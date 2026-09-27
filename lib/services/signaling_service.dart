import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SignalingService {
  SignalingService._();

  static final SignalingService instance = SignalingService._();

  static const String server = "wss://crypt.runsite.app/ws";

  /// The broadcast stream listeners subscribe to.
  ///
  /// Created once and kept across reconnects. It used to be built inside
  /// connect() and closed on teardown, so an automatic reconnect would hand
  /// every existing listener a dead stream and no further events would ever be
  /// delivered. It is only closed on an explicit disconnect().
  StreamController<dynamic>? _streamController;

  StreamController<dynamic> get _events {
    return _streamController ??= StreamController<dynamic>.broadcast();
  }

  WebSocketChannel? _channel;
  StreamSubscription? _channelSubscription;
  String? _currentUsername;

  bool _connected = false;

  bool get isConnected => _connected;

  /// True while a socket is being opened, so callers can tell "not ready yet"
  /// apart from "not available at all".
  bool get isConnecting => _connecting;

  bool _connecting = false;

  /// Set by disconnect() so an intentional close does not schedule a
  /// reconnect behind the user's back.
  bool _closedDeliberately = false;

  /// Frames produced before the socket was ready.
  ///
  /// Sending while disconnected used to be a silent no-op, so a conversation
  /// request, offer, answer or ICE candidate raised while the socket was still
  /// opening was thrown away with no error anywhere. The far end then waited
  /// out its connection timeout for a frame that was never sent. Frames are
  /// held here instead and flushed in order the moment the socket is ready.
  final List<Map<String, dynamic>> _pendingFrames =
      <Map<String, dynamic>>[];

  /// Bound on the backlog, so a peer that is offline for a long time cannot
  /// grow this without limit. Conversation requests are the only frames worth
  /// holding on to; older signals are dropped first because they are stale by
  /// the time a socket reopens.
  static const int _maxPendingFrames = 32;

  Timer? _reconnectTimer;

  /// Backoff schedule for an unexpected drop, in milliseconds.
  static const List<int> _reconnectDelaysMs = <int>[
    500,
    1000,
    2000,
    4000,
    8000,
    15000,
  ];

  int _reconnectAttempt = 0;

  /// Fires once a socket has been up long enough to be considered healthy, at
  /// which point the backoff is allowed to reset.
  Timer? _stabilityTimer;

  // ============================================================
  // CONNECTION
  // ============================================================

  Future<void> connect(String username) async {
    // The event stream deliberately survives: listeners subscribed to it must
    // keep receiving events across a reconnect.
    await _teardown(closeStream: false);

    // Materialise the stream now, not on the first inbound event. Listeners
    // read .stream straight after connect() returns, and a lazily created
    // controller would not exist yet.
    _streamController ??= StreamController<dynamic>.broadcast();

    _closedDeliberately = false;

    _connecting = true;

    _currentUsername = username;
    _connected = false;
    _reconnectAttempt = 0;

    try {
      final channel = WebSocketChannel.connect(Uri.parse(server));

      _channel = channel;

      _channelSubscription = channel.stream.listen(
        (data) {
          try {
            final decoded = jsonDecode(data.toString());

            if (!_events.isClosed) {
              _events.add(decoded);
            }
          } catch (_) {
            if (!_events.isClosed) {
              _events.add(data);
            }
          }
        },
        onError: (error) {
          _connected = false;

          if (!_events.isClosed) {
            _events.addError(error);
          }

          _scheduleReconnect();
        },
        onDone: () {
          _connected = false;

          _scheduleReconnect();
        },
        cancelOnError: false,
      );

      await channel.ready;

      _connected = true;
      _connecting = false;

      // Register with the server.
      _send({"type": "register", "username": username});

      // Request the complete current blacklist.
      requestBlacklist();

      // Hand over anything that was produced while the socket was opening.
      _flushPendingFrames();

      // Only treat the socket as healthy once it has actually stayed up. A
      // server that accepts and immediately drops would otherwise reset the
      // backoff on every attempt and turn into a tight 500ms loop.
      _stabilityTimer?.cancel();

      _stabilityTimer = Timer(const Duration(seconds: 30), () {
        _reconnectAttempt = 0;
      });
    } catch (_) {
      _connected = false;
      _connecting = false;

      _scheduleReconnect();
    }
  }

  /// Retries the socket after a drop, backing off so a server outage does not
  /// turn into a reconnect loop.
  ///
  /// There was no recovery at all before: once the socket closed, the only way
  /// back was to restart the app.
  void _scheduleReconnect() {
    if (_closedDeliberately) return;

    if (_reconnectTimer?.isActive ?? false) return;

    if (_currentUsername == null) return;

    final int index = _reconnectAttempt < _reconnectDelaysMs.length
        ? _reconnectAttempt
        : _reconnectDelaysMs.length - 1;

    final int delayMs = _reconnectDelaysMs[index];

    _reconnectAttempt++;

    _reconnectTimer = Timer(
      Duration(milliseconds: delayMs),
      () {
        _reconnectTimer = null;

        if (_closedDeliberately) return;

        final String username = _currentUsername ?? "";

        if (username.isEmpty) return;

        unawaited(connect(username));
      },
    );
  }

  // ============================================================
  // CONVERSATION REQUEST
  // ============================================================

  void sendConversationRequest({
    required String target,
    required Map<String, dynamic> payload,
  }) {
    _send({
      "type": "conversation_request",
      "sender": _currentUsername,
      "target": target,
      "payload": payload,
    });
  }

  // ============================================================
  // CONVERSATION ACCEPT
  // ============================================================

  void sendConversationAccept({
    required String target,
    required Map<String, dynamic> payload,
  }) {
    _send({
      "type": "conversation_accept",
      "sender": _currentUsername,
      "target": target,
      "payload": payload,
    });
  }

  // ============================================================
  // CONVERSATION REJECT
  // ============================================================

  void sendConversationReject({
    required String target,
    required Map<String, dynamic> payload,
  }) {
    _send({
      "type": "conversation_reject",
      "sender": _currentUsername,
      "target": target,
      "payload": payload,
    });
  }

  // ============================================================
  // ACCOUNT DELETED
  // ============================================================

  /// Notifies the server that this account has been deleted.
  ///
  /// The server adds the username + publicId to its
  /// authoritative blacklist and broadcasts the updated
  /// blacklist to connected clients.
  void sendAccountDeleted({
    required String username,
    required String publicId,
  }) {
    _send({
      "type": "account_deleted",
      "sender": username,
      "payload": {"username": username, "publicId": publicId},
    });
  }

  // ============================================================
  // BLACKLIST
  // ============================================================

  /// Requests the complete current blacklist from the server.
  void requestBlacklist() {
    if (_currentUsername == null) {
      return;
    }

    _send({"type": "blacklist_request", "sender": _currentUsername});
  }

  // ============================================================
  // WEBRTC OFFER
  // ============================================================

  void sendOffer({
    required String target,
    required RTCSessionDescription offer,
  }) {
    _send({
      "type": "offer",
      "sender": _currentUsername,
      "target": target,
      "payload": {"sdp": offer.sdp, "type": offer.type},
    });
  }

  // ============================================================
  // WEBRTC ANSWER
  // ============================================================

  void sendAnswer({
    required String target,
    required RTCSessionDescription answer,
  }) {
    _send({
      "type": "answer",
      "sender": _currentUsername,
      "target": target,
      "payload": {"sdp": answer.sdp, "type": answer.type},
    });
  }

  // ============================================================
  // WEBRTC ICE CANDIDATE
  // ============================================================

  void sendCandidate({
    required String target,
    required RTCIceCandidate candidate,
  }) {
    _send({
      "type": "candidate",
      "sender": _currentUsername,
      "target": target,
      "payload": {
        "candidate": candidate.candidate,
        "sdpMid": candidate.sdpMid,
        "sdpMLineIndex": candidate.sdpMLineIndex,
      },
    });
  }

  // ============================================================
  // ENCRYPTED SIGNAL
  // ============================================================

  void sendSignal({
    required String target,
    required Map<String, dynamic> payload,
  }) {
    _send({
      "type": "signal",
      "sender": _currentUsername,
      "target": target,
      "payload": payload,
    });
  }

  // ============================================================
  // INTERNAL SEND
  // ============================================================

  void _send(Map<String, dynamic> data) {
    if (_channel == null || !_connected) {
      _queueFrame(data);

      return;
    }

    try {
      _channel!.sink.add(jsonEncode(data));
    } catch (_) {
      // The socket failed mid-write. Keep the frame so the reconnect can
      // deliver it rather than losing it.
      _queueFrame(data);
    }
  }

  /// Holds a frame until the socket is ready.
  void _queueFrame(Map<String, dynamic> data) {
    // Registration and blacklist refreshes are rebuilt on every connect, so
    // holding an old copy would only duplicate them.
    final String type = data["type"]?.toString() ?? "";

    if (type == "register" || type == "blacklist_request") {
      return;
    }

    // An ICE candidate for a peer connection that no longer exists is noise by
    // the time the socket reopens.
    if (type == "candidate" && _pendingFrames.length >= _maxPendingFrames) {
      return;
    }

    if (_pendingFrames.length >= _maxPendingFrames) {
      _pendingFrames.removeAt(0);
    }

    _pendingFrames.add(data);
  }

  void _flushPendingFrames() {
    if (_pendingFrames.isEmpty) return;

    final List<Map<String, dynamic>> frames = List<Map<String, dynamic>>.of(
      _pendingFrames,
    );

    _pendingFrames.clear();

    for (final Map<String, dynamic> frame in frames) {
      try {
        _channel?.sink.add(jsonEncode(frame));
      } catch (_) {
        // Still not usable. Put the rest back so the next attempt retries.
        _pendingFrames.add(frame);
      }
    }
  }

  // ============================================================
  // STREAM
  // ============================================================

  Stream<dynamic> get stream {
    final controller = _streamController;

    if (controller == null) {
      throw StateError("Call connect() before listening to signaling stream.");
    }

    return controller.stream;
  }

  // ============================================================
  // DISCONNECT
  // ============================================================

  void disconnect() {
    _closedDeliberately = true;

    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    _pendingFrames.clear();

    unawaited(_teardown(closeStream: true));

    _currentUsername = null;
  }

  /// Closes the current socket without touching the reconnect state, so both
  /// an explicit disconnect and a reconnect can share it.
  ///
  /// [closeStream] is only true for an explicit disconnect. A reconnect has to
  /// leave the event stream open or every existing listener is stranded.
  Future<void> _teardown({required bool closeStream}) async {
    _connected = false;
    _connecting = false;

    _stabilityTimer?.cancel();
    _stabilityTimer = null;

    final subscription = _channelSubscription;
    final channel = _channel;

    _channelSubscription = null;
    _channel = null;

    await subscription?.cancel();

    try {
      await channel?.sink.close();
    } catch (_) {}

    if (!closeStream) return;

    final controller = _streamController;

    _streamController = null;

    try {
      await controller?.close();
    } catch (_) {}
  }
}
