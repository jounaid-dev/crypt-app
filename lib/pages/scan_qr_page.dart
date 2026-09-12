import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrscan_plus/qrscan_plus.dart' as qrscanner;

import '../services/account_service.dart';
import '../services/conversation_id_service.dart';
import '../services/conversation_service.dart';
import '../services/signaling_service.dart';
import '../models/conversation.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  bool scanned = false;
  String scannedUsername = "";

  final AccountService _accountService = AccountService();

  final ConversationService _conversationService = ConversationService();

  final SignalingService _signalingService = SignalingService.instance;

  bool _isValidBase64Key(String value, int expectedLength) {
    try {
      final decoded = base64Decode(value);
      return decoded.length == expectedLength;
    } on FormatException {
      return false;
    }
  }

  bool _isValidQrProof(String value) {
    if (value.length != 43 || !RegExp(r'^[A-Za-z0-9_-]+$').hasMatch(value)) {
      return false;
    }

    try {
      final decoded = base64Url.decode(value);
      return decoded.length == 32 &&
          base64UrlEncode(decoded).replaceAll('=', '') == value;
    } on FormatException {
      return false;
    }
  }

  bool _isValidCryptPayload(Map<String, dynamic> data) {
    if (data['app'] != 'CRYPT' || data['version'] != 2) {
      return false;
    }

    final username = data['username'];
    final encryptionKey = data['publicEncryptionKey'];
    final signingKey = data['publicSigningKey'];
    final proof = data['qrProof'];

    if (username is! String ||
        encryptionKey is! String ||
        signingKey is! String ||
        proof is! String ||
        username.trim().isEmpty ||
        encryptionKey.isEmpty ||
        signingKey.isEmpty) {
      return false;
    }

    return _isValidBase64Key(encryptionKey, 32) &&
        _isValidBase64Key(signingKey, 32) &&
        _isValidQrProof(proof);
  }

  // ============================================================
  // QR PROCESSING
  // ============================================================

  Future<void> processQrValue(String value, AppLocalizations l10n) async {
    if (scanned) return;

    try {
      Map<String, dynamic> data;

      // ==========================================================
      // CRYPT QR FORMAT
      // ==========================================================

      if (value.startsWith("crypt://contact")) {
        final uri = Uri.parse(value);

        if (uri.scheme != 'crypt' ||
            uri.host != 'contact' ||
            uri.path.isNotEmpty) {
          throw Exception("Invalid CRYPT QR");
        }

        final encoded = uri.queryParameters["data"];

        if (encoded == null) {
          throw Exception("Missing data");
        }

        final decoded = jsonDecode(encoded);

        if (decoded is! Map) {
          throw Exception("Invalid CRYPT QR");
        }

        data = Map<String, dynamic>.from(decoded);
      } else {
        throw Exception("Invalid CRYPT QR");
      }

      // ==========================================================
      // STRICT CRYPT IDENTITY VALIDATION
      // ==========================================================

      if (_isValidCryptPayload(data)) {
        if (!mounted) return;

        // ========================================================
        // PEER IDENTITY
        // ========================================================

        final String peerUsername =
            data["username"]?.toString() ?? l10n.defaultUser;

        final String peerEncryptionKey = data["publicEncryptionKey"] as String;

        final String peerSigningKey = data["publicSigningKey"] as String;

        if (peerUsername.trim().isEmpty ||
            peerEncryptionKey.trim().isEmpty ||
            peerSigningKey.trim().isEmpty) {
          throw Exception("Incomplete CRYPT identity.");
        }

        // ========================================================
        // QR PROOF
        // ========================================================

        final String? qrProof = data["qrProof"] as String?;

        if (qrProof == null || qrProof.isEmpty) {
          throw Exception("QR code does not contain a proof.");
        }

        // ========================================================
        // LOAD MY IDENTITY
        // ========================================================

        final String? myUsername = await _accountService.getUsername();

        final String? myEncryptionKey = await _accountService
            .getPublicEncryptionKey();

        final String? mySigningKey = await _accountService
            .getPublicSigningKey();

        if (myUsername == null || myUsername.trim().isEmpty) {
          throw Exception("Local username is missing.");
        }

        if (myEncryptionKey == null || myEncryptionKey.trim().isEmpty) {
          throw Exception(l10n.localEncryptionKeyMissing);
        }

        if (mySigningKey == null || mySigningKey.trim().isEmpty) {
          throw Exception("Local signing key is missing.");
        }

        // ========================================================
        // PREVENT SELF
        // ========================================================

        if (myUsername == peerUsername ||
            myEncryptionKey == peerEncryptionKey) {
          throw Exception("Cannot add yourself.");
        }

        // ========================================================
        // CONVERSATION ID
        // ========================================================

        final String conversationId = ConversationIdService.generate(
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

        final Conversation? existingConversation = await _conversationService
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

          await _conversationService.updateConversation(updatedConversation);

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

            debugPrint(
              "[QR] Conversation request sent "
              "from $myUsername to $peerUsername.",
            );
          } else {
            debugPrint("[QR] Signaling server is not connected.");
          }

          await Future.delayed(const Duration(milliseconds: 800));

          if (!mounted) return;

          Navigator.pop(context, {
            "alreadyExists": true,
            "conversation": updatedConversation,
            "qrData": data,
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

        await _conversationService.addConversation(conversation);

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

          debugPrint(
            "[QR] Conversation request sent "
            "from $myUsername to $peerUsername.",
          );
        } else {
          debugPrint("[QR] Signaling server is not connected.");
        }

        // ========================================================
        // SUCCESS
        // ========================================================

        await Future.delayed(const Duration(milliseconds: 1500));

        if (!mounted) return;

        Navigator.pop(context, {
          "alreadyExists": false,
          "conversation": conversation,
          "qrData": data,
        });
      } else {
        throw Exception("Not a valid CRYPT profile payload.");
      }
    } catch (e) {
      debugPrint("[QR] Processing error: $e");

      if (!mounted) return;

      setState(() {
        scanned = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(l10n.invalidCryptQrFormat),
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

  Future<void> scanFromGallery(AppLocalizations l10n) async {
    if (scanned) return;

    try {
      // ==========================================================
      // USE A DEDICATED GALLERY QR DECODER
      // ==========================================================

      final String result = await qrscanner.scanPhoto();

      if (result.trim().isEmpty) {
        if (!mounted) return;

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.noQrCodeFound)));

        return;
      }

      debugPrint("[QR] Gallery QR detected.");

      // ==========================================================
      // SAME CRYPT PROCESSING AS CAMERA
      // ==========================================================

      await processQrValue(result, l10n);
    } catch (e) {
      debugPrint("[QR] Gallery scan error: $e");

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.couldNotScanImage)));
    }
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
          IconButton(
            tooltip: l10n.gallery,
            onPressed: scanned ? null : () => scanFromGallery(l10n),
            icon: const Icon(Icons.photo_library_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            // ====================================================
            // LIVE CAMERA
            // ====================================================
            MobileScanner(
              onDetect: (capture) => handleCameraScan(capture, l10n),
            ),

            // ====================================================
            // CAMERA OVERLAY
            // ====================================================
            IgnorePointer(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withAlpha(55),
                      child: Center(
                        child: Container(
                          width: 265,
                          height: 265,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ====================================================
            // TOP INSTRUCTION
            // ====================================================
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
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    l10n.alignQrCode,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.6,
                    ),
                  ),
                ),
              ),
            ),

            // ====================================================
            // GALLERY BUTTON
            // ====================================================
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: OutlinedButton.icon(
                onPressed: scanned ? null : () => scanFromGallery(l10n),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black.withAlpha(225),
                  side: const BorderSide(color: Colors.white, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.photo_library_outlined, size: 21),
                label: Text(
                  l10n.scanFromGallery,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            // ====================================================
            // SUCCESS SCREEN
            // ====================================================
            if (scanned)
              Container(
                color: Colors.black.withAlpha(235),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 28),
                    padding: const EdgeInsets.fromLTRB(28, 30, 28, 28),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorScheme.outline, width: 2),
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
