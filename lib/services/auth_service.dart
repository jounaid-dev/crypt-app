import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createAccount() async {
    // No catch clause: both of the ones this used to have only rethrew, which
    // let the original failure through unchanged and added nothing.
    UserCredential result = await _auth.signInAnonymously();

    return result.user!.uid;
  }
}