import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crypt_messenger/l10n/app_localizations.dart';

class ChatLockService {
  // ============================================================
  // SECURITY PARAMETERS
  // ============================================================

  static const int _maxAttempts = 5;

  static const List<int> _lockoutMinutes = [
    60,
    75,
    90,
  ];

  // Same security level as the PBKDF2 configuration
  // already used elsewhere in CRYPT.
  static const int _pbkdf2Iterations = 310000;
  static const int _derivedKeyBits = 256;

  static const int _saltLength = 32;

  final Pbkdf2 _pbkdf2 = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: _pbkdf2Iterations,
    bits: _derivedKeyBits,
  );

  // ============================================================
  // STORAGE KEYS
  // ============================================================

  String _passcodeHashKey(
    String conversationId,
  ) =>
      'chat_passcode_hash_$conversationId';

  String _passcodeSaltKey(
    String conversationId,
  ) =>
      'chat_passcode_salt_$conversationId';

  // Legacy plaintext key.
  //
  // This is ONLY used to migrate old installations.
  // New passcodes are NEVER stored here.
  String _legacyPasscodeKey(
    String conversationId,
  ) =>
      'chat_passcode_$conversationId';

  String _attemptsKey(
    String conversationId,
  ) =>
      'lock_attempts_$conversationId';

  String _expiryKey(
    String conversationId,
  ) =>
      'lock_expiry_$conversationId';

  String _tierKey(
    String conversationId,
  ) =>
      'escalation_tier_$conversationId';

  String _lockedKey(
    String conversationId,
  ) =>
      'chat_locked_$conversationId';

  // ============================================================
  // RANDOM SALT
  // ============================================================

  List<int> _generateSalt() {
    final random = Random.secure();

    return List<int>.generate(
      _saltLength,
      (_) => random.nextInt(256),
    );
  }

  // ============================================================
  // DERIVE PASSCODE HASH
  // ============================================================

  Future<String> _deriveHash({
    required String passcode,
    required List<int> salt,
  }) async {
    final secretKey =
        await _pbkdf2.deriveKeyFromPassword(
      password: passcode,
      nonce: salt,
    );

    final hashBytes =
        await secretKey.extractBytes();

    return base64UrlEncode(hashBytes);
  }

  // ============================================================
  // CONSTANT-TIME STRING COMPARISON
  // ============================================================

  bool _secureCompare(
    String a,
    String b,
  ) {
    final aBytes = utf8.encode(a);
    final bBytes = utf8.encode(b);

    if (aBytes.length != bBytes.length) {
      return false;
    }

    int difference = 0;

    for (int i = 0; i < aBytes.length; i++) {
      difference |=
          aBytes[i] ^ bBytes[i];
    }

    return difference == 0;
  }

  // ============================================================
  // VERIFY PASSCODE AGAINST STORED HASH
  // ============================================================

  Future<bool> _verifyStoredHash({
    required String passcode,
    required String storedHash,
    required String storedSalt,
  }) async {
    try {
      final salt =
          base64Url.decode(storedSalt);

      final calculatedHash =
          await _deriveHash(
        passcode: passcode,
        salt: salt,
      );

      return _secureCompare(
        calculatedHash,
        storedHash,
      );
    } catch (_) {
      return false;
    }
  }

  // ============================================================
  // CHECK WHETHER A PASSCODE IS CONFIGURED
  // ============================================================

  Future<bool> _hasPasscode(
    SharedPreferences prefs,
    String conversationId,
  ) async {
    final hash =
        prefs.getString(
      _passcodeHashKey(conversationId),
    );

    final salt =
        prefs.getString(
      _passcodeSaltKey(conversationId),
    );

    // Secure format.
    if (hash != null &&
        hash.isNotEmpty &&
        salt != null &&
        salt.isNotEmpty) {
      return true;
    }

    // Legacy format.
    final legacy =
        prefs.getString(
      _legacyPasscodeKey(conversationId),
    );

    return legacy != null &&
        legacy.isNotEmpty;
  }

  // ============================================================
  // CHECK WHETHER CHAT IS LOCKED
  // ============================================================

  Future<bool> isLocked(
    String conversationId,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    final hasPasscode =
        await _hasPasscode(
      prefs,
      conversationId,
    );

    if (!hasPasscode) {
      return false;
    }

    final expiry =
        prefs.getInt(
      _expiryKey(conversationId),
    );

    if (expiry != null) {
      final now =
          DateTime.now()
              .millisecondsSinceEpoch;

      if (now < expiry) {
        return true;
      }

      // Lockout expired.
      await prefs.remove(
        _expiryKey(conversationId),
      );

      await prefs.remove(
        _attemptsKey(conversationId),
      );
    }

    // This means the conversation is
    // protected by a passcode.
    return prefs.getBool(
          _lockedKey(conversationId),
        ) ??
        true;
  }

  // ============================================================
  // MIGRATE OLD PLAINTEXT PASSCODE
  // ============================================================

  Future<bool> _verifyLegacyAndMigrate({
    required SharedPreferences prefs,
    required String conversationId,
    required String enteredPasscode,
  }) async {
    final legacyPasscode =
        prefs.getString(
      _legacyPasscodeKey(conversationId),
    );

    if (legacyPasscode == null ||
        legacyPasscode.isEmpty) {
      return false;
    }

    final matches =
        _secureCompare(
      enteredPasscode,
      legacyPasscode,
    );

    if (!matches) {
      return false;
    }

    // Generate new secure salt.
    final salt = _generateSalt();

    // Derive secure hash.
    final hash =
        await _deriveHash(
      passcode: enteredPasscode,
      salt: salt,
    );

    // Store secure credentials.
    await prefs.setString(
      _passcodeHashKey(conversationId),
      hash,
    );

    await prefs.setString(
      _passcodeSaltKey(conversationId),
      base64UrlEncode(salt),
    );

    // CRITICAL:
    // Delete the old plaintext passcode.
    await prefs.remove(
      _legacyPasscodeKey(conversationId),
    );

    return true;
  }

  // ============================================================
  // VERIFY ACCESS
  // ============================================================

  Future<bool> verifyAccess({
    required BuildContext context,
    required String conversationId,
    required String chatUsername,
  }) async {
    final prefs =
        await SharedPreferences.getInstance();

    final hasPasscode =
        await _hasPasscode(
      prefs,
      conversationId,
    );

    // No chat lock configured.
    if (!hasPasscode) {
      return true;
    }

    // ----------------------------------------------------------
    // CHECK ACTIVE LOCKOUT
    // ----------------------------------------------------------

    final expiry =
        prefs.getInt(
      _expiryKey(conversationId),
    );

    if (expiry != null) {
      final now =
          DateTime.now()
              .millisecondsSinceEpoch;

      if (now < expiry) {
        final remainingMinutes =
            ((expiry - now) / 60000)
                .ceil();

        if (!context.mounted) {
          return false;
        }

        final l10n =
            AppLocalizations.of(context)!;

        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return AlertDialog(
              title: Text(
                l10n.securityLockoutActive,
              ),
              content: Text(
                l10n.tooManyAttemptsFrozen(
                  remainingMinutes,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      dialogContext,
                    ).pop();
                  },
                  child: Text(
                    l10n.acknowledge,
                  ),
                ),
              ],
            );
          },
        );

        return false;
      }

      // Lockout expired.
      await prefs.remove(
        _expiryKey(conversationId),
      );

      await prefs.remove(
        _attemptsKey(conversationId),
      );
    }

    // ----------------------------------------------------------
    // CURRENT SECURITY STATE
    // ----------------------------------------------------------

    int attempts =
        prefs.getInt(
      _attemptsKey(conversationId),
    ) ??
        0;

    int tier =
        prefs.getInt(
      _tierKey(conversationId),
    ) ??
        0;

    while (true) {
      final remaining =
          _maxAttempts - attempts;

      // --------------------------------------------------------
      // TOO MANY ATTEMPTS
      // --------------------------------------------------------

      if (remaining <= 0) {
        final penaltyMinutes =
            _lockoutMinutes[
              tier %
                  _lockoutMinutes.length
            ];

        final expiryTimestamp =
            DateTime.now()
                    .millisecondsSinceEpoch +
                (penaltyMinutes * 60000);

        final nextTier =
            tier + 1;

        await prefs.setInt(
          _expiryKey(conversationId),
          expiryTimestamp,
        );

        await prefs.setInt(
          _tierKey(conversationId),
          nextTier,
        );

        await prefs.setInt(
          _attemptsKey(conversationId),
          0,
        );

        await prefs.setBool(
          _lockedKey(conversationId),
          true,
        );

        if (!context.mounted) {
          return false;
        }

        final l10n =
            AppLocalizations.of(context)!;

        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return AlertDialog(
              title: Text(
                l10n.accessBlocked,
              ),
              content: Text(
                l10n.accessSuspended(
                  penaltyMinutes,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      dialogContext,
                    ).pop();
                  },
                  child: Text(
                    l10n.ok,
                  ),
                ),
              ],
            );
          },
        );

        return false;
      }

      // --------------------------------------------------------
      // PASSCODE DIALOG
      // --------------------------------------------------------

      final controller =
          TextEditingController();

      final l10n =
          AppLocalizations.of(context)!;

      final result =
          await showDialog<String?>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(
              l10n.unlockSecureNode(
                chatUsername,
              ),
            ),
            content: Column(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Text(
                  l10n
                      .verificationMetricsRemaining(
                    remaining,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller:
                      controller,
                  obscureText: true,
                  keyboardType:
                      TextInputType.number,
                  autofocus: true,
                  decoration:
                      InputDecoration(
                    labelText:
                        l10n.secureKeyPasscode,
                    border:
                        const OutlineInputBorder(),
                  ),
                ),
                if (remaining == 1) ...[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    l10n.warningHardwareLockout,
                    style:
                        const TextStyle(
                      color: Colors.red,
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(
                    dialogContext,
                  ).pop(null);
                },
                child: Text(
                  l10n.cancel,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    dialogContext,
                  ).pop(
                    controller.text,
                  );
                },
                child: Text(
                  l10n.ok,
                ),
              ),
            ],
          );
        },
      );

      controller.dispose();

      // User cancelled.
      if (result == null) {
        return false;
      }

      final enteredPasscode =
          result;

      // --------------------------------------------------------
      // VERIFY SECURE HASH
      // --------------------------------------------------------

      final storedHash =
          prefs.getString(
        _passcodeHashKey(
          conversationId,
        ),
      );

      final storedSalt =
          prefs.getString(
        _passcodeSaltKey(
          conversationId,
        ),
      );

      bool authenticated = false;

      if (storedHash != null &&
          storedSalt != null) {
        authenticated =
            await _verifyStoredHash(
          passcode: enteredPasscode,
          storedHash: storedHash,
          storedSalt: storedSalt,
        );
      } else {
        // ------------------------------------------------------
        // LEGACY MIGRATION
        // ------------------------------------------------------

        authenticated =
            await _verifyLegacyAndMigrate(
          prefs: prefs,
          conversationId:
              conversationId,
          enteredPasscode:
              enteredPasscode,
        );
      }

      // --------------------------------------------------------
      // CORRECT PASSCODE
      // --------------------------------------------------------

      if (authenticated) {
        await prefs.remove(
          _attemptsKey(conversationId),
        );

        await prefs.remove(
          _expiryKey(conversationId),
        );

        await prefs.remove(
          _tierKey(conversationId),
        );

        await prefs.setBool(
          _lockedKey(conversationId),
          true,
        );

        return true;
      }

      // --------------------------------------------------------
      // WRONG PASSCODE
      // --------------------------------------------------------

      attempts++;

      await prefs.setInt(
        _attemptsKey(conversationId),
        attempts,
      );

      if (!context.mounted) {
        return false;
      }

      if (attempts < _maxAttempts) {
        final remainingAfterFailure =
            _maxAttempts - attempts;

        await showDialog<void>(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: Text(
                l10n.accessBlocked,
              ),
              content: Text(
                l10n.verificationMetricsRemaining(
                  remainingAfterFailure,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      dialogContext,
                    ).pop();
                  },
                  child: Text(
                    l10n.ok,
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  // ============================================================
  // ENABLE / CHANGE CHAT LOCK
  // ============================================================

  Future<void> setPasscode({
    required String conversationId,
    required String passcode,
  }) async {
    if (passcode.isEmpty) {
      throw ArgumentError(
        'Passcode cannot be empty.',
      );
    }

    final prefs =
        await SharedPreferences.getInstance();

    // Generate a completely new salt.
    final salt = _generateSalt();

    // Derive the secure hash.
    final hash =
        await _deriveHash(
      passcode: passcode,
      salt: salt,
    );

    // Store ONLY hash + salt.
    await prefs.setString(
      _passcodeHashKey(conversationId),
      hash,
    );

    await prefs.setString(
      _passcodeSaltKey(conversationId),
      base64UrlEncode(salt),
    );

    // Remove any old plaintext version.
    await prefs.remove(
      _legacyPasscodeKey(conversationId),
    );

    await prefs.setBool(
      _lockedKey(conversationId),
      true,
    );

    // Reset security state.
    await prefs.remove(
      _attemptsKey(conversationId),
    );

    await prefs.remove(
      _expiryKey(conversationId),
    );

    await prefs.remove(
      _tierKey(conversationId),
    );
  }

  // ============================================================
  // REMOVE CHAT LOCK
  // ============================================================

  Future<void> removePasscode(
    String conversationId,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove(
      _passcodeHashKey(conversationId),
    );

    await prefs.remove(
      _passcodeSaltKey(conversationId),
    );

    // Also remove legacy plaintext if it exists.
    await prefs.remove(
      _legacyPasscodeKey(conversationId),
    );

    await prefs.remove(
      _attemptsKey(conversationId),
    );

    await prefs.remove(
      _expiryKey(conversationId),
    );

    await prefs.remove(
      _tierKey(conversationId),
    );

    await prefs.remove(
      _lockedKey(conversationId),
    );
  }
}