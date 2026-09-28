/// The single source of truth for what premium costs and how to pay for it.
///
/// The offer is deliberately small: one method, one address, one amount. Every
/// screen that talks about premium reads these values so the price and the
/// address can never drift apart between them.
library;

import 'package:url_launcher/url_launcher.dart';

class PremiumOffer {
  PremiumOffer._();

  /// Lightning address payments are sent to.
  ///
  /// Phoenix Wallet resolves this address to an invoice, so the same string is
  /// shown on screen and used to build the `bitcoin:?lno=` URI that opens the
  /// wallet with the payment pre-filled.
  static const String lightningAddress =
      'lno1pgx5x5je2p2zqurjv4kkjatdzrhq8pjw7qjlm68mtp7e3yvxee4y5xrgjhhyf2'
      'fxhlphpckrvevh50u0q2vzwj4ug8g3jcds83vzmfmm5qv20z0l9aawe90r655gfhuv'
      'z26pjqszwlu7ddm5u64vf939s6rce97z89lf64073k62taltu7rxd90nx92sqvcvlcy'
      'raz5u25qzctre983fqkpmrtprnjwehn7uaragk4zx8kark3cajgc5pus8zd3mft93m'
      '5493y3726k6qwwv0d6ztvskkyjp5p79js0mxxkz5kjfktdf9znvuqy0gwxmpc8myqpjx'
      'mesdcfjhk5zxg9x3fcvfj6h80scp9cfy5sc6u3cnk53q8nzf3x767pduhgvu7w8ctxt'
      'z7eglhqzq6xy';

  /// How the payment is made, as recorded on a proof of payment.
  ///
  /// The address is a Lightning address, so the payment arrives over
  /// Lightning whichever app sends it. It is not tied to one wallet: the app
  /// hands the address to whatever Lightning wallet the device has installed.
  static const String paymentMethod = 'Lightning';

  /// The same thing in a sentence.
  static const String paymentMethodLabel = 'your Lightning wallet';

  /// Named as the recommended app, without being required.
  static const String recommendedWallet = 'Phoenix';

  /// Smallest payment that unlocks premium.
  static const double minimumAmountUsd = 5;

  /// Shown next to the amount so the lifetime wording is unmissable.
  static const String minimumAmountLabel = r'$5 USD';

  /// What the payment buys.
  static const String lifetimeLabel = 'Lifetime Premium Access';

  /// How long a payment takes to be switched on.
  static const String activationWindow = '24-48 hours (excluding weekends)';

  /// A wallet link carrying the Lightning address.
  static Uri get walletUri => Uri.parse(
    'bitcoin:?lno=$lightningAddress',
  );

  /// The wallet links to try, in order.
  ///
  /// `bitcoin:?lno=` is the form wallets that understand Lightning addresses
  /// register, so it is tried first and is what Phoenix opens. The other
  /// entries exist because wallets do not agree on which scheme they claim:
  /// some answer only to a bare `bitcoin:` link, others only to `lightning:`.
  /// The first one a wallet on the device actually claims is the one used, so
  /// the button is not tied to one app.
  static List<Uri> get walletUris => <Uri>[
    walletUri,
    Uri.parse('bitcoin:$lightningAddress'),
    Uri.parse('lightning:$lightningAddress'),
  ];

  /// Hands the Lightning address to whichever Lightning wallet is installed.
  ///
  /// Returns false when nothing on the device claims any of the schemes, so
  /// the caller can send the user to copying the address rather than leaving
  /// the button looking broken.
  static Future<bool> openWallet() async {
    for (final Uri uri in walletUris) {
      try {
        if (!await canLaunchUrl(uri)) {
          continue;
        }

        await launchUrl(uri, mode: LaunchMode.externalApplication);

        return true;
      } catch (_) {
        // The scheme was claimed but the launch failed. Try the next one
        // instead of giving up on opening a wallet altogether.
        continue;
      }
    }

    return false;
  }

  /// The activation steps, in the order the user performs them.
  static const List<String> activationSteps = <String>[
    'Pay $minimumAmountLabel from $paymentMethodLabel to the Lightning '
        'address above.',
    'Take a screenshot of the payment confirmation and send it in as your '
        'proof of payment.',
    'Activation takes $activationWindow.',
  ];
}
