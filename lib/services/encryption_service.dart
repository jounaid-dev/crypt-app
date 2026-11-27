import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class EncryptionService {
  final Cipher algorithm = AesGcm.with256bits();

  /// Encrypts a plaintext string for the given shared key.
  ///
  /// This is the outbound path used by the chat page and the unit tests.
  /// It produces a base64 string whose layout matches the [decryptMessage]
  /// expectations, so the two paths always pair.
  Future<String> encryptMessage({
    required String message,
    required SecretKey key,
  }) async {
    final bytes = utf8.encode(message);

    final nonce = algorithm.newNonce();

    final secretBox = await algorithm.encrypt(
      bytes,
      secretKey: key,
      nonce: nonce,
    );

    // Base layout: nonce || ciphertext || mac, which is exactly what
    // SecretBox.fromConcatenation rebuilds in [decryptMessage].
    final ciphertext = secretBox.concatenation();

    return base64Encode(ciphertext);
  }

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
