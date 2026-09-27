import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/payment_proof.dart';
import '../services/moderation_service.dart';
import '../services/moderation_validation.dart';

/// Submits proof of a premium payment for an administrator to review.
///
/// Premium is granted by the database when the proof is approved, so this
/// screen never sets a local flag.
class SubmitPaymentProofPage extends StatefulWidget {
  const SubmitPaymentProofPage({super.key});

  @override
  State<SubmitPaymentProofPage> createState() =>
      _SubmitPaymentProofPageState();
}

class _SubmitPaymentProofPageState extends State<SubmitPaymentProofPage> {
  static const List<String> _methods = <String>[
    'Bank transfer',
    'UPI',
    'PayPal',
    'Crypto',
    'Cash',
    'Other',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String _method = _methods.first;

  Uint8List? _proofImage;

  bool _submitting = false;

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _pickProof() async {
    final ImagePicker picker = ImagePicker();

    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 85,
    );

    if (picked == null) return;

    final Uint8List bytes = await picked.readAsBytes();

    if (!mounted) return;

    setState(() {
      _proofImage = bytes;
    });
  }

  Future<void> _submit() async {
    if (_submitting) return;

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final Uint8List? proof = _proofImage;

    if (proof == null) {
      _showError('Attach a photo of your payment receipt.');
      return;
    }

    setState(() {
      _submitting = true;
    });

    try {
      await ModerationService.instance.submitPaymentProof(
        amountText: _amountController.text,
        method: _method,
        reference: _referenceController.text,
        note: _noteController.text,
        proofImage: proof,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Payment proof submitted. Premium is enabled once an '
            'administrator approves it.',
          ),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      _showError(
        e is ModerationException
            ? e.message
            : 'Could not submit the payment proof.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Submit payment proof')),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            children: [
              Text(
                'Pay, then send the receipt here. An administrator checks it '
                'and turns premium on for your account. Your local settings '
                'cannot grant it.',
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Amount you paid',
                ),
                validator: (value) {
                  final error =
                      ModerationValidation.validatePaymentProof(
                    amountText: value ?? '',
                    method: _method,
                    reference: _referenceController.text,
                    note: _noteController.text,
                  );

                  return error?.message;
                },
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                initialValue: _method,
                decoration: const InputDecoration(labelText: 'How you paid'),
                items: _methods
                    .map(
                      (m) => DropdownMenuItem<String>(
                        value: m,
                        child: Text(m),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _method = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _referenceController,
                maxLength: ModerationValidation.maxReferenceLength,
                decoration: const InputDecoration(
                  labelText: 'Transaction reference',
                  hintText: 'The id on your receipt',
                ),
                validator: (value) {
                  final error =
                      ModerationValidation.validatePaymentProof(
                    amountText: _amountController.text,
                    method: _method,
                    reference: value ?? '',
                    note: _noteController.text,
                  );

                  return error?.message;
                },
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: _noteController,
                minLines: 2,
                maxLines: 4,
                maxLength: ModerationValidation.maxNoteLength,
                decoration: const InputDecoration(
                  labelText: 'Note (optional)',
                ),
              ),

              const SizedBox(height: 16),

              Text('Payment receipt', style: theme.textTheme.titleSmall),

              const SizedBox(height: 8),

              if (_proofImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    _proofImage!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: _pickProof,
                icon: Icon(
                  _proofImage == null
                      ? Icons.add_photo_alternate_outlined
                      : Icons.swap_horiz,
                ),
                label: Text(
                  _proofImage == null
                      ? 'Attach receipt'
                      : 'Replace receipt',
                ),
              ),

              const SizedBox(height: 28),

              FilledButton(
                onPressed: _submitting ? null : _submit,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: _submitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Submit for review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
