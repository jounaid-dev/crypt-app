import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/account_service.dart';
import '../services/crypt_qr_codec.dart';
import '../services/qr_validation_code_service.dart';
import '../pages/signup_page.dart';

class MyIdentityPage extends StatefulWidget {
  const MyIdentityPage({super.key});

  @override
  State<MyIdentityPage> createState() => _MyIdentityPageState();
}

class _MyIdentityPageState extends State<MyIdentityPage> {
  final AccountService _accountService = AccountService();

  final QrValidationCodeService _qrValidationCodeService =
      QrValidationCodeService();

  static const String _qrProofKey = "active_qr_proof";
  static const String _qrProofCreatedAtKey = "active_qr_proof_created_at";

  /// How often a fresh QR/validation code is generated while this page is
  /// open. Older UNUSED codes remain valid.
  static const Duration _qrRotationInterval = Duration(seconds: 30);

  Timer? _qrRotationTimer;

  String username = "";
  String publicEncryptionKey = "";
  String publicSigningKey = "";

  // ============================================================
  // ONE-TIME QR PROOF
  // ============================================================

  String qrProof = "";

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadIdentity();
  }

  // ============================================================
  // GENERATE SECURE QR PROOF
  //
  // Delegated to the shared codec so the proof format can never drift
  // away from the validator that checks it on the receiving side.
  // ============================================================

  String generateQrProof() {
    return CryptQrCodec.generateQrProof();
  }

  // ============================================================
  // SAVE ACTIVE QR PROOF
  // ============================================================

  Future<void> saveQrProof(String proof) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_qrProofKey, proof);

    await prefs.setInt(
      _qrProofCreatedAtKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  // ============================================================
  // ROTATE QR / VALIDATION CODE
  // ============================================================

  void _startQrRotation() {
    _qrRotationTimer?.cancel();

    _qrRotationTimer = Timer.periodic(
      _qrRotationInterval,
      (_) => _rotateQrProof(),
    );
  }

  Future<void> _rotateQrProof() async {
    final newProof = generateQrProof();

    // Persist the new UNUSED code. Older unused codes stay valid.
    await _qrValidationCodeService.registerCode(newProof);

    await saveQrProof(newProof);

    if (!mounted) return;

    setState(() {
      qrProof = newProof;
    });

    debugPrint("[QR] Rotated validation code.");
  }

  // ============================================================
  // LOAD IDENTITY
  // ============================================================

  Future<void> loadIdentity() async {
    final account = await _accountService.getAccount();

    if (account == null) {
      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignupPage()),
        (route) => false,
      );

      return;
    }

    username = account["username"] ?? "";

    publicEncryptionKey = account["publicKey"] ?? "";

    publicSigningKey = account["publicSigningKey"] ?? "";

    // ==========================================================
    // GENERATE A FRESH QR PROOF
    // ==========================================================

    qrProof = generateQrProof();

    // ==========================================================
    // SAVE THE EXACT PROOF USED BY BOTH QR TYPES
    // ==========================================================

    await saveQrProof(qrProof);

    // ==========================================================
    // PERSIST THE VALIDATION CODE IN HIVE (UNUSED)
    // ==========================================================

    await _qrValidationCodeService.registerCode(qrProof);

    // ==========================================================
    // ROTATE THE QR / VALIDATION CODE WHILE THIS PAGE IS OPEN
    // ==========================================================

    _startQrRotation();

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }

  // ============================================================
  // INVITE LINK
  //
  // Built with the same codec the scanner and the deep link handler
  // parse with, so the three paths can never disagree on the format.
  // ============================================================

  String inviteLink() {
    return CryptQrCodec.encode(
      CryptQrPayload(
        username: username,
        publicEncryptionKey: publicEncryptionKey,
        publicSigningKey: publicSigningKey,
        qrProof: qrProof,
      ),
    );
  }

  // ============================================================
  // CREATE QR PAINTER
  //
  // IMPORTANT:
  //
  // Both the displayed QR and the shared QR use this exact
  // same configuration and the exact same inviteLink().
  //
  // ============================================================

  QrPainter createQrPainter() {
    return QrPainter(
      data: inviteLink(),
      version: QrVersions.auto,
      gapless: true,
      // The payload is ~240 bytes. Error correction level L keeps the symbol
      // at the lowest possible density, which yields the largest modules for
      // the available space. The higher levels force a denser symbol that is
      // noticeably harder for another phone to read off a screen.
      errorCorrectionLevel: QrErrorCorrectLevel.L,
      // Colors belong to the styles now. `color`/`emptyColor` are deprecated,
      // and the background is supplied by the surrounding white card / the
      // white rect painted before the export.
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Colors.black,
      ),
      dataModuleStyle: const QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
        color: Colors.black,
      ),
    );
  }

  // ============================================================
  // SHARE QR CODE AS AN IMAGE
  // ============================================================

  /// Renders the QR on an opaque white sheet with a spec quiet zone.
  ///
  /// `QrPainter.toImageData` fills the whole canvas with the symbol, so the
  /// exported PNG had the code running edge to edge and a transparent
  /// background. Decoders need the light margin around the symbol to find it,
  /// so the sheet is painted white and the code is inset inside it.
  Future<Uint8List> renderQrImageBytes() async {
    const int edge = 1200;
    const double quietZoneRatio = 0.08;

    final ui.PictureRecorder recorder = ui.PictureRecorder();

    final Canvas canvas = Canvas(recorder);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, edge.toDouble(), edge.toDouble()),
      Paint()..color = Colors.white,
    );

    final double codeEdge =
        edge * (1 - (quietZoneRatio * 2));

    final double offset = (edge - codeEdge) / 2;

    canvas.save();

    canvas.translate(offset, offset);

    // Same painter configuration as the QR shown on the page.
    createQrPainter().paint(
      canvas,
      Size(codeEdge, codeEdge),
    );

    canvas.restore();

    final ui.Image image = await recorder
        .endRecording()
        .toImage(edge, edge);

    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    if (byteData == null) {
      throw Exception("Could not generate QR image");
    }

    return byteData.buffer.asUint8List();
  }

  Future<void> shareQrCode() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      final Uint8List imageBytes = await renderQrImageBytes();

      await Share.shareXFiles([
        XFile.fromData(imageBytes, name: "crypt_qr.png", mimeType: "image/png"),
      ], subject: "CRYPT");
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.couldNotShareQrCode(l10n.connectionFailed),
          ),
        ),
      );
    }
  }

  // ============================================================
  // OLD TEXT/LINK SHARING
  // KEPT UNCHANGED
  // ============================================================

  Future<void> shareIdentity() async {
    final l10n = AppLocalizations.of(context)!;

    await Share.share(
      l10n.addMeOnCrypt(inviteLink()),
      subject: l10n.myIdentity,
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _qrRotationTimer?.cancel();
    _qrRotationTimer = null;

    super.dispose();
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myIdentity)),
      body: SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        child: Text(
                          username.isEmpty ? "?" : username[0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        username,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Card(
                        color: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          // 28 also supplies the light quiet zone the QR
                          // spec requires around the symbol.
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            children: [
                              // ==================================================
                              // DISPLAYED QR
                              //
                              // EXACT SAME DATA:
                              // inviteLink()
                              //
                              // EXACT SAME CONFIGURATION:
                              // createQrPainter()
                              //
                              // The payload is ~240 bytes, so QrVersions.auto
                              // picks a fairly dense symbol. Rendering it at a
                              // fixed 200px left only ~3px per module, which
                              // MLKit cannot reliably decode from another
                              // phone's screen. Give it all the width
                              // available, capped so it never looks oversized.
                              // ==================================================
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  // The scroll view hands down an unbounded
                                  // height, so the shortest side is the width.
                                  final double side = constraints
                                      .biggest
                                      .shortestSide
                                      .clamp(0.0, 340.0);

                                  return Center(
                                    child: SizedBox(
                                      width: side,
                                      height: side,
                                      child: CustomPaint(
                                        painter: createQrPainter(),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 16),

                              Text(
                                l10n.scanToAddMe,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // ==================================================
                      // SHARE QR AS IMAGE
                      // ==================================================
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: shareQrCode,
                          icon: const Icon(Icons.qr_code_2),
                          label: Text(
                            l10n.shareQrCode,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      // ==================================================
                      // OLD LINK SHARE BUTTON
                      // ==================================================

                      /*
                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child:
                            OutlinedButton.icon(
                          onPressed:
                              shareIdentity,
                          icon: const Icon(
                            Icons.share,
                          ),
                          label: Text(
                            l10n.shareProfileLink,
                          ),
                        ),
                      ),
                      */
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
