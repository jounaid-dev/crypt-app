import 'dart:math';

import 'package:crypt_messenger/services/crypt_qr_codec.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr/qr.dart';

/// Builds a payload exactly like my_identity_page.dart does, then decodes it
/// the way the scanner and the deep link handler do.
CryptQrPayload samplePayload({String username = 'alice'}) {
  final random = Random(42);

  String key() =>
      base64EncodeOf(List<int>.generate(32, (_) => random.nextInt(256)));

  return CryptQrPayload(
    username: username,
    publicEncryptionKey: key(),
    publicSigningKey: key(),
    qrProof: CryptQrCodec.generateQrProofFrom(random),
  );
}

String base64EncodeOf(List<int> bytes) {
  // Local helper so the test does not depend on dart:convert ordering.
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  final buffer = StringBuffer();
  for (var i = 0; i < bytes.length; i += 3) {
    final b0 = bytes[i];
    final b1 = i + 1 < bytes.length ? bytes[i + 1] : 0;
    final b2 = i + 2 < bytes.length ? bytes[i + 2] : 0;
    buffer.write(chars[b0 >> 2]);
    buffer.write(chars[((b0 & 0x03) << 4) | (b1 >> 4)]);
    buffer.write(i + 1 < bytes.length ? chars[((b1 & 0x0F) << 2) | (b2 >> 6)] : '=');
    buffer.write(i + 2 < bytes.length ? chars[b2 & 0x3F] : '=');
  }
  return buffer.toString();
}

void main() {
  group('proof format', () {
    test('generated proofs are accepted by the validator', () {
      for (var i = 0; i < 500; i++) {
        final proof = CryptQrCodec.generateQrProof();
        expect(proof.length, 43, reason: 'proof must be 43 chars');
        expect(
          CryptQrCodec.isValidQrProof(proof),
          isTrue,
          reason: 'freshly generated proof was rejected: $proof',
        );
      }
    });

    test('rejects wrong lengths and non url-safe characters', () {
      expect(CryptQrCodec.isValidQrProof(''), isFalse);
      expect(CryptQrCodec.isValidQrProof('short'), isFalse);
      expect(CryptQrCodec.isValidQrProof('a' * 44), isFalse);
      expect(CryptQrCodec.isValidQrProof('a' * 42), isFalse);
      // '+' and '/' are standard base64, not base64url.
      expect(CryptQrCodec.isValidQrProof('a' * 42 + '+'), isFalse);
    });
  });

  group('encode/decode round trip', () {
    test('a freshly generated code decodes and validates', () {
      final payload = samplePayload();

      final encoded = CryptQrCodec.encode(payload);

      expect(encoded, startsWith('crypt://contact?data='));

      final decoded = CryptQrCodec.decode(encoded);

      expect(decoded, isNotNull,
          reason: 'the scanner rejected a code the app just created');
      expect(decoded!.username, payload.username);
      expect(decoded.publicEncryptionKey, payload.publicEncryptionKey);
      expect(decoded.publicSigningKey, payload.publicSigningKey);
      expect(decoded.qrProof, payload.qrProof);
    });

    test('1000 generated identities all round trip', () {
      for (var i = 0; i < 1000; i++) {
        final payload = samplePayload(username: 'user$i');
        final decoded = CryptQrCodec.decode(CryptQrCodec.encode(payload));
        expect(decoded, isNotNull, reason: 'failed for $payload');
      }
    });

    test('usernames containing a percent sign survive the round trip', () {
      // Regression: the deep link handler used to decode the data twice,
      // which threw on any '%' in a field.
      for (final name in ['100%_real', 'a%20b', '50%50%', '%']) {
        final payload = samplePayload(username: name);
        final decoded = CryptQrCodec.decode(CryptQrCodec.encode(payload));
        expect(decoded, isNotNull, reason: 'failed for $name');
        expect(decoded!.username, name);
      }
    });

    test('non ascii usernames survive the round trip', () {
      const name = 'Ωμέγα_用户_🎉';
      final payload = samplePayload(username: name);
      final decoded = CryptQrCodec.decode(CryptQrCodec.encode(payload));
      expect(decoded, isNotNull);
      expect(decoded!.username, name);
    });
  });

  group('rejections', () {
    test('wrong version is rejected', () {
      final payload = samplePayload();
      final json =
          '{"app":"CRYPT","version":1,"username":"${payload.username}",'
          '"publicEncryptionKey":"${payload.publicEncryptionKey}",'
          '"publicSigningKey":"${payload.publicSigningKey}",'
          '"qrProof":"${payload.qrProof}"}';
      final link = 'crypt://contact?data=${Uri.encodeComponent(json)}';

      expect(CryptQrCodec.decode(link), isNull);
    });

    test('malformed keys are rejected', () {
      final json =
          '{"app":"CRYPT","version":2,"username":"mallory",'
          '"publicEncryptionKey":"not-a-key",'
          '"publicSigningKey":"also-not-a-key","qrProof":"short"}';
      final link = 'crypt://contact?data=${Uri.encodeComponent(json)}';

      expect(CryptQrCodec.decode(link), isNull);
    });

    test('non crypt payloads and other schemes are rejected', () {
      expect(CryptQrCodec.decode('https://example.com'), isNull);
      expect(CryptQrCodec.decode('crypt://other?data=x'), isNull);
      expect(CryptQrCodec.decode('crypt://contact'), isNull);
      expect(CryptQrCodec.decode('crypt://contact?data='), isNull);
      expect(CryptQrCodec.decode('not a uri at all'), isNull);
    });

    test('an unpadded proof that the old code rejected is now accepted', () {
      // This is the exact shape generateQrProof() produces.
      final proof = CryptQrCodec.generateQrProof();
      expect(proof, isNot(contains('=')));
      expect(CryptQrCodec.isValidQrProof(proof), isTrue);
    });
  });

  group('symbol density', () {
    test('records module density for the real payload', () {
      final link = CryptQrCodec.encode(samplePayload());

      for (final e in <String, int>{
        'L': QrErrorCorrectLevel.L,
        'M': QrErrorCorrectLevel.M,
        'Q': QrErrorCorrectLevel.Q,
        'H': QrErrorCorrectLevel.H,
      }.entries) {
        final code = QrCode.fromData(
          data: link,
          errorCorrectLevel: e.value,
        );
        final modules = code.moduleCount;
        final at200 = 200 / modules;
        final at340 = 340 / modules;

        // ignore: avoid_print
        print('ECC ${e.key}: v${code.typeNumber}, $modules modules, '
            '200px=${at200.toStringAsFixed(2)}px/module, '
            '340px=${at340.toStringAsFixed(2)}px/module');
      }
    });
  });
}
