import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/conversation.dart';

class ConversationService {
  static const String _storageKey = "conversations";

  Future<List<Conversation>> getConversations() async {
    final prefs =
        await SharedPreferences.getInstance();

    final data =
        prefs.getStringList(_storageKey) ?? [];

    final conversations = data
        .map(
          (e) => Conversation.fromJson(
            jsonDecode(e),
          ),
        )
        .toList();

    conversations.sort(
      (a, b) =>
          b.lastMessageAt.compareTo(
        a.lastMessageAt,
      ),
    );

    return conversations;
  }

  // NEW: Find an existing conversation by the peer's public encryption key.
  Future<Conversation?> findConversationByPublicKey(
    String publicEncryptionKey,
  ) async {
    final conversations =
        await getConversations();

    try {
      return conversations.firstWhere(
        (c) =>
            c.publicEncryptionKey ==
            publicEncryptionKey,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveConversations(
    List<Conversation> conversations,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setStringList(
      _storageKey,
      conversations
          .map(
            (e) => jsonEncode(
              e.toJson(),
            ),
          )
          .toList(),
    );
  }

  Future<void> addConversation(
    Conversation conversation,
  ) async {
    final conversations =
        await getConversations();

    final exists = conversations.any(
      (c) =>
          c.publicEncryptionKey ==
          conversation.publicEncryptionKey,
    );

    if (exists) {
      return;
    }

    conversations.add(conversation);

    await saveConversations(
      conversations,
    );
  }

  Future<void> deleteConversation(
    String conversationId,
  ) async {
    final conversations =
        await getConversations();

    conversations.removeWhere(
      (c) => c.id == conversationId,
    );

    await saveConversations(
      conversations,
    );
  }

  Future<void> updateConversation(
    Conversation conversation,
  ) async {
    final conversations =
        await getConversations();

    final index = conversations.indexWhere(
      (c) => c.id == conversation.id,
    );

    if (index == -1) {
      return;
    }

    conversations[index] = conversation;

    await saveConversations(
      conversations,
    );
  }

  Future<void> updateLastMessage({
    required String conversationId,
    required String lastMessage,
  }) async {
    final conversations =
        await getConversations();

    final index = conversations.indexWhere(
      (c) => c.id == conversationId,
    );

    if (index == -1) {
      return;
    }

    final current = conversations[index];

    conversations[index] =
        current.copyWith(
      lastMessage: lastMessage,
      lastMessageAt: DateTime.now(),
    );

    await saveConversations(
      conversations,
    );
  }

  Future<void> increaseUnread(
    String conversationId,
  ) async {
    final conversations =
        await getConversations();

    final index = conversations.indexWhere(
      (c) => c.id == conversationId,
    );

    if (index == -1) {
      return;
    }

    final current = conversations[index];

    conversations[index] =
        current.copyWith(
      unreadCount:
          current.unreadCount + 1,
    );

    await saveConversations(
      conversations,
    );
  }

  Future<void> clearUnread(
    String conversationId,
  ) async {
    final conversations =
        await getConversations();

    final index = conversations.indexWhere(
      (c) => c.id == conversationId,
    );

    if (index == -1) {
      return;
    }

    final current = conversations[index];

    conversations[index] =
        current.copyWith(
      unreadCount: 0,
    );

    await saveConversations(
      conversations,
    );
  }
}