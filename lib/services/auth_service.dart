import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createAccount() async {
    try {
      print("== About to sign in anonymously ==");

      UserCredential result = await _auth.signInAnonymously();

      print("== Success ==");
      print("UID: ${result.user?.uid}");

      return result.user!.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException");
      print("Code: ${e.code}");
      print("Message: ${e.message}");
      rethrow;
    } catch (e) {
      print("Unknown error: $e");
      rethrow;
    }
  }
}