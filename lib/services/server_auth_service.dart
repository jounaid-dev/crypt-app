import 'package:supabase_flutter/supabase_flutter.dart';

/// Bridges CRYPT accounts to Supabase Auth so that requests carry a real
/// session.
///
/// CRYPT does not use real email addresses. Every account signs in with a
/// synthetic address of the form `<username>@crypt.invalid`; nothing is ever
/// delivered and email confirmation stays disabled in the dashboard.
///
/// The password is unchanged and is still used by the client to derive the
/// X25519/Ed25519 keys. Only the verification of that password moves to the
/// server, which is what gives RLS a trustworthy identity to make decisions
/// about. Previously every Supabase call was anonymous, so `auth.uid()` was
/// always null and no policy could tell an admin from anyone else.
class ServerAuthService {
  ServerAuthService._();

  static final ServerAuthService instance = ServerAuthService._();

  static const String syntheticEmailDomain = 'crypt.invalid';

  final SupabaseClient _supabase = Supabase.instance.client;

  /// The address CRYPT uses for [username] in Supabase Auth.
  static String syntheticEmailFor(String username) {
    return '$username@$syntheticEmailDomain';
  }

  /// Recovers the CRYPT username from an email produced by
  /// [syntheticEmailFor]. Returns null for any other address.
  static String? usernameFromEmail(String? email) {
    if (email == null) return null;

    final suffix = '@$syntheticEmailDomain';

    if (!email.endsWith(suffix)) return null;

    final username = email.substring(0, email.length - suffix.length);

    return username.isEmpty ? null : username;
  }

  bool get isSignedIn => _supabase.auth.currentSession != null;

  /// The CRYPT username of the current session, or null when signed out.
  String? get currentUsername =>
      usernameFromEmail(_supabase.auth.currentUser?.email);

  /// Registers the account with Supabase Auth.
  ///
  /// Uses [signUp] rather than a direct insert so the password is verified
  /// server-side. gotrue throws [AuthException] on failure and returns no
  /// error field, so failures are caught rather than read off the response.
  Future<String> signUp({
    required String username,
    required String password,
  }) async {
    final clean = username.trim();

    try {
      final response = await _supabase.auth.signUp(
        email: syntheticEmailFor(clean),
        password: password,
      );

      if (response.session != null) {
        return clean;
      }

      // No session came back, which happens when the project still has email
      // confirmation switched on. Sign in explicitly so the account is usable
      // either way.
      return await signIn(username: clean, password: password);
    } on AuthException catch (e) {
      // An account that already exists in Auth is fine: the caller is
      // restoring, not registering.
      if (_isAlreadyRegistered(e)) {
        return signIn(username: clean, password: password);
      }

      throw ServerAuthException(e.message);
    }
  }

  /// Signs in an existing account.
  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    final clean = username.trim();

    try {
      final response = await _supabase.auth.signInWithPassword(
        email: syntheticEmailFor(clean),
        password: password,
      );

      if (response.session == null) {
        throw ServerAuthException('Incorrect username or password.');
      }

      return clean;
    } on AuthException catch (e) {
      throw ServerAuthException(_friendlyMessage(e));
    }
  }

  static bool _isAlreadyRegistered(AuthException e) {
    final message = e.message.toLowerCase();

    return message.contains('already') ||
        message.contains('registered') ||
        message.contains('exists');
  }

  /// Keeps Supabase's wording away from the user where possible.
  static String _friendlyMessage(AuthException e) {
    final message = e.message.toLowerCase();

    if (message.contains('invalid login')) {
      return 'Incorrect username or password.';
    }

    if (message.contains('email not confirmed')) {
      return 'This account still needs to be confirmed.';
    }

    return e.message;
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  /// Fires whenever the session appears or disappears.
  Stream<ServerAuthEvent> get onAuthStateChange {
    return _supabase.auth.onAuthStateChange.map(
      (event) => ServerAuthEvent(
        signedIn: event.session != null,
        username: usernameFromEmail(event.session?.user.email),
      ),
    );
  }

  /// The email currently used to register RLS policies.
  String? get currentEmail => _supabase.auth.currentUser?.email;
}

class ServerAuthEvent {
  const ServerAuthEvent({required this.signedIn, this.username});

  final bool signedIn;
  final String? username;
}

class ServerAuthException implements Exception {
  ServerAuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
