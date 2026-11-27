import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'identity_service.dart';

class SessionService {
  SessionService._();

  static final SessionService instance = SessionService._();

  /// Where the unlock password is kept between app launches.
  ///
  /// FlutterSecureStorage is backed by the Android Keystore / iOS Keychain, so
  /// the value is encrypted at rest by the OS and other apps cannot read it.
  /// It is still the real password, which is why [lock] deletes it: signing out
  /// must leave nothing behind.
  ///
  /// Without this, a returning user lands on HomePage with no password in
  /// memory, every stored message fails to decrypt, and sending throws
  /// "Identity locked." until they sign out and in again.
  static const String _storedPasswordKey = "session_unlock_password";

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? _password;

  void unlock(String password) {
    _password = password;
  }

  String? get password => _password;

  /// Unlocks the session and remembers [password] for the next cold start.
  ///
  /// A write failure is swallowed on purpose: a device whose keystore is
  /// unavailable must still be able to sign in, it just will not keep the
  /// session across a restart.
  Future<void> remember(String password) async {
    unlock(password);

    try {
      await _storage.write(key: _storedPasswordKey, value: password);
    } catch (_) {
      // Session stays memory-only for this launch.
    }
  }

  /// Reopens the stored session on a cold start.
  ///
  /// Returns true when a password is available again. Safe to call more than
  /// once: an in-memory password wins, so a rebuild never re-reads the
  /// keystore and never re-runs PBKDF2.
  Future<bool> restore() async {
    if (_password != null) {
      return true;
    }

    try {
      final stored = await _storage.read(key: _storedPasswordKey);

      if (stored == null || stored.isEmpty) {
        return false;
      }

      _password = stored;

      // Deliberately not awaited: startup must not block on PBKDF2. The first
      // real key use awaits the same derivation, which is already in flight.
      unawaited(IdentityService.warmKeyCache(stored));

      return true;
    } catch (_) {
      return false;
    }
  }

  /// Ends the session and takes the derived keypairs out of memory.
  ///
  /// IdentityService caches the unlocked private keys so that a key is not
  /// re-derived with a full PBKDF2 pass for every message. Locking exists to
  /// stop key material being reachable, so the cache has to be dropped here
  /// rather than at each individual call site: one place means a new lock
  /// point cannot forget it.
  void lock() {
    _password = null;

    IdentityService.clearKeyCache();

    // A sign-out must not leave the password on the device either.
    unawaited(
      _storage.delete(key: _storedPasswordKey).catchError((_) {}),
    );
  }
}
