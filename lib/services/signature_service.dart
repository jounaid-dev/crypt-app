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
  
  // Encode the payload deterministically using the same JSON construction on
  // both signing and verification sides.
    final payloadBytes = utf8.encode(jsonEncode(payloadData));
    
    // Generate the cryptographic signature
    final signatureObj = await _ed25519.sign(
      payloadBytes,
      keyPair: privateKey,
    );

    return base64Url.encode(signatureObj.bytes);
  }

  /// Verifies a message signature against the sender's public key and payload.
  Future<bool> verifyMessage({
    required String base64Signature,
    required Map<String, dynamic> payloadData,
    required SimplePublicKey senderPublicKey,
  }) async {
    try {
      final payloadBytes = utf8.encode(jsonEncode(payloadData));
      final signatureBytes = base64Url.decode(base64Signature);

      final signatureObj = Signature(
        signatureBytes,
        publicKey: senderPublicKey,
      );

      return await _ed25519.verify(
        payloadBytes,
        signature: signatureObj,
      );
    } catch (_) {
      // Return false safely if decoding or verification fails
      return false;
    }
  }
}