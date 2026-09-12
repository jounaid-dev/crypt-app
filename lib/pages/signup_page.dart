import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

import '../services/identity_service.dart';
import '../services/account_service.dart';
import '../services/cloud_identity_service.dart';
import '../main.dart';
import '../services/session_service.dart';
import 'terms_and_conditions_page.dart';
import 'beta_intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final IdentityService _identityService = IdentityService();
  final AccountService _accountService = AccountService();
  final CloudIdentityService _cloudIdentityService = CloudIdentityService();

  bool _loading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {});
    });
  }

  bool _isPasswordStrong(String password) {
    if (password.length < 8) return false;
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    if (!password.contains(RegExp(r'[0-9]'))) return false;
    return true;
  }

  bool _isValidUsername(String username) {
    return RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(username);
  }

  Future<void> _handleSignup() async {
    final l10n = AppLocalizations.of(context)!;

    final chosenUsername = _usernameController.text.trim().replaceAll(
      RegExp(r'\s+'),
      '_',
    );

    final password = _passwordController.text.trim();

    if (chosenUsername.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.pleaseFillInAllFields)));
      return;
    }

    if (chosenUsername.length > 20) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.usernameExceedsLimit)));
      return;
    }

    if (!_isValidUsername(chosenUsername)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.invalidUsernameCharacters)));
      return;
    }

    if (!_isPasswordStrong(password)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.weakPasswordNotice)));
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      String uniqueUsername = chosenUsername;

      final exists = await _cloudIdentityService.usernameExists(chosenUsername);

      if (exists) {
        bool found = false;
        final random = Random();

        for (int i = 0; i < 100; i++) {
          final tag = (random.nextInt(9000) + 1000).toString();

          final candidate = "${chosenUsername}_$tag";

          final candidateExists = await _cloudIdentityService.usernameExists(
            candidate,
          );

          if (!candidateExists) {
            uniqueUsername = candidate;
            found = true;
            break;
          }
        }

        if (!found) {
          throw Exception(l10n.unableToGenerateUniqueUsername);
        }
      }

      final bundle = await _identityService.generateAndStoreIdentity(
        uniqueUsername,
        password,
      );

      final identity = bundle.identity;

      const uuid = Uuid();
      final publicId = uuid.v4();

      await _accountService.createAccount(
        username: uniqueUsername,
        password: password,
        publicKey: identity.publicEncryptionKey,
        publicSigningKey: identity.publicSigningKey,
        publicId: publicId,
        encryptedIdentity: bundle.encryptedIdentity,
        passwordSalt: bundle.passwordSalt,
      );

      if (!mounted) return;

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(l10n.accountCreated),
          content: Text(
            uniqueUsername == chosenUsername
                ? l10n.yourUsernameIs(uniqueUsername)
                : l10n.usernameTakenAssignedTag(chosenUsername, uniqueUsername),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.continueText),
            ),
          ],
        ),
      );

      if (!mounted) return;

      final agreed = await Navigator.push<bool>(
        context,
        MaterialPageRoute(builder: (_) => const TermsAndConditionsPage()),
      );

      if (agreed != true || !mounted) return;

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

      SessionService.instance.unlock(password);

      CryptApp.restartStartup(context);
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.failedToGenerateIdentity(l10n.connectionFailed)),
        ),
      );
    } finally {
      if (mounted && _loading) {
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
        ? l10n.keepPasswordSecureHint
        : "";

    return Scaffold(
      appBar: AppBar(title: Text(l10n.createAccount)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
              bottom: 48.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_person, size: 80, color: Colors.blue),

                const SizedBox(height: 24),

                Text(
                  l10n.welcomeToCrypt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  l10n.signupDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),

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

                const SizedBox(height: 32),

                // USERNAME
                TextField(
                  controller: _usernameController,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    labelText: l10n.username,
                    hintText: l10n.chooseAUsername,
                    helperText: l10n.usernameHelperText,
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
                  onSubmitted: (_) => _handleSignup(),
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

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : _handleSignup,
                    child: _loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : Text(l10n.signup, textAlign: TextAlign.center),
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
