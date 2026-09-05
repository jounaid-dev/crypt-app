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

 Future<void> connect(String username) async {
  disconnect();

  _currentUsername = username;
  _connected = false;

  debugPrint(
    "[Signaling] Connecting to $server as $username...",
  );

  try {
    final channel = WebSocketChannel.connect(
      Uri.parse(server),
    );

    _channel = channel;

    _streamController =
        StreamController<dynamic>.broadcast();

    _channelSubscription = channel.stream.listen(
      (data) {
        debugPrint(
          "[Signaling Received] $data",
        );

        try {
          final decoded =
              jsonDecode(data.toString());

          _streamController?.add(decoded);
        } catch (_) {
          _streamController?.add(data);
        }
      },
      onError: (error) {
        debugPrint(
          "[Signaling Error] $error",
        );

        _connected = false;

        if (!(_streamController?.isClosed ?? true)) {
          _streamController?.addError(error);
        }
      },
      onDone: () {
        debugPrint(
          "[Signaling] Connection closed",
        );

        _connected = false;
      },
      cancelOnError: false,
    );

    // Wait for the WebSocket handshake.
    await channel.ready;

    _connected = true;

    debugPrint(
      "[Signaling] WebSocket connected.",
    );

    // Register only AFTER the connection is ready.
    _send({
      "type": "register",
      "username": username,
    });

    debugPrint(
      "[Signaling] Registration sent for $username",
    );
  } catch (e, stack) {
    _connected = false;

    debugPrint(
      "[Signaling Connection Failed] $e",
    );

    debugPrint(
      "$stack",
    );
  }
}

  /// Sends a WebRTC offer.
  void sendOffer({
    required String target,
    required RTCSessionDescription offer,
  }) {
    debugPrint(
      "[Signaling] Sending offer to $target",
    );

    _send({
      "type": "offer",
      "sender": _currentUsername,
      "target": target,
      "payload": {
        "sdp": offer.sdp,
        "type": offer.type,
      },
    });
  }

  /// Sends a WebRTC answer.
  void sendAnswer({
    required String target,
    required RTCSessionDescription answer,
  }) {
    debugPrint(
      "[Signaling] Sending answer to $target",
    );

    _send({
      "type": "answer",
      "sender": _currentUsername,
      "target": target,
      "payload": {
        "sdp": answer.sdp,
        "type": answer.type,
      },
    });
  }

  /// Sends a WebRTC ICE candidate.
  void sendCandidate({
    required String target,
    required RTCIceCandidate candidate,
  }) {
    debugPrint(
      "[Signaling] Sending ICE candidate to $target",
    );

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

  /// Relays an already-encrypted signal through the Go server.
  void sendSignal({
    required String target,
    required Map<String, dynamic> payload,
  }) {
    debugPrint(
      "[Signaling] Relaying encrypted message to $target",
    );

    _send({
      "type": "signal",
      "sender": _currentUsername,
      "target": target,
      "payload": payload,
    });
  }

  void _send(Map<String, dynamic> data) {
    if (_channel == null || !_connected) {
      debugPrint(
        "[Signaling Warning] Cannot send, not connected",
      );
      return;
    }

    try {
      _channel!.sink.add(
        jsonEncode(data),
      );
    } catch (e) {
      debugPrint(
        "[Signaling Send Error] $e",
      );
    }
  }

  Stream<dynamic> get stream {
    final controller = _streamController;

    if (controller == null) {
      throw StateError(
        "Call connect() before listening to signaling stream.",
      );
    }

    return controller.stream;
  }

  void disconnect() {
    _connected = false;

    _channelSubscription?.cancel();
    _channelSubscription = null;

    _channel?.sink.close();
    _channel = null;

    _streamController?.close();
    _streamController = null;

    _currentUsername = null;

    debugPrint(
      "[Signaling] Disconnected and cleaned up",
    );
  }
}