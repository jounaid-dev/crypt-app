import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Asks for a four digit PIN and returns it, or null if cancelled.
///
/// Self contained on purpose: it owns the [TextEditingController] and the
/// validation message and disposes both in its own [dispose]. Building this by
/// hand with a `StatefulBuilder` and disposing the controller as soon as
/// `showDialog` returned left the text field attached to a disposed controller
/// while the dismissed dialog was still animating out. That is what produced
/// the `dependents.isEmpty` assertion the moment a chat lock was tapped.
///
/// Non numeric characters are rejected by an input formatter rather than by
/// rewriting `controller.text` from inside `onChanged`. Assigning to the
/// controller while the field is handling its own change re-enters the text
/// field's listener and can tear down an element mid-update.
class PinEntryDialog extends StatefulWidget {
  final String title;

  final String helper;

  const PinEntryDialog({super.key, required this.title, required this.helper});

  @override
  State<PinEntryDialog> createState() => _PinEntryDialogState();
}

class _PinEntryDialogState extends State<PinEntryDialog> {
  final TextEditingController _controller = TextEditingController();

  String _errorText = "";

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _submit() {
    final String digits = _controller.text;

    if (digits.length != 4) {
      setState(() {
        _errorText = "Enter exactly 4 digits.";
      });

      return;
    }

    Navigator.pop(context, digits);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.helper,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 14),

          TextField(
            controller: _controller,
            autofocus: true,
            obscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 4,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              labelText: loc.secureKeyPasscode,
              counterText: "",
              border: const OutlineInputBorder(),
              errorText: _errorText.isEmpty ? null : _errorText,
            ),
            onChanged: (String value) {
              if (_errorText.isEmpty) return;

              setState(() {
                _errorText = "";
              });
            },
            onSubmitted: (_) => _submit(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.cancel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(loc.ok),
        ),
      ],
    );
  }
}