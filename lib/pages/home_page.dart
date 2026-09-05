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

  const HomePage({
    super.key,
    required this.uid,

    // Theme
    this.isDarkMode = false,
    this.onThemeChanged = _defaultThemeChanged,

    // Language
    this.onLanguageChanged,
  });

  static void _defaultThemeChanged(bool value) {}

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage>
    with WidgetsBindingObserver {
  final ConversationService conversationService =
      ConversationService();

  final ChatLockService chatLockService =
      ChatLockService();

  List<Conversation> conversations = [];
  List<Conversation> filteredConversations = [];

  String _searchQuery = "";

  late TextEditingController _searchController;

  bool _isAppBackgrounded = false;

  @override
  void initState() {
    super.initState();

  

    _searchController = TextEditingController();

    loadConversations();
  }

  @override
  void dispose() {

    _searchController.dispose();

    super.dispose();
  }

  // ============================================================
  // APP LIFECYCLE
  // ============================================================

  @override
  void didChangeAppLifecycleState(
    AppLifecycleState state,
  ) {
    if (!mounted) return;

    setState(() {
      _isAppBackgrounded =
          state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused ||
          state == AppLifecycleState.hidden;
    });
  }

  // ============================================================
  // CONVERSATIONS
  // ============================================================

  Future<void> loadConversations() async {
    final list =
        await conversationService.getConversations();

    if (!mounted) return;

    setState(() {
      conversations = list;
      _applySearch();
    });
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      filteredConversations =
          List<Conversation>.from(conversations);
      return;
    }

    final query =
        _searchQuery.toLowerCase();

    filteredConversations =
        conversations.where((conversation) {
      return conversation.username
          .toLowerCase()
          .contains(query);
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

    return text
        .trim()
        .substring(0, 1)
        .toUpperCase();
  }

  String _formatTime(
    BuildContext context,
    DateTime dateTime,
  ) {
    final localTime = dateTime.toLocal();

    final hour =
        localTime.hour % 12 == 0
            ? 12
            : localTime.hour % 12;

    final minute =
        localTime.minute.toString().padLeft(2, "0");

    final period =
        localTime.hour >= 12 ? "PM" : "AM";

    return "$hour:$minute $period";
  }

  // ============================================================
  // OPEN CHAT
  // ============================================================

  Future<void> _openConversation(
    Conversation conversation,
  ) async {
    final allowed =
        await chatLockService.verifyAccess(
      context: context,
      conversationId: conversation.id,
      chatUsername: conversation.username,
    );

    if (!allowed || !mounted) {
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatPage(
          conversation: conversation,
        ),
      ),
    );

    // Refresh when returning from ChatPage.
    await loadConversations();
  }

  // ============================================================
  // QR SCANNER
  // ============================================================

  Future<void> scanQr() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ScanQrPage(),
      ),
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
      final existingConversation =
          result["conversation"] as Conversation;

      await _openConversation(
        existingConversation,
      );

      return;
    }

    // ----------------------------------------------------------
    // VALIDATE QR DATA
    // ----------------------------------------------------------

    if (result is! Map) {
      return;
    }

    final peerPublicEncryptionKey =
        result["publicEncryptionKey"]?.toString();

    final peerPublicSigningKey =
        result["publicSigningKey"]?.toString() ?? "";

    final peerUsername =
        result["username"]?.toString();

    if (peerPublicEncryptionKey == null ||
        peerPublicEncryptionKey.isEmpty ||
        peerUsername == null ||
        peerUsername.isEmpty) {
      return;
    }

    // ----------------------------------------------------------
    // GET MY PUBLIC ENCRYPTION KEY
    // ----------------------------------------------------------

    final myPublicEncryptionKey =
        widget.uid.trim();

    if (myPublicEncryptionKey.isEmpty) {
      debugPrint(
        "Cannot create conversation: own public encryption key is missing.",
      );
      return;
    }

    // ----------------------------------------------------------
    // DETERMINISTIC CONVERSATION ID
    // ----------------------------------------------------------

    final conversationId =
        ConversationIdService.generate(
      myPublicEncryptionKey:
          myPublicEncryptionKey,
      peerPublicEncryptionKey:
          peerPublicEncryptionKey,
    );

    debugPrint(
      "QR conversation ID: $conversationId",
    );

    // ----------------------------------------------------------
    // CHECK AGAINST LOCAL STORAGE
    // ----------------------------------------------------------

    final existing =
        await conversationService
            .findConversationByPublicKey(
      peerPublicEncryptionKey,
    );

    if (existing != null) {
      final updatedConversation = Conversation(
        id: existing.id,
        username: peerUsername,
        publicSigningKey: peerPublicSigningKey,
        publicEncryptionKey:
            existing.publicEncryptionKey,
        createdAt: existing.createdAt,
        lastMessageAt:
            existing.lastMessageAt,
        lastMessage:
            existing.lastMessage,
        unreadCount:
            existing.unreadCount,
        verified:
            existing.verified,
      );

      await conversationService.addConversation(
        updatedConversation,
      );

      await _openConversation(
        updatedConversation,
      );

      return;
    }

    // ----------------------------------------------------------
    // CREATE CONVERSATION
    // ----------------------------------------------------------

    final now = DateTime.now();

    final conversation = Conversation(
      id: conversationId,
      username: peerUsername,
      publicSigningKey:
          peerPublicSigningKey,
      publicEncryptionKey:
          peerPublicEncryptionKey,
      createdAt: now,
      lastMessageAt: now,
      lastMessage: "",
      unreadCount: 0,

      // This is NOT claiming cryptographic verification.
      // The contact was imported successfully.
      verified: false,
    );

    await conversationService.addConversation(
      conversation,
    );

    await loadConversations();

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatPage(
          conversation: conversation,
        ),
      ),
    );

    await loadConversations();
  }

  // ============================================================
  // BUILD CONVERSATION TILE
  // ============================================================

  Widget _buildConversationTile(
    BuildContext context,
    Conversation conversation,
  ) {
    final l10n =
        AppLocalizations.of(context)!;

    return FutureBuilder<bool>(
      future: chatLockService.isLocked(
        conversation.id,
      ),
      builder: (
        context,
        lockSnapshot,
      ) {
        final isLocked =
            lockSnapshot.data ?? false;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor:
                isLocked
                    ? Colors.red.shade700
                    : Theme.of(context)
                        .colorScheme
                        .primary,
            child: Text(
              firstLetter(
                conversation.username,
              ),
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
                  overflow:
                      TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 6),

              if (isLocked)
                const Icon(
                  Icons.lock,
                  size: 16,
                  color: Colors.orange,
                )
              else if (conversation.verified)
                const Icon(
                  Icons.verified_user,
                  size: 16,
                  color: Colors.green,
                ),
            ],
          ),

          subtitle: Text(
            conversation.lastMessage.isEmpty
                ? l10n.processingDecryption
                : conversation.lastMessage,
            maxLines: 1,
            overflow:
                TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(0.6),
            ),
          ),

          trailing: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Text(
                _formatTime(
                  context,
                  conversation.lastMessageAt,
                ),
                style: TextStyle(
                  fontSize: 12,
                  color:
                      Colors.grey.shade500,
                ),
              ),

              if (conversation.unreadCount > 0)
                Container(
                  margin:
                      const EdgeInsets.only(
                    top: 4,
                  ),
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration:
                      BoxDecoration(
                    color:
                        Colors.blueAccent,
                    borderRadius:
                        BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Text(
                    conversation.unreadCount
                        .toString(),
                    style:
                        const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          onTap: () =>
              _openConversation(
            conversation,
          ),

          onLongPress: () {
            debugPrint(
              "Conversation ID: ${conversation.id}",
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
    final l10n =
        AppLocalizations.of(context)!;

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
          // ======================================================
          // SETTINGS
          // ======================================================

          IconButton(
            icon:
                const Icon(Icons.settings),
            onPressed: () =>
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SettingsPage(
                  // ----------------------------
                  // THEME
                  // ----------------------------

                  isDarkMode:
                      widget.isDarkMode,

                  onThemeChanged:
                      widget.onThemeChanged,

                  // ----------------------------
                  // LANGUAGE
                  // ----------------------------

                  onLanguageChanged:
                      widget.onLanguageChanged,
                ),
              ),
            ),
          ),

          // ======================================================
          // QR SCANNER
          // ======================================================

          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
            onPressed: scanQr,
          ),

          // ======================================================
          // IDENTITY
          // ======================================================

          IconButton(
            icon: const Icon(
              Icons.fingerprint,
            ),
            onPressed: () =>
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MyIdentityPage(),
              ),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          Column(
            children: [
              // ==================================================
              // SEARCH
              // ==================================================

              Padding(
                padding:
                    const EdgeInsets.all(12),
                child: TextField(
                  controller:
                      _searchController,
                  onChanged:
                      _performSearch,
                  decoration:
                      InputDecoration(
                    hintText: l10n
                        .searchPipelinesHint,

                    prefixIcon:
                        const Icon(
                      Icons.search,
                    ),

                    suffixIcon:
                        _searchQuery
                                .isNotEmpty
                            ? IconButton(
                                icon:
                                    const Icon(
                                  Icons.clear,
                                ),
                                onPressed: () {
                                  _searchController
                                      .clear();

                                  _performSearch(
                                    "",
                                  );
                                },
                              )
                            : null,

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(12),
                    ),
                  ),
                ),
              ),

              // ==================================================
              // CONVERSATIONS
              // ==================================================

              Expanded(
                child:
                    filteredConversations
                            .isEmpty
                        ? Center(
                            child: Text(
                              l10n
                                  .zeroPipelinesDiscovered,
                            ),
                          )
                        : ListView.builder(
                            itemCount:
                                filteredConversations
                                    .length,
                            itemBuilder:
                                (
                              context,
                              index,
                            ) {
                              return _buildConversationTile(
                                context,
                                filteredConversations[
                                    index],
                              );
                            },
                          ),
              ),
            ],
          ),

          // ======================================================
          // APP BACKGROUND PRIVACY SHIELD
          // ======================================================

          if (_isAppBackgrounded)
            Positioned.fill(
              child: Container(
                color:
                    const Color(0xFF000000),
                child: Center(
                  child: Text(
                    l10n
                        .cryptContainerSecure,
                    style:
                        const TextStyle(
                      color:
                          Colors.blueAccent,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                      letterSpacing: 2,
                      decoration:
                          TextDecoration.none,
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