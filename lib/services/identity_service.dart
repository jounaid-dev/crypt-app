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

  // ============================================================
  // DERIVED KEYPAIR CACHE
  //
  // Unlocking either private key costs a full PBKDF2 pass (500,000
  // iterations) plus two reads from platform secure storage and an AES-GCM
  // unwrap. That result depends only on the account password: not on the peer,
  // not on the message, and not on which chat is open.
  //
  // It was being recomputed anyway:
  //
  //   * getSigningKeyPair ran on every single outgoing message.
  //   * getEncryptionKeyPair ran every time a chat was opened, because the
  //     shared-key cache in ChatPage is per widget, so it starts empty for
  //     each conversation.
  //
  // Caching the two keypairs means the first unlock pays the PBKDF2 cost and
  // everything after it is a field read. Opening the tenth chat is no slower
  // than opening the second, and sending a message no longer re-derives a key
  // that has not changed.
  //
  // The cache is static because this service is constructed separately in
  // several places rather than shared, so a per-instance cache would not be
  // shared between the page that sends and the service that reads.
  //
  // It is dropped by clearKeyCache, which SessionService.lock calls. Locking is
  // meant to take key material out of memory, so the cache must not outlive
  // it.
  // ============================================================

  static String? _cachedPassword;
  static SimpleKeyPair? _cachedEncryptionKeyPair;
  static SimpleKeyPair? _cachedSigningKeyPair;

  // Derivations already running, so two callers that arrive together share one
  // pass instead of each paying for their own. Without this, opening a chat
  // while the sign-in warm up is still running would run PBKDF2 twice.
  static Future<SimpleKeyPair>? _pendingEncryption;
  static Future<SimpleKeyPair>? _pendingSigning;
  static String? _pendingPassword;

  /// Forgets the derived keypairs.
  ///
  /// Called when the session is locked or ended. The password is compared
  /// rather than assumed, so a cache built with a different password is never
  /// handed out.
  static void clearKeyCache() {
    _cachedPassword = null;
    _cachedEncryptionKeyPair = null;
    _cachedSigningKeyPair = null;
    _pendingEncryption = null;
    _pendingSigning = null;
    _pendingPassword = null;
  }

  static bool _cacheMatches(String password) {
    return _cachedPassword == password;
  }

  /// Unlocks both keypairs ahead of the first message or chat open.
  ///
  /// The first unlock pays the full PBKDF2 cost, which is the slowest thing
  /// the app does. Doing it right after sign in, while the user is still on
  /// the signed-in screen, means the first chat they tap opens immediately
  /// instead of pausing on a key derivation.
  ///
  /// Failures are swallowed on purpose: this is only a cache warm, and the
  /// real call sites still surface a genuine unlock failure when a key is
  /// actually needed.
  static Future<void> warmKeyCache(String password) async {
    if (_cacheMatches(password) &&
        _cachedEncryptionKeyPair != null &&
        _cachedSigningKeyPair != null) {
      return;
    }

    final IdentityService service = IdentityService();

    try {
      await service.getEncryptionKeyPair(password);
    } catch (_) {}

    try {
      await service.getSigningKeyPair(password);
    } catch (_) {}
  }

  static void _remember(
    String password, {
    SimpleKeyPair? encryptionKeyPair,
    SimpleKeyPair? signingKeyPair,
  }) {
    _cachedPassword = password;

    if (encryptionKeyPair != null) {
      _cachedEncryptionKeyPair = encryptionKeyPair;
    }

    if (signingKeyPair != null) {
      _cachedSigningKeyPair = signingKeyPair;
    }
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
    if (_cacheMatches(password)) {
      final cached = _cachedEncryptionKeyPair;

      if (cached != null) {
        return cached;
      }
    }

    // A derivation is already running for this password. Wait for that one
    // rather than starting a second one alongside it.
    final inFlight = _pendingEncryption;

    if (inFlight != null && _pendingPassword == password) {
      return inFlight;
    }

    final Future<SimpleKeyPair> derivation =
        _unlockEncryptionKeyPair(password);

    _pendingPassword = password;
    _pendingEncryption = derivation;

    try {
      return await derivation;
    } finally {
      if (identical(_pendingEncryption, derivation)) {
        _pendingEncryption = null;
        _pendingPassword = null;
      }
    }
  }

  Future<SimpleKeyPair> _unlockEncryptionKeyPair(
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

      final keyPair = SimpleKeyPairData(
        privateBytes,
        publicKey: SimplePublicKey(
          publicBytes,
          type: KeyPairType.x25519,
        ),
        type: KeyPairType.x25519,
      );

      _remember(password, encryptionKeyPair: keyPair);

      return keyPair;
    } catch (_) {
      throw Exception(
        "Unable to unlock encryption identity.",
      );
    }
  }

  Future<SimpleKeyPair> getSigningKeyPair(
    String password,
  ) async {
    // This used to re-derive the signing key for every message that was sent.
    if (_cacheMatches(password)) {
      final cached = _cachedSigningKeyPair;

      if (cached != null) {
        return cached;
      }
    }

    // Sending the first message while the sign-in warm up is still running
    // must not start a second derivation.
    final inFlight = _pendingSigning;

    if (inFlight != null && _pendingPassword == password) {
      return inFlight;
    }

    final Future<SimpleKeyPair> derivation =
        _unlockSigningKeyPair(password);

    _pendingPassword = password;
    _pendingSigning = derivation;

    try {
      return await derivation;
    } finally {
      if (identical(_pendingSigning, derivation)) {
        _pendingSigning = null;
        _pendingPassword = null;
      }
    }
  }

  Future<SimpleKeyPair> _unlockSigningKeyPair(
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

      _remember(password, signingKeyPair: keyPair);

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