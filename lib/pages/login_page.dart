import 'dart:async';

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import '../services/account_service.dart';
import '../services/identity_service.dart';
import '../main.dart';
import 'signup_page.dart';
import '../services/session_service.dart';
import 'terms_and_conditions_page.dart';
import 'beta_intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final AccountService _accountService = AccountService();

  bool _loading = false;
  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _handleLogin() async {
    final l10n = AppLocalizations.of(context)!;

    final cleanUsername = _usernameController.text.trim();

    final cleanPassword = _passwordController.text.trim();

    if (cleanUsername.isEmpty || cleanPassword.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.pleaseFillAllFields)));
      return;
    }

    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.agreeTerms)),
      );
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final success = await _accountService.login(cleanUsername, cleanPassword);

      if (!mounted) return;

      if (success) {
        if (!mounted) return;

        final prefs = await SharedPreferences.getInstance();
        final betaAcknowledged =
            prefs.getBool('beta_intro_acknowledged') ?? false;

        if (!mounted) return;

        if (!betaAcknowledged) {
          final acknowledged = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => const BetaIntroPage()),
          );
          if (acknowledged != true || !mounted) return;
        }

        SessionService.instance.unlock(cleanPassword);

        // Start unlocking the private keys now, so the first chat opens
        // without pausing on a key derivation. Deliberately not awaited: the
        // user is already signed in at this point.
        unawaited(IdentityService.warmKeyCache(cleanPassword));

        CryptApp.restartStartup(context);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.wrongUsernameOrPassword)));
      }
    } on BannedAccountException catch (e) {
      // The server suspended this account. Say so instead of the generic
      // connection error, and do not sign the user in.
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.message),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.loginError(e.toString()))),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final String hintText = _passwordController.text.isEmpty
        ? l10n.enterMasterSecurityPassword
        : "";

    return Scaffold(
      appBar: AppBar(title: Text(l10n.login)),
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
                const Icon(Icons.lock_open, size: 80, color: Colors.blue),

                const SizedBox(height: 24),

                Text(
                  l10n.connectAnAccount,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                // USERNAME
                TextField(
                  controller: _usernameController,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    labelText: l10n.username,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  enabled: !_loading,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 20),

                // PASSWORD
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  autocorrect: false,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _handleLogin(),
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

                // PASSWORD HINT UNDER THE FIELD
                if (hintText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        hintText,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ),

                CheckboxListTile(
                  value: _agreedToTerms,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(l10n.agreeTerms),
                      TextButton(
                        onPressed: _loading
                            ? null
                            : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TermsAndConditionsPage(),
                                ),
                              ),
                        child: Text(l10n.termsAndConditions),
                      ),
                    ],
                  ),
                  onChanged: _loading
                      ? null
                      : (value) => setState(() {
                          _agreedToTerms = value ?? false;
                        }),
                ),

                const SizedBox(height: 24),

                // LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : _handleLogin,
                    child: _loading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(l10n.login, textAlign: TextAlign.center),
                  ),
                ),

                const SizedBox(height: 15),

                // SIGN UP
                TextButton(
                  onPressed: _loading
                      ? null
                      : () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupPage(),
                            ),
                          );
                        },
                  child: Text(l10n.dontHaveAnAccountSignUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
