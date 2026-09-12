import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' hide MessageType;
import 'package:cryptography/cryptography.dart';

import 'package:crypt_messenger/services/encryption_service.dart';
import '../services/signaling_service.dart';
import '../services/account_service.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../services/message_service.dart';
import '../services/webrtc_service.dart';
import '../services/session_service.dart';
import '../services/key_exchange_service.dart';
import '../services/signature_service.dart';

class ChatPage extends StatefulWidget {
  final Conversation conversation;

  const ChatPage({super.key, required this.conversation});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final MessageService _messageService = MessageService();

  final TextEditingController _messageController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final Uuid _uuid = const Uuid();

  final SignalingService _signaling = SignalingService.instance;

  final AccountService _accountService = AccountService();

  final WebRTCService _webrtc = WebRTCService.instance;

  final KeyExchangeService _keyExchangeService = KeyExchangeService();

  final EncryptionService _encryptionService = EncryptionService();

  final SignatureService _signatureService = SignatureService();

  RTCDataChannelState _channelState = RTCDataChannelState.RTCDataChannelClosed;

  bool get _isP2PActive =>
      _channelState == RTCDataChannelState.RTCDataChannelOpen;

  StreamSubscription? _signalingSubscription;

  String? _currentUsername;

  SecretKey? _cachedSharedKey;
  Future<SecretKey>? _sharedKeyDerivation;

  // ============================================================
  // MESSAGE STATE
  // ============================================================

  List<Message> _messages = [];

  final Map<String, String> _decryptedTexts = {};

  final Set<String> _decryptingMessageIds = {};

  /*
   * Messages that have been sent but have NOT yet received
   * a verified delivery ACK.
   *
   * They are persisted locally as pending so they survive
   * connection loss or app restart.
   */
  final Map<String, Message> _pendingMessages = {};

  bool _isLoading = true;

  bool _isConnecting = true;
  bool _connectionFailed = false;

  Timer? _connectionTimeoutTimer;

  /*
   * Periodic outbox retry timer.
   *
   * Pending messages remain pending until a valid signed ACK
   * is received and successfully persisted.
   */
  Timer? _pendingRetryTimer;

  bool _isPendingRetryRunning = false;

  bool _isConnectionAttemptRunning = false;
  bool _hasConnectedOnce = false;

  static const int _pageSize = 20;

  int _loadedMessageCount = 0;

  bool _isLoadingOlderMessages = false;

  bool _hasMoreMessages = true;

  static const int _initialBatchSize = 20;

  static const Duration _pendingRetryInterval = Duration(seconds: 5);

  static const Duration _connectionTimeout = Duration(seconds: 20);

