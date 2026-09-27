import 'package:crypt_messenger/models/payment_proof.dart';
import 'package:crypt_messenger/models/report.dart';
import 'package:crypt_messenger/services/moderation_validation.dart';
import 'package:crypt_messenger/services/server_auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('report validation', () {
    test('accepts a normal bug report', () {
      expect(
        ModerationValidation.validateReport(
          details: 'The app crashes when I open my profile screen.',
        ),
        isNull,
      );
    });

    test('rejects details that are too short', () {
      expect(
        ModerationValidation.validateReport(details: 'broken'),
        ReportValidationError.tooShort,
      );
    });

    test('rejects an empty submission', () {
      expect(
        ModerationValidation.validateReport(details: '   '),
        ReportValidationError.empty,
      );
    });

    test('rejects details over the limit', () {
      expect(
        ModerationValidation.validateReport(details: 'x' * 4001),
        ReportValidationError.detailsTooLong,
      );
    });

    test('rejects more than four screenshots', () {
      expect(
        ModerationValidation.validateReport(
          details: 'A perfectly reasonable description of the problem.',
          screenshotCount: 5,
        ),
        ReportValidationError.tooManyScreenshots,
      );
    });

    test('rejects usernames that could escape a storage folder', () {
      // These are the values that would break the RLS storage policy, which
      // compares the first path segment against the caller's username.
      for (final bad in [
        '../admin',
        'a/b',
        'a\\b',
        '../../etc',
        'ab',
        '',
        'x' * 33,
        'has space',
        'emoji😀',
      ]) {
        expect(
          ModerationValidation.isValidUsername(bad),
          isFalse,
          reason: 'should reject "$bad"',
        );
      }
    });

    test('accepts ordinary usernames', () {
      for (final good in ['alice', 'bob_1', 'a.b', 'a-b', 'User_99', 'x' * 32]) {
        expect(
          ModerationValidation.isValidUsername(good),
          isTrue,
          reason: 'should accept "$good"',
        );
      }
    });

    test('trims before validating the reported username', () {
      expect(
        ModerationValidation.validateReport(
          details: 'This person is impersonating my account.',
          reportedUsername: '  impostor  ',
        ),
        isNull,
      );
    });
  });

  group('payment proof validation', () {
    PaymentProofValidationError? check({
      String amount = '9.99',
      String method = 'UPI',
      String reference = 'TXN12345',
      String? note,
    }) {
      return ModerationValidation.validatePaymentProof(
        amountText: amount,
        method: method,
        reference: reference,
        note: note,
      );
    }

    test('accepts a complete submission', () {
      expect(check(), isNull);
    });

    test('rejects a missing amount', () {
      expect(check(amount: ''), PaymentProofValidationError.amountNotPositive);
      expect(
        check(amount: '0'),
        PaymentProofValidationError.amountNotPositive,
      );
      expect(
        check(amount: '-5'),
        PaymentProofValidationError.amountNotPositive,
      );
    });

    test('rejects nonsense and oversized amounts', () {
      expect(
        check(amount: 'abc'),
        PaymentProofValidationError.amountNotFinite,
      );
      expect(
        check(amount: '1000001'),
        PaymentProofValidationError.amountTooLarge,
      );
    });

    test('rejects a missing method or reference', () {
      expect(
        check(method: '  '),
        PaymentProofValidationError.missingMethod,
      );
      expect(
        check(reference: ''),
        PaymentProofValidationError.missingReference,
      );
    });

    test('rejects over-long reference and note', () {
      expect(
        check(reference: 'x' * 121),
        PaymentProofValidationError.referenceTooLong,
      );
      expect(
        check(note: 'y' * 501),
        PaymentProofValidationError.noteTooLong,
      );
    });

    test('every error has a user readable message', () {
      for (final e in PaymentProofValidationError.values) {
        expect(e.message, isNotEmpty, reason: '$e has no message');
      }

      for (final e in ReportValidationError.values) {
        expect(e.message, isNotEmpty, reason: '$e has no message');
      }
    });
  });

  group('synthetic auth email', () {
    test('round trips a username', () {
      for (final name in ['alice', 'bob_1', 'User.99', 'a-b-c']) {
        final email = ServerAuthService.syntheticEmailFor(name);
        expect(email, '$name@crypt.invalid');
        expect(ServerAuthService.usernameFromEmail(email), name);
      }
    });

    test('never produces a deliverable address', () {
      final email = ServerAuthService.syntheticEmailFor('alice');
      expect(email.endsWith('@crypt.invalid'), isTrue);
      // The .invalid TLD is reserved by RFC 2606 and can never resolve.
      expect(email.contains('@crypt.invalid'), isTrue);
    });

    test('rejects addresses outside the synthetic domain', () {
      expect(
        ServerAuthService.usernameFromEmail('alice@gmail.com'),
        isNull,
      );
      expect(
        ServerAuthService.usernameFromEmail('alice@crypt.invalid.evil.com'),
        isNull,
      );
      expect(ServerAuthService.usernameFromEmail('@crypt.invalid'), isNull);
      expect(ServerAuthService.usernameFromEmail(null), isNull);
    });
  });

  group('model parsing', () {
    test('report survives a server row', () {
      final report = Report.fromJson({
        'id': 'abc',
        'reporter_username': 'alice',
        'reported_username': 'bob',
        'category': 'abuse',
        'details': 'Harassing me in chat.',
        'screenshots': ['alice/one.png', 'alice/two.png'],
        'status': 'reviewing',
        'created_at': '2026-01-02T03:04:05Z',
      });

      expect(report.id, 'abc');
      expect(report.category, ReportCategory.abuse);
      expect(report.status, ReportStatus.reviewing);
      expect(report.screenshots.length, 2);
      expect(report.isOpen, isTrue);
      expect(report.createdAt.year, 2026);
    });

    test('report tolerates missing and unknown fields', () {
      final report = Report.fromJson({'id': 'x'});

      expect(report.reportedUsername, isNull);
      expect(report.category, ReportCategory.other);
      expect(report.status, ReportStatus.open);
      expect(report.screenshots, isEmpty);
      expect(report.details, '');
    });

    test('payment proof parses a numeric amount sent as a string', () {
      final proof = PaymentProof.fromJson({
        'id': 'p1',
        'username': 'alice',
        'amount': '19.50',
        'method': 'UPI',
        'reference': 'TXN1',
        'proof_path': 'alice/p1.png',
        'status': 'pending',
        'created_at': '2026-01-02T03:04:05Z',
      });

      expect(proof.amount, 19.5);
      expect(proof.isPending, isTrue);
    });

    test('payment proof parses a numeric amount sent as a number', () {
      final proof = PaymentProof.fromJson({
        'id': 'p1',
        'username': 'alice',
        'amount': 19.5,
        'method': 'UPI',
        'reference': 'TXN1',
        'proof_path': 'alice/p1.png',
      });

      expect(proof.amount, 19.5);
    });

    test('account flags only read true for real booleans', () {
      final flags = AccountFlags.fromJson({
        'username': 'alice',
        'is_premium': true,
        'is_banned': 'false',
        'is_admin': 1,
      });

      expect(flags.isPremium, isTrue);
      // A string or number must not be coerced into a privileged flag.
      expect(flags.isBanned, isFalse);
      expect(flags.isAdmin, isFalse);
    });
  });

  group('attachment limits', () {
    test('exactly four screenshots is allowed, five is not', () {
      const String details = 'A description long enough to pass validation.';

      expect(
        ModerationValidation.validateReport(
          details: details,
          screenshotCount: 4,
        ),
        isNull,
      );

      expect(
        ModerationValidation.validateReport(
          details: details,
          screenshotCount: 5,
        ),
        ReportValidationError.tooManyScreenshots,
      );
    });

    test('a negative count is rejected rather than trusted', () {
      expect(
        ModerationValidation.validateReport(
          details: 'A description long enough to pass validation.',
          screenshotCount: -1,
        ),
        ReportValidationError.tooManyScreenshots,
      );
    });
  });
}
