import 'dart:convert';
import 'package:crypto/crypto.dart';

class ConversationIdService {
  static String generate({
    required String myPublicEncryptionKey,
    required String peerPublicEncryptionKey,
  }) {
    final keys = [
      myPublicEncryptionKey,
      peerPublicEncryptionKey,
    ]..sort();

    final canonical =
        '${keys[0]}:${keys[1]}';

    final bytes =
        utf8.encode(canonical);

    return sha256
        .convert(bytes)
        .toString();
  }
}