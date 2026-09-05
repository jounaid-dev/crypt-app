import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class AccountDestructionPage extends StatefulWidget {
  const AccountDestructionPage({super.key});

  @override
  State<AccountDestructionPage> createState() => _AccountDestructionPageState();
}

class _AccountDestructionPageState extends State<AccountDestructionPage> {
  final TextEditingController _verificationController = TextEditingController();
  final TextEditingController _passwordOverrideController = TextEditingController();
  
  String _generatedCode = "";
  bool _codeMatches = false;
  bool _showPasswordOverride = false;

  @override
  void initState() {
    super.initState();
    _generateRandomCode();
    _verificationController.addListener(_checkCodeMatch);
  }

  void _generateRandomCode() {
    _generatedCode = (Random().nextInt(90000) + 10000).toString(); // 5 random digits
  }

  void _checkCodeMatch() {
    setState(() {
      _codeMatches = _verificationController.text.trim() == _generatedCode;
      if (_verificationController.text.trim().length == 5 && !_codeMatches) {
        _showPasswordOverride = true; // Displays password override field if 5 digits entries mismatch
      }
    });
  }

  Future<void> _executeEmergencySignOut() async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.forceEscapeSignOutTitle),
        content: Text(l10n.forceEscapeSignOutContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true), 
            style: FilledButton.styleFrom(backgroundColor: Colors.red), 
            child: Text(l10n.wipeDevice),
          ),
        ],
      ),
    ) ?? false;

    if (!confirm) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
  }

  Future<void> _executeAccountWipe() async {
    final prefs = await SharedPreferences.getInstance();
    
    if (!_codeMatches && _showPasswordOverride) {
      final savedPassword = prefs.getString("account_password");
      if (_passwordOverrideController.text != savedPassword) {
        // WRONG PASSWORD PENALTY LOCKOUT INJECTS HERE
        final expiry = DateTime.now().millisecondsSinceEpoch + 600000;
        await prefs.setInt('settings_lockout_expiry', expiry);
        if (!mounted) return;
        Navigator.pop(context); // Boots them right off the widget branch back to home tree to start countdown
        return;
      }
    }

    final String? myUsername = prefs.getString("account_username");
    if (myUsername != null && myUsername.isNotEmpty) {
      // Write the self-destruct blueprint signature text string directly into local lists
      final List<String> blacklist = prefs.getStringList("destruction_blacklist") ?? [];
      if (!blacklist.contains(myUsername.toLowerCase())) {
        blacklist.add(myUsername.toLowerCase());
        await prefs.setStringList("destruction_blacklist", blacklist);
      }
    }

    // Nuke all SharedPreferences cache containers entirely on this smartphone
    await prefs.clear();

    if (!mounted) return;
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
  }

  @override
  void dispose() {
    _verificationController.dispose();
    _passwordOverrideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF2A0808),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Icon(Icons.report_problem_rounded, size: 80, color: Colors.redAccent),
                const SizedBox(height: 16),
                Text(
                  l10n.accountDestructionAlertTitle, 
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.accountDestructionWarning,
                  textAlign: TextAlign.center, 
                  style: const TextStyle(color: Colors.red, height: 1.4),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.accountDestructionCriticalNotice,
                  textAlign: TextAlign.center, 
                  style: const TextStyle(color: Colors.orangeAccent, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                Text(
                  l10n.verificationSecurityKey(_generatedCode), 
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _verificationController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: l10n.copyDigitsHint, 
                    border: const OutlineInputBorder(),
                  ),
                ),
                if (_showPasswordOverride) ...[
                  const SizedBox(height: 20),
                  Text(
                    l10n.codeMismatchNotice, 
                    textAlign: TextAlign.center, 
                    style: const TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordOverrideController, 
                    obscureText: true, 
                    textAlign: TextAlign.center, 
                    decoration: InputDecoration(
                      labelText: l10n.accountPasswordLabel, 
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: (_codeMatches || (_showPasswordOverride && _passwordOverrideController.text.isNotEmpty)) ? _executeAccountWipe : null,
                    style: FilledButton.styleFrom(backgroundColor: Colors.red, disabledBackgroundColor: Colors.white10),
                    child: Text(l10n.deleteEverythingPermanently),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _executeEmergencySignOut, 
                  child: Text(
                    l10n.escapeAndPurgeDeviceData, 
                    style: const TextStyle(color: Colors.redAccent),
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