import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SignalingService {
  SignalingService._();

  static final SignalingService instance = SignalingService._();

  static const String server = "wss://crypt.runsite.app/ws";

  WebSocketChannel? _channel;
  StreamController<dynamic>? _streamController;
  StreamSubscription? _channelSubscription;
  String? _currentUsername;

  bool _connected = false;

  bool get isConnected => _connected;

  // ============================================================
  // CONNECTION
  // ============================================================

  Future<void> connect(String username) async {
    disconnect();

    _currentUsername = username;
    _connected = false;

    try {
      final channel = WebSocketChannel.connect(Uri.parse(server));

      _channel = channel;

      _streamController = StreamController<dynamic>.broadcast();

      _channelSubscription = channel.stream.listen(
        (data) {
          try {
            final decoded = jsonDecode(data.toString());

            _streamController?.add(decoded);
          } catch (_) {
            _streamController?.add(data);
          }
        },
        onError: (error) {
          _connected = false;

          if (!(_streamController?.isClosed ?? true)) {
            _streamController?.addError(error);
          }
        },
        onDone: () {
          _connected = false;
        },
        cancelOnError: false,
      );

      await channel.ready;

      _connected = true;

      // Register with the server.
      _send({"type": "register", "username": username});

      // Request the complete current blacklist.
      requestBlacklist();
    } catch (_) {
      _connected = false;
    }
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
      return;
    }

    try {
      _channel!.sink.add(jsonEncode(data));
    } catch (_) {}
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
    _connected = false;

    _channelSubscription?.cancel();
    _channelSubscription = null;

    _channel?.sink.close();
    _channel = null;

    _streamController?.close();
    _streamController = null;

    _currentUsername = null;
  }
}
