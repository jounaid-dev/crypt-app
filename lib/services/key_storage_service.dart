import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveIdentity(String identity) async {
    await _storage.write(
      key: "identity",
      value: identity,
    );
  }

  Future<String?> getIdentity() async {
    return await _storage.read(
      key: "identity",
    );
  }

  Future<void> deleteIdentity() async {
    await _storage.delete(
      key: "identity",
    );
  }

  // Generic Secure Key-Value Operations
  Future<void> saveConversationKey(String key, String value) async {
    await _storage.write(
      key: key,
      value: value,
    );
  }

  Future<String?> getConversationKey(String key) async {
    return await _storage.read(
      key: key,
    );
  }

  Future<void> deleteConversationKey(String key) async {
    await _storage.delete(
      key: key,
    );
  }

  // Nouveaux raccourcis

  Future<String?> getPasswordSalt() async {
    return await _storage.read(
      key: "password_salt",
    );
  }

  Future<String?> getEncryptedIdentity() async {
    return await _storage.read(
      key: "identity",
    );
  }
}