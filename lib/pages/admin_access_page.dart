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

  /// The last failure, shown under the field.
  String? _error;

  /// True once the server has confirmed it is reachable, so a banner about a
  /// missing code is not shown on a flaky connection.
  bool _checkedServer = false;

  bool _codeConfigured = true;

  bool _lockedOut = false;

  @override
  void initState() {
    super.initState();

    _checkServerState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  /// Asks the server whether a code has been set at all.
  ///
  /// Without this the only feedback for "the code was never seeded" is five
  /// wrong attempts followed by a fifteen minute block, which reads exactly
  /// like a broken code.
  Future<void> _checkServerState() async {
    try {
      final AdminAccessState state = await AdminService.instance.accessState();

      if (!mounted) return;

      setState(() {
        _checkedServer = true;
        _codeConfigured = state.configured;
        _lockedOut = state.lockedOut;
      });
    } catch (_) {
      // The server could not be reached. Say nothing rather than guess.
      if (!mounted) return;

      setState(() {
        _checkedServer = true;
      });
    }
  }

  Future<void> _unlock() async {
    if (_busy) return;

    final code = _codeController.text.trim();

    if (code.isEmpty) return;

    setState(() {
      _busy = true;
      _error = null;
    });

    AdminUnlockResult result;

    try {
      result = await AdminService.instance.unlockWithCode(code);
    } catch (e) {
      // A transport or permission error used to be reported as a wrong code,
      // which sent people looking for a typo in a code that was fine.
      result = AdminUnlockResult.failed(
        'Check your connection and try again.',
      );

      debugPrint("[Admin] unlock failed: $e");
    }

    if (!mounted) return;

    if (result.isSuccess) {
      AccountFlagsService.instance.invalidate();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Admin access granted.'),
        ),
      );

      Navigator.pop(context, true);

      return;
    }

    setState(() {
      _busy = false;
      _error = result.message;
      _lockedOut = result.status == 'locked_out';
    });
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
              'The code is checked on the server, not in the app.',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            // Shown only when the server has confirmed the state, so a slow or
            // unreachable server does not claim the code is missing.
            if (_checkedServer && !_codeConfigured) ...[
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.amber.withValues(alpha: 0.35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 18,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'No admin code is set on the server yet',
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'This is a one-time setup, not something wrong with '
                      'your code. Run supabase/seed_admin.sql in the Supabase '
                      'SQL editor, replace the placeholder with your code, and '
                      'the panel will unlock here.',
                      style: TextStyle(fontSize: 12, height: 1.35),
                    ),
                  ],
                ),
              ),
            ],

            if (_lockedOut) ...[
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.amber.withValues(alpha: 0.35),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      size: 18,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'The code is blocked for 15 minutes after too many '
                        'wrong attempts. It works again after that.',
                        style: TextStyle(fontSize: 12, height: 1.35),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            TextField(
              controller: _codeController,
              autofocus: true,
              obscureText: true,
              enabled: !_busy,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => _unlock,
              decoration: InputDecoration(
                labelText: 'Access code',
                errorText: _error,
                errorMaxLines: 4,
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

            const SizedBox(height: 12),

            TextButton(
              onPressed: _busy ? null : _checkServerState,
              child: const Text('Check the code setup again'),
            ),
          ],
        ),
      ),
    );
  }
}
