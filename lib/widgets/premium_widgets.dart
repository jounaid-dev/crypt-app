import 'package:flutter/material.dart';

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

  /// feature, free, premium
  static const List<(String, String, String)> rows =
      <(String, String, String)>[
        ('Encrypted peer-to-peer messaging', 'Included', 'Included'),
        ('Messages stay on your devices', 'Included', 'Included'),
        ('Chats locked with your own PIN', '1 chat', 'Unlimited'),
        ('Unlock with fingerprint or face', 'Not included', 'Included'),
        ('Price', 'Free', r'One payment of $5'),
        ('Access', 'While the app is free', 'Lifetime'),
      ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
            _cell(context, 'Feature', bold: true),
            _cell(
              context,
              'Free',
              bold: true,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            _cell(context, 'Premium', bold: true, color: Colors.amber),
          ],
        ),

        for (final (String feature, String free, String premium) in rows)
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
                color: _isUpgrade(premium) ? Colors.amber : null,
                bold: _isUpgrade(premium),
              ),
            ],
          ),
      ],
    );
  }

  /// Premium column values that describe what the payment adds.
  static bool _isUpgrade(String premium) {
    return premium == 'Included' || premium == 'Unlimited';
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
            PremiumOffer.lifetimeLabel,
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'One payment of ${PremiumOffer.minimumAmountLabel} and premium is '
            'yours for life. There is no subscription and nothing to renew.',
            style: const TextStyle(fontSize: 11, height: 1.35),
          ),

          const SizedBox(height: 12),

          Text(
            'Lightning address',
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

          for (int i = 0; i < PremiumOffer.activationSteps.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '${i + 1}. ${PremiumOffer.activationSteps[i]}',
                style: const TextStyle(fontSize: 11, height: 1.3),
              ),
            ),

          const SizedBox(height: 6),

          Text(
            'CRYPT is built by a solo developer. Premium is what keeps it '
            'ad-free and actively maintained.',
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