  bool _disposed = false;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_handleScroll);

    _loadMessages();
    _connect();
  }

  // ============================================================
  // LOCAL MESSAGES
  // ============================================================

  Future<void> _loadMessages() async {
    try {
      final allMessages = await _messageService.getMessages(
        widget.conversation.id,
      );

      final messages = allMessages.reversed.take(_pageSize).toList();

      /*
       * Restore the OUTBOX from ALL locally stored messages.
       *
       * The UI only loads 20 messages initially, but pending
       * messages can be much older than those 20.
       */
      final pendingMessages = allMessages
          .where(
            (message) =>
                message.outgoing && message.status == MessageStatus.pending,
          )
          .toList();

      if (!mounted || _disposed) return;

      _pendingMessages.clear();

      for (final message in pendingMessages) {
        _pendingMessages[message.id] = message;
      }

      /*
       * Newest -> oldest.
       */
      messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      setState(() {
        _messages = messages;
        _loadedMessageCount = messages.length;
        _hasMoreMessages = messages.length == _pageSize;
        _isLoading = false;
      });

      if (messages.isEmpty) {
        return;
      }

      // --------------------------------------------------------
      // INITIAL 20
      // --------------------------------------------------------

      final initialCount = messages.length < _initialBatchSize
          ? messages.length
          : _initialBatchSize;

      final firstBatch = messages.take(initialCount).toList();

      await _decryptInitialBatch(firstBatch);

      if (!mounted || _disposed) return;

      // --------------------------------------------------------
      // BACKGROUND
      // --------------------------------------------------------

      _startBackgroundDecryption(messages.skip(initialCount).toList());
    } catch (e, stack) {
      debugPrint("[Messages] Loading failed: $e\n$stack");

      if (!mounted || _disposed) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  // ============================================================
  // INITIAL DECRYPTION
  // ============================================================

  Future<void> _decryptInitialBatch(List<Message> messages) async {
    if (messages.isEmpty) return;

    debugPrint(
      "[Messages] Decrypting first "
      "${messages.length} messages...",
    );

    try {
      final sharedKey = await _getOrDeriveSharedKey();

      final results = await Future.wait(
        messages.map((message) => _decryptWithKey(message, sharedKey)),
      );

      if (!mounted || _disposed) return;

      for (int i = 0; i < messages.length; i++) {
        final text = results[i];

        if (text != null) {
          _decryptedTexts[messages[i].id] = text;
        }
      }

      setState(() {});

      debugPrint(
        "[Messages] First "
        "${messages.length} messages decrypted.",
      );
    } catch (e, stack) {
      debugPrint(
        "[Messages] Initial batch decryption failed: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // BACKGROUND DECRYPTION
  // ============================================================

  void _startBackgroundDecryption(List<Message> remainingMessages) {
    if (remainingMessages.isEmpty || _disposed || !mounted) {
      return;
    }

    unawaited(_decryptRemainingMessages(remainingMessages));
  }

  Future<void> _decryptRemainingMessages(List<Message> messages) async {
    if (messages.isEmpty) {
      return;
    }

    try {
      final sharedKey = await _getOrDeriveSharedKey();

      for (final message in messages) {
        if (_disposed || !mounted) {
          return;
        }

        if (_decryptedTexts.containsKey(message.id)) {
          continue;
        }

        if (_decryptingMessageIds.contains(message.id)) {
          continue;
        }

        _decryptingMessageIds.add(message.id);

        try {
          final text = await _decryptWithKey(message, sharedKey);

          if (text != null && !_disposed && mounted) {
            _decryptedTexts[message.id] = text;

            setState(() {});
          }
        } catch (e) {
          debugPrint(
            "[Crypto] Background decryption failed "
            "for ${message.id}: $e",
          );
        } finally {
          _decryptingMessageIds.remove(message.id);
        }

        await Future<void>.delayed(Duration.zero);
      }

      debugPrint("[Messages] Background decryption finished.");
    } catch (e, stack) {
      debugPrint(
        "[Messages] Background decryption error: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // DECRYPT ONE MESSAGE
  // ============================================================

  Future<String?> _decryptWithKey(Message message, SecretKey sharedKey) async {
    try {
      return await _encryptionService.decryptMessage(
        encryptedMessage: message.encryptedText,
        key: sharedKey,
      );
    } catch (e) {
      debugPrint(
        "[Crypto] Failed to decrypt "
        "${message.id}: $e",
      );

      return null;
    }
  }

  // ============================================================
  // SHARED KEY
  // ============================================================

  Future<SecretKey> _getOrDeriveSharedKey() async {
    if (_cachedSharedKey != null) {
      return _cachedSharedKey!;
    }

    final derivationInProgress = _sharedKeyDerivation;
    if (derivationInProgress != null) {
      return derivationInProgress;
    }

    final password = SessionService.instance.password;

    if (password == null) {
      throw Exception("Identity locked.");
    }

    final derivation = _keyExchangeService.deriveSharedKey(
      password: password,
      peerPublicKey: widget.conversation.publicEncryptionKey,
    );

    _sharedKeyDerivation = derivation;

    try {
      final sharedKey = await derivation;
      _cachedSharedKey = sharedKey;
      return sharedKey;
    } finally {
      if (identical(_sharedKeyDerivation, derivation)) {
        _sharedKeyDerivation = null;
      }
    }
  }

  // ============================================================
  // P2P TRANSPORT
  // ============================================================

  Future<bool> _sendPayload(
    Map<String, dynamic> payload, {
    bool showConnectionError = true,
  }) async {
    if (!_isP2PActive) {
      debugPrint("[Transport] P2P channel is not open.");

      if (showConnectionError && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.p2pConnectionNotReady),
          ),
        );
      }

      return false;
    }

    try {
      final encoded = jsonEncode(payload);

      _webrtc.sendMessage(encoded);

      return true;
    } catch (e) {
      debugPrint("[Transport] P2P send failed: $e");

      return false;
    }
  }

  // ============================================================
  // CONNECTION
  // ============================================================

  Future<void> _connect() async {
    if (_isConnectionAttemptRunning || _disposed || !mounted) {
      return;
    }

    _isConnectionAttemptRunning = true;

    await _resetConnectionResources();
    _hasConnectedOnce = false;

    if (mounted && !_disposed) {
      setState(() {
        _isConnecting = true;
        _connectionFailed = false;
      });
    }

    try {
      _currentUsername = await _accountService.getUsername();

      if (_currentUsername == null || !mounted || _disposed) {
        return;
      }

      await _getOrDeriveSharedKey();

      // --------------------------------------------------------
      // SIGNALING
      // --------------------------------------------------------

      if (!_signaling.isConnected) {
        await _signaling.connect(_currentUsername!);
      }

      // --------------------------------------------------------
      // WEBRTC
      // --------------------------------------------------------

      await _webrtc.initialize();

      _webrtc.onConnectionFailed = () {
        debugPrint("=== ChatPage: WebRTC connection failed ===");

        _markConnectionFailed(force: true);
      };

      if (!mounted || _disposed) return;

      // --------------------------------------------------------
      // DATA CHANNEL STATE
      // --------------------------------------------------------

      _webrtc.onDataChannelState = (state) {
        debugPrint("[WebRTC] DataChannel state: $state");

        if (!mounted || _disposed) return;

        setState(() {
          _channelState = state;

          _isConnecting =
              !_connectionFailed &&
              state != RTCDataChannelState.RTCDataChannelOpen;

          if (state == RTCDataChannelState.RTCDataChannelOpen) {
            _connectionFailed = false;
            _hasConnectedOnce = true;
          }
        });

        if (state == RTCDataChannelState.RTCDataChannelOpen) {
          _connectionTimeoutTimer?.cancel();
          _connectionTimeoutTimer = null;
          debugPrint("======================================");

          debugPrint("       P2P CONNECTION ESTABLISHED");

          debugPrint("======================================");

          // ----------------------------------------------------
          // BLACKLIST
          // ----------------------------------------------------

          unawaited(_syncGossipBlacklist());

          // ----------------------------------------------------
          // OUTBOX
          // ----------------------------------------------------

          /*
           * Start the continuous retry timer.
           *
           * It remains active until this ChatPage is disposed.
           * Each cycle only sends when the P2P channel is open.
           */
          _startPendingRetryTimer();

          // Immediately retry instead of waiting 5 seconds.
          unawaited(_retryPendingMessages());
        } else if (_hasConnectedOnce &&
            (state == RTCDataChannelState.RTCDataChannelClosed ||
                state == RTCDataChannelState.RTCDataChannelClosing)) {
          unawaited(_handleConnectionDrop());
        }
      };

      // --------------------------------------------------------
      // RECEIVE P2P
      // --------------------------------------------------------

      _webrtc.onMessage = (packet) async {
        await _handleP2PPacket(packet);
      };

      // --------------------------------------------------------
      // ICE
      // --------------------------------------------------------

      _webrtc.onIceCandidate = (candidate) {
        _signaling.sendCandidate(
          target: widget.conversation.username,
          candidate: candidate,
        );
      };

      // --------------------------------------------------------
      // SIGNALING
      // --------------------------------------------------------

      await _signalingSubscription?.cancel();
      _signalingSubscription = _signaling.stream.listen((event) async {
        await _handleSignalingEvent(event);
      });

      // --------------------------------------------------------
      // OFFERER SELECTION
      // --------------------------------------------------------

      if (_currentUsername!.compareTo(widget.conversation.username) > 0) {
        _startConnectionTimeout();

        await Future.delayed(const Duration(milliseconds: 600));

        if (!mounted || _disposed) return;

        final offer = await _webrtc.createOffer();

        if (!mounted || _disposed) return;

        _signaling.sendOffer(
          target: widget.conversation.username,
          offer: offer,
        );

        debugPrint("[WebRTC] Offer sent.");
      } else {
        _startConnectionTimeout();
      }
    } catch (e, stack) {
      debugPrint(
        "[ChatPage] Connection error: "
        "$e\n$stack",
      );

      _markConnectionFailed(force: true);
    } finally {
      _isConnectionAttemptRunning = false;
    }
  }

  // ============================================================
  // OUTBOX RETRY TIMER
  // ============================================================

  void _startPendingRetryTimer() {
    if (_disposed || !mounted) {
      return;
    }

    if (_pendingRetryTimer?.isActive ?? false) {
      return;
    }

    debugPrint("[Retry] Starting persistent outbox retry timer.");

    _pendingRetryTimer = Timer.periodic(_pendingRetryInterval, (_) {
      if (_disposed || !mounted) {
        return;
      }

      if (!_isP2PActive) {
        return;
      }

      unawaited(_retryPendingMessages());
    });
  }

  // ============================================================
  // RETRY PENDING MESSAGES
  // ============================================================

  Future<void> _retryPendingMessages() async {
    if (_disposed || !mounted || !_isP2PActive) {
      return;
    }

    /*
     * Prevent two retry cycles from running at the same time.
     */
    if (_isPendingRetryRunning) {
      return;
    }

    _isPendingRetryRunning = true;

    try {
      /*
       * Refresh the outbox directly from persistent storage.
       *
       * This guarantees that an old pending message that is
       * outside the UI's loaded 20 messages is still retried.
       */
      final persistedPending = await _messageService.getPendingOutgoingMessages(
        widget.conversation.id,
      );

      if (_disposed || !mounted || !_isP2PActive) {
        return;
      }

      /*
       * Merge persistent pending messages into memory.
       */
      for (final message in persistedPending) {
        _pendingMessages[message.id] = message;
      }

      if (_pendingMessages.isEmpty) {
        debugPrint("[Retry] No pending messages.");
        return;
      }

      debugPrint(
        "[Retry] Retrying "
        "${_pendingMessages.length} pending messages...",
      );

      /*
       * Snapshot the map so ACK handling can safely remove
       * entries while this loop is running.
       */
      final pendingMessages = List<Message>.from(_pendingMessages.values);

      for (final message in pendingMessages) {
        if (_disposed || !mounted || !_isP2PActive) {
          return;
        }

        /*
         * The message may have received an ACK while we were
         * processing another message.
         */
        if (!_pendingMessages.containsKey(message.id)) {
          continue;
        }

        try {
          /*
           * IMPORTANT:
           *
           * These are the ORIGINAL values.
           *
           * We do NOT:
           * - generate a new ID
           * - re-encrypt the plaintext
           * - generate a new timestamp
           * - create a new signature
           *
           * Therefore every retry represents the exact same
           * authenticated message.
           */
          final sent = await _sendPayload({
            "id": message.id,
            "conversationId": message.conversationId,
            "sender": message.sender,
            "receiver": message.receiver,
            "text": message.encryptedText,
            "signature": message.signature,
            "senderSigningPublicKey": message.senderSigningPublicKey,
            "timestamp": message.timestamp.millisecondsSinceEpoch,
          }, showConnectionError: false);

          if (sent) {
            debugPrint(
              "[Retry] ${message.id} resent. "
              "Waiting for ACK...",
            );
          } else {
            debugPrint("[Retry] ${message.id} could not be resent.");
          }
        } catch (e) {
          debugPrint(
            "[Retry] Failed to resend "
            "${message.id}: $e",
          );
        }
      }
    } catch (e, stack) {
      debugPrint(
        "[Retry] Outbox retry error: "
        "$e\n$stack",
      );
    } finally {
      _isPendingRetryRunning = false;
    }
  }

  // ============================================================
  // CONNECTION FAILURE / RETRY
  // ============================================================

  void _startConnectionTimeout() {
    if (_disposed || !mounted) return;

    _connectionTimeoutTimer?.cancel();

    debugPrint("=== WebRTC connection timeout started ===");

    _connectionTimeoutTimer = Timer(_connectionTimeout, _markConnectionFailed);
  }

  void _markConnectionFailed({bool force = false}) {
    if (_disposed || !mounted || (!force && _isP2PActive)) return;

    _connectionTimeoutTimer?.cancel();
    _connectionTimeoutTimer = null;

    setState(() {
      _isConnecting = false;
      _connectionFailed = true;
    });
  }

  void _retryConnection() {
    if (_isConnectionAttemptRunning || _disposed || !mounted) return;

    _connectionTimeoutTimer?.cancel();
    _connectionTimeoutTimer = null;

    unawaited(_connect());
  }

  Future<void> _resetConnectionResources() async {
    _connectionTimeoutTimer?.cancel();
    _connectionTimeoutTimer = null;

    await _signalingSubscription?.cancel();
    _signalingSubscription = null;

    _webrtc.onMessage = null;
    _webrtc.onIceCandidate = null;
    _webrtc.onDataChannelState = null;
    _webrtc.onConnectionFailed = null;

    await _webrtc.dispose();

    if (!mounted || _disposed) return;

    setState(() {
      _channelState = RTCDataChannelState.RTCDataChannelClosed;
      _isConnecting = true;
      _connectionFailed = false;
    });
  }

  Future<void> _handleConnectionDrop() async {
    if (_disposed || !mounted) return;

    _webrtc.onMessage = null;
    _webrtc.onIceCandidate = null;
    _webrtc.onDataChannelState = null;
    _webrtc.onConnectionFailed = null;

    await _webrtc.dispose();

    _markConnectionFailed(force: true);
  }

  // ============================================================
  // SIGNALING
  // ============================================================

  Future<void> _handleSignalingEvent(dynamic event) async {
    try {
      if (event is! Map) return;

      final data = Map<String, dynamic>.from(event);

      final type = data["type"] as String?;

      final sender = data["sender"] as String?;

      if (sender != null && sender != widget.conversation.username) {
        return;
      }

      final payload = _parsePayload(data["payload"]);

      switch (type) {
        case "offer":
          await _handleOffer(payload);
          break;

        case "answer":
          await _handleAnswer(payload);
          break;

        case "candidate":
          await _handleCandidate(payload);
          break;

        case "signal":
          debugPrint("[Security] Ignoring legacy signal message.");
          break;
      }
    } catch (e, stack) {
      debugPrint(
        "[ChatPage] Signaling error: "
        "$e\n$stack",
      );
    }
  }

  Future<void> _handleOffer(Map<String, dynamic> payload) async {
    final sdp = payload["sdp"] as String?;

    final offerType = payload["type"] as String?;

    if (sdp == null || sdp.isEmpty || offerType == null) {
      return;
    }

    debugPrint("[WebRTC] Received offer.");

    await _webrtc.setRemoteOffer(RTCSessionDescription(sdp, offerType));

    if (!mounted || _disposed) return;

    final answer = await _webrtc.createAnswer();

    if (!mounted || _disposed) return;

    _signaling.sendAnswer(target: widget.conversation.username, answer: answer);

    debugPrint("[WebRTC] Answer sent.");
  }

  Future<void> _handleAnswer(Map<String, dynamic> payload) async {
    final sdp = payload["sdp"] as String?;

    final answerType = payload["type"] as String?;

    if (sdp == null || sdp.isEmpty || answerType == null) {
      return;
    }

    debugPrint("[WebRTC] Received answer.");

    await _webrtc.setRemoteAnswer(RTCSessionDescription(sdp, answerType));
  }

  Future<void> _handleCandidate(Map<String, dynamic> payload) async {
    final candidate = payload["candidate"];

    if (candidate == null) {
      return;
    }

    await _webrtc.addCandidate(
      RTCIceCandidate(candidate, payload["sdpMid"], payload["sdpMLineIndex"]),
    );
  }

  // ============================================================
  // PAYLOAD PARSER
  // ============================================================

  Map<String, dynamic> _parsePayload(dynamic rawPayload) {
    if (rawPayload is String) {
      try {
        final decoded = jsonDecode(rawPayload);

        return _parsePayload(decoded);
      } catch (_) {
        return {};
      }
    }

    if (rawPayload is Map) {
      return Map<String, dynamic>.from(rawPayload);
    }

    return {};
  }

  // ============================================================
  // P2P RECEIVER
  // ============================================================

  Future<void> _handleP2PPacket(String packet) async {
    try {
      final payload = _parsePayload(packet);

      if (payload.isEmpty) {
        debugPrint("[P2P] Invalid packet.");
        return;
      }

      final type = payload["type"]?.toString();

      // --------------------------------------------------------
      // GOSSIP BLACKLIST
      // --------------------------------------------------------

      if (type == "gossip_blacklist") {
        await _handleIncomingGossip(payload["blacklist"]);
        return;
      }

      // --------------------------------------------------------
      // ACK
      // --------------------------------------------------------

      if (type == "ack") {
        final messageId = payload["messageId"] as String?;

        final status = payload["status"] as String?;

        final sender = payload["sender"] as String?;

        final receiver = payload["receiver"] as String?;

        final conversationId = payload["conversationId"]?.toString();

        final signature = payload["signature"]?.toString() ?? "";

        final signingPublicKey =
            payload["senderSigningPublicKey"]?.toString() ?? "";

        if (messageId == null ||
            status == null ||
            sender == null ||
            receiver == null ||
            conversationId == null ||
            signature.isEmpty ||
            signingPublicKey.isEmpty) {
          debugPrint("[Security] Invalid ACK.");
          return;
        }

        // ACK must come from the person we are talking to.
        if (sender != widget.conversation.username) {
          debugPrint("[Security] ACK from unexpected sender.");
          return;
        }

        // ACK must be addressed to us.
        if (receiver != _currentUsername) {
          debugPrint("[Security] ACK is not addressed to us.");
          return;
        }

        // The signing key must be trusted.
        if (signingPublicKey != widget.conversation.publicSigningKey) {
          debugPrint("[Security] ACK signing key mismatch.");
          return;
        }

        final verificationPayload = <String, dynamic>{
          "type": "ack",
          "messageId": messageId,
          "conversationId": conversationId,
          "sender": sender,
          "receiver": receiver,
          "status": status,
        };

        bool isSignatureValid = false;

        try {
          final publicKeyBytes = base64Decode(signingPublicKey);

          final senderPublicKey = SimplePublicKey(
            publicKeyBytes,
            type: KeyPairType.ed25519,
          );

          isSignatureValid = await _signatureService.verifyMessage(
            base64Signature: signature,
            payloadData: verificationPayload,
            senderPublicKey: senderPublicKey,
          );
        } catch (e) {
          debugPrint("[Security] ACK verification error: $e");

          isSignatureValid = false;
        }

        if (!isSignatureValid) {
          debugPrint("[Security] Rejected forged ACK.");
          return;
        }

        debugPrint(
          "[ACK] Valid signed ACK received "
          "for $messageId",
        );

        await _handleIncomingAck(messageId, status, payload);

        return;
      }

      // --------------------------------------------------------
      // MESSAGE
      // --------------------------------------------------------

      final messageId = payload["id"] as String?;

      if (messageId == null) {
        debugPrint("[Security] P2P packet has no message ID.");
        return;
      }

      final incomingEncryptedText = payload["text"]?.toString() ?? "";

      final incomingSignature = payload["signature"]?.toString() ?? "";

      final incomingPubKeyBase64 =
          payload["senderSigningPublicKey"]?.toString() ?? "";

      final timestampMs = payload["timestamp"];

      if (timestampMs is! int) {
        debugPrint("[Security] Message has invalid timestamp.");
        return;
      }

      final timestamp = DateTime.fromMillisecondsSinceEpoch(timestampMs);

      final conversationId = payload["conversationId"]?.toString();

      if (conversationId == null || conversationId.isEmpty) {
        debugPrint("[Security] Message has no conversation ID.");
        return;
      }

      final sender = payload["sender"]?.toString();

      final receiver = payload["receiver"]?.toString();

      if (sender == null || sender.isEmpty) {
        debugPrint("[Security] Message has no sender.");
        return;
      }

      if (receiver == null || receiver.isEmpty) {
        debugPrint("[Security] Message has no receiver.");
        return;
      }

      // --------------------------------------------------------
      // SENDER CHECK
      // --------------------------------------------------------

      if (sender != widget.conversation.username) {
        debugPrint("[Security] Unexpected P2P sender: $sender");
        return;
      }

      // --------------------------------------------------------
      // RECEIVER CHECK
      // --------------------------------------------------------

      if (receiver != _currentUsername) {
        debugPrint("[Security] Message is not addressed to us.");
        return;
      }

      // --------------------------------------------------------
      // CONVERSATION CHECK
      // --------------------------------------------------------

      if (conversationId != widget.conversation.id) {
        debugPrint("[Security] Wrong conversation ID.");
        return;
      }

      // --------------------------------------------------------
      // BASIC FIELD CHECKS
      // --------------------------------------------------------

      if (incomingEncryptedText.isEmpty ||
          incomingSignature.isEmpty ||
          incomingPubKeyBase64.isEmpty) {
        debugPrint("[Security] Message is missing required fields.");
        return;
      }

      // --------------------------------------------------------
      // TRUSTED SIGNING KEY CHECK
      // --------------------------------------------------------

      if (incomingPubKeyBase64 != widget.conversation.publicSigningKey) {
        return;
      }

      // --------------------------------------------------------
      // SIGNATURE VERIFICATION
      // --------------------------------------------------------

      final verificationPayload = <String, dynamic>{
        "messageId": messageId,
        "conversationId": conversationId,
        "sender": sender,
        "receiver": receiver,
        "timestamp": timestampMs,
        "content": incomingEncryptedText,
      };

      bool isSignatureValid = false;

      try {
        final publicKeyBytes = base64Decode(
          widget.conversation.publicSigningKey,
        );

        final senderPublicKey = SimplePublicKey(
          publicKeyBytes,
          type: KeyPairType.ed25519,
        );

        isSignatureValid = await _signatureService.verifyMessage(
          base64Signature: incomingSignature,
          payloadData: verificationPayload,
          senderPublicKey: senderPublicKey,
        );
      } catch (e) {
        debugPrint("[Security] Signature verification error: $e");

        isSignatureValid = false;
      }

      if (!isSignatureValid) {
        debugPrint("[Security] Rejected forged/tampered message.");
        return;
      }

      // ========================================================
      // AUTHENTICATED DUPLICATE HANDLING
      // ========================================================
      //
      // IMPORTANT:
      //
      // We only reach this point after:
      // - sender validation
      // - receiver validation
      // - conversation validation
      // - trusted public-key validation
      // - signature validation
      //
      // Therefore a duplicate here is an authenticated copy
      // of a message that we already accepted.
      //
      // The sender may be retrying because our previous ACK
      // was lost. Re-ACK it instead of silently dropping it.
      // ========================================================

      final alreadyExists = _messages.any((message) => message.id == messageId);

      final pendingExists = _pendingMessages.containsKey(messageId);

      bool persistedDuplicate = false;

      if (!alreadyExists && !pendingExists) {
        /*
         * The message might not be loaded into the current
         * UI page because it is older than the latest 20.
         *
         * Check persistent storage before deciding it is new.
         */
        final storedMessages = await _messageService.getMessages(
          widget.conversation.id,
        );

        persistedDuplicate = storedMessages.any(
          (message) => message.id == messageId,
        );
      }

      if (alreadyExists || pendingExists || persistedDuplicate) {
        debugPrint(
          "[P2P] Authenticated duplicate "
          "$messageId received.",
        );

        /*
         * The receiver already has the message.
         *
         * Send the ACK again so the sender can finally
         * transition its pending outbox entry to delivered.
         */
        await _sendAck(messageId, "delivered");

        return;
      }

      // --------------------------------------------------------
      // CREATE MESSAGE
      // --------------------------------------------------------

      final message = Message(
        id: messageId,
        conversationId: conversationId,
        sender: sender,
        receiver: receiver,
        encryptedText: incomingEncryptedText,
        signature: incomingSignature,
        senderSigningPublicKey: incomingPubKeyBase64,
        timestamp: timestamp,
        outgoing: false,
        type: MessageType.text,
        status: MessageStatus.delivered,
      );

      // --------------------------------------------------------
      // PERSIST INCOMING MESSAGE
      // --------------------------------------------------------

      await _messageService.addMessage(message);

      // --------------------------------------------------------
      // DECRYPT
      // --------------------------------------------------------

      try {
        final sharedKey = await _getOrDeriveSharedKey();

        final text = await _decryptWithKey(message, sharedKey);

        if (text != null && mounted && !_disposed) {
          _decryptedTexts[message.id] = text;
        }
      } catch (e) {
        debugPrint("[Crypto] Incoming decryption failed: $e");
      }

      if (!mounted || _disposed) return;

      // --------------------------------------------------------
      // ADD TO UI
      // --------------------------------------------------------

      setState(() {
        _messages.insert(0, message);
      });

      // --------------------------------------------------------
      // DELIVERY ACK
      // --------------------------------------------------------

      await _sendAck(message.id, "delivered");

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    } catch (e, stack) {
      debugPrint(
        "[ChatPage] P2P packet error: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // SEND MESSAGE
  // ============================================================

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();

    if (text.isEmpty) return;

    _messageController.clear();

    try {
      // --------------------------------------------------------
      // SHARED KEY
      // --------------------------------------------------------

      final sharedKey = await _getOrDeriveSharedKey();

      // --------------------------------------------------------
      // ENCRYPT
      // --------------------------------------------------------

      final encrypted = await _encryptionService.encryptMessage(
        message: text,
        key: sharedKey,
      );

      final messageId = _uuid.v4();

      final timestampMs = DateTime.now().millisecondsSinceEpoch;

      final senderId = _currentUsername ?? "";

      final receiverId = widget.conversation.username;

      if (senderId.isEmpty) {
        throw Exception("Current username is unavailable.");
      }

      // --------------------------------------------------------
      // SIGNING KEY
      // --------------------------------------------------------

      final password = SessionService.instance.password;

      if (password == null) {
        throw Exception("Identity locked.");
      }

      final signingKeyPair = await _accountService.getSigningKeyPair(password);

      final senderPublicKey = await signingKeyPair.extractPublicKey();

      final senderPubKeyBase64 = base64Encode(senderPublicKey.bytes);

      // --------------------------------------------------------
      // EXACT SIGNED PAYLOAD
      // --------------------------------------------------------

      final payloadToSign = <String, dynamic>{
        "messageId": messageId,
        "conversationId": widget.conversation.id,
        "sender": senderId,
        "receiver": receiverId,
        "timestamp": timestampMs,
        "content": encrypted,
      };

      final signature = await _signatureService.signMessage(
        privateKey: signingKeyPair,
        payloadData: payloadToSign,
      );

      // --------------------------------------------------------
      // LOCAL MESSAGE
      // --------------------------------------------------------

      final newMessage = Message(
        id: messageId,
        conversationId: widget.conversation.id,
        sender: senderId,
        receiver: receiverId,
        encryptedText: encrypted,
        signature: signature,
        senderSigningPublicKey: senderPubKeyBase64,
        timestamp: DateTime.fromMillisecondsSinceEpoch(timestampMs),
        outgoing: true,
        type: MessageType.text,
        status: MessageStatus.pending,
      );

      // --------------------------------------------------------
      // SAVE PENDING MESSAGE IMMEDIATELY
      // --------------------------------------------------------
      //
      // This happens BEFORE P2P.
      //
      // If the connection is unavailable or the app closes,
      // the exact same message can be retried later.
      // --------------------------------------------------------

      _pendingMessages[messageId] = newMessage;

      _decryptedTexts[messageId] = text;

      await _messageService.addMessage(newMessage);

      // --------------------------------------------------------
      // SHOW MESSAGE IMMEDIATELY
      // --------------------------------------------------------

      if (mounted && !_disposed) {
        setState(() {
          _messages.insert(0, newMessage);
        });
      }

      // --------------------------------------------------------
      // SEND
      // --------------------------------------------------------

      final sendSucceeded = await _sendPayload({
        "id": messageId,
        "conversationId": widget.conversation.id,
        "sender": senderId,
        "receiver": receiverId,
        "text": encrypted,
        "signature": signature,
        "senderSigningPublicKey": senderPubKeyBase64,
        "timestamp": timestampMs,
      });

      // --------------------------------------------------------
      // SEND FAILED
      // --------------------------------------------------------

      if (!sendSucceeded) {
        debugPrint(
          "[Message] $messageId not sent. "
          "Keeping it as pending.",
        );

        return;
      }

      debugPrint(
        "[Message] $messageId sent. "
        "Waiting for ACK...",
      );
    } catch (e, stack) {
      debugPrint(
        "[ChatPage] Send message failed: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // SEND ACK
  // ============================================================

  Future<void> _sendAck(String messageId, String status) async {
    try {
      final password = SessionService.instance.password;

      if (password == null) {
        debugPrint("[ACK] Cannot sign ACK: identity locked.");
        return;
      }

      final signingKeyPair = await _accountService.getSigningKeyPair(password);

      final senderPublicKey = await signingKeyPair.extractPublicKey();

      final senderPubKeyBase64 = base64Encode(senderPublicKey.bytes);

      // EXACT payload that gets signed.
      final payloadToSign = <String, dynamic>{
        "type": "ack",
        "messageId": messageId,
        "conversationId": widget.conversation.id,
        "sender": _currentUsername,
        "receiver": widget.conversation.username,
        "status": status,
      };

      final signature = await _signatureService.signMessage(
        privateKey: signingKeyPair,
        payloadData: payloadToSign,
      );

      final sent = await _sendPayload({
        "type": "ack",
        "messageId": messageId,
        "conversationId": widget.conversation.id,
        "sender": _currentUsername,
        "receiver": widget.conversation.username,
        "status": status,
        "senderSigningPublicKey": senderPubKeyBase64,
        "signature": signature,
      }, showConnectionError: false);

      if (sent) {
        debugPrint("[ACK] Sent ACK for $messageId");
      } else {
        debugPrint("[ACK] Could not send ACK for $messageId.");
      }
    } catch (e, stack) {
      debugPrint(
        "[ACK] Failed to create/send ACK: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // HANDLE INCOMING ACK
  // ============================================================

  Future<void> _handleIncomingAck(
    String messageId,
    String statusStr,
    Map<String, dynamic> payload,
  ) async {
    // We only accept delivered ACKs.
    if (statusStr != "delivered") {
      debugPrint(
        "[ACK] Ignoring unsupported ACK status: "
        "$statusStr",
      );
      return;
    }

    final pending = _pendingMessages[messageId];

    if (pending == null) {
      debugPrint("[ACK] No pending message for $messageId");
      return;
    }

    final conversationId = payload["conversationId"]?.toString();

    final sender = payload["sender"]?.toString();

    final receiver = payload["receiver"]?.toString();

    final signature = payload["signature"]?.toString() ?? "";

    final signingPublicKey =
        payload["senderSigningPublicKey"]?.toString() ?? "";

    // ------------------------------------------------------------
    // BASIC ACK VALIDATION
    // ------------------------------------------------------------

    if (conversationId != widget.conversation.id) {
      debugPrint("[Security] ACK has wrong conversation ID.");
      return;
    }

    // The ACK sender must be the person we sent the message to.
    if (sender != widget.conversation.username) {
      debugPrint("[Security] ACK came from unexpected sender.");
      return;
    }

    // The ACK receiver must be us.
    if (receiver != _currentUsername) {
      debugPrint("[Security] ACK is not addressed to us.");
      return;
    }

    if (signature.isEmpty || signingPublicKey.isEmpty) {
      debugPrint("[Security] ACK is missing signature/key.");
      return;
    }

    // ------------------------------------------------------------
    // TRUSTED SIGNING KEY CHECK
    // ------------------------------------------------------------

    if (signingPublicKey != widget.conversation.publicSigningKey) {
      debugPrint("[Security] ACK signing key mismatch.");
      return;
    }

    // ------------------------------------------------------------
    // VERIFY ACK SIGNATURE
    // ------------------------------------------------------------

    final verificationPayload = <String, dynamic>{
      "type": "ack",
      "messageId": messageId,
      "conversationId": conversationId,
      "sender": sender,
      "receiver": receiver,
      "status": statusStr,
    };

    bool isSignatureValid = false;

    try {
      final publicKeyBytes = base64Decode(widget.conversation.publicSigningKey);

      final senderPublicKey = SimplePublicKey(
        publicKeyBytes,
        type: KeyPairType.ed25519,
      );

      isSignatureValid = await _signatureService.verifyMessage(
        base64Signature: signature,
        payloadData: verificationPayload,
        senderPublicKey: senderPublicKey,
      );
    } catch (e) {
      debugPrint(
        "[Security] ACK signature verification error: "
        "$e",
      );

      isSignatureValid = false;
    }

    if (!isSignatureValid) {
      debugPrint("[Security] Rejected forged ACK.");
      return;
    }

    // ------------------------------------------------------------
    // VALID SIGNED ACK
    // ------------------------------------------------------------

    debugPrint(
      "[ACK] Valid signed delivery ACK "
      "for $messageId.",
    );

    // ------------------------------------------------------------
    // UPDATE PERSISTED MESSAGE
    // ------------------------------------------------------------
    //
    // IMPORTANT:
    //
    // Do NOT use addMessage() here.
    //
    // The message already exists in storage as pending.
    // updateMessage() changes that exact message to delivered.
    // ------------------------------------------------------------

    final updatedMessage = pending.copyWith(status: MessageStatus.delivered);

    try {
      await _messageService.updateMessage(updatedMessage);

      /*
       * Only remove it from the in-memory outbox AFTER the
       * persistent update succeeded.
       */
      _pendingMessages.remove(messageId);

      if (!mounted || _disposed) return;

      final index = _messages.indexWhere((message) => message.id == messageId);

      if (index != -1) {
        setState(() {
          _messages[index] = updatedMessage;
        });
      }

      debugPrint("[ACK] Message $messageId is now delivered.");
    } catch (e, stack) {
      /*
       * Keep the message in _pendingMessages if persistence
       * failed. The retry system will continue treating it
       * as pending.
       */
      debugPrint(
        "[ACK] Failed to persist delivered status "
        "for $messageId: $e\n$stack",
      );
    }
  }

  // ============================================================
  // GOSSIP BLACKLIST
  // ============================================================

  Future<void> _syncGossipBlacklist() async {
    try {
      final blacklist = await _messageService.getBlacklist();

      if (blacklist.isEmpty) return;

      await _sendPayload({
        "type": "gossip_blacklist",
        "blacklist": blacklist,
      }, showConnectionError: false);
    } catch (e) {
      debugPrint("[Gossip] Sync failed: $e");
    }
  }

  Future<void> _handleIncomingGossip(dynamic incomingData) async {
    if (incomingData is! List) {
      return;
    }

    final incomingBlacklist = incomingData
        .map((e) => e.toString().toLowerCase())
        .toList();

    for (final blockedUserId in incomingBlacklist) {
      await _messageService.deleteMessagesFromSender(blockedUserId);
    }

    _decryptedTexts.clear();

    if (mounted && !_disposed) {
      setState(() {
        _isLoading = true;
        _messages = [];
      });
    }

    await _loadMessages();
  }

  // ============================================================
  // LOAD OLDER MESSAGES
  // ============================================================

  void _handleScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    // Because the ListView is reversed, position 0 is the newest
    // message and maxScrollExtent is the oldest.
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      unawaited(_loadOlderMessages());
    }
  }

  Future<void> _loadOlderMessages() async {
    if (_isLoadingOlderMessages || !_hasMoreMessages || _disposed || !mounted) {
      return;
    }

    _isLoadingOlderMessages = true;

    try {
      final olderMessages = await _messageService.getMessagesPage(
        widget.conversation.id,
        limit: _pageSize,
        offset: _loadedMessageCount,
      );

      if (_disposed || !mounted) {
        return;
      }

      olderMessages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      if (olderMessages.isEmpty) {
        _hasMoreMessages = false;
        return;
      }

      final existingIds = _messages.map((message) => message.id).toSet();

      final newMessages = olderMessages
          .where((message) => !existingIds.contains(message.id))
          .toList();

      /*
       * Also restore any pending messages discovered
       * while loading older pages.
       */
      for (final message in olderMessages) {
        if (message.outgoing && message.status == MessageStatus.pending) {
          _pendingMessages[message.id] = message;
        }
      }

      setState(() {
        _messages.addAll(newMessages);

        _loadedMessageCount += olderMessages.length;

        _hasMoreMessages = olderMessages.length == _pageSize;
      });

      // Decrypt newly loaded messages in background.
      _startBackgroundDecryption(newMessages);
    } catch (e, stack) {
      debugPrint(
        "[Messages] Loading older messages failed: "
        "$e\n$stack",
      );
    } finally {
      _isLoadingOlderMessages = false;
    }
  }

  // ============================================================
  // SCROLL
  // ============================================================

  void _scrollToBottom() {
    if (!_scrollController.hasClients) {
      return;
    }

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _disposed = true;

    _signalingSubscription?.cancel();

    _connectionTimeoutTimer?.cancel();
    _connectionTimeoutTimer = null;

    _pendingRetryTimer?.cancel();
    _pendingRetryTimer = null;

    _isPendingRetryRunning = false;

    _webrtc.onMessage = null;
    _webrtc.onIceCandidate = null;
    _webrtc.onDataChannelState = null;
    _webrtc.onConnectionFailed = null;

    unawaited(_webrtc.dispose());

    /*
     * Remove plaintext from memory.
     */
    _decryptedTexts.clear();

    _decryptingMessageIds.clear();

    /*
     * This only clears the in-memory copy.
     *
     * Pending messages themselves remain safely persisted
     * inside MessageService/Hive.
     */
    _pendingMessages.clear();

    _cachedSharedKey = null;
    _sharedKeyDerivation = null;

    _scrollController.dispose();

    _messageController.dispose();

    super.dispose();
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.conversation.username,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isP2PActive ? Icons.lock : Icons.lock_outline,
                    size: 16,
                    color: _isP2PActive
                        ? Colors.green
                        : _connectionFailed
                        ? Colors.red
                        : Colors.orange,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _isP2PActive
                        ? l10n.p2p
                        : _connectionFailed
                        ? l10n.connectionFailed
                        : l10n.connecting,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // ====================================================
          // CONNECTION STATUS
          // ====================================================
          if (_isConnecting || _connectionFailed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              color: (_connectionFailed ? Colors.red : Colors.orange)
                  .withValues(alpha: 0.15),
              child: Center(
                child: _connectionFailed
                    ? Column(
                        children: [
                          Text(
                            l10n.connectionFailedDetails,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton(
                            onPressed: _retryConnection,
                            child: Text(l10n.retry),
                          ),
                        ],
                      )
                    : Text(
                        l10n.connectingP2p,
                        style: const TextStyle(fontSize: 12),
                      ),
              ),
            ),

          // ====================================================
          // MESSAGES
          // ====================================================
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                ? Center(child: Text(l10n.noMessagesYet))
                : ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];

                      final decryptedText = _decryptedTexts[message.id];

                      return Align(
                        alignment: message.outgoing
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: message.outgoing
                                ? Colors.blueAccent
                                : Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // ------------------------------------------
                              // TEXT
                              // ------------------------------------------
                              if (decryptedText != null)
                                Text(
                                  decryptedText,
                                  style: const TextStyle(color: Colors.white),
                                )
                              else
                                const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),

                              // ------------------------------------------
                              // STATUS
                              // ------------------------------------------
                              if (message.outgoing) ...[
                                const SizedBox(height: 2),
                                Icon(
                                  message.status == MessageStatus.read
                                      ? Icons.done_all
                                      : message.status ==
                                            MessageStatus.delivered
                                      ? Icons.done_all
                                      : Icons.done,
                                  size: 14,
                                  color: message.status == MessageStatus.read
                                      ? Colors.lightBlueAccent
                                      : Colors.white70,
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // ====================================================
          // INPUT
          // ====================================================
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: l10n.typeMessage,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _isP2PActive ? _sendMessage : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
