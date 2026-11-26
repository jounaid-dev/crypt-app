import 'package:crypt_messenger/services/encryption_service.dart';
import 'package:cryptography/cryptography.dart';
import 'package:flutter_test/flutter_test.dart';

/// Emoji are ordinary Unicode text, so they must survive the same
/// encrypt/decrypt path as every other message.
///
/// These cases cover a simple emoji, a skin-tone modifier, a zero-width
/// joiner family sequence, flags and mixed text, which are the shapes a
/// naive byte handling change would break first.
void main() {
  late EncryptionService service;
  late SecretKey key;

  setUp(() async {
    service = EncryptionService();
    key = await AesGcm.with256bits().newSecretKey();
  });

  group('emoji message round trip', () {
    const List<String> messages = <String>[
      '👋',
      'Hello 👋🏽',
      'Family 👨‍👩‍👧‍👦',
      'Flags 🇫🇷🇰🇷',
      'Mixed: ça va? 😀 100% 🔐',
      '❤️‍🔥',
    ];

    for (final String message in messages) {
      test('preserves "$message"', () async {
        final String encrypted = await service.encryptMessage(
          message: message,
          key: key,
        );

        final String decrypted = await service.decryptMessage(
          encryptedMessage: encrypted,
          key: key,
        );

        expect(decrypted, message);
      });
    }
  });
}
