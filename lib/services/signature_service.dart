import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class SignatureService {
  final Ed25519 _ed25519 = Ed25519();

  /// Signs a structured payload map using the sender's Ed25519 private key.
  /// Returns a base64url-encoded signature string.
  Future<String> signMessage({
    required SimpleKeyPair privateKey,
    required Map<String, dynamic> payloadData,
  }) async {
    final payloadBytes = utf8.encode(jsonEncode(payloadData));

    final signatureObj = await _ed25519.sign(
      payloadBytes,
      keyPair: privateKey,
    );

    return base64Url.encode(signatureObj.bytes);
  }

  Future<bool> verifyMessage({
    required String base64Signature,
    required Map<String, dynamic> payloadData,
    required SimplePublicKey senderPublicKey,
  }) async {
    try {
      final signatureBytes = _decodeSignature(base64Signature);
      final payloadBytes = utf8.encode(jsonEncode(payloadData));

      return await _ed25519.verify(
        payloadBytes,
        signature: Signature(signatureBytes, publicKey: senderPublicKey),
      );
    } catch (_) {
      return false;
    }
  }

  /// Accepts base64url and standard base64 signatures so a signature from one
  /// encoding still verifies on the other side. [base64Url.normalize] maps both
  /// alphabets onto base64url and restores any missing padding, so the same
  /// signature decodes to the same bytes no matter which side encoded it.
  static List<int> _decodeSignature(String base64Signature) {
    return base64Url.decode(base64Url.normalize(base64Signature));
  }
}
