import 'dart:async';

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';

import '../services/identity_service.dart';
import '../services/session_service.dart';

/// Asks for the master password on a cold start.
///
/// The app remembers that an account exists on this device, but the password
/// that unwraps the private keys only ever lived in memory. A restart therefore
/// left the app signed in and unable to decrypt anything: every stored message
/// sat on a spinner, and sending a message failed silently because the signing
/// key could not be unlocked. This screen restores the session before the chats
/// are shown, which is the actual fix for that. Nothing is stored to make it
/// work: the password is verified by unwrapping the keys, exactly as login does.
class UnlockPage extends StatefulWidget {
  const UnlockPage({super.key, required this.onUnlocked});

  final VoidCallback onUnlocked;

  @override
  State<UnlockPage> createState() => _UnlockPageState();
}

class _UnlockPageState extends State<UnlockPage> {
  final TextEditingController _passwordController = TextEditingController();

  final IdentityService _identityService = IdentityService();

  bool _loading = false;

  bool _obscurePassword = true;

  String? _error;

  @override
  void dispose() {
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> _unlock() async {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    final String password = _passwordController.text.trim();

    if (password.isEmpty) {
      setState(() {
        _error = l10n.pleaseFillAllFields;
      });

      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      // Both keys have to unwrap. The signing key is verified against the
      // stored public key, so a wrong password fails here rather than later,
      // in the middle of a chat.
      await _identityService.getSigningKeyPair(password);

      await _identityService.getEncryptionKeyPair(password);

      SessionService.instance.unlock(password);

      // Warm the cache for the first chat, exactly like login does.
      unawaited(IdentityService.warmKeyCache(password));

      if (!mounted) return;

      widget.onUnlocked();
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _error = l10n.wrongUsernameOrPassword;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 72, color: Colors.blue),

                const SizedBox(height: 22),

                Text(
                  l10n.unlockCrypt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  l10n.unlockCryptBody,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, height: 1.45),
                ),

                const SizedBox(height: 28),

                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  autofocus: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _unlock(),
                  enabled: !_loading,
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    errorText: _error,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.vpn_key_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : _unlock,
                    child: _loading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(l10n.unlock, textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
