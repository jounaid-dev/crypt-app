import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show visibleForTesting;

import '../models/message.dart';
import 'hive_storage_service.dart';

class MessageService {
  static const String _messagePrefix = "messages_";

  String _key(String conversationId) {
    return "$_messagePrefix$conversationId";
  }

  // ============================================================
  // DECODED MESSAGE CACHE
  //
  // A conversation is stored as one JSON array, so reading it means decoding
  // every message in it. That decode was repeated on every single operation:
  // sending one message read and rewrote the whole history, and opening a chat
  // decoded the entire archive only to draw the newest 20. On a long
  // conversation this is the difference between an instant open and a spinner.
  //
  // The cache holds the decoded list, keyed by conversation id. Every write
  // already runs inside _enqueueWrite, so writes are serialised and the cache
  // can never be stale relative to a write in flight. Public readers hand out
  // copies so a caller cannot mutate the cached list by accident.
  //
  // Both the cache and the write queue are static because the app does not use
  // a single shared MessageService: ChatPage and GossipService each construct
  // their own. A per-instance cache would let the two disagree about the same
  // conversation, and a per-instance write queue would let one instance
  // overwrite the other's changes.
  // ============================================================

  static final Map<String, List<Message>> _decodedCache =
      <String, List<Message>>{};

  static Future<void> _writeQueue = Future.value();

  /// Drops the decoded cache.
  ///
  /// Called when the underlying store is wiped from outside this service, such
  /// as a device wipe or a sign out, so nothing already decoded can outlive the
  /// data it came from.
  void clearCache() {
    _decodedCache.clear();
  }

  // ============================================================
  // TEST SEAM
  //
  // Exposes the write queue directly so its sequencing guarantee can be tested
  // without a Hive box, which is the only thing that can fail it in practice.
  // ============================================================

  @visibleForTesting
  static Future<void> runQueuedForTest(Future<void> Function() operation) {
    return MessageService()._enqueueWrite(operation);
  }

  /// Resets the shared queue and cache between tests.
  @visibleForTesting
  static void resetForTest() {
    _writeQueue = Future<void>.value();
    _decodedCache.clear();
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
    // Already decoded: hand back the live list so a read-modify-write does not
    // pay for a second decode of the same data.
    final cached = _decodedCache[conversationId];

    if (cached != null) {
      return cached;
    }

    final data = HiveStorageService.getString(
      _key(conversationId),
    );

    final messages = _decodeMessages(data);

    // Storage is always kept oldest -> newest.
    messages.sort(
      (a, b) => a.timestamp.compareTo(b.timestamp),
    );

    _decodedCache[conversationId] = messages;

    return messages;
  }

  /// A snapshot of a conversation's messages, safe for a caller to sort,
  /// reverse or otherwise rearrange.
  Future<List<Message>> _readMessagesCopy(
    String conversationId,
  ) async {
    final messages = await _readMessages(conversationId);

    return List<Message>.of(messages);
  }

  /// Deletes a conversation's stored messages and forgets the decoded copy.
  Future<void> _removeStoredMessages(
    String conversationId,
  ) async {
    _decodedCache.remove(conversationId);

    await HiveStorageService.remove(
      _key(conversationId),
    );
  }

  // ============================================================
  // GET ALL MESSAGES
  // ============================================================

  Future<List<Message>> getMessages(
    String conversationId,
  ) async {
    return _readMessagesCopy(conversationId);
  }

  // ============================================================
  // GET PENDING OUTBOX MESSAGES
  // ============================================================
  //
  // Returns ALL outgoing messages that are still waiting
  // for a valid signed delivery ACK.
  //
  // This is intentionally not paginated.
  //
  // The ChatPage UI only loads a page of messages, but the
  // outbox must be able to restore old pending messages too.
  //
  // ============================================================

  Future<List<Message>> getPendingOutgoingMessages(
    String conversationId,
  ) async {
    final messages = await _readMessagesCopy(
      conversationId,
    );

    return messages
        .where(
          (message) =>
              message.outgoing &&
              message.status == MessageStatus.pending,
        )
        .toList();
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

  /// The conversation is already held oldest -> newest, so paging is a plain
  /// slice from the end rather than a full reversal of a decoded copy.
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
    final newestFirst = messages.reversed.toList();

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

    // The written list is the current state, so the decoded copy is refreshed
    // here rather than thrown away and decoded again on the next read.
    _decodedCache[conversationId] = messages;
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
        await _removeStoredMessages(
          message.conversationId,
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
      await _removeStoredMessages(
        conversationId,
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
    final messages = await _readMessagesCopy(
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
          await _removeStoredMessages(
            conversationId,
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

    // ============================================================
    // WAIT FOR THE PREVIOUS WRITE
    //
    // This queue exists only to order writes. It must never complete with an
    // error, and the guard here is what guarantees that even if a future
    // version leaks one: awaiting an errored future would throw before this
    // caller's own completer was ever completed, leaving the queue stuck on a
    // future that can never finish. Every later write would then wait on it
    // forever, so the app would silently stop persisting messages.
    // ============================================================

    try {
      await previous;
    } catch (_) {
      // An earlier write failed. That is its caller's problem, not ours.
      // Carry on rather than inheriting the failure.
    }

    try {
      await operation();
    } catch (error, stack) {
      // Release the next writer before reporting this failure. Completing
      // with the error here is what used to wedge the queue permanently.
      completer.complete();

      Error.throwWithStackTrace(error, stack);
    }

    completer.complete();
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
}