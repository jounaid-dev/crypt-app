import 'dart:async';
import 'dart:convert';

import '../models/message.dart';
import 'hive_storage_service.dart';

class MessageService {
  static const String _messagePrefix = "messages_";

  // Prevent simultaneous read-modify-write operations
  // from overwriting each other.
  Future<void> _writeQueue = Future.value();

  String _key(String conversationId) {
    return "$_messagePrefix$conversationId";
  }

  // ============================================================
  // INTERNAL: LOAD RAW MESSAGES
  // ============================================================

  List<Message> _decodeMessages(String? data) {
    if (data == null || data.isEmpty) {
      return [];
    }

    try {
      final decoded = jsonDecode(data);

      if (decoded is! List) {
        return [];
      }

      final messages = <Message>[];

      for (final item in decoded) {
        if (item is! Map) {
          continue;
        }

        try {
          messages.add(
            Message.fromJson(
              Map<String, dynamic>.from(item),
            ),
          );
        } catch (e) {
          // Ignore one corrupted message instead of
          // destroying the entire conversation.
          //
          // This is intentionally silent because a single
          // corrupted record should not prevent the rest
          // of the conversation from loading.
        }
      }

      return messages;
    } catch (e) {
      return [];
    }
  }

  Future<List<Message>> _readMessages(
    String conversationId,
  ) async {
    final data = HiveStorageService.getString(
      _key(conversationId),
    );

    final messages = _decodeMessages(data);

    // Storage is always kept oldest -> newest.
    messages.sort(
      (a, b) => a.timestamp.compareTo(b.timestamp),
    );

    return messages;
  }

  // ============================================================
  // GET ALL MESSAGES
  // ============================================================

  Future<List<Message>> getMessages(
    String conversationId,
  ) async {
    return _readMessages(conversationId);
  }

  // ============================================================
  // GET PAGINATED MESSAGES
  //
  // Returned order:
  //
  // newest -> oldest
  //
  // Example:
  //
  // offset: 0, limit: 20
  // = newest 20
  //
  // offset: 20, limit: 20
  // = next 20 older messages
  // ============================================================

  Future<List<Message>> getMessagesPage(
    String conversationId, {
    int limit = 20,
    int offset = 0,
  }) async {
    if (limit <= 0 || offset < 0) {
      return [];
    }

    final messages = await _readMessages(
      conversationId,
    );

    if (messages.isEmpty) {
      return [];
    }

    // Convert:
    //
    // oldest -> newest
    //
    // into:
    //
    // newest -> oldest
    final newestFirst = List<Message>.from(
      messages.reversed,
    );

    if (offset >= newestFirst.length) {
      return [];
    }

    final start = offset;

    final end = (start + limit)
        .clamp(0, newestFirst.length);

    return newestFirst.sublist(
      start,
      end,
    );
  }

  // ============================================================
  // GET TOTAL MESSAGE COUNT
  // ============================================================

  Future<int> getMessageCount(
    String conversationId,
  ) async {
    final messages = await _readMessages(
      conversationId,
    );

    return messages.length;
  }

  // ============================================================
  // SAVE MESSAGES
  // ============================================================

  Future<void> saveMessages(
    String conversationId,
    List<Message> messages,
  ) async {
    await _enqueueWrite(() async {
      await _saveMessagesUnsafe(
        conversationId,
        messages,
      );
    });
  }

  Future<void> _saveMessagesUnsafe(
    String conversationId,
    List<Message> messages,
  ) async {
    // Always store oldest -> newest.
    messages.sort(
      (a, b) => a.timestamp.compareTo(b.timestamp),
    );

    final encoded = jsonEncode(
      messages
          .map(
            (message) => message.toJson(),
          )
          .toList(),
    );

    await HiveStorageService.setString(
      _key(conversationId),
      encoded,
    );
  }

  // ============================================================
  // ADD MESSAGE
  // ============================================================

  Future<void> addMessage(
    Message message,
  ) async {
    await _enqueueWrite(() async {
      final messages = await _readMessages(
        message.conversationId,
      );

      // Prevent duplicates.
      final alreadyExists = messages.any(
        (m) => m.id == message.id,
      );

      if (alreadyExists) {
        return;
      }

      messages.add(message);

      await _saveMessagesUnsafe(
        message.conversationId,
        messages,
      );
    });
  }

  // ============================================================
  // ADD MULTIPLE MESSAGES
  // ============================================================

  Future<void> addMessages(
    String conversationId,
    List<Message> newMessages,
  ) async {
    if (newMessages.isEmpty) {
      return;
    }

    await _enqueueWrite(() async {
      final messages = await _readMessages(
        conversationId,
      );

      final existingIds = messages
          .map((m) => m.id)
          .toSet();

      for (final message in newMessages) {
        if (message.conversationId !=
            conversationId) {
          continue;
        }

        if (existingIds.contains(message.id)) {
          continue;
        }

        messages.add(message);
        existingIds.add(message.id);
      }

      await _saveMessagesUnsafe(
        conversationId,
        messages,
      );
    });
  }

  // ============================================================
  // UPDATE MESSAGE
  // ============================================================

