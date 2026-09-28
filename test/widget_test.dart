import 'package:crypt_messenger/services/premium_offer.dart';
import 'package:flutter_test/flutter_test.dart';

/// Guards the values the payment screens display.
///
/// The Lightning address, the price and the activation window are shown to a
/// user who is about to send real money, so a careless edit here is expensive
/// and invisible until someone tries to pay. These assertions pin the values
/// that were specified for the offer.
void main() {
  group('premium offer', () {
    test('is a single Lightning payment at a five dollar minimum', () {
      // Payment arrives over Lightning, but the app does not require one
      // particular wallet: the address is handed to whichever Lightning wallet
      // the device has installed.
      expect(PremiumOffer.paymentMethod, 'Lightning');
      expect(PremiumOffer.minimumAmountUsd, 5);
      expect(PremiumOffer.minimumAmountLabel, r'$5 USD');
      expect(PremiumOffer.lifetimeLabel, 'Lifetime Premium Access');
    });

    test('tries more than one scheme so any wallet can be opened', () {
      // A wallet that only claims a bare bitcoin: link, or only lightning:,
      // must still be reachable, so more than one candidate is offered and
      // every one of them carries the same address.
      expect(PremiumOffer.walletUris, hasLength(greaterThan(1)));

      for (final Uri uri in PremiumOffer.walletUris) {
        expect(
          uri.toString(),
          contains(PremiumOffer.lightningAddress),
        );
      }

      expect(PremiumOffer.walletUris.first, PremiumOffer.walletUri);
    });

    test('Lightning address is intact and not truncated', () {
      const String expected =
          'lno1pgx5x5je2p2zqurjv4kkjatdzrhq8pjw7qjlm68mtp7e3yvxee4y5xrgjhhyf2fxhlphpckrvevh50u0q2vzwj4ug8g3jcds83v'
          'zmfmm5qv20z0l9aawe90r655gfhuvz26pjqszwlu7ddm5u64vf939s6rce97z89lf64073k62taltu7rxd90nx92sqvcvlcyraz5u25'
          'qzctre983fqkpmrtprnjwehn7uaragk4zx8kark3cajgc5pus8zd3mft93m5493y3726k6qwwv0d6ztvskkyjp5p79js0mxxkz5kjfk'
          'tdf9znvuqy0gwxmpc8myqpjxmesdcfjhk5zxg9x3fcvfj6h80scp9cfy5sc6u3cnk53q8nzf3x767pduhgvu7w8ctxtz7eglhqzq6xy';

      expect(PremiumOffer.lightningAddress, expected);

      // The constant is written across several source lines, so a dropped
      // fragment would still be a plausible looking string. Rejoining must
      // produce exactly the address, with nothing lost at the seams.
      expect(
        PremiumOffer.lightningAddress.replaceAll(RegExp(r'\s'), ''),
        expected,
      );

      expect(PremiumOffer.lightningAddress, startsWith('lno1'));
      expect(PremiumOffer.lightningAddress, isNot(contains(' ')));
    });

    test('wallet link points at the same address', () {
      expect(
        PremiumOffer.walletUri.toString(),
        'bitcoin:?lno=${PremiumOffer.lightningAddress}',
      );
    });

    test('activation steps cover pay, screenshot and activation time', () {
      expect(PremiumOffer.activationSteps, hasLength(3));

      expect(
        PremiumOffer.activationSteps.first,
        contains(PremiumOffer.minimumAmountLabel),
      );

      expect(
        PremiumOffer.activationSteps.first,
        contains(PremiumOffer.paymentMethodLabel),
      );

      expect(
        PremiumOffer.activationSteps[1].toLowerCase(),
        contains('screenshot'),
      );

      expect(
        PremiumOffer.activationSteps.last,
        contains(PremiumOffer.activationWindow),
      );

      expect(PremiumOffer.activationWindow, '24-48 hours (excluding weekends)');
    });
  });
}
