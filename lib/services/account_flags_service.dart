import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/payment_proof.dart';

/// Reads the signed-in user's own server-side flags.
///
/// Premium and ban status used to be a local SharedPreferences boolean, which
/// anyone could flip. Both are now owned by the database and only read here.
class AccountFlagsService {
  AccountFlagsService._();

  static final AccountFlagsService instance = AccountFlagsService._();

  final SupabaseClient _supabase = Supabase.instance.client;

  AccountFlags? _cache;

  /// Fetches the caller's flags through the my_account_flags() RPC, which
  /// returns only the caller's own row.
  Future<AccountFlags?> fetch({bool force = false}) async {
    if (_cache != null && !force) return _cache;

    final response = await _supabase.rpc(
      'my_account_flags',
    );

    final rows = response as List;

    if (rows.isEmpty) return null;

    final flags = AccountFlags.fromJson(
      Map<String, dynamic>.from(rows.first),
    );

    _cache = flags;

    return flags;
  }

  /// The signed-in username according to the server.
  Future<String?> username() async {
    return (await fetch())?.username;
  }

  /// The signed-in username, or a thrown error if there is no session.
  Future<String> requireUsername() async {
    final name = await username();

    if (name == null || name.isEmpty) {
      throw StateError('Not signed in.');
    }

    return name;
  }

  Future<bool> isPremium() async {
    return (await fetch())?.isPremium ?? false;
  }

  Future<bool> isBanned() async {
    return (await fetch())?.isBanned ?? false;
  }

  Future<bool> isAdmin() async {
    return (await fetch())?.isAdmin ?? false;
  }

  Future<String?> banReason() async {
    return (await fetch())?.bannedReason;
  }

  /// Drops the cached flags, e.g. after signing in as someone else.
  void invalidate() {
    _cache = null;
  }
}
