class SessionService {
  SessionService._();

  static final SessionService instance = SessionService._();

  String? _password;

  void unlock(String password) {
    _password = password;
  }

  String? get password => _password;

  void lock() {
    _password = null;
  }
}