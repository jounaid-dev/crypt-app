import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptIdService {
  String generateFromPublicKey(
    String publicKey,
  ) {
    final hash = sha256.convert(
      utf8.encode(publicKey),
    );

    final hex = hash
        .toString()
        .toUpperCase();

    return "CPT-"
        "${hex.substring(0, 4)}-"
        "${hex.substring(4, 8)}-"
        "${hex.substring(8, 12)}-"
        "${hex.substring(12, 16)}";
  }
}