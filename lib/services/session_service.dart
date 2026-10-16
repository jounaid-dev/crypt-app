import 'identity_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// Persists the master password to SharedPreferences.
  /// Call this after a successful login so the app can restore the session
  /// after a kill/reboot.
  Future<void> savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_password', password);
  }

  /// Retrieves the previously saved master password, or null if none exists.
  Future<String?> getSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('saved_password');
  }
}
