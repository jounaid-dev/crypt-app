import 'dart:async';

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';

import 'chat_page.dart';
import 'my_identity_page.dart';
import 'scan_qr_page.dart';
import 'settings_page.dart';

import '../models/conversation.dart';
import '../services/conversation_service.dart';
import '../services/conversation_id_service.dart';
import '../services/chat_lock_service.dart';
import '../services/signaling_service.dart';
import '../services/account_service.dart';
import '../services/qr_validation_code_service.dart';

class HomePage extends StatefulWidget {
  final String uid;

  // ============================================================
  // THEME
  // ============================================================

  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  // ============================================================
  // LANGUAGE
  // ============================================================

  final Function(Locale)? onLanguageChanged;
  final bool showSplashScreen;
  final Function(bool)? onSplashScreenChanged;

  const HomePage({
    super.key,
    required this.uid,
    this.isDarkMode = false,
    this.onThemeChanged = _defaultThemeChanged,
    this.onLanguageChanged,
    this.showSplashScreen = true,
    this.onSplashScreenChanged,
  });

  static void _defaultThemeChanged(bool value) {}

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final ConversationService conversationService = ConversationService();

  final ChatLockService chatLockService = ChatLockService();

  final SignalingService _signaling = SignalingService.instance;

  final AccountService _accountService = AccountService();

  final QrValidationCodeService _qrValidationCodeService =
      QrValidationCodeService();

  List<Conversation> conversations = [];
  List<Conversation> filteredConversations = [];

  String _searchQuery = "";

  /// True until the first conversation list has arrived.
  ///
  /// A brand new account has no chats, so without this the home page draws its
  /// finished empty state immediately and there is no sign the app is still
  /// starting up after the splash.
  bool _isLoadingConversations = true;

  /// How long the loading spinner stays up at minimum, so it is actually
  /// visible instead of flashing past in a single frame.
  static const int _minimumLoadingMs = 1200;

  late TextEditingController _searchController;

  bool _isAppBackgrounded = false;

  StreamSubscription? _signalingSubscription;

  bool _isHandlingConversationRequest = false;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _searchController = TextEditingController();

    loadConversations();

