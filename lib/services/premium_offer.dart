/// The single source of truth for what premium costs and how to pay for it.
///
/// The offer is deliberately small: one method, one address, one amount. Every
/// screen that talks about premium reads these values so the price and the
/// address can never drift apart between them.
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

  /// The only payment method. There is no list to choose from.
  static const String paymentMethod = 'Phoenix Lightning Wallet';

  /// Smallest payment that unlocks premium.
  static const double minimumAmountUsd = 5;

  /// Shown next to the amount so the lifetime wording is unmissable.
  static const String minimumAmountLabel = r'$5 USD';

  /// What the payment buys.
  static const String lifetimeLabel = 'Lifetime Premium Access';

  /// How long a payment takes to be switched on.
  static const String activationWindow = '24-48 hours (excluding weekends)';

  /// A wallet link that opens Phoenix with this address pre-filled.
  static Uri get walletUri => Uri.parse(
    'bitcoin:?lno=$lightningAddress',
  );

  /// The activation steps, in the order the user performs them.
  static const List<String> activationSteps = <String>[
    'Pay $minimumAmountLabel via $paymentMethod to the Lightning address above.',
    'Take a screenshot of the payment confirmation and send it in as your '
        'proof of payment.',
    'Activation takes $activationWindow.',
  ];
}
