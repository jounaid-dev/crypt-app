import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';

import '../main.dart';
import '../services/account_service.dart';
import '../services/identity_service.dart';
import '../services/session_service.dart';

/// Asks for the master password when the one remembered from last session is
/// gone.
///
/// A returning user normally goes straight to HomePage because
/// [SessionService] keeps the password in the OS keystore. That copy can
/// disappear while the account itself stays on the device: a backup restored
/// onto another phone, a keystore reset, or a device where the keystore write
/// failed. HomePage without a password can only fail to decrypt stored
/// messages and cannot sign a new one, so the password is asked for here
/// instead of showing a chat list that cannot work.
class UnlockPage extends StatefulWidget {
  const UnlockPage({super.key});

  @override
  State<UnlockPage> createState() => _UnlockPageState();
}

class _UnlockPageState extends State<UnlockPage> {
  final TextEditingController _passwordController = TextEditingController();

  final AccountService _accountService = AccountService();

  final IdentityService _identityService = IdentityService();

  String _username = "";

  bool _loading = false;

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final username = await _accountService.getUsername();

    if (!mounted || username == null) return;

    setState(() {
      _username = username;
    });
  }

  // ============================================================
  // UNLOCK
  // ============================================================

  Future<void> _unlock() async {
    final l10n = AppLocalizations.of(context)!;

    // The same trimming the login screen applies, so a password typed with a
    // trailing space still unlocks.
    final password = _passwordController.text.trim();

    if (password.isEmpty || _loading) {
      return;
    }

    setState(() {
      _loading = true;
    });

    String? username;

    try {
      username = await _identityService.unlockAndIdentify(password);
    } catch (_) {
      username = null;
    }

    if (!mounted) return;

    if (username == null) {
      setState(() {
        _loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.falsePassword)),
      );

      return;
    }

    // The correct password is known again, so store it for the next cold
    // start. Awaiting the write means the very next launch can restore it.
    await SessionService.instance.remember(password);

    if (!mounted) return;

    CryptApp.restartStartup(context);
  }

  // ============================================================
  // SIGN OUT
  //
  // The escape hatch when the password is genuinely lost, or when the local
  // identity is unusable. Without it this screen would be a dead end.
  // ============================================================

  Future<void> _signOut() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    await _accountService.logout();

    SessionService.instance.lock();

    if (!mounted) return;

    CryptApp.restartStartup(context);
  }

  @override
  void dispose() {
    _passwordController.dispose();

    super.dispose();
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _username.isEmpty
              ? l10n.password
              : l10n.unlockSecureNode(_username),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
              top: 25.0,
              bottom: 48.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 80,
                  color: Colors.blue,
                ),

                const SizedBox(height: 24),

                Text(
                  l10n.enterMasterSecurityPassword,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  autocorrect: false,
                  enableSuggestions: false,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _unlock(),
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
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
                  enabled: !_loading,
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
                        : Text(
                            l10n.continueText,
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: _loading ? null : _signOut,
                  child: Text(l10n.logout),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
