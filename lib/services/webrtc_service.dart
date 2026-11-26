import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'data_channel_chunker.dart';

class WebRTCService {
  WebRTCService._();

  static final WebRTCService instance = WebRTCService._();

  RTCPeerConnection? peerConnection;
  RTCDataChannel? dataChannel;

  /// The peer this connection was opened for.
  ///
  /// The service is a singleton, so the connection can outlive the page that
  /// created it. Recording the peer lets a chat reuse a channel that is still
  /// open for that same person instead of tearing it down and negotiating
  /// again.
  String? activePeer;

  void Function(RTCIceCandidate candidate)? onIceCandidate;
  void Function(String message)? onMessage;
  void Function(RTCDataChannelState state)? onDataChannelState;

  // Called when WebRTC determines that the P2P connection has failed.
  void Function()? onConnectionFailed;

  final List<RTCIceCandidate> _remoteCandidateQueue = [];
  bool _isRemoteDescriptionSet = false;

  // Large messages (attachments) are split into data-channel sized frames on
  // the way out and stitched back together on the way in, so callers keep
  // sending and receiving one string per message.
  final DataChannelChunker _chunker = const DataChannelChunker();

  final IncomingChunkAssembler _assembler = IncomingChunkAssembler();

  /// How much unsent data is allowed to queue in the data channel before the
  /// sender waits. Without this a 20 MB attachment is handed to the channel in
  /// one burst and the SCTP send buffer grows without bound.
  static const int _bufferedAmountLimit = 256 * 1024;

  Future<void> initialize() async {
    if (peerConnection != null) {
      await dispose();
    }

    _isRemoteDescriptionSet = false;
    _remoteCandidateQueue.clear();
    _assembler.reset();

    peerConnection = await createPeerConnection({
      // Several independent STUN servers, including one on port 443, so a
      // restrictive mobile or office network still gets a reflexive address
      // to offer. With only one provider a blocked STUN host left both devices
      // gathering nothing and the handshake timed out.
      "iceServers": [
        {
          "urls": [
            "stun:stun.l.google.com:19302",
            "stun:stun1.l.google.com:19302",
            "stun:stun2.l.google.com:19302",
            "stun:stun3.l.google.com:19302",
          ],
        },
        {
          "urls": [
            "stun:stun.cloudflare.com:3478",
            "stun:stun.nextcloud.com:443",
          ],
        },
      ],
      "iceTransportPolicy": "all",
      "bundlePolicy": "balanced",
      "rtcpMuxPolicy": "require",
      "sdpSemantics": "unified-plan",
    });

    peerConnection!.onIceConnectionState = (state) {
      debugPrint(
        "=== ICE Connection State: $state ===",
      );

      // Only report a real ICE failure.
      //
      // "disconnected" can sometimes recover by itself,
      // so we do NOT trigger the retry there.
      if (state ==
          RTCIceConnectionState.RTCIceConnectionStateFailed) {
        debugPrint(
          "=== P2P CONNECTION FAILED ===",
        );

        onConnectionFailed?.call();
      }
    };

    peerConnection!.onSignalingState = (state) {
      debugPrint(
        "=== Signaling State: $state ===",
      );
    };

    peerConnection!.onConnectionState = (state) {
      debugPrint(
        "=== Peer Connection State: $state ===",
      );

      if (state ==
          RTCPeerConnectionState.RTCPeerConnectionStateFailed) {
        debugPrint(
          "=== PEER CONNECTION FAILED ===",
        );

        onConnectionFailed?.call();
      }
    };

    peerConnection!.onIceGatheringState = (state) {
      debugPrint(
        "=== ICE Gathering State: $state ===",
      );
    };

    peerConnection!.onIceCandidate = (candidate) {
      if (candidate.candidate != null &&
          candidate.candidate!.isNotEmpty) {
        onIceCandidate?.call(candidate);
      }
    };

    peerConnection!.onDataChannel = (channel) {
      debugPrint(
        "=== Received Remote DataChannel ===",
      );

      dataChannel = channel;
      _bindDataChannelListeners();
    };
  }

  void _bindDataChannelListeners() {
    final channel = dataChannel;
    if (channel == null) return;

    channel.onDataChannelState = (state) {
      debugPrint(
        "=== DataChannel State: $state ===",
      );

      onDataChannelState?.call(state);
    };

    channel.onMessage = (message) {
      final String? text = message.text;

      if (text == null || text.isEmpty) {
        return;
      }

      // A send is complete only when every frame has arrived. Until then the
      // frame is consumed here and the app never sees a partial payload.
      final String? complete = _assembler.add(text);

      if (complete == null) {
        return;
      }

      debugPrint(
        "=== Received P2P Message ===",
      );

      onMessage?.call(complete);
    };
  }

