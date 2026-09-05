import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCService {
  WebRTCService._();

  static final WebRTCService instance = WebRTCService._();

  RTCPeerConnection? peerConnection;
  RTCDataChannel? dataChannel;

  void Function(RTCIceCandidate candidate)? onIceCandidate;
  void Function(String message)? onMessage;
  void Function(RTCDataChannelState state)? onDataChannelState;

  // Called when WebRTC determines that the P2P connection has failed.
  void Function()? onConnectionFailed;

  final List<RTCIceCandidate> _remoteCandidateQueue = [];
  bool _isRemoteDescriptionSet = false;

  Future<void> initialize() async {
    if (peerConnection != null) {
      await dispose();
    }

    _isRemoteDescriptionSet = false;
    _remoteCandidateQueue.clear();

    peerConnection = await createPeerConnection({
      "iceServers": [
        {
          "urls": [
            "stun:stun.l.google.com:19302",
            "stun:stun1.l.google.com:19302",
          ],
        },
      ],
      "iceTransportPolicy": "all",
      "bundlePolicy": "balanced",
      "rtcpMuxPolicy": "require",
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
      debugPrint(
        "=== Received P2P Message ===",
      );

      onMessage?.call(message.text);
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

  void sendMessage(String text) {
    final channel = dataChannel;

    if (channel == null) {
      debugPrint(
        "=== P2P SEND FAILED: DataChannel is null ===",
      );
      return;
    }

    if (channel.state !=
        RTCDataChannelState.RTCDataChannelOpen) {
      debugPrint(
        "=== P2P SEND FAILED: Channel not open ===",
      );
      return;
    }

    channel.send(
      RTCDataChannelMessage(text),
    );

    debugPrint(
      "=== P2P MESSAGE SENT ===",
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

      _remoteCandidateQueue.clear();
      _isRemoteDescriptionSet = false;
    }
  }
}