    _initializeSignaling();
  }

  // ============================================================
  // SIGNALING INITIALIZATION
  // ============================================================

  Future<void> _initializeSignaling() async {
    try {
      final username = await _accountService.getUsername();

      if (username == null || username.trim().isEmpty) {
        debugPrint("[Home] Cannot connect signaling: username missing.");
        return;
      }

      // --------------------------------------------------------
      // CONNECT
      // --------------------------------------------------------

      if (!_signaling.isConnected) {
        await _signaling.connect(username.trim());
      }

      // --------------------------------------------------------
      // LISTEN
      // --------------------------------------------------------

      if (!mounted) return;

      await _signalingSubscription?.cancel();

      _signalingSubscription = _signaling.stream.listen(
        (event) async {
          await _handleSignalingEvent(event);
        },
        onError: (error) {
          debugPrint("[Home] Signaling stream error: $error");
        },
      );

      debugPrint("[Home] Signaling listener ready.");
    } catch (e, stack) {
      debugPrint(
        "[Home] Signaling initialization failed: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // SIGNALING EVENTS
  // ============================================================

  Future<void> _handleSignalingEvent(dynamic event) async {
    try {
      if (event is! Map) {
        return;
      }

      final data = Map<String, dynamic>.from(event);

      final type = data["type"]?.toString();

      if (type == "conversation_request") {
        await _handleConversationRequest(data);
        return;
      }

      if (type == "conversation_accept") {
        await _handleConversationAccept(data);
        return;
      }

      if (type == "conversation_reject") {
        debugPrint("[Home] Conversation request rejected.");
        return;
      }
    } catch (e, stack) {
      debugPrint(
        "[Home] Signaling event error: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // INCOMING CONVERSATION REQUEST
  // ============================================================

  Future<void> _handleConversationRequest(Map<String, dynamic> data) async {
    final l10n = AppLocalizations.of(context)!;

    if (_isHandlingConversationRequest) {
      debugPrint("[Home] Already handling a conversation request.");
      return;
    }

    _isHandlingConversationRequest = true;

    try {
      final sender = data["sender"]?.toString();

      final target = data["target"]?.toString();

      final rawPayload = data["payload"];

      // ========================================================
      // BASIC ENVELOPE VALIDATION
      // ========================================================

      if (sender == null || sender.trim().isEmpty) {
        debugPrint("[Security] Conversation request has no sender.");
        return;
      }

      if (target == null || target.trim().isEmpty) {
        debugPrint("[Security] Conversation request has no target.");
        return;
      }

      if (rawPayload is! Map) {
        debugPrint("[Security] Conversation request has invalid payload.");
        return;
      }

      final payload = Map<String, dynamic>.from(rawPayload);

      // ========================================================
      // GET REQUEST IDENTITY
      // ========================================================

      final peerUsername = payload["username"]?.toString();

      final peerPublicEncryptionKey = payload["publicEncryptionKey"]
          ?.toString();

      final peerPublicSigningKey = payload["publicSigningKey"]?.toString();

      final requestedConversationId = payload["conversationId"]?.toString();

      final receivedQrProof = payload["qrProof"]?.toString();

      if (peerUsername == null ||
          peerUsername.trim().isEmpty ||
          peerPublicEncryptionKey == null ||
          peerPublicEncryptionKey.trim().isEmpty ||
          peerPublicSigningKey == null ||
          peerPublicSigningKey.trim().isEmpty) {
        debugPrint("[Security] Incomplete conversation request.");
        return;
      }

      // ========================================================
      // SENDER IDENTITY MUST MATCH ENVELOPE
      // ========================================================

      if (sender != peerUsername) {
        debugPrint("[Security] Conversation request sender mismatch.");
        return;
      }

      // ========================================================
      // GET OUR USERNAME
      // ========================================================

      final myUsername = await _accountService.getUsername();

      if (myUsername == null || myUsername.trim().isEmpty) {
        debugPrint("[Home] Our username is missing.");
        return;
      }

      // ========================================================
      // TARGET MUST BE US
      // ========================================================

      if (target != myUsername) {
        debugPrint("[Security] Conversation request is not for us.");
        return;
      }

      // ========================================================
      // DO NOT ALLOW SELF REQUEST
      // ========================================================

      if (peerUsername == myUsername) {
        debugPrint("[Security] Ignoring self conversation request.");
        return;
      }

      // ========================================================
      // QR PROOF
      // ========================================================

      if (receivedQrProof == null || receivedQrProof.isEmpty) {
        debugPrint("[Security] Conversation request has no QR proof.");
        return;
      }

      final storedCode = await _qrValidationCodeService.findCode(
        receivedQrProof,
      );

      if (storedCode == null) {
        debugPrint(
          "[Security] No stored QR validation code "
          "matches $peerUsername's request.",
        );
        return;
      }

      // --------------------------------------------------------
      // A CODE THAT HAS ALREADY BEEN CONSUMED CANNOT BE REUSED
      // --------------------------------------------------------

      if (storedCode.used) {
        debugPrint(
          "[Security] QR validation code already used. "
          "Conversation request rejected.",
        );
        return;
      }

      debugPrint(
        "[QR Security] QR validation code verified for "
        "$peerUsername.",
      );

      // ========================================================
      // GET OUR PUBLIC ENCRYPTION KEY
      // ========================================================

      final myPublicEncryptionKey = await _accountService
          .getPublicEncryptionKey();

      if (myPublicEncryptionKey == null || myPublicEncryptionKey.isEmpty) {
        debugPrint("[Home] Our public encryption key is missing.");
        return;
      }

      // ========================================================
      // DETERMINISTIC CONVERSATION ID
      // ========================================================

      final conversationId = ConversationIdService.generate(
        myPublicEncryptionKey: myPublicEncryptionKey,
        peerPublicEncryptionKey: peerPublicEncryptionKey,
      );

      debugPrint(
        "[Home] Deterministic conversation ID: "
        "$conversationId",
      );

      // ========================================================
      // VALIDATE SUPPLIED CONVERSATION ID
      // ========================================================

      if (requestedConversationId != null &&
          requestedConversationId.isNotEmpty &&
          requestedConversationId != conversationId) {
        debugPrint("[Security] Conversation ID mismatch.");
        return;
      }

      // ========================================================
      // CHECK EXISTING CONTACT
      // ========================================================

      final existing = await conversationService.findConversationByPublicKey(
        peerPublicEncryptionKey,
      );

      Conversation conversation;

      if (existing != null) {
        conversation = existing.copyWith(
          id: conversationId,
          username: peerUsername,
          publicSigningKey: peerPublicSigningKey,
          publicEncryptionKey: peerPublicEncryptionKey,
        );

        final updated = await conversationService.updateConversation(
          conversation,
        );

        if (!updated) {
          throw StateError("Conversation update failed.");
        }

        debugPrint("[Home] Existing conversation updated.");
      } else {
        // ======================================================
        // CREATE NEW CONTACT
        // ======================================================

        final now = DateTime.now();

        conversation = Conversation(
          id: conversationId,
          username: peerUsername,
          publicSigningKey: peerPublicSigningKey,
          publicEncryptionKey: peerPublicEncryptionKey,
          createdAt: now,
          lastMessageAt: now,
          lastMessage: "",
          unreadCount: 0,
          verified: false,
        );

        final added = await conversationService.addConversation(conversation);

        if (!added) {
          throw StateError("Conversation creation failed.");
        }

        debugPrint("[Home] New conversation saved.");
      }

      // ========================================================
      // MARK QR VALIDATION CODE AS USED
      // ========================================================
      //
      // Persisted only after the conversation was created
      // successfully above. If creation failed, the code is left
      // unused and can still be used later.

      final markedUsed = await _qrValidationCodeService.markUsed(
        receivedQrProof,
      );

      if (!markedUsed) {
        debugPrint("[Security] QR validation code was consumed concurrently.");
        return;
      }

      // ========================================================
      // SEND ACCEPTANCE
      // ========================================================

      if (!_signaling.isConnected) {
        debugPrint(
          "[Home] Signaling is disconnected. "
          "Cannot send acceptance.",
        );
        return;
      }

      _signaling.sendConversationAccept(
        target: peerUsername,
        payload: {
          "conversationId": conversation.id,

          "username": myUsername,

          "publicEncryptionKey": myPublicEncryptionKey,

          "publicSigningKey": await _accountService.getPublicSigningKey(),

          "requesterPublicEncryptionKey": peerPublicEncryptionKey,
        },
      );

      debugPrint(
        "[Home] Conversation acceptance sent to "
        "$peerUsername.",
      );

      await loadConversations();

      // ========================================================
      // NOTIFICATION
      // ========================================================

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.newContact(peerUsername))));
      }
    } catch (e, stack) {
      debugPrint(
        "[Home] Failed to handle conversation request: "
        "$e\n$stack",
      );
    } finally {
      _isHandlingConversationRequest = false;
    }
  }

  // ============================================================
  // OUTGOING REQUEST ACCEPTANCE
  // ============================================================

  Future<void> _handleConversationAccept(Map<String, dynamic> data) async {
    try {
      final sender = data["sender"]?.toString();

      final target = data["target"]?.toString();

      final rawPayload = data["payload"];

      if (sender == null || sender.isEmpty || rawPayload is! Map) {
        return;
      }

      final payload = Map<String, dynamic>.from(rawPayload);

      final conversationId = payload["conversationId"]?.toString();

      final peerUsername = payload["username"]?.toString();

      final peerPublicEncryptionKey = payload["publicEncryptionKey"]
          ?.toString();

      final peerPublicSigningKey = payload["publicSigningKey"]?.toString();

      if (conversationId == null ||
          conversationId.isEmpty ||
          peerUsername == null ||
          peerUsername.isEmpty ||
          peerPublicEncryptionKey == null ||
          peerPublicEncryptionKey.isEmpty) {
        debugPrint("[Security] Invalid conversation acceptance.");
        return;
      }

      // ========================================================
      // GET OUR USERNAME
      // ========================================================

      final myUsername = await _accountService.getUsername();

      if (myUsername == null || myUsername.isEmpty) {
        return;
      }

      // ========================================================
      // TARGET MUST BE US
      // ========================================================

      if (target != null && target.isNotEmpty && target != myUsername) {
        debugPrint(
          "[Security] Conversation acceptance "
          "is not for us.",
        );
        return;
      }

      // ========================================================
      // SENDER MUST MATCH PEER
      // ========================================================

      if (sender != peerUsername) {
        debugPrint(
          "[Security] Conversation acceptance "
          "sender mismatch.",
        );
        return;
      }

      // ========================================================
      // GET OUR PUBLIC ENCRYPTION KEY
      // ========================================================

      final myPublicEncryptionKey = await _accountService
          .getPublicEncryptionKey();

      if (myPublicEncryptionKey == null || myPublicEncryptionKey.isEmpty) {
        return;
      }

      // ========================================================
      // RE-CALCULATE CONVERSATION ID
      // ========================================================

      final expectedConversationId = ConversationIdService.generate(
        myPublicEncryptionKey: myPublicEncryptionKey,
        peerPublicEncryptionKey: peerPublicEncryptionKey,
      );

      if (conversationId != expectedConversationId) {
        debugPrint("[Security] Acceptance conversation ID mismatch.");
        return;
      }

      // ========================================================
      // FIND LOCAL CONVERSATION
      // ========================================================

      Conversation? conversation;

      final allConversations = await conversationService.getConversations();

      for (final item in allConversations) {
        if (item.id == conversationId ||
            item.publicEncryptionKey == peerPublicEncryptionKey) {
          conversation = item;
          break;
        }
      }

      if (conversation == null) {
        debugPrint(
          "[Home] Acceptance received for "
          "unknown conversation.",
        );
        return;
      }

      // ========================================================
      // UPDATE TRUSTED PEER IDENTITY
      // ========================================================

      final acceptedConversation = conversation.copyWith(
        id: expectedConversationId,
        username: peerUsername,
        publicEncryptionKey: peerPublicEncryptionKey,
        publicSigningKey: peerPublicSigningKey ?? conversation.publicSigningKey,
      );

      await conversationService.updateConversation(acceptedConversation);

      debugPrint(
        "[Home] Conversation accepted by "
        "$peerUsername.",
      );

      await loadConversations();
    } catch (e, stack) {
      debugPrint(
        "[Home] Failed to handle conversation acceptance: "
        "$e\n$stack",
      );
    }
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _signalingSubscription?.cancel();
    _signalingSubscription = null;

    _searchController.dispose();

    super.dispose();
  }

  // ============================================================
  // APP LIFECYCLE
  // ============================================================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mounted) return;

    setState(() {
      _isAppBackgrounded =
          state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused ||
          state == AppLifecycleState.hidden;
    });

    if (state == AppLifecycleState.resumed) {
      _initializeSignaling();
    }
  }

  // ============================================================
  // CONVERSATIONS
  // ============================================================

  Future<void> loadConversations() async {
    // Hold the spinner for a moment even when the list arrives instantly.
    // Without this the first frame after the splash is the finished list, so
    // the loading state is never actually seen and the app looks like it
    // skipped straight past a blank screen.
    final Stopwatch sinceStart = Stopwatch()..start();

    final list = await conversationService.getConversations();

    final int remaining = _minimumLoadingMs - sinceStart.elapsedMilliseconds;

    if (remaining > 0) {
      await Future<void>.delayed(Duration(milliseconds: remaining));
    }

    if (!mounted) return;

    setState(() {
      conversations = list;
      _isLoadingConversations = false;
      _applySearch();
    });
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      filteredConversations = List<Conversation>.from(conversations);
      return;
    }

    final query = _searchQuery.toLowerCase();

    filteredConversations = conversations.where((conversation) {
      return conversation.username.toLowerCase().contains(query);
    }).toList();
  }

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      _applySearch();
    });
  }

  // ============================================================
  // HELPERS
  // ============================================================

  String firstLetter(String text) {
    if (text.trim().isEmpty) {
      return "?";
    }

    return text.trim().substring(0, 1).toUpperCase();
  }

  String _formatTime(BuildContext context, DateTime dateTime) {
    final localTime = dateTime.toLocal();

    final hour = localTime.hour % 12 == 0 ? 12 : localTime.hour % 12;

    final minute = localTime.minute.toString().padLeft(2, "0");

    final period = localTime.hour >= 12 ? "PM" : "AM";

    return "$hour:$minute $period";
  }

  // ============================================================
  // OPEN CHAT
  // ============================================================

  Future<void> _openConversation(Conversation conversation) async {
    final allowed = await chatLockService.verifyAccess(
      context: context,
      conversationId: conversation.id,
      chatUsername: conversation.username,
    );

    if (!allowed || !mounted) {
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ChatPage(conversation: conversation)),
    );

    await loadConversations();
  }

  // ============================================================
  // QR SCANNER
  // ============================================================

  Future<void> scanQr() async {
    final l10n = AppLocalizations.of(context)!;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScanQrPage()),
    );

    if (result == null || !mounted) {
      return;
    }

    // ----------------------------------------------------------
    // EXISTING CONTACT
    // ----------------------------------------------------------

    if (result is Map &&
        result["alreadyExists"] == true &&
        result["conversation"] is Conversation) {
      final existingConversation = result["conversation"] as Conversation;

      await _openConversation(existingConversation);

      return;
    }

    // ----------------------------------------------------------
    // VALIDATE RESULT
    //
    // These two guards used to return in silence. Scanning a code that came
    // back without a usable identity therefore did nothing visible at all,
    // which reads as the camera having failed. Each one now says what went
    // wrong instead.
    // ----------------------------------------------------------

    if (result is! Map) {
      _showScanProblem(l10n.scanCouldNotReadCode);

      return;
    }

    final peerPublicEncryptionKey = result["publicEncryptionKey"]?.toString();

    final peerPublicSigningKey = result["publicSigningKey"]?.toString() ?? "";

    final peerUsername = result["username"]?.toString();

    if (peerPublicEncryptionKey == null ||
        peerPublicEncryptionKey.isEmpty ||
        peerUsername == null ||
        peerUsername.isEmpty) {
      _showScanProblem(l10n.scanMissingTheirIdentity);

      return;
    }

    // ----------------------------------------------------------
    // GET MY REAL PUBLIC ENCRYPTION KEY
    // ----------------------------------------------------------

    final myPublicEncryptionKey = await _accountService
        .getPublicEncryptionKey();

    if (myPublicEncryptionKey == null || myPublicEncryptionKey.isEmpty) {
      debugPrint(
        "[QR] Cannot create conversation: "
        "own public encryption key is missing.",
      );

      _showScanProblem(l10n.scanOwnIdentityMissing);

      return;
    }

    // ----------------------------------------------------------
    // DETERMINISTIC CONVERSATION ID
    // ----------------------------------------------------------

    final conversationId = ConversationIdService.generate(
      myPublicEncryptionKey: myPublicEncryptionKey,
      peerPublicEncryptionKey: peerPublicEncryptionKey,
    );

    debugPrint(
      "[QR] Conversation ID: "
      "$conversationId",
    );

    // ----------------------------------------------------------
    // CHECK LOCAL STORAGE
    // ----------------------------------------------------------

    final existing = await conversationService.findConversationByPublicKey(
      peerPublicEncryptionKey,
    );

    if (existing != null) {
      final updatedConversation = existing.copyWith(
        id: conversationId,
        username: peerUsername,
        publicSigningKey: peerPublicSigningKey,
        publicEncryptionKey: peerPublicEncryptionKey,
      );

      await conversationService.updateConversation(updatedConversation);

      await _openConversation(updatedConversation);

      return;
    }

    // ----------------------------------------------------------
    // CREATE CONVERSATION
    // ----------------------------------------------------------

    final now = DateTime.now();

    final conversation = Conversation(
      id: conversationId,
      username: peerUsername,
      publicSigningKey: peerPublicSigningKey,
      publicEncryptionKey: peerPublicEncryptionKey,
      createdAt: now,
      lastMessageAt: now,
      lastMessage: "",
      unreadCount: 0,
      verified: false,
    );

    await conversationService.addConversation(conversation);

    await loadConversations();

    if (!mounted) return;

    // ----------------------------------------------------------
    // TELL THE USER WHAT HAPPENED
    //
    // The request is on its way at this point, but the chat is not live until
    // the other person accepts. Without a word about that, scanning a code
    // just drops the user back into a list where nothing appears to have
    // happened, so they scan again, or assume it failed.
    // ----------------------------------------------------------

    await _showRequestSentDialog(l10n: l10n, peerUsername: peerUsername);

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ChatPage(conversation: conversation)),
    );

    await loadConversations();
  }

  /// Reports a scan that could not be turned into a chat.
  ///
  /// A snackbar rather than a dialog: this is a recoverable mistake and the
  /// user is standing on the home page ready to try the next code.
  void _showScanProblem(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Confirms that a connection request was sent, and that the chat is not
  /// live yet.
  Future<void> _showRequestSentDialog({
    required AppLocalizations l10n,
    required String peerUsername,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 34,
                width: 34,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),

              const SizedBox(height: 22),

              Text(
                l10n.requestSentTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                l10n.requestSentBody(peerUsername),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, height: 1.4),
              ),

              const SizedBox(height: 10),

              Text(
                l10n.requestSentKeepOpen,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          actions: [
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(l10n.requestSentGotIt),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // BUILD CONVERSATION TILE
  // ============================================================

  /// What the home page shows when there are no chats yet.
  ///
  /// This used to be a single line reading "No connections found.", which
  /// tells a new user nothing about where a chat comes from. A chat here is
  /// not something you create on this screen: it starts by scanning the other
  /// person's QR code. So the empty state says that and offers the button that
  /// does it, rather than leaving the list looking broken.
  Widget _buildEmptyState(AppLocalizations l10n) {
    final ThemeData theme = Theme.of(context);

    final bool isFiltered = _searchQuery.trim().isNotEmpty;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isFiltered
                  ? Icons.search_off
                  : Icons.forum_outlined,
              size: 56,
              color: theme.colorScheme.primary.withValues(alpha: 0.55),
            ),

            const SizedBox(height: 18),

            Text(
              isFiltered ? l10n.noChatsMatchSearch : l10n.noChatsYetTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              isFiltered
                  ? l10n.noChatsMatchSearchHint
                  : l10n.noChatsYetHint,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),

            if (!isFiltered) ...[
              const SizedBox(height: 24),

              FilledButton.icon(
                onPressed: scanQr,
                icon: const Icon(Icons.qr_code_scanner),
                label: Text(l10n.scanQrToStartChat),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildConversationTile(
    BuildContext context,
    Conversation conversation,
  ) {
    final l10n = AppLocalizations.of(context)!;

    return FutureBuilder<bool>(
      future: chatLockService.isLocked(conversation.id),
      builder: (context, lockSnapshot) {
        final isLocked = lockSnapshot.data ?? false;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: isLocked
                ? Colors.red.shade700
                : Theme.of(context).colorScheme.primary,
            child: Text(
              firstLetter(conversation.username),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Row(
            children: [
              Flexible(
                child: Text(
                  conversation.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 6),
              if (isLocked)
                const Icon(Icons.lock, size: 16, color: Colors.orange)
              else if (conversation.verified)
                const Icon(Icons.verified_user, size: 16, color: Colors.green),
            ],
          ),
          subtitle: Text(
            conversation.lastMessage.isEmpty
                ? l10n.processingDecryption
                : conversation.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatTime(context, conversation.lastMessageAt),
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
              if (conversation.unreadCount > 0)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    conversation.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () => _openConversation(conversation),
          onLongPress: () {
            debugPrint(
              "Conversation ID: "
              "${conversation.id}",
            );
          },
        );
      },
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.appName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(
                  isDarkMode: widget.isDarkMode,
                  onThemeChanged: widget.onThemeChanged,
                  onLanguageChanged: widget.onLanguageChanged,
                  showSplashScreen: widget.showSplashScreen,
                  onSplashScreenChanged: widget.onSplashScreenChanged,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: scanQr,
          ),
          IconButton(
            icon: const Icon(Icons.fingerprint),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyIdentityPage()),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _searchController,
                  onChanged: _performSearch,
                  decoration: InputDecoration(
                    hintText: l10n.searchPipelinesHint,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();

                              _performSearch("");
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _isLoadingConversations
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 28,
                              width: 28,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              l10n.loadingChats,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : filteredConversations.isEmpty
                    ? _buildEmptyState(l10n)
                    : ListView.builder(
                        itemCount: filteredConversations.length,
                        itemBuilder: (context, index) {
                          return _buildConversationTile(
                            context,
                            filteredConversations[index],
                          );
                        },
                      ),
              ),
            ],
          ),
          if (_isAppBackgrounded)
            Positioned.fill(
              child: Container(
                color: const Color(0xFF000000),
                child: Center(
                  child: Text(
                    l10n.cryptContainerSecure,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
