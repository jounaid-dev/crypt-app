import 'dart:convert';

/// Splits a large payload into data-channel sized frames.
///
/// A WebRTC data channel is not a byte stream with no upper bound: sending one
/// multi-megabyte string through `send` is not reliable, and several
/// implementations refuse a message over roughly 64 KB. Attachments made the
/// payload far bigger than that, so a large message is cut into small frames
/// here and put back together on the other side.
///
/// The framing is kept out of the app's own protocol on purpose. Callers still
/// hand over one string and still receive one string, so message signing,
/// acknowledgements and every existing packet keep working unchanged.
class DataChannelChunker {
  const DataChannelChunker({this.chunkSize = defaultChunkSize});

  /// 16 KB of UTF-16 code units per frame is comfortably under every
  /// implementation's limit even when each unit is a three-byte character.
  static const int defaultChunkSize = 16 * 1024;

  /// First bytes of a chunk frame. A real app packet starts with `{"id"` or
  /// `{"type"`, so this can never collide with one.
  static const String framePrefix = '{"__cryptChunk"';

  final int chunkSize;

  bool needsChunking(String text) => text.length > chunkSize;

  List<String> frames(String text, {required String transferId}) {
    final List<String> parts = <String>[];

    int start = 0;

    while (start < text.length) {
      int end = start + chunkSize;

      if (end > text.length) {
        end = text.length;
      }

      // Never cut a surrogate pair in half. A lone half cannot be encoded or
      // displayed, and the receiver would join it back into broken text.
      if (end < text.length) {
        final int lastUnit = text.codeUnitAt(end - 1);

        if (lastUnit >= 0xD800 && lastUnit <= 0xDBFF) {
          if (end - start == 1) {
            // A one-unit chunk cannot back off without becoming empty, so
            // take the whole pair instead.
            end = start + 2 <= text.length ? start + 2 : text.length;
          } else {
            end -= 1;
          }
        }
      }

      if (end <= start) {
        end = start + chunkSize;

        if (end > text.length) {
          end = text.length;
        }
      }

      parts.add(text.substring(start, end));

      start = end;
    }

    final int total = parts.length;

    return List<String>.generate(parts.length, (int index) {
      return jsonEncode({
        '__cryptChunk': {
          'id': transferId,
          'i': index,
          'n': total,
        },
        'd': parts[index],
      });
    });
  }
}

/// Rebuilds frames produced by [DataChannelChunker].
///
/// Stateful because frames of one transfer arrive interleaved with ordinary
/// packets and with other transfers. Partial transfers expire, and the total
/// buffered size is capped, so a peer cannot pin memory by starting transfers
/// it never finishes.
class IncomingChunkAssembler {
  IncomingChunkAssembler({
    this.maxMessageChars = 32 * 1024 * 1024,
    this.maxConcurrentTransfers = 3,
    this.maxTransferAge = const Duration(seconds: 120),
  });

  final int maxMessageChars;

  final int maxConcurrentTransfers;

  final Duration maxTransferAge;

  final Map<String, _PartialTransfer> _partials = <String, _PartialTransfer>{};

  /// Returns the complete message, null when the frame was consumed as part of
  /// a transfer that is not finished yet, or the input unchanged when it is an
  /// ordinary packet.
  String? add(String frame) {
    if (!frame.startsWith(DataChannelChunker.framePrefix)) {
      return frame;
    }

    final dynamic decoded;

    try {
      decoded = jsonDecode(frame);
    } catch (_) {
      return null;
    }

    if (decoded is! Map) {
      return null;
    }

    final dynamic meta = decoded['__cryptChunk'];

    final dynamic data = decoded['d'];

    if (meta is! Map || data is! String) {
      return null;
    }

    final String id = meta['id']?.toString() ?? '';

    final dynamic rawIndex = meta['i'];
    final dynamic rawTotal = meta['n'];

    if (id.isEmpty || rawIndex is! int || rawTotal is! int) {
      return null;
    }

    if (rawTotal <= 0 || rawIndex < 0 || rawIndex >= rawTotal) {
      return null;
    }

    final int total = rawTotal;

    // A peer could ask for an enormous number of frames. Refuse anything that
    // could not possibly fit under the cap rather than allocating it.
    if (total > (maxMessageChars ~/ 1024) + 1024) {
      return null;
    }

    _expireOld();

    // Bound the number of half-finished transfers held at once.
    if (_partials.length >= maxConcurrentTransfers && !_partials.containsKey(id)) {
      _partials.remove(_partials.keys.first);
    }

    final _PartialTransfer transfer = _partials.putIfAbsent(
      id,
      () => _PartialTransfer(total, DateTime.now()),
    );

    if (transfer.parts.length != total) {
      // Same id reused for a different shape: treat it as a new transfer.
      _partials[id] = _PartialTransfer(total, DateTime.now());
    }

    final _PartialTransfer active = _partials[id]!;

    active.parts[rawIndex] = data;

    active.bytes += data.length;

    if (active.bytes > maxMessageChars) {
      _partials.remove(id);
      return null;
    }

    if (active.received < total) {
      return null;
    }

    _partials.remove(id);

    final StringBuffer buffer = StringBuffer();

    for (final String? part in active.parts) {
      if (part == null) {
        return null;
      }

      buffer.write(part);
    }

    return buffer.toString();
  }

  /// Drops every partial transfer.
  ///
  /// Called when the peer connection is rebuilt: frames from the old channel
  /// can never complete on the new one, and holding them would waste memory.
  void reset() {
    _partials.clear();
  }

  void _expireOld() {
    final DateTime now = DateTime.now();

    _partials.removeWhere(
      (_, transfer) => now.difference(transfer.startedAt) > maxTransferAge,
    );
  }
}

class _PartialTransfer {
  _PartialTransfer(this.total, this.startedAt) : parts = List<String?>.filled(total, null);

  final int total;

  final DateTime startedAt;

  final List<String?> parts;

  int bytes = 0;

  int get received => parts.where((part) => part != null).length;
}
