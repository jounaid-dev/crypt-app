import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/account_service.dart';
import '../pages/signup_page.dart';

class MyIdentityPage extends StatefulWidget {
  const MyIdentityPage({super.key});

  @override
  State<MyIdentityPage> createState() => _MyIdentityPageState();
}

class _MyIdentityPageState extends State<MyIdentityPage> {
  final AccountService _accountService = AccountService();

  static const String _qrProofKey = "active_qr_proof";
  static const String _qrProofCreatedAtKey =
      "active_qr_proof_created_at";

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
  // ============================================================

  String generateQrProof() {
    final random = Random.secure();

    final bytes = List<int>.generate(
      32,
      (_) => random.nextInt(256),
    );

    return base64UrlEncode(bytes).replaceAll("=", "");
  }

  // ============================================================
  // SAVE ACTIVE QR PROOF
  // ============================================================

  Future<void> saveQrProof(String proof) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      _qrProofKey,
      proof,
    );

    await prefs.setInt(
      _qrProofCreatedAtKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  // ============================================================
  // LOAD IDENTITY
  // ============================================================

  Future<void> loadIdentity() async {
    final account =
        await _accountService.getAccount();

    if (account == null) {
      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const SignupPage(),
        ),
        (route) => false,
      );

      return;
    }

    username =
        account["username"] ?? "";

    publicEncryptionKey =
        account["publicKey"] ?? "";

    publicSigningKey =
        account["publicSigningKey"] ?? "";

    // ==========================================================
    // GENERATE A FRESH QR PROOF
    // ==========================================================

    qrProof = generateQrProof();

    // ==========================================================
    // SAVE THE EXACT PROOF USED BY BOTH QR TYPES
    // ==========================================================

    await saveQrProof(qrProof);

    // ==========================================================
    // DEBUG
    // ==========================================================

    final methodEncryptionKey =
        await _accountService
            .getPublicEncryptionKey();

    print("");
    print("==================================================");
    print("             CRYPT IDENTITY DEBUG");
    print("==================================================");

    print("[ACCOUNT]");
    print("username:");
    print(username);

    print("");
    print("[ENCRYPTION KEY]");
    print("account[publicKey]:");
    print(publicEncryptionKey);

    print("");
    print("getPublicEncryptionKey():");
    print(methodEncryptionKey);

    print("");
    print(
      "Encryption keys MATCH: "
      "${publicEncryptionKey == methodEncryptionKey}",
    );

    print("");
    print("[SIGNING KEY]");
    print(publicSigningKey);

    print("");
    print("[QR PROOF]");
    print(qrProof);

    print("");
    print("[QR PAYLOAD]");
    print(qrData());

    print("");
    print("[INVITE LINK]");
    print(inviteLink());

    print("==================================================");
    print("");

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }

  // ============================================================
  // QR PAYLOAD
  // ============================================================

  String qrData() {
    return jsonEncode({
      "app": "CRYPT",
      "version": 2,
      "username": username,
      "publicEncryptionKey":
          publicEncryptionKey,
      "publicSigningKey":
          publicSigningKey,
      "qrProof": qrProof,
    });
  }

  // ============================================================
  // INVITE LINK
  // ============================================================

  String inviteLink() {
    final payload = {
      "app": "CRYPT",
      "version": 2,
      "username": username,
      "publicEncryptionKey":
          publicEncryptionKey,
      "publicSigningKey":
          publicSigningKey,
      "qrProof": qrProof,
    };

    final jsonPayload =
        jsonEncode(payload);

    return "crypt://contact?data=${Uri.encodeComponent(
      jsonPayload,
    )}";
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
      color: Colors.black,
      emptyColor: Colors.white,
    );
  }

  // ============================================================
  // SHARE QR CODE AS AN IMAGE
  // ============================================================

  Future<void> shareQrCode() async {
    try {
      // ========================================================
      // IMPORTANT:
      //
      // This is the SAME QR painter configuration used by the
      // QR displayed on the page.
      //
      // ========================================================

      final qrPainter =
          createQrPainter();

      final ByteData? byteData =
          await qrPainter.toImageData(
        1200,
        format:
            ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        throw Exception(
          "Could not generate QR image",
        );
      }

      final Uint8List imageBytes =
          byteData.buffer.asUint8List();

      await Share.shareXFiles(
        [
          XFile.fromData(
            imageBytes,
            name: "crypt_qr.png",
            mimeType: "image/png",
          ),
        ],
        subject: "CRYPT",
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Could not share QR code: $e",
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
    final l10n =
        AppLocalizations.of(context)!;

    await Share.share(
      l10n.addMeOnCrypt(
        inviteLink(),
      ),
      subject:
          l10n.myIdentity,
    );
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n =
        AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(l10n.myIdentity),
      ),
      body: SafeArea(
        child: loading
            ? const Center(
                child:
                    CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  48,
                ),
                child:
                    SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        child: Text(
                          username.isEmpty
                              ? "?"
                              : username[0]
                                  .toUpperCase(),
                          style:
                              const TextStyle(
                            fontSize: 30,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Text(
                        username,
                        style:
                            const TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Card(
                        color: Colors.white,
                        elevation: 8,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            24,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(
                            20,
                          ),
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
                              // ==================================================

                              SizedBox(
                                width: 200,
                                height: 200,
                                child: CustomPaint(
                                  painter:
                                      createQrPainter(),
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              Text(
                                l10n.scanToAddMe,
                                style:
                                    const TextStyle(
                                  color:
                                      Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      // ==================================================
                      // SHARE QR AS IMAGE
                      // ==================================================

                      SizedBox(
                        width:
                            double.infinity,
                        height: 50,
                        child:
                            OutlinedButton.icon(
                          onPressed:
                              shareQrCode,
                          icon: const Icon(
                            Icons.qr_code_2,
                          ),
                          label:
                              const Text(
                            "Share QR Code",
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