  Future<void> updateMessage(
    Message updatedMessage,
  ) async {
    await _enqueueWrite(() async {
      final messages = await _readMessages(
        updatedMessage.conversationId,
      );

      final index = messages.indexWhere(
        (m) => m.id == updatedMessage.id,
      );

      if (index == -1) {
        return;
      }

      messages[index] = updatedMessage;

      await _saveMessagesUnsafe(
        updatedMessage.conversationId,
        messages,
      );
    });
  }

  // ============================================================
  // UPDATE MESSAGE STATUS
  // ============================================================

  Future<void> updateMessageStatus(
    String messageId,
    MessageStatus newStatus,
  ) async {
    await _enqueueWrite(() async {
      final keys = HiveStorageService.getKeys()
          .where(
            (key) => key
                .toString()
                .startsWith(_messagePrefix),
          )
          .toList();

      for (final key in keys) {
        final conversationId = key
            .toString()
            .substring(_messagePrefix.length);

        final messages = await _readMessages(
          conversationId,
        );

        final index = messages.indexWhere(
          (message) => message.id == messageId,
        );

        if (index == -1) {
          continue;
        }

        messages[index] =
            messages[index].copyWith(
          status: newStatus,
        );

        await _saveMessagesUnsafe(
          conversationId,
          messages,
        );

        return;
      }
    });
  }

  // ============================================================
  // DELETE MESSAGE
  // ============================================================

  Future<void> deleteMessage(
    Message message,
  ) async {
    await _enqueueWrite(() async {
      final messages = await _readMessages(
        message.conversationId,
      );

      messages.removeWhere(
        (m) => m.id == message.id,
      );

      if (messages.isEmpty) {
        await HiveStorageService.remove(
          _key(message.conversationId),
        );
        return;
      }

      await _saveMessagesUnsafe(
        message.conversationId,
        messages,
      );
    });
  }

  // ============================================================
  // DELETE CONVERSATION
  // ============================================================

  Future<void> deleteMessagesForConversation(
    String conversationId,
  ) async {
    await clearConversation(
      conversationId,
    );
  }

  // ============================================================
  // CLEAR CONVERSATION
  // ============================================================

  Future<void> clearConversation(
    String conversationId,
  ) async {
    await _enqueueWrite(() async {
      await HiveStorageService.remove(
        _key(conversationId),
      );
    });
  }

  // ============================================================
  // SEARCH
  // ============================================================
  //
  // NOTE:
  // Messages are encrypted, so searching encryptedText
  // does NOT search plaintext messages.
  //
  // This method is kept because your existing architecture
  // may still use it elsewhere.
  // ============================================================

  Future<List<Message>> searchMessages(
    String conversationId,
    String query,
  ) async {
    final messages = await _readMessages(
      conversationId,
    );

    final normalizedQuery =
        query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      return messages;
    }

    return messages.where((message) {
      return message.encryptedText
          .toLowerCase()
          .contains(normalizedQuery);
    }).toList();
  }

  // ============================================================
  // BLACKLIST
  // ============================================================

  Future<List<String>> getBlacklist() async {
    return HiveStorageService.getStringList(
          "destruction_blacklist",
        )
            ?.map(
              (e) => e.toString(),
            )
            .toList() ??
        [];
  }

  // ============================================================
  // DELETE MESSAGES FROM SENDER
  // ============================================================

  Future<void> deleteMessagesFromSender(
    String sender,
  ) async {
    await _enqueueWrite(() async {
      final normalizedSender =
          sender.toLowerCase();

      final keys = HiveStorageService.getKeys()
          .where(
            (key) => key
                .toString()
                .startsWith(_messagePrefix),
          )
          .toList();

      for (final key in keys) {
        final conversationId = key
            .toString()
            .substring(_messagePrefix.length);

        final messages = await _readMessages(
          conversationId,
        );

        final filtered = messages
            .where(
              (message) =>
                  message.sender
                      .toLowerCase() !=
                  normalizedSender,
            )
            .toList();

        if (filtered.length == messages.length) {
          continue;
        }

        if (filtered.isEmpty) {
          await HiveStorageService.remove(
            _key(conversationId),
          );
        } else {
          await _saveMessagesUnsafe(
            conversationId,
            filtered,
          );
        }
      }
    });
  }

  // ============================================================
  // WRITE QUEUE
  //
  // Makes sure multiple operations such as:
  //
  // addMessage()
  // updateMessage()
  // deleteMessage()
  //
  // cannot simultaneously read an old database state
  // and overwrite each other's changes.
  // ============================================================

  Future<void> _enqueueWrite(
    Future<void> Function() operation,
  ) async {
    final previous = _writeQueue;

    final completer = _WriteCompleter();

    _writeQueue = completer.future;

    // Wait until the previous write finishes.
    await previous;

    try {
      await operation();

      completer.complete();
    } catch (e, stack) {
      completer.completeError(
        e,
        stack,
      );

      rethrow;
    }
  }
}

// ============================================================
// SMALL INTERNAL FUTURE COMPLETER
// ============================================================

class _WriteCompleter {
  final Completer<void> _completer =
      Completer<void>();

  Future<void> get future =>
      _completer.future;

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }

  void completeError(
    Object error,
    StackTrace stack,
  ) {
    if (!_completer.isCompleted) {
      _completer.completeError(
        error,
        stack,
      );
    }
  }
}