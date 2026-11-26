import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' hide MessageType;
import 'package:cryptography/cryptography.dart';

import 'package:crypt_messenger/services/encryption_service.dart';
import '../services/attachment_service.dart';
import '../services/conversation_service.dart';
import '../services/signaling_service.dart';
import '../services/account_service.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../services/message_service.dart';
import '../services/webrtc_service.dart';
import '../services/session_service.dart';
import '../services/key_exchange_service.dart';
import '../services/signature_service.dart';
import '../main.dart';

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

  final ConversationService _conversationService = ConversationService();

  final ImagePicker _imagePicker = ImagePicker();

  RTCDataChannelState _channelState = RTCDataChannelState.RTCDataChannelClosed;

  bool get _isP2PActive =>
      _channelState == RTCDataChannelState.RTCDataChannelOpen;

  /// The device with the greater username offers, the other one answers.
  ///
  /// Both sides compute this the same way, so they never offer at the same
  /// time and there is no glare to resolve.
  bool get _isOfferer =>
      (_currentUsername ?? "").compareTo(widget.conversation.username) > 0;

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

  // Messages that are waiting for their turn to be decrypted.
  //
  // This is what the bubble renders as "decrypting". It is separate from
  // _decryptingMessageIds because a message can be queued for a while before
  // the background pass reaches it, and the background pass skips ids that are
  // already in flight. Either set present means "not resolved yet"; once both
  // are absent the bubble must show its final state. That is the guarantee that
  // removes the endless spinner: a message can never be in neither state and
  // still render a spinner.
  final Set<String> _pendingDecryption = {};

  // Decoded attachments, kept small and rebuilt on demand from the encrypted
  // message itself, so a long chat with photos cannot pin hundreds of
  // megabytes in memory.
  final Map<String, ChatAttachment> _attachmentCache = {};

  final Map<String, String> _attachmentEnvelopes = {};

  static const int _attachmentCacheLimit = 4;

  /// A key derivation that hangs (a locked identity, a stalled platform read)
  /// must not leave every bubble spinning. After this long the message is
  /// reported as undecryptable instead, with a retry action.
  static const Duration _decryptionTimeout = Duration(seconds: 45);

  bool _isSendingAttachment = false;

  // Messages whose first send is still in progress.
  //
  // The outbox retries every pending message every few seconds. A large
  // attachment can take longer than that to hand to the data channel, so
  // without this the retry timer would start a second full transfer while the
  // first one was still running.
  final Set<String> _inFlightSends = {};

  // Message IDs whose ciphertext could not be decrypted.
  //
  // Without this the bubble had no way to tell "still decrypting" apart from
  // "decryption failed", so a failed message kept a spinner forever and
  // looked like infinite loading. A failed message now shows an explicit
  // "unable to decrypt" state instead.
  final Set<String> _failedDecryptions = {};

  /*
   * Messages that have been sent but have NOT yet received
   * a verified delivery ACK.
   *
   * They are persisted locally as pending so they survive
   * connection loss or app restart.
   */
  final Map<String, Message> _pendingMessages = {};

  bool _isLoading = true;

  // Whether the user has scrolled away from the newest message.
  //
  // While true we show a "jump to latest" button so a long conversation
  // stays easy to catch up with, instead of forcing the user to scroll
  // manually back to the bottom.
  bool _showScrollToBottom = false;

  bool _isConnecting = true;
  bool _connectionFailed = false;

  Timer? _connectionTimeoutTimer;

  /// Retries the P2P handshake for as long as this chat is open.
  Timer? _autoReconnectTimer;

  /// When the last offer, answer or ICE candidate was sent or received.
  ///
  /// The automatic retry uses it to stay out of the way of a negotiation
  /// that is already in flight.
  DateTime? _lastNegotiationAt;

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
    _startAutoReconnect();
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

      // Every message that is about to be drawn starts as pending. Nothing is
      // left in an undefined state, so a bubble is either decrypting because
      // it is genuinely queued, or it shows a final result.
      //
      // A plaintext already in memory is not marked pending again: the
      // background pass skips those ids, so marking them would leave a spinner
      // that nothing would ever clear. Their decoded attachments are kept for
      // the same reason.
      _pendingDecryption
        ..clear()
        ..addAll(
          messages
              .map((message) => message.id)
              .where((id) => !_decryptedTexts.containsKey(id)),
        );

      _failedDecryptions.clear();
      _decryptingMessageIds.clear();

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

      // Store the newest message as this conversation's preview. Without it
      // the chat list keeps the empty preview written when the contact was
      // created, which is what made the home screen show "Decrypting..." for
      // every chat after a restart even though the messages were on disk.
      await _persistPreviewForMessage(messages.first);

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

    for (final message in messages) {
      _pendingDecryption.add(message.id);
    }

    try {
      final sharedKey =
          await _getOrDeriveSharedKey().timeout(_decryptionTimeout);

      final results = await Future.wait(
        messages.map((message) => _decryptWithKey(message, sharedKey)),
      );

      if (!mounted || _disposed) return;

      for (int i = 0; i < messages.length; i++) {
        final text = results[i];

        if (text != null) {
          _registerDecrypted(messages[i], text);
        } else {
          // Stop showing a spinner for a message that will never decrypt.
          _markDecryptionFailed(messages[i].id);
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

      // The whole batch failed (for example the identity is locked). Mark
      // these messages so the UI shows an error instead of spinning forever.
      for (final message in messages) {
        _markDecryptionFailed(message.id);
      }

      if (mounted && !_disposed) {
        setState(() {});
      }
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
      final sharedKey =
          await _getOrDeriveSharedKey().timeout(_decryptionTimeout);

      // Rebuilding the list once per message is what made scrolling a long
      // conversation stutter: every decrypted bubble forced a full rebuild of
      // every other bubble. Decrypt in small batches instead, so the work is
      // the same but the rebuilds are a fraction of the count.
      const int batchSize = 8;

      int decryptedInBatch = 0;

      for (final message in messages) {
        if (_disposed || !mounted) {
          return;
        }

        if (_decryptedTexts.containsKey(message.id)) {
          // Already resolved; make sure it is not left looking pending.
          _pendingDecryption.remove(message.id);

          continue;
        }

        if (_decryptingMessageIds.contains(message.id)) {
          continue;
        }

        _decryptingMessageIds.add(message.id);

        try {
          final text = await _decryptWithKey(message, sharedKey);

          if (text != null && !_disposed && mounted) {
            _registerDecrypted(message, text);

            decryptedInBatch++;
          } else if (!_disposed && mounted) {
            _markDecryptionFailed(message.id);
          }
        } catch (e) {
          debugPrint(
            "[Crypto] Background decryption failed "
            "for ${message.id}: $e",
          );

          _markDecryptionFailed(message.id);
        } finally {
          _decryptingMessageIds.remove(message.id);
        }

        if (decryptedInBatch >= batchSize) {
          decryptedInBatch = 0;

          if (!_disposed && mounted) {
            setState(() {});
          }

          // Yield the frame so scrolling and incoming packets stay responsive
          // while the rest of the history is decrypted.
          await Future<void>.delayed(Duration.zero);
        }
      }

      if (!_disposed && mounted) {
        setState(() {});
      }

      debugPrint("[Messages] Background decryption finished.");
    } catch (e, stack) {
      debugPrint(
        "[Messages] Background decryption error: "
        "$e\n$stack",
      );

      for (final message in messages) {
        _markDecryptionFailed(message.id);
      }

      if (!_disposed && mounted) {
        setState(() {});
      }
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
  // DECRYPTION RESULT
  // ============================================================

  /// Records a successful decryption.
  ///
  /// Text messages keep their plaintext. An attachment envelope is recognised
  /// here so the bubble can draw the image or file directly, while the
  /// envelope itself stays available for the small decoded-bytes cache.
  void _registerDecrypted(Message message, String plaintext) {
    _pendingDecryption.remove(message.id);
    _decryptingMessageIds.remove(message.id);
    _failedDecryptions.remove(message.id);

    if (plaintext.length > 32 &&
        AttachmentService.looksLikeAttachment(plaintext)) {
      final ChatAttachment? attachment = AttachmentService.tryParse(plaintext);

      if (attachment == null) {
        // The envelope was tampered with or truncated. Show the same honest
        // error a failed decryption shows rather than a wall of base64.
        _failedDecryptions.add(message.id);
        return;
      }

      _attachmentEnvelopes[message.id] = plaintext;
      _attachmentCache[message.id] = attachment;
      _decryptedTexts[message.id] = '';
      return;
    }

    _attachmentEnvelopes.remove(message.id);
    _attachmentCache.remove(message.id);
    _decryptedTexts[message.id] = plaintext;
  }

  /// Ends the pending state for a message that cannot be decrypted.
  ///
  /// Every path that starts a decryption ends in either this or
  /// [_registerDecrypted], so no message is left in limbo.
  void _markDecryptionFailed(String messageId) {
    _pendingDecryption.remove(messageId);
    _decryptingMessageIds.remove(messageId);
    _failedDecryptions.add(messageId);
  }

  /// Decoded attachment bytes for a message, re-read from its envelope when
  /// the small cache has moved on.
  ChatAttachment? _attachmentFor(String messageId) {
    final ChatAttachment? cached = _attachmentCache[messageId];

    if (cached != null) {
      return cached;
    }

    final String? envelope = _attachmentEnvelopes[messageId];

    if (envelope == null) {
      return null;
    }

    final ChatAttachment? parsed = AttachmentService.tryParse(envelope);

    if (parsed == null) {
      return null;
    }

    if (_attachmentCache.length >= _attachmentCacheLimit) {
      _attachmentCache.remove(_attachmentCache.keys.first);
    }

    _attachmentCache[messageId] = parsed;

    return parsed;
  }

  /// Tries one message again after a failure, for example once the identity
  /// has been unlocked. Lets the user recover in place instead of reopening
  /// the chat.
  Future<void> _retryDecryption(Message message) async {
    if (_disabledForDecryption(message.id)) {
      return;
    }

    if (mounted) {
      setState(() {
        _failedDecryptions.remove(message.id);
        _pendingDecryption.add(message.id);
        _decryptingMessageIds.add(message.id);
      });
    }

    try {
      final sharedKey =
          await _getOrDeriveSharedKey().timeout(_decryptionTimeout);

      final text = await _decryptWithKey(message, sharedKey);

      if (text != null) {
        _registerDecrypted(message, text);
      } else {
        _markDecryptionFailed(message.id);
      }
    } catch (e) {
      debugPrint("[Crypto] Retry failed for ${message.id}: $e");

      _markDecryptionFailed(message.id);
    } finally {
      _decryptingMessageIds.remove(message.id);

      if (mounted && !_disposed) {
        setState(() {});
      }
    }
  }

  bool _disabledForDecryption(String messageId) {
    return _disposed || !mounted || _decryptingMessageIds.contains(messageId);
  }

  // ============================================================
  // CONVERSATION PREVIEW
  // ============================================================

  /// Saves the last line of this chat so the home list can show it.
  ///
  /// The preview is persisted on the device, next to the conversation, so it
  /// survives a restart. Until this existed the preview stayed empty forever
  /// and the chat list drew it as "Decrypting...", which is what looked like an
  /// infinite spinner after the app was killed and reopened.
  Future<void> _persistConversationPreview(
    String preview, {
    bool touch = true,
  }) async {
    final String trimmed = preview.trim();

    if (trimmed.isEmpty) {
      return;
    }

    final String line = trimmed.length > 120
        ? '${trimmed.substring(0, 120)}…'
        : trimmed;

    try {
      await _conversationService.updateLastMessage(
        conversationId: widget.conversation.id,
        lastMessage: line,
        touch: touch,
      );
    } catch (e) {
      debugPrint("[Messages] Could not save conversation preview: $e");
    }
  }

  Future<void> _persistPreviewForMessage(Message message) async {
    final ChatAttachment? attachment = _attachmentFor(message.id);

    if (attachment != null) {
      final AppLocalizations? l10n = mounted ? AppLocalizations.of(context) : null;

      await _persistConversationPreview(
        AttachmentService.previewLabel(
          attachment,
          photoLabel: l10n?.attachPhoto ?? 'Photo',
        ),
        // Filling in a preview that was never saved must not reorder the list.
        touch: false,
      );

      return;
    }

    final String? text = _decryptedTexts[message.id];

    if (text != null) {
      await _persistConversationPreview(text, touch: false);
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

      await _webrtc.sendMessage(encoded);

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
        // Keep a failure banner that is already showing: the automatic retry
        // must not make it flicker on and off every few seconds.
        _isConnecting = !_connectionFailed;
      });
    }

    try {
      _currentUsername = await _accountService.getUsername();

      if (_currentUsername == null || !mounted || _disposed) {
        return;
      }

      // --------------------------------------------------------
      // SIGNALING SOCKET
      //
      // The handshake does not need the shared key, so it no longer waits
      // for the key derivation to finish first.
      // --------------------------------------------------------

      if (!_signaling.isConnected) {
        await _signaling.connect(_currentUsername!);
      }

      // --------------------------------------------------------
      // LISTEN BEFORE ANYTHING SLOW
      //
      // The listener used to be attached after the WebRTC setup. An offer
      // that arrived while this page was still starting was therefore
      // dropped, and the chat sat on "Connecting to P2P..." until it timed
      // out.
      // --------------------------------------------------------

      await _signalingSubscription?.cancel();
      _signalingSubscription = _signaling.stream.listen((event) async {
        await _handleSignalingEvent(event);
      });

      // --------------------------------------------------------
      // WEBRTC
      //
      // An offer may already have built the connection while the steps above
      // were running; re-initialising here would throw that work away.
      // --------------------------------------------------------

      if (_webrtc.peerConnection == null) {
        await _webrtc.initialize();
      }

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
      // OFFERER SELECTION
      //
      // The offer is no longer delayed: the listener above is already
      // attached, and the automatic retry keeps sending it until the other
      // device has this chat open.
      // --------------------------------------------------------

      _startConnectionTimeout();

      if (_isOfferer) {
        await _sendOffer();
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

  /// Sends a fresh offer to the other device.
  Future<void> _sendOffer() async {
    if (_disposed || !mounted || _isP2PActive) {
      return;
    }

    final offer = await _webrtc.createOffer();

    if (!mounted || _disposed) return;

    _signaling.sendOffer(
      target: widget.conversation.username,
      offer: offer,
    );

    _lastNegotiationAt = DateTime.now();

    debugPrint("[WebRTC] Offer sent.");
  }

  /// Keeps retrying the P2P handshake while this chat is open.
  ///
  /// A single offer with one timeout left both devices on "Connecting to
  /// P2P..." whenever the other person opened the chat a moment later, and
  /// the only way out was the Retry button. The retry now runs by itself, so
  /// the chat connects as soon as both devices have it open.
  void _startAutoReconnect() {
    _autoReconnectTimer?.cancel();

    _autoReconnectTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        if (_disposed || !mounted) return;
        if (_isP2PActive) return;
        if (_isConnectionAttemptRunning) return;

        // Let a negotiation that is already in flight finish. Tearing the
        // peer connection down while an answer is on its way would only make
        // the two devices miss each other.
        final last = _lastNegotiationAt;

        if (last != null &&
            DateTime.now().difference(last) <
                const Duration(seconds: 6)) {
          return;
        }

        unawaited(_connect());
      },
    );
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

        if (_inFlightSends.contains(message.id)) {
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

    if (_connectionFailed) {
      setState(() {
        _connectionFailed = false;
        _isConnecting = true;
      });
    }

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
      _isConnecting = !_connectionFailed;
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

      if (type == "force_disconnect") {
        await _handleForceDisconnect(data);
        return;
      }

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

  /// The server reported this account as banned.
  ///
  /// Shows the reason, then ends the session so the app
  /// returns to the login screen.
  Future<void> _handleForceDisconnect(
    Map<String, dynamic> data,
  ) async {
    final reason = data["reason"]?.toString() ??
        AppLocalizations.of(context)!.accountSuspendedByAdmin;

    if (mounted) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.accountSuspended,
          ),
          content: Text(reason),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        ),
      );
    }

    _signaling.disconnect();
    await _accountService.logout();
    SessionService.instance.lock();

    if (!mounted) return;

    CryptApp.restartStartup(context);
  }

  Future<void> _handleOffer(Map<String, dynamic> payload) async {
    final sdp = payload["sdp"] as String?;

    final offerType = payload["type"] as String?;

    if (sdp == null || sdp.isEmpty || offerType == null) {
      return;
    }

    _lastNegotiationAt = DateTime.now();

    // A late duplicate offer must not tear down a channel that is already up.
    if (_isP2PActive) {
      return;
    }

    debugPrint("[WebRTC] Received offer.");

    // Every offer starts a fresh negotiation. Applying a repeated offer to
    // the previous connection fails, because that connection already holds a
    // local answer.
    await _webrtc.initialize();

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

    _lastNegotiationAt = DateTime.now();

    await _webrtc.setRemoteAnswer(RTCSessionDescription(sdp, answerType));
  }

  Future<void> _handleCandidate(Map<String, dynamic> payload) async {
    final candidate = payload["candidate"];

    if (candidate == null) {
      return;
    }

    _lastNegotiationAt = DateTime.now();

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

      _pendingDecryption.add(message.id);

      try {
        final sharedKey =
            await _getOrDeriveSharedKey().timeout(_decryptionTimeout);

        final text = await _decryptWithKey(message, sharedKey);

        if (text != null && mounted && !_disposed) {
          _registerDecrypted(message, text);
        } else if (mounted && !_disposed) {
          _markDecryptionFailed(message.id);
        }
      } catch (e) {
        debugPrint("[Crypto] Incoming decryption failed: $e");

        if (mounted && !_disposed) {
          _markDecryptionFailed(message.id);
        }
      }

      if (!mounted || _disposed) return;

      // Keep the chat list preview current on the receiving side too.
      await _persistPreviewForMessage(message);

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

      // Only yank the scroll position when the user is already looking at
      // the newest message; otherwise keep their place and surface the
      // "jump to latest" button instead.
      if (!_showScrollToBottom) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }

      // A light haptic makes an incoming message feel alive even when the
      // phone is in a pocket or the screen is dimmed.
      HapticFeedback.lightImpact();
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

    await _queueMessage(text, type: MessageType.text);
  }

  /// Encrypts, signs, persists and sends one plaintext payload.
  ///
  /// Attachments use this too: their plaintext is the attachment envelope, so
  /// they get exactly the same encryption, signature, outbox retry and storage
  /// as a typed message.
  Future<void> _queueMessage(
    String text, {
    required MessageType type,
  }) async {
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
        type: type,
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

      _registerDecrypted(newMessage, text);

      await _messageService.addMessage(newMessage);

      await _persistConversationPreview(_previewForPlaintext(text));

      // --------------------------------------------------------
      // SHOW MESSAGE IMMEDIATELY
      // --------------------------------------------------------

      if (mounted && !_disposed) {
        setState(() {
          _messages.insert(0, newMessage);
        });
      }

      // --------------------------------------------------------
      // NOT CONNECTED YET
      //
      // The message is already saved as pending, so queue it instead of
      // refusing to send. The outbox flushes it the moment the channel
      // opens.
      // --------------------------------------------------------

      if (!_isP2PActive) {
        debugPrint("[Message] $messageId queued until P2P is open.");

        return;
      }

      // --------------------------------------------------------
      // SEND
      // --------------------------------------------------------

      _inFlightSends.add(messageId);

      final bool sendSucceeded;

      try {
        sendSucceeded = await _sendPayload({
          "id": messageId,
          "conversationId": widget.conversation.id,
          "sender": senderId,
          "receiver": receiverId,
          "text": encrypted,
          "signature": signature,
          "senderSigningPublicKey": senderPubKeyBase64,
          "timestamp": timestampMs,
        });
      } finally {
        _inFlightSends.remove(messageId);
      }

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

      // A small confirmation tap, separate from the incoming-message impact.
      HapticFeedback.selectionClick();
    } catch (e, stack) {
      debugPrint(
        "[ChatPage] Send message failed: "
        "$e\n$stack",
      );
    }
  }

  /// The line shown in the chat list for a message's plaintext.
  String _previewForPlaintext(String plaintext) {
    if (!AttachmentService.looksLikeAttachment(plaintext)) {
      return plaintext;
    }

    final ChatAttachment? attachment = AttachmentService.tryParse(plaintext);

    if (attachment == null) {
      return plaintext;
    }

    final AppLocalizations? l10n = mounted ? AppLocalizations.of(context) : null;

    return AttachmentService.previewLabel(
      attachment,
      photoLabel: l10n?.attachPhoto ?? 'Photo',
    );
  }

  // ============================================================
  // ATTACHMENTS
  // ============================================================

  void _openAttachmentSheet() {
    if (_disposed || !mounted) return;

    final AppLocalizations l10n = AppLocalizations.of(context)!;

    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(l10n.attachPhoto),
                onTap: () {
                  Navigator.of(sheetContext).pop();

                  unawaited(_pickAttachment(MessageType.image));
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file),
                title: Text(l10n.attachFile),
                onTap: () {
                  Navigator.of(sheetContext).pop();

                  unawaited(_pickAttachment(MessageType.file));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAttachment(MessageType type) async {
    if (_isSendingAttachment || _disposed || !mounted) return;

    final AppLocalizations l10n = AppLocalizations.of(context)!;

    _isSendingAttachment = true;

    setState(() {});

    try {
      Uint8List? bytes;
      String name = '';
      String mime = '';

      if (type == MessageType.image) {
        final XFile? picked = await _imagePicker.pickImage(
          source: ImageSource.gallery,
        );

        if (picked == null) return;

        bytes = await picked.readAsBytes();
        name = picked.name.trim().isEmpty ? 'photo' : picked.name;
        mime = picked.mimeType ?? _mimeFromName(name);
      } else {
        final PlatformFile? file = await FilePicker.pickFile();

        if (file == null) return;

        // Ask for the size before reading, so an oversized pick is refused
        // without first pulling it into memory.
        final int? declaredLength = await file.length();

        if (declaredLength != null &&
            declaredLength > AttachmentService.maxBytes) {
          _showAttachmentProblem(
            l10n.attachmentTooLarge(AttachmentService.sizeLimitMb),
          );
          return;
        }

        bytes = await file.readAsBytes();
        name = file.name;
        mime = _mimeFromName(name);
      }

      if (bytes.isEmpty) {
        _showAttachmentProblem(l10n.attachmentSendFailed);
        return;
      }

      // Checked before encrypting and before the outbox stores anything, so an
      // oversized pick costs nothing and cannot wedge the send queue.
      if (bytes.length > AttachmentService.maxBytes) {
        _showAttachmentProblem(
          l10n.attachmentTooLarge(AttachmentService.sizeLimitMb),
        );
        return;
      }

      final String envelope = AttachmentService.encode(
        kind: type == MessageType.image
            ? ChatAttachment.kindImage
            : ChatAttachment.kindFile,
        name: name,
        mimeType: mime,
        bytes: bytes,
      );

      if (!mounted || _disposed) return;

      await _queueMessage(envelope, type: type);
    } catch (e, stack) {
      debugPrint("[Attachment] Pick/send failed: $e\n$stack");

      if (mounted && !_disposed) {
        _showAttachmentProblem(l10n.attachmentSendFailed);
      }
    } finally {
      _isSendingAttachment = false;

      if (mounted && !_disposed) {
        setState(() {});
      }
    }
  }

  void _showAttachmentProblem(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// A rough MIME type from the file extension.
  ///
  /// Only used to give the receiving share sheet a sensible type; the bytes
  /// themselves are what matter and they are encrypted either way.
  String _mimeFromName(String name) {
    final int dot = name.lastIndexOf('.');

    if (dot == -1 || dot == name.length - 1) {
      return 'application/octet-stream';
    }

    switch (name.substring(dot + 1).toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      case 'heic':
        return 'image/heic';
      case 'pdf':
        return 'application/pdf';
      case 'txt':
        return 'text/plain';
      case 'mp4':
        return 'video/mp4';
      case 'm4a':
        return 'audio/mp4';
      case 'mp3':
        return 'audio/mpeg';
      default:
        return 'application/octet-stream';
    }
  }

  /// Opens an attachment with the system share sheet, so the user can save it,
  /// open it in another app or forward it.
  Future<void> _openAttachment(ChatAttachment attachment) async {
    try {
      await Share.shareXFiles(
        [
          XFile.fromData(
            attachment.bytes,
            name: attachment.name,
            mimeType: attachment.mimeType.isEmpty
                ? 'application/octet-stream'
                : attachment.mimeType,
          ),
        ],
        subject: attachment.name,
      );
    } catch (e) {
      debugPrint("[Attachment] Could not open: $e");

      if (!mounted) return;

      _showAttachmentProblem(AppLocalizations.of(context)!.attachmentOpenFailed);
    }
  }

  Widget _buildAttachmentBubble(ChatAttachment attachment) {
    if (attachment.isImage) {
      return GestureDetector(
        onTap: () => unawaited(_openAttachment(attachment)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 240,
              maxHeight: 240,
            ),
            child: Image.memory(
              attachment.bytes,
              fit: BoxFit.cover,
              gaplessPlayback: true,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () => unawaited(_openAttachment(attachment)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.insert_drive_file_outlined,
            color: Colors.white,
            size: 22,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  attachment.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  AttachmentService.formatSize(attachment.size),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
    _attachmentCache.clear();
    _attachmentEnvelopes.clear();
    _pendingDecryption.clear();
    _failedDecryptions.clear();

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

    // Track whether the user is looking at the newest message. A small
    // threshold keeps the button from flickering on tiny scroll bounces.
    final bool atBottom = _scrollController.position.pixels < 80;

    if (atBottom != !_showScrollToBottom) {
      if (mounted && !_disposed) {
        setState(() {
          _showScrollToBottom = !atBottom;
        });
      }
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

      _pendingDecryption.addAll(
        newMessages
            .map((message) => message.id)
            .where((id) => !_decryptedTexts.containsKey(id)),
      );

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

    _autoReconnectTimer?.cancel();
    _autoReconnectTimer = null;

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

    _pendingDecryption.clear();

    _attachmentCache.clear();

    _attachmentEnvelopes.clear();

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
            child: Stack(
              children: [
                _isLoading
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

                      final attachment = _attachmentFor(message.id);

                      // A spinner is only ever drawn for a message that is
                      // actually waiting on decryption right now. A message
                      // that has fallen out of both sets has a final state, so
                      // it can never spin forever.
                      final bool isResolving =
                          _pendingDecryption.contains(message.id) ||
                          _decryptingMessageIds.contains(message.id);

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
                              if (attachment != null)
                                _buildAttachmentBubble(attachment)
                              else if (decryptedText != null &&
                                  decryptedText.isNotEmpty)
                                Text(
                                  decryptedText,
                                  style: const TextStyle(color: Colors.white),
                                )
                              else if (isResolving)
                                const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                GestureDetector(
                                  onTap: () =>
                                      unawaited(_retryDecryption(message)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.lock_outline,
                                        size: 14,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          l10n.decryptionError,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        l10n.retry,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          decoration:
                                              TextDecoration.underline,
                                        ),
                                      ),
                                    ],
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
                if (_showScrollToBottom)
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: FloatingActionButton.small(
                      heroTag: 'scrollToBottom',
                      onPressed: _scrollToBottom,
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
              ],
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
                  IconButton(
                    tooltip: l10n.attachFile,
                    onPressed:
                        _isSendingAttachment ? null : _openAttachmentSheet,
                    icon: _isSendingAttachment
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.attach_file),
                  ),
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
                    onPressed: _sendMessage,
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
