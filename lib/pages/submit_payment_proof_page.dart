import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/payment_proof.dart';
import '../services/moderation_service.dart';
import '../services/moderation_validation.dart';
import '../services/premium_offer.dart';
import '../widgets/premium_widgets.dart';

/// Where a user sends proof of their premium payment.
///
/// There is one method and one address, so the screen is instructions plus a
/// screenshot: pay in Phoenix, attach the confirmation, done. Nothing here
/// asks for a card reference, because a Lightning payment does not have one.
class SubmitPaymentProofPage extends StatefulWidget {
  const SubmitPaymentProofPage({super.key});

  @override
  State<SubmitPaymentProofPage> createState() =>
      _SubmitPaymentProofPageState();
}

class _SubmitPaymentProofPageState extends State<SubmitPaymentProofPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  Uint8List? _proofImage;

  bool _submitting = false;

  @override
  void dispose() {
    _amountController.dispose();
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

  Future<void> _openWallet() async {
    final Uri walletUri = PremiumOffer.walletUri;

    if (await canLaunchUrl(walletUri)) {
      await launchUrl(walletUri, mode: LaunchMode.externalApplication);

      return;
    }

    if (!mounted) return;

    _showError(
      'Could not open Phoenix. Copy the Lightning address and paste it into '
      'your Lightning wallet instead.',
    );
  }

  Future<void> _copyAddress() async {
    await Clipboard.setData(
      const ClipboardData(text: PremiumOffer.lightningAddress),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Lightning address copied.'),
      ),
    );
  }

  Future<void> _submit() async {
    if (_submitting) return;

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final Uint8List? proof = _proofImage;

    if (proof == null) {
      _showError('Attach a screenshot of your payment confirmation.');

      return;
    }

    setState(() {
      _submitting = true;
    });

    try {
      await ModerationService.instance.submitPaymentProof(
        amountText: _amountController.text,
        method: PremiumOffer.paymentMethod,
        note: _noteController.text,
        proofImage: proof,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Proof received. Premium is switched on within '
            '${PremiumOffer.activationWindow}.',
          ),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      _showError(
        e is ModerationException
            ? e.message
            : 'Could not send the payment proof.',
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
      appBar: AppBar(
        title: const Text('Get Lifetime Premium'),
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            children: [
              // ==================================================
              // THE OFFER
              // ==================================================

              Text(
                '${PremiumOffer.minimumAmountLabel} once, '
                '${PremiumOffer.lifetimeLabel}.',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'No subscription and nothing to renew. Pay with '
                '${PremiumOffer.paymentMethod}, send a screenshot of the '
                'confirmation, and premium is switched on within '
                '${PremiumOffer.activationWindow}.',
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 8),

              Text(
                'CRYPT is built by a solo developer. Premium is what keeps it '
                'ad-free and actively maintained.',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 20),

              const PremiumComparisonTable(),

              const SizedBox(height: 24),

              // ==================================================
              // STEP 1: PAY
              // ==================================================

              const _StepHeading(
                number: 1,
                title: 'Pay with Phoenix',
              ),

              const SizedBox(height: 10),

              Text(
                'Lightning address',
                style: theme.textTheme.labelMedium,
              ),

              const SizedBox(height: 6),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.amber.withValues(alpha: 0.3),
                  ),
                ),
                child: SelectableText(
                  PremiumOffer.lightningAddress,
                  style: const TextStyle(
                    fontSize: 11,
                    height: 1.4,
                    fontFamily: 'monospace',
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _openWallet,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          7,
                          255,
                          90,
                        ),
                        foregroundColor: Colors.black,
                      ),
                      icon: const Icon(Icons.bolt),
                      label: const Text('Open Phoenix'),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _copyAddress,
                      icon: const Icon(Icons.copy, size: 18),
                      label: const Text('Copy address'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ==================================================
              // STEP 2: SEND THE SCREENSHOT
              // ==================================================

              const _StepHeading(
                number: 2,
                title: 'Send your screenshot',
              ),

              const SizedBox(height: 10),

              Text(
                'Take a screenshot of the payment confirmation in Phoenix and '
                'attach it below.',
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 16),

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
                      ? 'Attach screenshot'
                      : 'Replace screenshot',
                ),
              ),

              const SizedBox(height: 24),

              // ==================================================
              // STEP 3: AMOUNT AND NOTE
              //
              // The amount is what was actually sent, so an administrator can
              // match it against the payment. There is no reference field:
              // a Lightning payment has no transaction id to copy.
              // ==================================================

              const _StepHeading(
                number: 3,
                title: 'Confirm the amount',
              ),

              const SizedBox(height: 10),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Amount you paid (USD)',
                  helperText:
                      'Minimum ${PremiumOffer.minimumAmountLabel}.',
                ),
                validator: (value) {
                  final error =
                      ModerationValidation.validatePaymentProof(
                        amountText: value ?? '',
                        method: PremiumOffer.paymentMethod,
                        note: _noteController.text,
                      );

                  return error?.message;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _noteController,
                minLines: 2,
                maxLines: 4,
                maxLength: ModerationValidation.maxNoteLength,
                decoration: const InputDecoration(
                  labelText: 'Note (optional)',
                ),
              ),

              const SizedBox(height: 12),

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
                    : const Text('Send my proof'),
              ),

              const SizedBox(height: 16),

              Text(
                'Activation takes ${PremiumOffer.activationWindow}.',
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The numbered heading that opens each step on the payment screen.
class _StepHeading extends StatelessWidget {
  final int number;

  final String title;

  const _StepHeading({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      children: [
        CircleAvatar(
          radius: 11,
          backgroundColor: theme.colorScheme.primary,
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),

        const SizedBox(width: 8),

        Text(title, style: theme.textTheme.titleSmall),
      ],
    );
  }
}
