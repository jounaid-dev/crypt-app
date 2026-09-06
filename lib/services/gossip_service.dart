import 'dart:convert';

import 'hive_storage_service.dart';
import 'conversation_service.dart';
import 'message_service.dart';
import '../models/conversation.dart';

class GossipService {
  static const String _blacklistKey =
      "destruction_blacklist";

  static const String _blacklistVersionKey =
      "destruction_blacklist_version";

  final ConversationService _conversationService =
      ConversationService();

  final MessageService _messageService =
      MessageService();

  // ============================================================
  // RECEIVE SERVER BLACKLIST
  // ============================================================

  /// Receives the complete blacklist from the server.
  ///
  /// Expected payload:
  ///
  /// {
  ///   "version": 3,
  ///   "updatedAt": "...",
  ///   "entries": [
  ///     {
  ///       "username": "alice",
  ///       "publicId": "..."
  ///     }
  ///   ]
  /// }
  static Future<void> importAndSyncMesh(
    dynamic rawPayload,
  ) async {
    await processServerBlacklist(rawPayload);
  }

  static Future<void> processServerBlacklist(
    dynamic rawPayload,
  ) async {
    if (rawPayload == null) {
      return;
    }

    try {
      Map<String, dynamic> payload;

      // Server data may already be decoded.
      if (rawPayload is Map) {
        payload = Map<String, dynamic>.from(
          rawPayload,
        );
      }
      // Or it may still be JSON text.
      else if (rawPayload is String) {
        if (rawPayload.trim().isEmpty) {
          return;
        }

        final decoded = jsonDecode(rawPayload);

        if (decoded is! Map) {
          return;
        }

        payload = Map<String, dynamic>.from(
          decoded,
        );
      } else {
        return;
      }

      final versionValue =
          payload["version"];

      final int version =
          versionValue is int
              ? versionValue
              : int.tryParse(
                    versionValue?.toString() ?? "",
                  ) ??
                  0;

      final entriesValue =
          payload["entries"];

      if (entriesValue is! List) {
        return;
      }

      final List<Map<String, String>>
          incomingEntries = [];

      for (final item in entriesValue) {
        if (item is! Map) {
          continue;
        }

        final username =
            item["username"]
                    ?.toString()
                    .trim() ??
                "";

        final publicId =
            item["publicId"]
                    ?.toString()
                    .trim() ??
                "";

        // A valid server blacklist entry must
        // contain at least one identity.
        if (username.isEmpty &&
            publicId.isEmpty) {
          continue;
        }

        incomingEntries.add({
          "username": username,
          "publicId": publicId,
        });
      }

      // Store the complete server blacklist.
      await _storeBlacklist(
        version,
        incomingEntries,
      );

      // Clean local conversations using the
      // complete stored blacklist.
      await executeCascadeSelfDestruct();
    } catch (e) {
      print(
        "[Blacklist] Synchronization failure: $e",
      );
    }
  }

  // ============================================================
  // STORE SERVER BLACKLIST
  // ============================================================

  static Future<void> _storeBlacklist(
    int version,
    List<Map<String, String>> entries,
  ) async {
    final encoded = entries
        .map(
          (entry) => jsonEncode({
            "username":
                entry["username"] ?? "",
            "publicId":
                entry["publicId"] ?? "",
          }),
        )
        .toList();

    await HiveStorageService.setStringList(
      _blacklistKey,
      encoded,
    );

    await HiveStorageService.setString(
      _blacklistVersionKey,
      version.toString(),
    );

    print(
      "[Blacklist] Stored ${entries.length} "
      "server blacklist entries "
      "(version $version)",
    );
  }

  // ============================================================
  // READ BLACKLIST
  // ============================================================

  static Future<List<Map<String, String>>>
      _readBlacklist() async {
    final stored =
        HiveStorageService.getStringList(
          _blacklistKey,
        ) ??
        [];

    final result =
        <Map<String, String>>[];

    for (final item in stored) {
      try {
        final decoded = jsonDecode(item);

        if (decoded is! Map) {
          continue;
        }

        final username =
            decoded["username"]
                    ?.toString()
                    .trim() ??
                "";

        final publicId =
            decoded["publicId"]
                    ?.toString()
                    .trim() ??
                "";

        if (username.isEmpty &&
            publicId.isEmpty) {
          continue;
        }

        result.add({
          "username": username,
          "publicId": publicId,
        });
      } catch (_) {
        // Ignore corrupted entries.
      }
    }

    return result;
  }

  // ============================================================
  // BLACKLIST ACCESS
  // ============================================================

  static Future<List<Map<String, String>>>
      getBlacklistEntries() async {
    return _readBlacklist();
  }

  static Future<int> getBlacklistVersion() async {
    final value =
        HiveStorageService.getString(
          _blacklistVersionKey,
        );

    return int.tryParse(
          value ?? "",
        ) ??
        0;
  }

  // ============================================================
  // CASCADE DELETE
  // ============================================================

  static Future<void>
      executeCascadeSelfDestruct() async {
    final service = GossipService();

    final blacklist =
        await _readBlacklist();

    if (blacklist.isEmpty) {
      return;
    }

    final conversations =
        await service._conversationService
            .getConversations();

    final List<Conversation>
        conversationsToDelete = [];

    for (final conversation
        in conversations) {
      if (service
          ._conversationMatchesBlacklist(
        conversation,
        blacklist,
      )) {
        conversationsToDelete.add(
          conversation,
        );
      }
    }

    if (conversationsToDelete.isEmpty) {
      return;
    }

    for (final conversation
        in conversationsToDelete) {
      try {
        // Delete all messages belonging to
        // the blacklisted conversation.
        await service._messageService
            .deleteMessagesForConversation(
          conversation.id,
        );

        // Delete the conversation itself.
        await service._conversationService
            .deleteConversation(
          conversation.id,
        );

        print(
          "[Blacklist] Purged conversation "
          "${conversation.id} "
          "for ${conversation.username}",
        );
      } catch (e) {
        print(
          "[Blacklist] Failed to purge "
          "${conversation.id}: $e",
        );
      }
    }
  }

  // ============================================================
  // MATCH BLACKLIST AGAINST CONVERSATION
  // ============================================================

  bool _conversationMatchesBlacklist(
    Conversation conversation,
    List<Map<String, String>> blacklist,
  ) {
    final conversationUsername =
        conversation.username
            .trim()
            .toLowerCase();

    if (conversationUsername.isEmpty) {
      return false;
    }

    for (final entry in blacklist) {
      final blockedUsername =
          entry["username"]
                  ?.trim()
                  .toLowerCase() ??
              "";

      // The server's blacklist identifies the
      // account by username.
      if (blockedUsername.isNotEmpty &&
          conversationUsername ==
              blockedUsername) {
        return true;
      }
    }

    return false;
  }
}