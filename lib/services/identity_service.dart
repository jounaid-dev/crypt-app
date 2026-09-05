import 'dart:convert';

import 'package:cryptography/cryptography.dart';

import '../models/identity.dart';
import '../models/identity_bundle.dart';
import 'key_storage_service.dart';

class IdentityService {
  final KeyStorageService _keyStorage = KeyStorageService();

  final X25519 _x25519 = X25519();
  final Ed25519 _ed25519 = Ed25519();
  final AesGcm _aesGcm = AesGcm.with256bits();

  // 500,000 PBKDF2-HMAC-SHA256 iterations.
  // Used consistently across the MVP.
  final Pbkdf2 _pbkdf2 = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: 500000,
    bits: 256,
  );

  Future<SecretKey> _deriveKey(
    String password,
    List<int> salt,
  ) async {
    return await _pbkdf2.deriveKeyFromPassword(
      password: password,
      nonce: salt,
    );
  }

  Future<String> _encryptPayload(
    List<int> payload,
    SecretKey secretKey,
  ) async {
    final secretBox = await _aesGcm.encrypt(
      payload,
      secretKey: secretKey,
    );

    return jsonEncode({
      "nonce": base64Encode(secretBox.nonce),
      "cipherText": base64Encode(secretBox.cipherText),
      "mac": base64Encode(secretBox.mac.bytes),
    });
  }

  Future<List<int>> _decryptPayload(
    String encryptedJson,
    SecretKey secretKey,
  ) async {
    final dynamic decoded;

    try {
      decoded = jsonDecode(encryptedJson);
    } catch (_) {
      throw Exception("Invalid encrypted payload.");
    }

    if (decoded is! Map) {
      throw Exception("Invalid encrypted payload.");
    }

    final map = Map<String, dynamic>.from(decoded);

    final nonce = map["nonce"];
    final cipherText = map["cipherText"];
    final mac = map["mac"];

    if (nonce is! String ||
        cipherText is! String ||
        mac is! String) {
      throw Exception("Invalid encrypted payload format.");
    }

    try {
      final secretBox = SecretBox(
        base64Decode(cipherText),
        nonce: base64Decode(nonce),
        mac: Mac(base64Decode(mac)),
      );

      return await _aesGcm.decrypt(
        secretBox,
        secretKey: secretKey,
      );
    } catch (_) {
      // Authentication failure, corrupted ciphertext,
      // invalid Base64, or invalid AES-GCM data.
      throw Exception("Unable to decrypt protected data.");
    }
  }

  Future<SimpleKeyPair> getEncryptionKeyPair(
    String password,
  ) async {
    final saltString =
        await _keyStorage.getConversationKey("password_salt");

    final encryptedPrivateKey =
        await _keyStorage.getConversationKey(
      "private_encryption_key",
    );

    if (saltString == null || encryptedPrivateKey == null) {
      throw Exception("Encryption identity is missing.");
    }

    final identity =
        await getLocalIdentityWithPassword(password);

    if (identity == null) {
      throw Exception("Identity is missing.");
    }

    try {
      final salt = base64Decode(saltString);

      final masterKey = await _deriveKey(
        password,
        salt,
      );

      final privateBytes = await _decryptPayload(
        encryptedPrivateKey,
        masterKey,
      );

      // X25519 private keys are 32 bytes.
      if (privateBytes.length != 32) {
        throw Exception("Invalid X25519 private key.");
      }

      final publicBytes =
          base64Decode(identity.publicEncryptionKey);

      if (publicBytes.length != 32) {
        throw Exception("Invalid X25519 public key.");
      }

      return SimpleKeyPairData(
        privateBytes,
        publicKey: SimplePublicKey(
          publicBytes,
          type: KeyPairType.x25519,
        ),
        type: KeyPairType.x25519,
      );
    } catch (_) {
      throw Exception(
        "Unable to unlock encryption identity.",
      );
    }
  }

  Future<SimpleKeyPair> getSigningKeyPair(
    String password,
  ) async {
    final saltString =
        await _keyStorage.getConversationKey("password_salt");

    final encryptedPrivateKey =
        await _keyStorage.getConversationKey(
      "private_signing_key",
    );

    if (saltString == null || encryptedPrivateKey == null) {
      throw Exception("Signing identity is missing.");
    }

    final identity =
        await getLocalIdentityWithPassword(password);

    if (identity == null) {
      throw Exception("Identity is missing.");
    }

    try {
      final salt = base64Decode(saltString);

      final masterKey = await _deriveKey(
        password,
        salt,
      );

      final privateBytes = await _decryptPayload(
        encryptedPrivateKey,
        masterKey,
      );

      // Ed25519 private seeds are 32 bytes.
      if (privateBytes.length != 32) {
        throw Exception("Invalid Ed25519 private key.");
      }

      final keyPair =
          await _ed25519.newKeyPairFromSeed(privateBytes);

      // Verify that the recovered private key corresponds
      // to the public signing key stored in the identity.
      final recoveredPublic =
          await keyPair.extractPublicKey();

      final expectedPublic =
          base64Decode(identity.publicSigningKey);

      if (!_constantTimeEquals(
        recoveredPublic.bytes,
        expectedPublic,
      )) {
        throw Exception(
          "Signing key does not match identity.",
        );
      }

      return keyPair;
    } catch (_) {
      throw Exception(
        "Unable to unlock signing identity.",
      );
    }
  }

  Future<IdentityBundle> generateAndStoreIdentity(
    String username,
    String password,
  ) async {
    final encryptionKeyPair =
        await _x25519.newKeyPair();

    final signingKeyPair =
        await _ed25519.newKeyPair();

    final privateEncryptionBytes =
        await encryptionKeyPair.extractPrivateKeyBytes();

    final privateSigningBytes =
        await signingKeyPair.extractPrivateKeyBytes();

    // 32-byte random salt.
    final salt =
        SecretKeyData.random(length: 32).bytes;

    await _keyStorage.saveConversationKey(
      "password_salt",
      base64Encode(salt),
    );

    final masterSecretKey =
        await _deriveKey(password, salt);

    // Encrypt X25519 private key with AES-256-GCM.
    final encryptedEncryptionKey =
        await _encryptPayload(
      privateEncryptionBytes,
      masterSecretKey,
    );

    // Encrypt Ed25519 private key with AES-256-GCM.
    final encryptedSigningKey =
        await _encryptPayload(
      privateSigningBytes,
      masterSecretKey,
    );

    await _keyStorage.saveConversationKey(
      "private_encryption_key",
      encryptedEncryptionKey,
    );

    await _keyStorage.saveConversationKey(
      "private_signing_key",
      encryptedSigningKey,
    );

    final publicEncryption =
        await encryptionKeyPair.extractPublicKey();

    final publicSigning =
        await signingKeyPair.extractPublicKey();

    final identity = Identity(
      username: username,
      publicSigningKey:
          base64Encode(publicSigning.bytes),
      publicEncryptionKey:
          base64Encode(publicEncryption.bytes),

      // Private keys are NEVER placed in Identity.
      privateSigningKey: "",
      privateEncryptionKey: "",
    );

    final identityBytes = utf8.encode(
      jsonEncode(identity.toJson()),
    );

    // Encrypt identity metadata as well.
    final encryptedIdentity =
        await _encryptPayload(
      identityBytes,
      masterSecretKey,
    );

    await _keyStorage.saveIdentity(
      encryptedIdentity,
    );

    return IdentityBundle(
      identity: identity,
      encryptedIdentity: encryptedIdentity,
      passwordSalt: base64Encode(salt),
    );
  }

  Future<Identity?> getLocalIdentityWithPassword(
    String password,
  ) async {
    final encryptedIdentity =
        await _keyStorage.getIdentity();

    final saltString =
        await _keyStorage.getConversationKey(
      "password_salt",
    );

    if (encryptedIdentity == null ||
        saltString == null) {
      return null;
    }

    try {
      final salt = base64Decode(saltString);

      final masterSecretKey =
          await _deriveKey(
        password,
        salt,
      );

      final decrypted =
          await _decryptPayload(
        encryptedIdentity,
        masterSecretKey,
      );

      final decoded =
          jsonDecode(utf8.decode(decrypted));

      if (decoded is! Map) {
        throw Exception("Invalid identity.");
      }

      return Identity.fromJson(
        Map<String, dynamic>.from(decoded),
      );
    } catch (_) {
      throw Exception(
        "Invalid password or corrupted identity.",
      );
    }
  }

  Future<bool> hasStoredIdentity() async {
    return await _keyStorage.getIdentity() != null;
  }

  Future<Identity?> getLocalIdentity() async {
    // Identity is encrypted and requires the password
    // to be unlocked.
    return null;
  }

  bool _constantTimeEquals(
    List<int> a,
    List<int> b,
  ) {
    if (a.length != b.length) {
      return false;
    }

    var result = 0;

    for (var i = 0; i < a.length; i++) {
      result |= a[i] ^ b[i];
    }

    return result == 0;
  }
}