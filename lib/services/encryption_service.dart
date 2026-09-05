import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class EncryptionService {
  final Cipher algorithm = AesGcm.with256bits();

  Future<String> encryptMessage({
    required String message,
    required SecretKey key,
  }) async {
    final secretBox = await algorithm.encrypt(
      utf8.encode(message),
      secretKey: key,
    );

    return base64Encode(
      secretBox.concatenation(),
    );
  }

  Future<String> decryptMessage({
    required String encryptedMessage,
    required SecretKey key,
  }) async {
    final bytes = base64Decode(
      encryptedMessage,
    );

    // Fixed: fetch nonceLength and macLength properly from the current algorithm state
    final secretBox = SecretBox.fromConcatenation(
      bytes,
      nonceLength: algorithm.nonceLength,
      macLength: algorithm.macAlgorithm.macLength,
    );

    final clear = await algorithm.decrypt(
      secretBox,
      secretKey: key,
    );

    return utf8.decode(clear);
  }
}