  Future<RTCSessionDescription> createOffer() async {
    if (peerConnection == null) {
      await initialize();
    }

    final init = RTCDataChannelInit()
      ..ordered = true;

    dataChannel =
        await peerConnection!.createDataChannel(
      "crypt",
      init,
    );

    _bindDataChannelListeners();

    final offer =
        await peerConnection!.createOffer();

    await peerConnection!.setLocalDescription(
      offer,
    );

    debugPrint(
      "=== Local Offer Created ===",
    );

    return offer;
  }

  Future<void> setRemoteOffer(
    RTCSessionDescription offer,
  ) async {
    if (peerConnection == null) {
      await initialize();
    }

    await peerConnection!.setRemoteDescription(
      offer,
    );

    _isRemoteDescriptionSet = true;

    await _drainCandidateQueue();

    debugPrint(
      "=== Remote Offer Set ===",
    );
  }

  Future<RTCSessionDescription> createAnswer() async {
    if (peerConnection == null) {
      throw Exception(
        "PeerConnection is null during createAnswer",
      );
    }

    final answer =
        await peerConnection!.createAnswer();

    await peerConnection!.setLocalDescription(
      answer,
    );

    debugPrint(
      "=== Local Answer Created ===",
    );

    return answer;
  }

  Future<void> setRemoteAnswer(
    RTCSessionDescription answer,
  ) async {
    if (peerConnection == null) return;

    await peerConnection!.setRemoteDescription(
      answer,
    );

    _isRemoteDescriptionSet = true;

    await _drainCandidateQueue();

    debugPrint(
      "=== Remote Answer Set ===",
    );
  }

  Future<void> addCandidate(
    RTCIceCandidate candidate,
  ) async {
    if (peerConnection == null) return;

    if (!_isRemoteDescriptionSet) {
      debugPrint(
        "=== Queuing Remote ICE Candidate ===",
      );

      _remoteCandidateQueue.add(candidate);
      return;
    }

    try {
      await peerConnection!.addCandidate(
        candidate,
      );

      debugPrint(
        "=== Remote ICE Candidate Added ===",
      );
    } catch (e) {
      debugPrint(
        "=== Error Adding ICE Candidate: $e ===",
      );
    }
  }

  Future<void> _drainCandidateQueue() async {
    if (peerConnection == null) return;

    for (final candidate
        in List<RTCIceCandidate>.from(
      _remoteCandidateQueue,
    )) {
      try {
        await peerConnection!.addCandidate(
          candidate,
        );
      } catch (e) {
        debugPrint(
          "=== Error Draining ICE Candidate: $e ===",
        );
      }
    }

    _remoteCandidateQueue.clear();
  }

  bool get isDataChannelOpen {
    return dataChannel?.state ==
        RTCDataChannelState.RTCDataChannelOpen;
  }

  /// Sends [text], splitting it into frames when it is too large for one
  /// data-channel message.
  ///
  /// Throws when the channel is gone or closes mid-transfer, so the caller can
  /// keep the message in the outbox instead of believing it was delivered.
  Future<void> sendMessage(String text) async {
    final channel = dataChannel;

    if (channel == null) {
      debugPrint(
        "=== P2P SEND FAILED: DataChannel is null ===",
      );

      throw StateError('Data channel is not available.');
    }

    if (channel.state !=
        RTCDataChannelState.RTCDataChannelOpen) {
      debugPrint(
        "=== P2P SEND FAILED: Channel not open ===",
      );

      throw StateError('Data channel is not open.');
    }

    if (!_chunker.needsChunking(text)) {
      channel.send(
        RTCDataChannelMessage(text),
      );

      debugPrint(
        "=== P2P MESSAGE SENT ===",
      );

      return;
    }

    final String transferId =
        DateTime.now().microsecondsSinceEpoch.toString();

    final List<String> frames = _chunker.frames(
      text,
      transferId: transferId,
    );

    debugPrint(
      "=== P2P TRANSFER START: ${text.length} chars in ${frames.length} frames ===",
    );

    for (final String frame in frames) {
      // Wait while the channel's own buffer is full. Sending regardless is
      // what makes a large transfer stall or fail on a slow link.
      while ((channel.bufferedAmount ?? 0) > _bufferedAmountLimit) {
        await Future<void>.delayed(const Duration(milliseconds: 15));

        if (channel.state !=
            RTCDataChannelState.RTCDataChannelOpen) {
          throw StateError('Data channel closed during transfer.');
        }
      }

      if (channel.state !=
          RTCDataChannelState.RTCDataChannelOpen) {
        throw StateError('Data channel closed during transfer.');
      }

      channel.send(
        RTCDataChannelMessage(frame),
      );
    }

    debugPrint(
      "=== P2P TRANSFER SENT ===",
    );
  }

  Future<void> dispose() async {
    try {
      await dataChannel?.close();
      await peerConnection?.close();
    } catch (e) {
      debugPrint(
        "=== WebRTC Dispose Error: $e ===",
      );
    } finally {
      dataChannel = null;
      peerConnection = null;
      activePeer = null;

      _remoteCandidateQueue.clear();
      _assembler.reset();
      _isRemoteDescriptionSet = false;
    }
  }
}