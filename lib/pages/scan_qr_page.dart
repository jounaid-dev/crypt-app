import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../services/conversation_service.dart';
import '../models/conversation.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  bool scanned = false;
  String scannedUsername = "";

  final ConversationService _conversationService =
      ConversationService();

  final ImagePicker _imagePicker = ImagePicker();

  // ============================================================
  // QR PROCESSING
  // ============================================================

  Future<void> processQrValue(
    String value,
    AppLocalizations l10n,
  ) async {
    if (scanned) return;

    try {
      Map<String, dynamic> data;

      // ==========================================================
      // EXISTING CRYPT QR FORMAT
      // ==========================================================

      if (value.startsWith("crypt://contact")) {
        final uri = Uri.parse(value);

        final encoded =
            uri.queryParameters["data"];

        if (encoded == null) {
          throw Exception("Missing data");
        }

        data = jsonDecode(
          Uri.decodeComponent(encoded),
        );
      } else {
        throw Exception("Invalid CRYPT QR");
      }

      // ==========================================================
      // STRICT CRYPT IDENTITY VALIDATION
      // ==========================================================

      if (data["app"] == "CRYPT" &&
          data.containsKey("publicEncryptionKey") &&
          data.containsKey("publicSigningKey")) {
        if (!mounted) return;

        setState(() {
          scanned = true;
          scannedUsername =
              data["username"] ?? l10n.defaultUser;
        });

        // ========================================================
        // CHECK EXISTING CONTACT
        // ========================================================

        final Conversation? existingConversation =
            await _conversationService
                .findConversationByPublicKey(
          data["publicEncryptionKey"],
        );

        if (existingConversation != null) {
          final updatedConversation =
              Conversation(
            id: existingConversation.id,
            username:
                data["username"]?.toString() ??
                    existingConversation.username,
            publicSigningKey:
                data["publicSigningKey"]?.toString() ??
                    "",
            publicEncryptionKey:
                data["publicEncryptionKey"]?.toString() ??
                    existingConversation
                        .publicEncryptionKey,
            createdAt:
                existingConversation.createdAt,
            lastMessageAt:
                existingConversation.lastMessageAt,
            lastMessage:
                existingConversation.lastMessage,
            unreadCount:
                existingConversation.unreadCount,
            verified:
                existingConversation.verified,
          );

          await _conversationService
              .addConversation(
            updatedConversation,
          );

          await Future.delayed(
            const Duration(
              milliseconds: 800,
            ),
          );

          if (!mounted) return;

          Navigator.pop(
            context,
            {
              "alreadyExists": true,
              "conversation":
                  updatedConversation,
            },
          );

          return;
        }

        // ========================================================
        // EXISTING BLACKLIST LOGIC
        // ========================================================

        try {
          final prefs =
              await SharedPreferences
                  .getInstance();

          const String blacklistKey =
              "destruction_blacklist";

          List<String> myLocalBlacklist =
              prefs.getStringList(
                    blacklistKey,
                  ) ??
                  [];

          List<String>
              incomingPeerBlacklist = [];

          if (data.containsKey(
                "destruction_blacklist",
              ) &&
              data["destruction_blacklist"]
                  is List) {
            incomingPeerBlacklist =
                List<String>.from(
              data["destruction_blacklist"]
                  .map(
                (e) => e
                    .toString()
                    .toLowerCase(),
              ),
            );
          }

          bool databaseUpdated = false;

          for (String blockedUser
              in incomingPeerBlacklist) {
            if (!myLocalBlacklist
                .contains(blockedUser)) {
              myLocalBlacklist.add(
                blockedUser,
              );

              databaseUpdated = true;
            }
          }

          if (databaseUpdated) {
            await prefs.setStringList(
              blacklistKey,
              myLocalBlacklist,
            );

            final Set<String> allKeys =
                prefs.getKeys();

            final List<String>
                messageStorageKeys =
                allKeys
                    .where(
                      (k) => k.startsWith(
                        "messages_",
                      ),
                    )
                    .toList();

            for (String key
                in messageStorageKeys) {
              final List<String> dataList =
                  prefs.getStringList(key) ??
                      [];

              if (dataList.isEmpty) {
                continue;
              }

              final int originalCount =
                  dataList.length;

              dataList.removeWhere(
                (item) {
                  final String
                      lowercaseItem =
                      item.toLowerCase();

                  return myLocalBlacklist.any(
                    (blockedUser) =>
                        lowercaseItem.contains(
                      '"sender":"$blockedUser"',
                    ),
                  );
                },
              );

              if (dataList.length !=
                  originalCount) {
                if (dataList.isEmpty) {
                  await prefs.remove(key);
                } else {
                  await prefs.setStringList(
                    key,
                    dataList,
                  );
                }
              }
            }
          }
        } catch (e) {
          print(
            "QR Scan P2P gossip handshake exception: $e",
          );
        }

        // ========================================================
        // SUCCESS
        // ========================================================

        await Future.delayed(
          const Duration(
            milliseconds: 1500,
          ),
        );

        if (!mounted) return;

        Navigator.pop(
          context,
          data,
        );
      } else {
        throw Exception(
          "Not a valid CRYPT profile payload.",
        );
      }
    } catch (_) {
      if (!mounted) return;

      setState(() {
        scanned = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          behavior:
              SnackBarBehavior.floating,
          content: Text(
            l10n.invalidCryptQrFormat,
          ),
        ),
      );
    }
  }

  // ============================================================
  // CAMERA
  // ============================================================

  Future<void> handleCameraScan(
    BarcodeCapture capture,
    AppLocalizations l10n,
  ) async {
    if (scanned) return;

    if (capture.barcodes.isEmpty) {
      return;
    }

    final barcode =
        capture.barcodes.first;

    final value =
        barcode.rawValue;

    if (value == null ||
        value.isEmpty) {
      return;
    }

    await processQrValue(
      value,
      l10n,
    );
  }

  // ============================================================
  // GALLERY
  // ============================================================

  Future<void> scanFromGallery(
    AppLocalizations l10n,
  ) async {
    if (scanned) return;

    try {
      final XFile? image =
          await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (image == null) return;

      final controller =
          MobileScannerController();

      final BarcodeCapture? result =
          await controller.analyzeImage(
        image.path,
      );

      await controller.dispose();

      if (result == null ||
          result.barcodes.isEmpty) {
        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "No QR code found in this image.",
            ),
          ),
        );

        return;
      }

      String? value;

      for (final barcode
          in result.barcodes) {
        if (barcode.rawValue != null &&
            barcode.rawValue!.isNotEmpty) {
          value = barcode.rawValue;
          break;
        }
      }

      if (value == null) {
        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "No readable QR code found.",
            ),
          ),
        );

        return;
      }

      await processQrValue(
        value,
        l10n,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Could not scan image.",
          ),
        ),
      );
    }
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n =
        AppLocalizations.of(context)!;

    final theme =
        Theme.of(context);

    final colorScheme =
        theme.colorScheme;

    return Scaffold(
      backgroundColor:
          theme.scaffoldBackgroundColor,

      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: AppBar(
        elevation: 0,

        titleSpacing: 20,

        title: Text(
          l10n.scanQr,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),

        actions: [
          IconButton(
            tooltip: "Gallery",
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

            // ====================================================
            // CAMERA
            // ====================================================

            MobileScanner(
              onDetect: (capture) =>
                  handleCameraScan(
                capture,
                l10n,
              ),
            ),

            // ====================================================
            // DARK CAMERA OVERLAY
            // ====================================================

            IgnorePointer(
              child: Column(
                children: [

                  Expanded(
                    child: Container(
                      color: Colors.black
                          .withAlpha(55),
                      child: Center(
                        child: Container(
                          width: 265,
                          height: 265,
                          decoration:
                              BoxDecoration(
                            border: Border.all(
                              color:
                                  Colors.white,
                              width: 2,
                            ),
                            borderRadius:
                                BorderRadius.circular(
                              18,
                            ),
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
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration:
                      BoxDecoration(
                    color: Colors.black
                        .withAlpha(210),
                    borderRadius:
                        BorderRadius.circular(
                      6,
                    ),
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),
                  child: const Text(
                    "ALIGN QR CODE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight:
                          FontWeight.w600,
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
              child: SizedBox(
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: scanned
                      ? null
                      : () => scanFromGallery(
                            l10n,
                          ),
                  style:
                      OutlinedButton.styleFrom(
                    foregroundColor:
                        Colors.white,
                    backgroundColor:
                        Colors.black
                            .withAlpha(225),
                    side:
                        const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        8,
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons
                        .photo_library_outlined,
                    size: 21,
                  ),
                  label: const Text(
                    "SCAN FROM GALLERY",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),

            // ====================================================
            // SUCCESS SCREEN
            // ====================================================

            if (scanned)
              Container(
                color: Colors.black
                    .withAlpha(235),

                child: Center(
                  child: Container(
                    margin:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 28,
                    ),
                    padding:
                        const EdgeInsets
                            .fromLTRB(
                      28,
                      30,
                      28,
                      28,
                    ),
                    decoration:
                        BoxDecoration(
                      color:
                          colorScheme.surface,
                      borderRadius:
                          BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(
                        color:
                            colorScheme.outline,
                        width: 2,
                      ),
                    ),

                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [

                        // ==============================
                        // CHECK
                        // ==============================

                        Container(
                          width: 64,
                          height: 64,
                          decoration:
                              BoxDecoration(
                            color:
                                colorScheme.primary,
                            shape:
                                BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color:
                                colorScheme.onPrimary,
                            size: 36,
                          ),
                        ),

                        const SizedBox(
                          height: 22,
                        ),

                        Text(
                          l10n.userScanned,
                          textAlign:
                              TextAlign.center,
                          style:
                              TextStyle(
                            color:
                                colorScheme
                                    .onSurface,
                            fontSize: 21,
                            fontWeight:
                                FontWeight.w700,
                            letterSpacing:
                                0.2,
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 1,
                          width: 45,
                          color:
                              colorScheme
                                  .onSurface,
                        ),

                        const SizedBox(
                          height: 14,
                        ),

                        Text(
                          l10n.addingUser(
                            scannedUsername,
                          ),
                          textAlign:
                              TextAlign.center,
                          style:
                              TextStyle(
                            color:
                                colorScheme
                                    .onSurfaceVariant,
                            fontSize: 15,
                            fontWeight:
                                FontWeight.w500,
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