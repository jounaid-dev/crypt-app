import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import 'key_storage_service.dart';

class ConversationKeyService {
  final KeyStorageService _storage = KeyStorageService();

  final AesGcm _aes = AesGcm.with256bits();

  Future<SecretKey> getOrCreateKey(
    String conversationId,
  ) async {
    final storedKey = await _storage.getConversationKey(
      conversationId,
    );

    if (storedKey != null && storedKey.isNotEmpty) {
      return SecretKey(
        base64Decode(storedKey),
      );
    }

    final secretKey = await _aes.newSecretKey();

    final keyBytes = await secretKey.extractBytes();

    await _storage.saveConversationKey(
      conversationId,
      base64Encode(keyBytes),
    );

    return secretKey;
  }

  Future<void> saveKey(
    String conversationId,
    SecretKey key,
  ) async {
    final bytes = await key.extractBytes();

    await _storage.saveConversationKey(
      conversationId,
      base64Encode(bytes),
    );
  }

  Future<SecretKey?> getKey(
    String conversationId,
  ) async {
    final storedKey =
        await _storage.getConversationKey(
      conversationId,
    );

    if (storedKey == null || storedKey.isEmpty) {
      return null;
    }

    return SecretKey(
      base64Decode(storedKey),
    );
  }

  Future<void> deleteKey(
    String conversationId,
  ) async {
    await _storage.deleteConversationKey(
      conversationId,
    );
  }

  Future<bool> hasKey(
    String conversationId,
  ) async {
    return await _storage.getConversationKey(
          conversationId,
        ) !=
        null;
  }
}