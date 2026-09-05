import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class PasswordService {
  static const int iterations = 500000;
  static const int saltLength = 32;

  final Pbkdf2 _pbkdf2 = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: iterations,
    bits: 256,
  );

  Future<String> hashPassword(
    String password,
    List<int> salt,
  ) async {
    if (password.isEmpty) {
      throw ArgumentError('Password cannot be empty.');
    }

    if (salt.length < 16) {
      throw ArgumentError('Salt is too short.');
    }

    final key = await _pbkdf2.deriveKeyFromPassword(
      password: password,
      nonce: salt,
    );

    final bytes = await key.extractBytes();

    return base64Encode(bytes);
  }

  List<int> generateSalt() {
    return SecretKeyData.random(
      length: saltLength,
    ).bytes;
  }

  Future<bool> verifyPassword({
    required String password,
    required String storedHash,
    required String storedSalt,
  }) async {
    if (password.isEmpty ||
        storedHash.isEmpty ||
        storedSalt.isEmpty) {
      return false;
    }

    try {
      final hash = await hashPassword(
        password,
        base64Decode(storedSalt),
      );

      final expected = base64Decode(storedHash);
      final actual = base64Decode(hash);

      if (expected.length != actual.length) {
        return false;
      }

      var difference = 0;

      for (var i = 0; i < expected.length; i++) {
        difference |= expected[i] ^ actual[i];
      }

      return difference == 0;
    } catch (_) {
      return false;
    }
  }
}