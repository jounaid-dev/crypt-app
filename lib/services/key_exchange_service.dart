import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import 'identity_service.dart';

class KeyExchangeService {
  final X25519 _algorithm = X25519();
  final IdentityService _identityService = IdentityService();

  Future<SecretKey> deriveSharedKey({
    required String password,
    required String peerPublicKey,
  }) async {
    if (password.isEmpty) {
      throw Exception("Password is required.");
    }

    if (peerPublicKey.isEmpty) {
      throw Exception("Peer public encryption key is missing.");
    }

    // ------------------------------------------------------------
    // LOAD MY X25519 KEYPAIR
    // ------------------------------------------------------------

    final myKeyPair =
        await _identityService.getEncryptionKeyPair(password);

    // ------------------------------------------------------------
    // DECODE PEER PUBLIC KEY
    // ------------------------------------------------------------

    final List<int> peerPublicKeyBytes;

    try {
      peerPublicKeyBytes = base64Decode(peerPublicKey);
    } catch (_) {
      throw Exception(
        "Invalid peer encryption public key.",
      );
    }

    // X25519 public keys are exactly 32 bytes.
    if (peerPublicKeyBytes.length != 32) {
      throw Exception(
        "Invalid X25519 public key length.",
      );
    }

    final peerKey = SimplePublicKey(
      peerPublicKeyBytes,
      type: KeyPairType.x25519,
    );

    // ------------------------------------------------------------
    // X25519 DIFFIE-HELLMAN
    // ------------------------------------------------------------

    final sharedKey =
        await _algorithm.sharedSecretKey(
      keyPair: myKeyPair,
      remotePublicKey: peerKey,
    );

    return sharedKey;
  }
}