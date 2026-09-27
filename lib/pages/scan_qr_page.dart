import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../services/account_service.dart';
import '../services/conversation_id_service.dart';
import '../services/conversation_service.dart';
import '../services/crypt_qr_codec.dart';
import '../services/signaling_service.dart';
import '../models/conversation.dart';

/// A scanned code that decoded correctly but describes the local account.
///
/// This is deliberately its own type rather than a message string. Every
/// failure in [ScanQrPage.processQrValue] used to be reported to the user as
/// "Invalid CRYPT QR code.", so scanning your own perfectly valid code looked
/// exactly like scanning a stranger's malformed one, which sent people looking
/// for a format bug that was not there.
class _SelfScanException implements Exception {
  const _SelfScanException();
}

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  bool scanned = false;
  String scannedUsername = "";

  /// Set synchronously the moment a capture is accepted for processing.
  ///
  /// `onDetect` fires on many consecutive frames. `scanned` is only flipped
  /// after several `await`s, so without this guard several frames could enter
  /// `processQrValue` at once and create duplicate contacts, send duplicate
  /// signaling requests, and pop the route more than once.
  bool _processing = false;

  /// Last payload rejected by validation, used to suppress the endless
  /// error loop that happens when a bad code stays in front of the camera.
  String? _lastRejectedValue;
  DateTime? _lastRejectedAt;

  final AccountService _accountService = AccountService();

  final ConversationService _conversationService = ConversationService();

  final SignalingService _signalingService = SignalingService.instance;

  final MobileScannerController _scannerController =
      MobileScannerController(
        // CRYPT only ever exchanges QR codes, so skip every other format.
        // This also stops random 1D barcodes from failing validation.
        formats: const [BarcodeFormat.qrCode],
        detectionSpeed: DetectionSpeed.normal,
        detectionTimeoutMs: 800,
      );

  final ImagePicker _imagePicker = ImagePicker();

  // ============================================================
  // QR PROCESSING
  // ============================================================

  Future<void> processQrValue(
    String value,
    AppLocalizations l10n,
  ) async {
    value = value.trim();

    if (_processing || scanned) return;

    _processing = true;

    try {
      // ==========================================================
      // PARSE AND VALIDATE
      //
      // Shared with the crypt://contact deep link handler so both entry
      // points accept and reject exactly the same codes.
      // ==========================================================

      final payload = CryptQrCodec.decode(value);

      if (payload == null) {
        throw Exception("Not a valid CRYPT profile payload.");
      }

      if (!mounted) return;

      // ========================================================
      // PEER IDENTITY
      // ========================================================

      final String peerUsername = payload.username;

      final String peerEncryptionKey = payload.publicEncryptionKey;

      final String peerSigningKey = payload.publicSigningKey;

      // ========================================================
      // QR PROOF
      // ========================================================

      final String qrProof = payload.qrProof;

      // ========================================================
      // LOAD MY IDENTITY
      // ========================================================

      final String? myUsername =
          await _accountService.getUsername();

      final String? myEncryptionKey =
          await _accountService.getPublicEncryptionKey();

      final String? mySigningKey =
          await _accountService.getPublicSigningKey();

      if (myUsername == null || myUsername.trim().isEmpty) {
        throw Exception("Local username is missing.");
      }

      if (myEncryptionKey == null ||
          myEncryptionKey.trim().isEmpty) {
        throw Exception(l10n.localEncryptionKeyMissing);
      }

      if (mySigningKey == null ||
          mySigningKey.trim().isEmpty) {
        throw Exception("Local signing key is missing.");
      }

      // ========================================================
      // PREVENT SELF
      // ========================================================

      if (myUsername == peerUsername ||
          myEncryptionKey == peerEncryptionKey) {
        throw const _SelfScanException();
      }

      // ========================================================
      // CONVERSATION ID
      // ========================================================

      final String conversationId =
          ConversationIdService.generate(
        myPublicEncryptionKey: myEncryptionKey,
        peerPublicEncryptionKey: peerEncryptionKey,
      );

      setState(() {
        scanned = true;
        scannedUsername = peerUsername;
      });

      // ========================================================
      // CHECK EXISTING CONTACT
      // ========================================================

      final Conversation? existingConversation =
          await _conversationService
              .findConversationByPublicKey(peerEncryptionKey);

      if (existingConversation != null) {
        final updatedConversation = Conversation(
          id: conversationId,
          username: peerUsername,
          publicSigningKey: peerSigningKey,
          publicEncryptionKey: peerEncryptionKey,
          createdAt: existingConversation.createdAt,
          lastMessageAt: existingConversation.lastMessageAt,
          lastMessage: existingConversation.lastMessage,
          unreadCount: existingConversation.unreadCount,
          verified: existingConversation.verified,
        );

        await _conversationService.updateConversation(
          updatedConversation,
        );

        // ======================================================
        // SEND REQUEST
        // ======================================================

        if (_signalingService.isConnected) {
          _signalingService.sendConversationRequest(
            target: peerUsername,
            payload: {
              "conversationId": conversationId,
              "qrProof": qrProof,
              "username": myUsername,
              "publicEncryptionKey": myEncryptionKey,
              "publicSigningKey": mySigningKey,
            },
          );
        }

        await Future.delayed(
          const Duration(milliseconds: 800),
        );

        if (!mounted) return;

        Navigator.pop(context, {
          "alreadyExists": true,
          "conversation": updatedConversation,
          "qrData": payload.toJson(),
        });

        return;
      }

      // ========================================================
      // CREATE LOCAL CONVERSATION
      // ========================================================

      final DateTime now = DateTime.now();

      final Conversation conversation = Conversation(
        id: conversationId,
        username: peerUsername,
        publicSigningKey: peerSigningKey,
        publicEncryptionKey: peerEncryptionKey,
        createdAt: now,
        lastMessageAt: now,
        lastMessage: "",
        unreadCount: 0,
        verified: false,
      );

      await _conversationService.addConversation(
        conversation,
      );

      // ========================================================
      // SEND CONVERSATION REQUEST
      // ========================================================

      if (_signalingService.isConnected) {
        _signalingService.sendConversationRequest(
          target: peerUsername,
          payload: {
            "conversationId": conversationId,
            "qrProof": qrProof,
            "username": myUsername,
            "publicEncryptionKey": myEncryptionKey,
            "publicSigningKey": mySigningKey,
          },
        );
      }

      // ========================================================
      // SUCCESS
      // ========================================================

      await Future.delayed(
        const Duration(milliseconds: 1500),
      );

      if (!mounted) return;

      Navigator.pop(context, {
        "alreadyExists": false,
        "conversation": conversation,
        "qrData": payload.toJson(),
      });
    } catch (error) {
      // ==========================================================
      // RESET THE GUARD
      //
      // A rejected code is still sitting in front of the camera, so the next
      // frame re-enters this method. Remember what was rejected and swallow
      // the repeats instead of showing an endless stream of snackbars.
      // ==========================================================

      final DateTime now = DateTime.now();

      final bool isRepeat =
          _lastRejectedValue == value &&
          _lastRejectedAt != null &&
          now.difference(_lastRejectedAt!) <
              const Duration(seconds: 5);

      _lastRejectedValue = value;
      _lastRejectedAt = now;

      _processing = false;

      if (!mounted) return;

      setState(() {
        scanned = false;
      });

      if (isRepeat) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            error is _SelfScanException
                ? "That is your own code. Scan someone else's CRYPT code "
                    "to start a chat with them."
                : l10n.invalidCryptQrFormat,
          ),
        ),
      );
    }
  }

  // ============================================================
  // LIVE CAMERA
  // ============================================================

  Future<void> handleCameraScan(
    BarcodeCapture capture,
    AppLocalizations l10n,
  ) async {
    if (scanned) return;

    if (capture.barcodes.isEmpty) {
      return;
    }

    for (final barcode in capture.barcodes) {
      final String? value = barcode.rawValue;

      if (value != null && value.isNotEmpty) {
        await processQrValue(value, l10n);
        return;
      }
    }
  }

  // ============================================================
  // GALLERY
  // ============================================================

  Future<void> scanFromGallery(
    AppLocalizations l10n,
  ) async {
    if (scanned) return;

    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (image == null) {
        return;
      }

      final BarcodeCapture? capture =
          await _scannerController.analyzeImage(
        image.path,
        formats: const [BarcodeFormat.qrCode],
      );

      if (capture == null ||
          capture.barcodes.isEmpty) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.noQrCodeFound),
          ),
        );

        return;
      }

      for (final barcode in capture.barcodes) {
        final String? value = barcode.rawValue;

        if (value != null && value.isNotEmpty) {
          await processQrValue(value, l10n);
          return;
        }
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.noQrCodeFound),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.couldNotScanImage),
        ),
      );
    }
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        titleSpacing: 20,
        title: Text(
          l10n.scanQr,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        actions: [
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: _scannerController,
            builder: (context, state, _) {
              return IconButton(
                tooltip: l10n.scanQr,
                onPressed: state.torchState == TorchState.unavailable
                    ? null
                    : () => _scannerController.toggleTorch(),
                icon: Icon(
                  state.torchState == TorchState.on
                      ? Icons.flashlight_on
                      : Icons.flashlight_off,
                ),
              );
            },
          ),
          IconButton(
            tooltip: l10n.gallery,
            onPressed: scanned
                ? null
                : () => scanFromGallery(l10n),
            icon: const Icon(
              Icons.photo_library_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            // ==================================================
            // LIVE CAMERA
            // ==================================================

            MobileScanner(
              controller: _scannerController,
              onDetect: (capture) =>
                  handleCameraScan(capture, l10n),
              errorBuilder: (context, error) {
                // ================================================
                // CAMERA UNAVAILABLE
                //
                // Without this the scanner area renders a bare
                // placeholder behind the dim overlay, so a denied or
                // missing camera looks like a broken scanner.
                // ================================================

                return ColoredBox(
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.no_photography_outlined,
                            color: Colors.white,
                            size: 44,
                          ),

                          const SizedBox(height: 16),

                          Text(
                            l10n.couldNotScanImage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // ==================================================
            // CAMERA OVERLAY
            //
            // The dimming is painted with an even-odd path so the
            // area inside the frame stays at full brightness.
            // Previously the dim layer covered the frame too, so
            // the box the user is told to aim at was itself dimmed
            // and gave no real alignment guide.
            // ==================================================

            IgnorePointer(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const double frameSize = 320;

                  return CustomPaint(
                    size: Size(
                      constraints.maxWidth,
                      constraints.maxHeight,
                    ),
                    painter: _ScannerOverlayPainter(
                      frameSize: frameSize,
                    ),
                  );
                },
              ),
            ),

            // ==================================================
            // TOP INSTRUCTION
            // ==================================================

            Positioned(
              top: 24,
              left: 24,
              right: 24,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(210),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),
                  child: Text(
                    l10n.alignQrCode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.6,
                    ),
                  ),
                ),
              ),
            ),

            // ==================================================
            // GALLERY BUTTON
            // ==================================================

            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: OutlinedButton.icon(
                onPressed: scanned
                    ? null
                    : () => scanFromGallery(l10n),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      Colors.black.withAlpha(225),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(
                  Icons.photo_library_outlined,
                  size: 21,
                ),
                label: Text(
                  l10n.scanFromGallery,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            // ==================================================
            // SUCCESS SCREEN
            // ==================================================

            if (scanned)
              Container(
                color: Colors.black.withAlpha(235),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 28,
                    ),
                    padding: const EdgeInsets.fromLTRB(
                      28,
                      30,
                      28,
                      28,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: colorScheme.onPrimary,
                            size: 36,
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          l10n.userScanned,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          height: 1,
                          width: 45,
                          color: colorScheme.onSurface,
                        ),

                        const SizedBox(height: 14),

                        Text(
                          l10n.addingUser(scannedUsername),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Draws the dimmed surround plus the bright alignment frame.
class _ScannerOverlayPainter extends CustomPainter {
  const _ScannerOverlayPainter({required this.frameSize});

  final double frameSize;

  static const double _radius = 18;
  static const double _borderWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    // Never let the frame grow past the available space.
    final double side = frameSize < size.shortestSide
        ? frameSize
        : size.shortestSide;

    final Rect frame = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: side,
      height: side,
    );

    final RRect frameRRect = RRect.fromRectAndRadius(
      frame,
      const Radius.circular(_radius),
    );

    // even-odd lets the frame rect punch a hole in the dim layer.
    final Path dim = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Offset.zero & size)
      ..addRRect(frameRRect);

    canvas.drawPath(
      dim,
      Paint()..color = Colors.black.withAlpha(120),
    );

    canvas.drawRRect(
      frameRRect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = _borderWidth,
    );
  }

  @override
  bool shouldRepaint(covariant _ScannerOverlayPainter oldDelegate) {
    return oldDelegate.frameSize != frameSize;
  }
}
