import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'password_service.dart';
import 'cloud_identity_service.dart';
import 'key_storage_service.dart';
import 'identity_service.dart';

class AccountService {
  static const String _usernameKey = "account_username";
  static const String _passwordHashKey = "account_password_hash";
  static const String _passwordSaltKey = "account_password_salt";

  static const String _publicKeyKey = "account_public_key";
  static const String _publicSigningKeyKey =
      "account_public_signing_key";

  static const String _createdKey = "account_created";

  static const String _backupVersion = "1";

  final PasswordService _passwordService = PasswordService();
  final CloudIdentityService _cloud = CloudIdentityService();
  final KeyStorageService _keyStorage = KeyStorageService();
  final IdentityService _identityService = IdentityService();
  
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> createAccount({
    required String username,
    required String password,
    required String publicKey,
    required String publicSigningKey,
    required String publicId,
    required String encryptedIdentity,
    required String passwordSalt,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (username.trim().isEmpty || password.isEmpty) {
      throw Exception("Username and password are required.");
    }

    if (passwordSalt.isEmpty) {
      throw Exception("Password salt is missing.");
    }

    final salt = base64Decode(passwordSalt);

    final hash = await _passwordService.hashPassword(
      password,
      salt,
    );

    // The private keys are already encrypted with the
    // password-derived AES-256-GCM key by IdentityService.
    final encryptedEncryptionKey =
        await _keyStorage.getConversationKey(
      "private_encryption_key",
    );

    final encryptedSigningKey =
        await _keyStorage.getConversationKey(
      "private_signing_key",
    );

    if (encryptedEncryptionKey == null ||
        encryptedEncryptionKey.isEmpty ||
        encryptedSigningKey == null ||
        encryptedSigningKey.isEmpty) {
      throw Exception("Encrypted private keys are missing.");
    }

    // Server backup contains ONLY encrypted private material.
    // The server never receives plaintext private keys.
    final backupPackage = jsonEncode({
      "version": _backupVersion,
      "encryptedIdentity": encryptedIdentity,
      "encryptedEncryptionKey": encryptedEncryptionKey,
      "encryptedSigningKey": encryptedSigningKey,
    });

    // Save local account.
    await prefs.setString(
      _usernameKey,
      username,
    );

    await prefs.setString(
      _passwordHashKey,
      hash,
    );

    await prefs.setString(
      _passwordSaltKey,
      base64Encode(salt),
    );

    await prefs.setString(
      _publicKeyKey,
      publicKey,
    );

    await prefs.setString(
      _publicSigningKeyKey,
      publicSigningKey,
    );

    await prefs.setBool(
      _createdKey,
      true,
    );

    // Upload only public identity + password verifier
    // + encrypted identity backup.
    await _cloud.backupIdentity(
      username: username,
      publicId: publicId,
      publicKey: publicKey,
      publicSigningKey: publicSigningKey,
      encryptedIdentity: backupPackage,
      passwordSalt: base64Encode(salt),
      passwordHash: hash,
    );
  }

  Future<bool> accountExists() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_createdKey) ?? false;
  }

  Future<bool> login(
    String username,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final savedUsername = prefs.getString(_usernameKey);
    final savedHash = prefs.getString(_passwordHashKey);
    final savedSalt = prefs.getString(_passwordSaltKey);

    // Local account.
    if (savedUsername != null &&
        savedHash != null &&
        savedSalt != null &&
        savedUsername == username) {
      return await _passwordService.verifyPassword(
        password: password,
        storedHash: savedHash,
        storedSalt: savedSalt,
      );
    }

    // New-device / remote account.
    final user = await _cloud.getUser(username);

    if (user == null) {
      return false;
    }

    final remoteHash = user["password_hash"];
    final remoteSalt = user["password_salt"];

    if (remoteHash == null || remoteSalt == null) {
      return false;
    }

    final valid = await _passwordService.verifyPassword(
      password: password,
      storedHash: remoteHash.toString(),
      storedSalt: remoteSalt.toString(),
    );

    if (!valid) {
      return false;
    }

    final encryptedBackup = user["encrypted_identity"];

    if (encryptedBackup == null ||
        encryptedBackup.toString().isEmpty) {
      return false;
    }

    Map<String, dynamic> backup;

    try {
      final decoded = jsonDecode(
        encryptedBackup.toString(),
      );

      if (decoded is! Map) {
        return false;
      }

      backup = Map<String, dynamic>.from(decoded);
    } catch (_) {
      return false;
    }

    final encryptedIdentity =
        backup["encryptedIdentity"];

    final encryptedEncryptionKey =
        backup["encryptedEncryptionKey"];

    final encryptedSigningKey =
        backup["encryptedSigningKey"];

    if (encryptedIdentity is! String ||
        encryptedIdentity.isEmpty ||
        encryptedEncryptionKey is! String ||
        encryptedEncryptionKey.isEmpty ||
        encryptedSigningKey is! String ||
        encryptedSigningKey.isEmpty) {
      return false;
    }

    // Restore encrypted identity.
    await _keyStorage.saveIdentity(
      encryptedIdentity,
    );

    // Restore encrypted private keys.
    await _keyStorage.saveConversationKey(
      "private_encryption_key",
      encryptedEncryptionKey,
    );

    await _keyStorage.saveConversationKey(
      "private_signing_key",
      encryptedSigningKey,
    );

    // Restore password salt used by IdentityService.
    await _keyStorage.saveConversationKey(
      "password_salt",
      remoteSalt.toString(),
    );

    // Restore local account metadata.
    await prefs.setString(
      _usernameKey,
      user["username"].toString(),
    );

    await prefs.setString(
      _passwordHashKey,
      remoteHash.toString(),
    );

    await prefs.setString(
      _passwordSaltKey,
      remoteSalt.toString(),
    );

    await prefs.setString(
      _publicKeyKey,
      user["public_key"].toString(),
    );

    await prefs.setString(
      _publicSigningKeyKey,
      user["public_signing_key"]?.toString() ?? "",
    );

    await prefs.setBool(
      _createdKey,
      true,
    );

    // Verify that the password can actually unlock
    // the encrypted identity after restoration.
    try {
      final identity =
          await _identityService.getLocalIdentityWithPassword(
        password,
      );

      if (identity == null) {
        return false;
      }
    } catch (_) {
      return false;
    }

    return true;
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_usernameKey);
  }

