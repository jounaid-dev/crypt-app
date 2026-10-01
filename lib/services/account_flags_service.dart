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

  /// When the cached flags were read.
  DateTime? _cacheTime;

  /// How long a cached read is trusted.
  ///
  /// Premium is switched on by an administrator on the server side. Without an
  /// expiry the very first read of a session was cached forever, so a user whose
  /// payment had just been approved kept seeing "waiting for an admin" and had
  /// to kill the app before the change appeared. Anything that has to reflect a
  /// server-side change made by someone else needs a short life.
  static const Duration _cacheTtl = Duration(seconds: 60);

  bool get _cacheIsFresh {
    final DateTime? at = _cacheTime;

    if (_cache == null || at == null) return false;

    return DateTime.now().difference(at) < _cacheTtl;
  }

  /// Fetches the caller's flags through the my_account_flags() RPC, which
  /// returns only the caller's own row.
  Future<AccountFlags?> fetch({bool force = false}) async {
    if (!force && _cacheIsFresh) return _cache;

    final response = await _supabase.rpc(
      'my_account_flags',
    );

    final rows = response as List;

    if (rows.isEmpty) return null;

    final flags = AccountFlags.fromJson(
      Map<String, dynamic>.from(rows.first),
    );

    _cache = flags;
    _cacheTime = DateTime.now();

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

  /// Re-reads the flags from the server, ignoring the cache.
  ///
  /// Used where the answer has to reflect an administrator's most recent
  /// decision, such as opening Settings.
  Future<AccountFlags?> refresh() => fetch(force: true);

  Future<bool> isPremium() async {
    return (await fetch())?.isPremium ?? false;
  }

  /// Reads premium straight from the server rather than from the cache.
  Future<bool> isPremiumFresh() async {
    return (await fetch(force: true))?.isPremium ?? false;
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
    _cacheTime = null;
  }
}
