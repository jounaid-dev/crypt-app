import 'identity_service.dart';

class SessionService {
  SessionService._();

  static final SessionService instance = SessionService._();

  String? _password;

  void unlock(String password) {
    _password = password;
  }

  String? get password => _password;

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
  }
}