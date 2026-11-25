import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/conversation.dart';

class ConversationService {
  static const String _storageKey = "conversations";

  Future<List<Conversation>> getConversations() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(_storageKey) ?? [];

    final conversations = data
        .map((e) => Conversation.fromJson(jsonDecode(e)))
        .toList();

    conversations.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));

    return conversations;
  }

  // NEW: Find an existing conversation by the peer's public encryption key.
  Future<Conversation?> findConversationByPublicKey(
    String publicEncryptionKey,
  ) async {
    final conversations = await getConversations();

    try {
      return conversations.firstWhere(
        (c) => c.publicEncryptionKey == publicEncryptionKey,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveConversations(List<Conversation> conversations) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      _storageKey,
      conversations.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  Future<bool> addConversation(Conversation conversation) async {
    final conversations = await getConversations();

    final exists = conversations.any(
      (c) => c.publicEncryptionKey == conversation.publicEncryptionKey,
    );

    if (exists) {
      return false;
    }

    conversations.add(conversation);

    await saveConversations(conversations);

    return true;
  }

  Future<void> deleteConversation(String conversationId) async {
    final conversations = await getConversations();

    conversations.removeWhere((c) => c.id == conversationId);

    await saveConversations(conversations);
  }

  Future<bool> updateConversation(Conversation conversation) async {
    final conversations = await getConversations();

    var index = conversations.indexWhere((c) => c.id == conversation.id);

    if (index == -1) {
      // A chat is identified by its pair of public keys. A record written by
      // an older build can carry a different id, and returning false here
      // made a scan look like it had failed when the contact was already
      // stored under its key.
      index = conversations.indexWhere(
        (c) =>
            conversation.publicEncryptionKey.isNotEmpty &&
            c.publicEncryptionKey == conversation.publicEncryptionKey,
      );
    }

    if (index == -1) {
      return false;
    }

    conversations[index] = conversation;

    await saveConversations(conversations);

    return true;
  }

  Future<void> updateLastMessage({
    required String conversationId,
    required String lastMessage,
  }) async {
    final conversations = await getConversations();

    final index = conversations.indexWhere((c) => c.id == conversationId);

    if (index == -1) {
      return;
    }

    final current = conversations[index];

    conversations[index] = current.copyWith(
      lastMessage: lastMessage,
      lastMessageAt: DateTime.now(),
    );

    await saveConversations(conversations);
  }

  Future<void> increaseUnread(String conversationId) async {
    final conversations = await getConversations();

    final index = conversations.indexWhere((c) => c.id == conversationId);

    if (index == -1) {
      return;
    }

    final current = conversations[index];

    conversations[index] = current.copyWith(
      unreadCount: current.unreadCount + 1,
    );

    await saveConversations(conversations);
  }

  Future<void> clearUnread(String conversationId) async {
    final conversations = await getConversations();

    final index = conversations.indexWhere((c) => c.id == conversationId);

    if (index == -1) {
      return;
    }

    final current = conversations[index];

    conversations[index] = current.copyWith(unreadCount: 0);

    await saveConversations(conversations);
  }
}
