import 'dart:convert';
import 'dart:typed_data';

/// An image or file that travels inside a normal encrypted message.
///
/// Attachments are not a second transport. The bytes are wrapped in a small
/// JSON envelope, and that envelope is encrypted and signed by exactly the
/// same code path as a text message. The other side decrypts it as usual and
/// then recognises the envelope, so an attachment gets the same end-to-end
/// encryption, the same Ed25519 signature, the same outbox retry and the same
/// on-device storage as any other message. Nothing about the security model
/// changes to carry them.
class ChatAttachment {
  const ChatAttachment({
    required this.kind,
    required this.name,
    required this.mimeType,
    required this.bytes,
  });

  /// Either [kindImage] or [kindFile].
  final String kind;

  final String name;

  final String mimeType;

  final Uint8List bytes;

  static const String kindImage = 'image';
  static const String kindFile = 'file';

  bool get isImage => kind == kindImage;

  int get size => bytes.length;
}

/// Raised when a picked attachment is larger than [AttachmentService.maxBytes].
class AttachmentTooLargeException implements Exception {
  const AttachmentTooLargeException(this.bytes);

  final int bytes;

  @override
  String toString() =>
      'Attachment is $bytes bytes, over the ${AttachmentService.maxBytes} byte limit.';
}

/// Encodes and decodes the attachment envelope, and owns the size limit.
///
/// The limit is deliberately a single constant. Every entry point checks the
/// same number, so a file accepted by the picker can never be rejected later
/// by the transport, and the receive path applies the same cap so a peer
/// cannot hand this device an unbounded payload.
class AttachmentService {
  AttachmentService._();

  /// 20 MiB. Large enough for a full-resolution phone photo, small enough to
  /// be encrypted, signed, base64 encoded and sent over the data channel
  /// without exhausting memory on a mid-range device. The plan is to raise
  /// this for premium accounts later; keeping it in one place means that is a
  /// one-line change rather than a hunt through the code.
  static const int maxBytes = 20 * 1024 * 1024;

  static const int sizeLimitMb = 20;

  static const int _version = 1;

  static const String _markerKey = '"cryptAttachment"';

  static const String _kindImage = ChatAttachment.kindImage;
  static const String _kindFile = ChatAttachment.kindFile;

  /// True when a decrypted plaintext is an attachment envelope rather than a
  /// typed message. The check is a cheap prefix scan, so every text message
  /// that is decrypted does not pay for a JSON parse.
  static bool looksLikeAttachment(String plaintext) {
    if (plaintext.length < 32) {
      return false;
    }

    final String head = plaintext.length > 96
        ? plaintext.substring(0, 96)
        : plaintext;

    return head.contains(_markerKey);
  }

  /// Wraps [bytes] in the envelope that gets encrypted.
  static String encode({
    required String kind,
    required String name,
    required String mimeType,
    required Uint8List bytes,
  }) {
    if (bytes.isEmpty) {
      throw ArgumentError.value(bytes, 'bytes', 'Attachment is empty.');
    }

    if (bytes.length > maxBytes) {
      throw AttachmentTooLargeException(bytes.length);
    }

    final String safeKind = kind == _kindImage ? _kindImage : _kindFile;

    return jsonEncode({
      'v': _version,
      'cryptAttachment': {
        'kind': safeKind,
        'name': sanitizeName(name),
        'mime': mimeType,
        'size': bytes.length,
        'data': base64Encode(bytes),
      },
    });
  }

  /// Reads an envelope back, or returns null when the plaintext is not one.
  ///
  /// Malformed envelopes (bad base64, a size mismatch, a payload over the
  /// limit) return null instead of throwing, because one bad incoming message
  /// must not break decryption of the rest of the conversation.
  static ChatAttachment? tryParse(String plaintext) {
    if (!looksLikeAttachment(plaintext)) {
      return null;
    }

    try {
      final dynamic decoded = jsonDecode(plaintext);

      if (decoded is! Map) {
        return null;
      }

      if (decoded['v'] != _version) {
        return null;
      }

      final dynamic raw = decoded['cryptAttachment'];

      if (raw is! Map) {
        return null;
      }

      final dynamic data = raw['data'];

      if (data is! String || data.isEmpty) {
        return null;
      }

      // Reject an oversized payload before allocating the decoded bytes.
      if (data.length > (maxBytes * 4 ~/ 3) + 64) {
        return null;
      }

      final Uint8List bytes = base64Decode(data);

      if (bytes.isEmpty || bytes.length > maxBytes) {
        return null;
      }

      final dynamic declaredSize = raw['size'];

      if (declaredSize is int && declaredSize != bytes.length) {
        return null;
      }

      final String kind = raw['kind'] == _kindImage ? _kindImage : _kindFile;

      return ChatAttachment(
        kind: kind,
        name: sanitizeName(raw['name']?.toString() ?? ''),
        mimeType: raw['mime']?.toString() ?? '',
        bytes: bytes,
      );
    } catch (_) {
      return null;
    }
  }

  /// A short label for the conversation list preview.
  static String previewLabel(
    ChatAttachment attachment, {
    required String photoLabel,
  }) {
    if (attachment.isImage) {
      return '📷 $photoLabel';
    }

    return '📎 ${attachment.name}';
  }

  /// Keeps a received name safe to show and safe to hand to the share sheet.
  static String sanitizeName(String name) {
    String clean = name.replaceAll(RegExp(r'[\\/:*?"<>|\u0000-\u001F]'), '_');

    clean = clean.trim();

    if (clean.isEmpty) {
      return 'attachment';
    }

    if (clean.length > 120) {
      clean = clean.substring(0, 120);
    }

    return clean;
  }

  static String formatSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }

    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }

    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
