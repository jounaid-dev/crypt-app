import '../models/payment_proof.dart';
import '../models/report.dart';

/// Input validation for moderation submissions.
///
/// Kept free of Flutter and Supabase so it can be unit tested directly and
/// reused by both the submission screens and the services.
class ModerationValidation {
  ModerationValidation._();

  static const int minDetailsLength = 10;
  static const int maxDetailsLength = 4000;
  static const int maxScreenshots = 4;
  static const int maxReferenceLength = 120;
  static const int maxNoteLength = 500;
  static const int maxMethodLength = 40;
  static const double maxAmount = 1000000;

  /// Usernames are used as Supabase storage folder names, so anything that
  /// could escape a folder or a URL is rejected outright.
  static final RegExp usernamePattern = RegExp(r'^[A-Za-z0-9_.-]{3,32}$');

  static bool isValidUsername(String? value) {
    if (value == null) return false;
    return usernamePattern.hasMatch(value.trim());
  }

  /// Returns null when the report is acceptable, otherwise the reason.
  static ReportValidationError? validateReport({
    required String details,
    String? reportedUsername,
    int screenshotCount = 0,
  }) {
    if (screenshotCount < 0 || screenshotCount > maxScreenshots) {
      return ReportValidationError.tooManyScreenshots;
    }

    final trimmedDetails = details.trim();

    if (trimmedDetails.isEmpty && reportedUsername == null) {
      return ReportValidationError.empty;
    }

    final reported = reportedUsername?.trim();

    if (reported != null && reported.isNotEmpty) {
      if (!isValidUsername(reported)) {
        return ReportValidationError.invalidReportedUsername;
      }
    }

    if (trimmedDetails.length < minDetailsLength) {
      return ReportValidationError.tooShort;
    }

    if (trimmedDetails.length > maxDetailsLength) {
      return ReportValidationError.detailsTooLong;
    }

    return null;
  }

  /// Returns null when the payment proof is acceptable, otherwise the reason.
  static PaymentProofValidationError? validatePaymentProof({
    required String amountText,
    required String method,
    required String reference,
    String? note,
  }) {
    final trimmedMethod = method.trim();
    final trimmedReference = reference.trim();
    final trimmedNote = note?.trim() ?? '';

    if (trimmedAmount(amountText) == null &&
        amountText.trim().isNotEmpty) {
      return PaymentProofValidationError.amountNotFinite;
    }

    final amount = trimmedAmount(amountText);

    if (amount == null) {
      return PaymentProofValidationError.amountNotPositive;
    }

    if (amount <= 0) {
      return PaymentProofValidationError.amountNotPositive;
    }

    if (amount > maxAmount) {
      return PaymentProofValidationError.amountTooLarge;
    }

    if (trimmedMethod.isEmpty ||
        trimmedMethod.length > maxMethodLength) {
      return PaymentProofValidationError.missingMethod;
    }

    if (trimmedReference.isEmpty) {
      return PaymentProofValidationError.missingReference;
    }

    if (trimmedReference.length > maxReferenceLength) {
      return PaymentProofValidationError.referenceTooLong;
    }

    if (trimmedNote.length > maxNoteLength) {
      return PaymentProofValidationError.noteTooLong;
    }

    return null;
  }

  /// Normalised amount, or null when the text is not a usable number.
  static double? trimmedAmount(String amountText) {
    final value = double.tryParse(amountText.trim());
    if (value == null || !value.isFinite) return null;
    return value;
  }
}
