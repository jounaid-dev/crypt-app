import 'dart:convert';
import 'dart:typed_data';

import 'package:crypt_messenger/services/attachment_service.dart';
import 'package:crypt_messenger/services/data_channel_chunker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AttachmentService', () {
    test('round trips an image envelope', () {
      final Uint8List bytes = Uint8List.fromList(List<int>.generate(2048, (i) => i % 256));

      final String envelope = AttachmentService.encode(
        kind: ChatAttachment.kindImage,
        name: 'holiday photo.jpg',
        mimeType: 'image/jpeg',
        bytes: bytes,
      );

      expect(AttachmentService.looksLikeAttachment(envelope), isTrue);

      final ChatAttachment? parsed = AttachmentService.tryParse(envelope);

      expect(parsed, isNotNull);
      expect(parsed!.kind, ChatAttachment.kindImage);
      expect(parsed.name, 'holiday photo.jpg');
      expect(parsed.mimeType, 'image/jpeg');
      expect(parsed.bytes, bytes);
    });

    test('a plain text message is not mistaken for an attachment', () {
      expect(AttachmentService.looksLikeAttachment('hello there'), isFalse);
      expect(AttachmentService.tryParse('hello there'), isNull);
    });

    test('refuses to encode over the 20 MB limit', () {
      final Uint8List tooBig = Uint8List(AttachmentService.maxBytes + 1);

      expect(
        () => AttachmentService.encode(
          kind: ChatAttachment.kindFile,
          name: 'big.bin',
          mimeType: 'application/octet-stream',
          bytes: tooBig,
        ),
        throwsA(isA<AttachmentTooLargeException>()),
      );
    });

    test('a corrupted or truncated envelope decodes to null', () {
      final String envelope = AttachmentService.encode(
        kind: ChatAttachment.kindFile,
        name: 'notes.txt',
        mimeType: 'text/plain',
        bytes: Uint8List.fromList(utf8.encode('hello')),
      );

      final Map<String, dynamic> decoded =
          jsonDecode(envelope) as Map<String, dynamic>;

      decoded['cryptAttachment']['data'] = 'not base64 at all';

      expect(AttachmentService.tryParse(jsonEncode(decoded)), isNull);
    });

    test('sanitizes a received file name', () {
      expect(AttachmentService.sanitizeName('../../etc/passwd'), isNot(contains('/')));
      expect(AttachmentService.sanitizeName('   '), 'attachment');
    });

    test('builds a readable preview label', () {
      final ChatAttachment image = ChatAttachment(
        kind: ChatAttachment.kindImage,
        name: 'a.png',
        mimeType: 'image/png',
        bytes: Uint8List(1),
      );

      expect(
        AttachmentService.previewLabel(image, photoLabel: 'Photo'),
        '📷 Photo',
      );
    });
  });

  group('DataChannelChunker', () {
    const DataChannelChunker chunker = DataChannelChunker(chunkSize: 1024);

    test('small messages are sent as they are', () {
      expect(chunker.needsChunking('a short message'), isFalse);
    });

    test('a long message is split and rejoined exactly', () {
      final String text = List<String>.generate(500, (i) => 'message $i').join('|');

      expect(chunker.needsChunking(text), isTrue);

      final List<String> frames = chunker.frames(text, transferId: 'transfer-1');

      expect(frames.length, greaterThan(1));

      final IncomingChunkAssembler assembler = IncomingChunkAssembler();

      String? complete;

      for (final String frame in frames) {
        complete = assembler.add(frame) ?? complete;
      }

      expect(complete, text);
    });

    test('frames arriving out of order still reassemble', () {
      final String text = List<String>.filled(2000, 'x').join();

      final List<String> frames = chunker.frames(text, transferId: 'out-of-order');

      final IncomingChunkAssembler assembler = IncomingChunkAssembler();

      String? complete;

      for (final String frame in frames.reversed) {
        complete = assembler.add(frame) ?? complete;
      }

      expect(complete, text);
    });

    test('a partial transfer yields nothing yet', () {
      final String text = List<String>.filled(3000, 'y').join();

      final List<String> frames = chunker.frames(text, transferId: 'partial');

      final IncomingChunkAssembler assembler = IncomingChunkAssembler();

      expect(assembler.add(frames.first), isNull);
    });

    test('ordinary packets pass straight through', () {
      final IncomingChunkAssembler assembler = IncomingChunkAssembler();

      expect(assembler.add('{"id":"abc"}'), '{"id":"abc"}');
    });

    test('never splits a surrogate pair', () {
      final String emoji = '😀';

      final List<String> frames = const DataChannelChunker(chunkSize: 1)
          .frames('$emoji$emoji', transferId: 'surrogates');

      for (final String frame in frames) {
        final Map<String, dynamic> decoded =
            jsonDecode(frame) as Map<String, dynamic>;

        final String part = decoded['d'] as String;

        // A part holding half of a pair cannot survive a UTF-8 round trip:
        // the encoder replaces the lone surrogate. A whole pair can.
        expect(utf8.decode(utf8.encode(part)), part);
      }
    });
  });
}