Future<String?> getPublicEncryptionKey() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getString(_publicKeyKey);
}

  Future<String?> getPublicSigningKey() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_publicSigningKeyKey);
  }

  Future getSigningKeyPair(
    String password,
  ) async {
    return await _identityService.getSigningKeyPair(
      password,
    );
  }

  Future<Map<String, String>?> getAccount() async {
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString(_usernameKey);
    final publicKey = prefs.getString(_publicKeyKey);

    if (username == null || publicKey == null) {
      return null;
    }

    return {
      "username": username,
      "publicKey": publicKey,
      "publicSigningKey":
          prefs.getString(_publicSigningKeyKey) ?? "",
    };
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_usernameKey);
    await prefs.remove(_passwordHashKey);
    await prefs.remove(_passwordSaltKey);
    await prefs.remove(_publicKeyKey);
    await prefs.remove(_publicSigningKeyKey);
    await prefs.remove(_createdKey);

    await _keyStorage.deleteIdentity();

    await _keyStorage.deleteConversationKey(
      "password_salt",
    );

    await _keyStorage.deleteConversationKey(
      "identity_salt",
    );

    await _keyStorage.deleteConversationKey(
      "private_encryption_key",
    );

    await _keyStorage.deleteConversationKey(
      "private_signing_key",
    );
  }

Future<void> deleteAccount() async {
  final username = await getUsername();

  if (username == null || username.trim().isEmpty) {
    throw Exception("No local account found.");
  }

  // 1. Delete account from Supabase first.
  await _cloud.deleteUser(username);

  // 2. Delete all local account data and encryption material.
  await logout();

  // 3. Delete settings/security data that logout() doesn't own.
  final prefs = await SharedPreferences.getInstance();

  await prefs.remove('failed_settings_attempts');
  await prefs.remove('locked_conversation_ids');
  await prefs.remove('active_conversations_list');
  await prefs.remove('account_is_premium');
  await prefs.remove('premium_user_support_comment');

  await _secureStorage.delete(
    key: 'settings_lockout_expiry',
  );
}

  String exportAccount(
    Map<String, String> account,
  ) {
    return jsonEncode(account);
  }

  Map<String, String> importAccount(
    String json,
  ) {
    final decoded = jsonDecode(json);

    if (decoded is! Map) {
      throw FormatException("Invalid account data.");
    }

    return Map<String, String>.from(decoded);
  }
}