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

    // The row is tied to the signed-in Supabase user. The RLS policy on
    // public.users only accepts a row whose auth_user_id matches auth.uid(),
    // so this must be set on insert and the session must already exist.
    final String? authUserId = _supabase.auth.currentUser?.id;

    if (authUserId == null) {
      throw Exception("Not signed in.");
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
        'auth_user_id': authUserId,
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

  /// Reads another account's public identity so this device can restore it.
  ///
  /// Reads the public_identity view rather than the users table, so
  /// password_hash and password_salt can never be read by a client. The
  /// password itself is verified by Supabase Auth in ServerAuthService, which
  /// means nothing here needs password material at all.
  Future<Map<String, dynamic>?> getUser(
    String username,
  ) async {
    final cleanUsername = username.trim();

    if (cleanUsername.isEmpty) {
      return null;
    }

    final response = await _supabase
        .from('user_public_identity')
        .select()
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