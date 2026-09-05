import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../services/account_service.dart';
import '../pages/signup_page.dart';

class MyIdentityPage extends StatefulWidget {
  const MyIdentityPage({super.key});

  @override
  State<MyIdentityPage> createState() => _MyIdentityPageState();
}

class _MyIdentityPageState extends State<MyIdentityPage> {
  final AccountService _accountService = AccountService();

  String username = "";
  String publicEncryptionKey = "";
  String publicSigningKey = "";

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadIdentity();
  }

  Future<void> loadIdentity() async {
    final account = await _accountService.getAccount();

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

    username = account["username"] ?? "";

    publicEncryptionKey =
        account["publicKey"] ?? "";

    publicSigningKey =
        account["publicSigningKey"] ?? "";

    // ============================================================
    // FULL IDENTITY DEBUG
    // ============================================================

    final methodEncryptionKey =
        await _accountService.getPublicEncryptionKey();

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
    print("[QR PAYLOAD]");
    print(jsonEncode({
      "app": "CRYPT",
      "version": 2,
      "username": username,
      "publicEncryptionKey": publicEncryptionKey,
      "publicSigningKey": publicSigningKey,
    }));

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

  String qrData() {
    return jsonEncode({
      "app": "CRYPT",
      "version": 2,
      "username": username,
      "publicEncryptionKey": publicEncryptionKey,
      "publicSigningKey": publicSigningKey,
    });
  }

  String inviteLink() {
    final payload = {
      "app": "CRYPT",
      "version": 2,
      "username": username,
      "publicEncryptionKey": publicEncryptionKey,
      "publicSigningKey": publicSigningKey,
    };

    return "crypt://contact?data=${Uri.encodeComponent(
      jsonEncode(payload),
    )}";
  }

  // ============================================================
  // SHARE QR CODE AS AN IMAGE
  // ============================================================

  Future<void> shareQrCode() async {
    try {
      final qrPainter = QrPainter(
        data: inviteLink(),
        version: QrVersions.auto,
        gapless: true,
        color: Colors.black,
        emptyColor: Colors.white,
      );

      final ByteData? byteData =
          await qrPainter.toImageData(
        1200,
        format: ui.ImageByteFormat.png,
      );

      if (byteData == null) {
        throw Exception("Could not generate QR image");
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

      ScaffoldMessenger.of(context).showSnackBar(
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
  // KEPT UNCHANGED FOR NOW
  // ============================================================

  Future<void> shareIdentity() async {
    final l10n =
        AppLocalizations.of(context)!;

    await Share.share(
      l10n.addMeOnCrypt(
        inviteLink(),
      ),
      subject: l10n.myIdentity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n =
        AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myIdentity),
      ),
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  48,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        child: Text(
                          username.isEmpty
                              ? "?"
                              : username[0]
                                  .toUpperCase(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

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
                              QrImageView(
                                data: inviteLink(),
                                version:
                                    QrVersions.auto,
                                size: 200,
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              Text(
                                l10n.scanToAddMe,
                                style:
                                    const TextStyle(
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
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed:
                              shareQrCode,
                          icon: const Icon(
                            Icons.qr_code_2,
                          ),
                          label: const Text(
                            "Share QR Code",
                          ),
                        ),
                      ),

                      // ==================================================
                      // OLD LINK SHARE BUTTON
                      // LEFT IN CODE BUT DISABLED
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