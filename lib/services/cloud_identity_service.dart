import 'package:supabase_flutter/supabase_flutter.dart';

class CloudIdentityService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> backupIdentity({
    required String username,
    required String publicId,
    required String publicKey,
    required String publicSigningKey,
    required String encryptedIdentity,
    required String passwordSalt,
    required String passwordHash,
  }) async {
    if (username.trim().isEmpty) {
      throw Exception("Username is required.");
    }

    if (publicId.isEmpty ||
        publicKey.isEmpty ||
        publicSigningKey.isEmpty ||
        encryptedIdentity.isEmpty ||
        passwordSalt.isEmpty ||
        passwordHash.isEmpty) {
      throw Exception("Incomplete identity backup.");
    }

    await _supabase
        .from('users')
        .upsert(
      {
        'username': username.trim(),
        'public_id': publicId,
        'public_key': publicKey,
        'public_signing_key': publicSigningKey,
        'encrypted_identity': encryptedIdentity,
        'password_salt': passwordSalt,
        'password_hash': passwordHash,
      },
      onConflict: 'username',
    );
  }

  Future<bool> usernameExists(
    String username,
  ) async {
    final cleanUsername = username.trim();

    if (cleanUsername.isEmpty) {
      return false;
    }

    final result = await _supabase
        .from('users')
        .select('username')
        .eq('username', cleanUsername)
        .maybeSingle();

    return result != null;
  }

  Future<Map<String, dynamic>?> getUser(
    String username,
  ) async {
    final cleanUsername = username.trim();

    if (cleanUsername.isEmpty) {
      return null;
    }

    final response = await _supabase
        .from('users')
        .select(
          'username, public_id, public_key, '
          'public_signing_key, encrypted_identity, '
          'password_salt, password_hash',
        )
        .eq('username', cleanUsername)
        .maybeSingle();

    return response;
  }

  Future<void> deleteUser(
    String username,
  ) async {
    final cleanUsername = username.trim();

    if (cleanUsername.isEmpty) {
      throw Exception("Username is required.");
    }

    await _supabase
        .from('users')
        .delete()
        .eq('username', cleanUsername);
  }
}