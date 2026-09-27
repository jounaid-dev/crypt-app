import 'dart:convert';
import 'dart:math';

/// The identity a CRYPT QR code carries.
class CryptQrPayload {
  const CryptQrPayload({
    required this.username,
    required this.publicEncryptionKey,
    required this.publicSigningKey,
    required this.qrProof,
  });

  final String username;
  final String publicEncryptionKey;
  final String publicSigningKey;
  final String qrProof;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "app": CryptQrCodec.appId,
      "version": CryptQrCodec.formatVersion,
      "username": username,
      "publicEncryptionKey": publicEncryptionKey,
      "publicSigningKey": publicSigningKey,
      "qrProof": qrProof,
    };
  }
}

/// Single source of truth for the CRYPT QR format.
///
/// Both the camera/gallery scanner and the `crypt://contact` deep link must
/// parse and validate identically, otherwise the two entry points drift apart
/// and accept or reject different codes.
class CryptQrCodec {
  CryptQrCodec._();

  static const String appId = "CRYPT";
  static const int formatVersion = 2;
  static const String scheme = "crypt";
  static const String host = "contact";
  static const String prefix = "$scheme://$host?data=";

  /// Generates an unpadded 43 character base64url proof (32 random bytes).
  static String generateQrProof() {
    return generateQrProofFrom(_secureRandom);
  }

  /// Exposed for tests so proof generation can be made deterministic.
  static String generateQrProofFrom(Random random) {
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    return base64UrlEncode(bytes).replaceAll("=", "");
  }

  static final Random _secureRandom = Random.secure();

  static String encode(CryptQrPayload payload) {
    return "$prefix${Uri.encodeComponent(jsonEncode(payload.toJson()))}";
  }

  /// Parses and fully validates a scanned or linked CRYPT code.
  ///
  /// Returns null for anything that is not a well formed, current-format
  /// CRYPT contact code.
  static CryptQrPayload? decode(String value) {
    value = value.trim();

    if (!value.startsWith(prefix)) return null;

    final Uri uri;

    try {
      uri = Uri.parse(value);
    } on FormatException {
      return null;
    }

    if (uri.scheme != scheme ||
        uri.host != host ||
        uri.path.isNotEmpty ||
        !uri.queryParameters.containsKey("data")) {
      return null;
    }

    // queryParameters already percent-decodes exactly once. Decoding again
    // would corrupt any field containing '%'.
    final String? encoded = uri.queryParameters["data"];

    if (encoded == null || encoded.isEmpty) return null;

    final Object? decoded;

    try {
      decoded = jsonDecode(encoded);
    } on FormatException {
      return null;
    }

    if (decoded is! Map) return null;

    final Map<String, dynamic> data = Map<String, dynamic>.from(decoded);

    if (data["app"] != appId || data["version"] != formatVersion) {
      return null;
    }

    final Object? username = data["username"];
    final Object? encryptionKey = data["publicEncryptionKey"];
    final Object? signingKey = data["publicSigningKey"];
    final Object? proof = data["qrProof"];

    if (username is! String ||
        encryptionKey is! String ||
        signingKey is! String ||
        proof is! String ||
        username.trim().isEmpty ||
        encryptionKey.isEmpty ||
        signingKey.isEmpty) {
      return null;
    }

    if (!isValidBase64Key(encryptionKey, 32)) return null;
    if (!isValidBase64Key(signingKey, 32)) return null;
    if (!isValidQrProof(proof)) return null;

    return CryptQrPayload(
      username: username,
      publicEncryptionKey: encryptionKey,
      publicSigningKey: signingKey,
      qrProof: proof,
    );
  }

  /// True when [value] is 32 bytes of standard base64.
  static bool isValidBase64Key(String value, int expectedLength) {
    try {
      return base64Decode(value).length == expectedLength;
    } on FormatException {
      return false;
    }
  }

  /// True when [value] is an unpadded base64url encoding of 32 bytes.
  static bool isValidQrProof(String value) {
    if (value.length != 43 ||
        !RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(value)) {
      return false;
    }

    try {
      // The proof is stored unpadded, so it is 43 characters. Dart's
      // base64Url.decode rejects lengths that are not a multiple of four, so
      // the padding has to be restored first. Decoding the raw value threw
      // FormatException, which was swallowed, and that silently rejected
      // every scan as an invalid CRYPT QR code.
      final padded = value.padRight(
        ((value.length + 3) ~/ 4) * 4,
        '=',
      );

      final decoded = base64Url.decode(padded);

      return decoded.length == 32 &&
          base64UrlEncode(decoded).replaceAll('=', '') == value;
    } on FormatException {
      return false;
    }
  }
}
