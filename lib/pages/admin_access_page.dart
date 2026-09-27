import 'package:flutter/material.dart';

import '../services/account_flags_service.dart';
import '../services/admin_service.dart';

/// Where an administrator types their access code.
///
/// The code is checked by the server, never stored in the app, so unpacking
/// the APK does not reveal it. On success the account is promoted and the
/// admin panel opens.
class AdminAccessPage extends StatefulWidget {
  const AdminAccessPage({super.key});

  @override
  State<AdminAccessPage> createState() => _AdminAccessPageState();
}

class _AdminAccessPageState extends State<AdminAccessPage> {
  final TextEditingController _codeController = TextEditingController();

  bool _busy = false;
  bool _rejected = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _unlock() async {
    if (_busy) return;

    final code = _codeController.text.trim();

    if (code.isEmpty) return;

    setState(() {
      _busy = true;
      _rejected = false;
    });

    bool ok = false;

    try {
      ok = await AdminService.instance.unlockWithCode(code);
    } catch (_) {
      ok = false;
    }

    if (!mounted) return;

    setState(() {
      _busy = false;
      _rejected = !ok;
    });

    if (ok) {
      AccountFlagsService.instance.invalidate();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Admin access granted.'),
        ),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Admin access')),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
          children: [
            const Icon(Icons.shield_outlined, size: 48),

            const SizedBox(height: 16),

            Text(
              'Enter the admin access code',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'The code is checked on the server, not in the app. After five '
              'wrong attempts the code is blocked for fifteen minutes.',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            TextField(
              controller: _codeController,
              autofocus: true,
              obscureText: true,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => _unlock,
              decoration: InputDecoration(
                labelText: 'Access code',
                errorText: _rejected ? 'Wrong code.' : null,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            FilledButton(
              onPressed: _busy ? null : _unlock,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: _busy
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Unlock admin panel'),
            ),
          ],
        ),
      ),
    );
  }
}
