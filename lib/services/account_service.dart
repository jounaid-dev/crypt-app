import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'password_service.dart';
import 'account_flags_service.dart';
import 'cloud_identity_service.dart';
import 'key_storage_service.dart';
import 'identity_service.dart';
import 'server_auth_service.dart';
import 'signaling_service.dart';
import 'session_service.dart';
import 'contact_service.dart';
import 'conversation_service.dart';
import 'hive_storage_service.dart';

class AccountService {
  static const String _usernameKey = "account_username";
  static const String _passwordHashKey = "account_password_hash";
  static const String _passwordSaltKey = "account_password_salt";

  static const String _publicKeyKey = "account_public_key";
  static const String _publicSigningKeyKey =
      "account_public_signing_key";
  static const String _publicIdKey =
      "account_public_id";

  static const String _createdKey = "account_created";

  static const String _backupVersion = "1";

  final PasswordService _passwordService = PasswordService();
  final CloudIdentityService _cloud = CloudIdentityService();
  final KeyStorageService _keyStorage = KeyStorageService();
  final IdentityService _identityService = IdentityService();
  final ServerAuthService _serverAuth = ServerAuthService.instance;
  final AccountFlagsService _flags = AccountFlagsService.instance;

  final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();

  final ContactService _contactService = ContactService();
  final ConversationService _conversationService = ConversationService();
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

    // Save the stable public ID locally so it can be
    // sent to the signaling server when the account
    // is permanently deleted.
    await prefs.setString(
      _publicIdKey,
      publicId,
    );

    await prefs.setBool(
      _createdKey,
      true,
    );

    // ============================================================
    // REGISTER WITH SUPABASE AUTH FIRST
    //
    // The public.users insert below is guarded by a policy that requires
    // auth_user_id to match auth.uid(), so the session has to exist before
    // the row is written. Registering first also means every later request
    // carries an identity, which is what lets RLS tell an admin from
    // anyone else.
    //
    // CRYPT uses a synthetic address, so nothing is ever emailed.
    // ============================================================

    await _serverAuth.signUp(
      username: username.trim(),
      password: password,
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

    _flags.invalidate();
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

    // ============================================================
    // SERVER VERIFICATION
    //
    // Supabase Auth is now the authority on whether these credentials are
    // valid. Previously the app fetched a world-readable password_hash and
    // compared it on device, which meant the hash was readable by anyone
    // holding the publishable key and the check could be skipped entirely by
    // a patched build.
    // ============================================================

    try {
      await _serverAuth.signIn(
        username: username.trim(),
        password: password,
      );
    } on ServerAuthException {
      return false;
    }

    _flags.invalidate();

    // ============================================================
    // BAN CHECK
    //
    // Authoritative, and re-read from the server on every login.
    // ============================================================

    final flags = await _flags.fetch(force: true);

    if (flags != null && flags.isBanned) {
      await _serverAuth.signOut();
      _flags.invalidate();

      throw BannedAccountException(
        flags.bannedReason ??
            'This account has been suspended by an administrator.',
      );
    }

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

    // The password was already verified by Supabase Auth above. The remote
    // password_hash and password_salt are deliberately not read: they are
    // unreachable from a client now that direct reads of the users table are
    // limited to your own row, and nothing here needs them.

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

    // The salt is an input to key derivation, so it has to be restored.
    // It is public by design and is served by user_public_identity.
    final salt = user["password_salt"]?.toString() ?? '';

    await _keyStorage.saveConversationKey(
      "password_salt",
      salt,
    );

    // Restore local account metadata.
    await prefs.setString(
      _usernameKey,
      user["username"].toString(),
    );

    await prefs.setString(
      _passwordSaltKey,
      salt,
    );

    // password_hash is intentionally absent from user_public_identity, so a
    // device that restored from the cloud has no local copy. That is fine:
    // the local fast path below simply does not apply, and the password is
    // verified by Supabase Auth on every login regardless.
    await prefs.remove(_passwordHashKey);

    await prefs.setString(
      _publicKeyKey,
      user["public_key"].toString(),
    );

    await prefs.setString(
      _publicSigningKeyKey,
      user["public_signing_key"]?.toString() ?? "",
    );

    // Restore the stable public ID.
    await prefs.setString(
      _publicIdKey,
      user["public_id"]?.toString() ?? "",
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

  Future<String?> getPublicId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_publicIdKey);
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

    // End the Supabase session too, otherwise the next person to use this
    // device would still be able to read this account's rows under RLS.
    await _serverAuth.signOut();
    _flags.invalidate();

    await prefs.remove(_usernameKey);
    await prefs.remove(_passwordHashKey);
    await prefs.remove(_passwordSaltKey);
    await prefs.remove(_publicKeyKey);
    await prefs.remove(_publicSigningKeyKey);
    await prefs.remove(_publicIdKey);
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

  Future<void> _clearAccountData() async {
    final prefs = await SharedPreferences.getInstance();

    // Conversations and contacts are local to the single active account.
    await _conversationService.saveConversations(const []);
    await _contactService.clearContacts();

    // Remove encrypted message/outbox records belonging to local conversations.
    final messageKeys = HiveStorageService.getKeys()
        .where((key) => key.startsWith('messages_'))
        .toList();
    for (final key in messageKeys) {
      await HiveStorageService.remove(key);
    }

    await HiveStorageService.remove('qr_validation_codes');
    await HiveStorageService.remove('destruction_blacklist');

    await prefs.remove('conversations');
    await prefs.remove('require_master_password_for_settings');
    await prefs.remove('failed_settings_attempts');
    await prefs.remove('locked_conversation_ids');
    await prefs.remove('active_conversations_list');
    await prefs.remove('account_is_premium');
    await prefs.remove('premium_user_support_comment');

    await _secureStorage.delete(key: 'settings_lockout_expiry');
  }

  Future<void> deleteAccount() async {
    final username = await getUsername();
    final publicId = await getPublicId();

    if (username == null || username.trim().isEmpty) {
      throw Exception("No local account found.");
    }

    if (publicId == null || publicId.trim().isEmpty) {
      throw Exception("Account public ID is missing.");
    }

    // 1. Delete account from Supabase first.
    await _cloud.deleteUser(username);

    // 2. Tell the signaling server that this account
    //    has been permanently deleted.
    //
    // The server will add this identity to the blacklist
    // and broadcast the updated blacklist to connected users.
    SignalingService.instance.sendAccountDeleted(
      username: username,
      publicId: publicId,
    );

    // 3. Stop the local session and remove account-scoped data.
    SignalingService.instance.disconnect();
    SessionService.instance.lock();
    await _clearAccountData();

    // 4. Remove account metadata and private encryption material last.
    await logout();
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

/// Thrown when the server says the account has been suspended.
class BannedAccountException implements Exception {
  BannedAccountException(this.message);

  final String message;

  @override
  String toString() => message;
}
