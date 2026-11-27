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

  /// Bound on the queue, so a long series of failed attempts cannot grow it
  /// without limit.
  static const int _maxRemoteCandidates = 128;

  bool _isRemoteDescriptionSet = false;

  /// The initialization currently running, if any.
  ///
  /// ChatPage's connect() and an offer that arrives while it is starting can
  /// both reach initialize() at the same moment. Each call used to run the
  /// whole setup on its own, so one of them disposed the connection the other
  /// had just built, and the answer could end up created on a peer connection
  /// that was already replaced. The answer was then valid for a connection
  /// nobody was using, so the two devices exchanged an offer, an answer and
  /// candidates and still never connected. A second caller now waits for the
  /// attempt that is already running.
  Future<void>? _initializing;

  Future<void> initialize() {
    final inFlight = _initializing;

    if (inFlight != null) {
      return inFlight;
    }

    final future = _initializeOnce();

    _initializing = future;

    return future.whenComplete(() {
      if (identical(_initializing, future)) {
        _initializing = null;
      }
    });
  }

  Future<void> _initializeOnce() async {
    // Candidates for the offer that is about to be applied can arrive before
    // this connection exists. dispose() clears the queue, so carry them over
    // instead of throwing them away: the other device only gathers each
    // candidate once, and a missing route can make the handshake fail.
    final List<RTCIceCandidate> pendingCandidates =
        List<RTCIceCandidate>.of(_remoteCandidateQueue);

    if (peerConnection != null) {
      await dispose();
    }

    for (final candidate in pendingCandidates) {
      _enqueueRemoteCandidate(candidate);
    }

    _isRemoteDescriptionSet = false;

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
        // A relay for the networks where STUN alone can never succeed: most
        // mobile carriers put both phones behind the same carrier-grade NAT
        // and block the direct UDP path, so the handshake failed every time
        // no matter how long the app waited. TURN is only used as a fallback
        // when a direct path cannot be found, and it still only relays the
        // encrypted DTLS traffic.
        {
          "urls": [
            "turn:openrelay.metered.ca:80",
            "turn:openrelay.metered.ca:443",
            "turn:openrelay.metered.ca:443?transport=tcp",
          ],
          "username": "openrelayproject",
          "credential": "openrelayproject",
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
    // A candidate can arrive before the offer that creates the connection.
    // Dropping it here was permanent: the sender never repeats a candidate,
    // so the missing route could make the handshake fail for good. Hold it
    // until there is a connection and a remote description to apply it to.
    if (peerConnection == null) {
      debugPrint(
        "=== Queuing Remote ICE Candidate (no connection yet) ===",
      );

      _enqueueRemoteCandidate(candidate);
      return;
    }

    if (!_isRemoteDescriptionSet) {
      debugPrint(
        "=== Queuing Remote ICE Candidate ===",
      );

      _enqueueRemoteCandidate(candidate);
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

  void _enqueueRemoteCandidate(RTCIceCandidate candidate) {
    if (_remoteCandidateQueue.length >= _maxRemoteCandidates) {
      _remoteCandidateQueue.removeAt(0);
    }

    _remoteCandidateQueue.add(candidate);
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