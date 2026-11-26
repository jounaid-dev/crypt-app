import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class EncryptionService {
  final Cipher algorithm = AesGcm.with256bits();

  /// The critical decryption path must never surface a "failed/no result"
  /// boolean to the UI. It either returns the plaintext or throws, so the
  /// caller can treat any non-success as a true error rather than a silent
  /// "false" that can be mistaken for a legitimate empty result.
  Future<String> decryptMessage({
    required String encryptedMessage,
    required SecretKey key,
  }) async {
    final bytes = base64Decode(encryptedMessage);

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
