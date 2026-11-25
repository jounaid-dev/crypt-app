import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/premium_offer.dart';

/// Free against Premium, side by side.
///
/// Every row is a real gate in the app rather than an aspiration, so the
/// table cannot promise something the code does not do. The free column lists
/// what already works; the premium column lists what the payment adds.
///
/// Shown both where the free limit is hit and on the payment screen, so the
/// same comparison is in front of the user wherever the decision is made.
class PremiumComparisonTable extends StatelessWidget {
  const PremiumComparisonTable({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations loc = AppLocalizations.of(context)!;

    // feature, free, premium, premiumIsUpgrade
    final List<(String, String, String, bool)> rows =
        <(String, String, String, bool)>[
      (
        loc.premiumTableEncrypted,
        loc.premiumTableIncluded,
        loc.premiumTableIncluded,
        true,
      ),
      (
        loc.premiumTableMessagesStay,
        loc.premiumTableIncluded,
        loc.premiumTableIncluded,
        true,
      ),
      (
        loc.premiumTableChatLocks,
        loc.premiumTableOneChat,
        loc.premiumTableUnlimited,
        true,
      ),
      (
        loc.premiumTableFingerprint,
        loc.premiumTableNotIncluded,
        loc.premiumTableIncluded,
        true,
      ),
      (
        loc.premiumTablePrice,
        loc.premiumTableFreeValue,
        loc.premiumTableOnePayment(PremiumOffer.minimumAmountLabel),
        false,
      ),
      (
        loc.premiumTableAccess,
        loc.premiumTableWhileFree,
        loc.premiumTableLifetime,
        false,
      ),
    ];

    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(
          color: theme.colorScheme.outlineVariant,
          width: 0.5,
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1.6),
        1: FlexColumnWidth(1.0),
        2: FlexColumnWidth(1.0),
      },
      children: [
        TableRow(
          children: [
            _cell(context, loc.premiumTableFeature, bold: true),
            _cell(
              context,
              loc.premiumTableFree,
              bold: true,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            _cell(
              context,
              loc.premiumTablePremium,
              bold: true,
              color: Colors.amber,
            ),
          ],
        ),

        for (final (String feature, String free, String premium, bool upgrade)
            in rows)
          TableRow(
            children: [
              _cell(context, feature),
              _cell(
                context,
                free,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              _cell(
                context,
                premium,
                color: upgrade ? Colors.amber : null,
                bold: upgrade,
              ),
            ],
          ),
      ],
    );
  }

  Widget _cell(
    BuildContext context,
    String text, {
    bool bold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          height: 1.25,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: color,
        ),
      ),
    );
  }
}

/// Where the money goes, how much, and what happens next.
///
/// The address, the amount and the activation window all come from
/// [PremiumOffer], so the settings upsell and the payment screen cannot show
/// two different prices or two different addresses.
class PremiumPaymentInstructions extends StatelessWidget {
  const PremiumPaymentInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations loc = AppLocalizations.of(context)!;

    final List<String> steps = <String>[
      loc.premiumActivationStep1(
        PremiumOffer.minimumAmountLabel,
        PremiumOffer.paymentMethodLabel,
      ),
      loc.premiumActivationStep2,
      loc.premiumActivationNote(PremiumOffer.activationWindow),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.premiumLifetimeAccess,
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            loc.premiumPaymentOneTime(PremiumOffer.minimumAmountLabel),
            style: const TextStyle(fontSize: 11, height: 1.35),
          ),

          const SizedBox(height: 12),

          Text(
            loc.premiumLightningAddressLabel,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 4),

          SelectableText(
            PremiumOffer.lightningAddress,
            style: const TextStyle(
              fontSize: 10,
              height: 1.3,
              fontFamily: 'monospace',
            ),
          ),

          const SizedBox(height: 12),

          for (int i = 0; i < steps.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '${i + 1}. ${steps[i]}',
                style: const TextStyle(fontSize: 11, height: 1.3),
              ),
            ),

          const SizedBox(height: 6),

          Text(
            loc.premiumSoloNote,
            style: TextStyle(
              fontSize: 10,
              height: 1.3,
              fontStyle: FontStyle.italic,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
