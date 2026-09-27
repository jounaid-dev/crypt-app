/// Where a payment proof is in the review queue.
enum PaymentProofStatus {
  pending,
  approved,
  rejected;

  static PaymentProofStatus fromName(String? value) {
    return PaymentProofStatus.values.firstWhere(
      (s) => s.name == value,
      orElse: () => PaymentProofStatus.pending,
    );
  }
}

/// A premium payment the user paid for and wants an admin to confirm.
class PaymentProof {
  const PaymentProof({
    required this.id,
    required this.username,
    required this.amount,
    required this.method,
    required this.reference,
    required this.proofPath,
    required this.createdAt,
    this.note,
    this.status = PaymentProofStatus.pending,
    this.adminNote,
    this.reviewedAt,
    this.reviewedBy,
  });

  final String id;
  final String username;
  final double amount;
  final String method;

  /// The transaction id the user saw on their payment receipt.
  final String reference;
  final String? note;

  /// Storage path of the uploaded proof image, not a public URL.
  final String proofPath;
  final PaymentProofStatus status;
  final String? adminNote;
  final DateTime createdAt;
  final DateTime? reviewedAt;
  final String? reviewedBy;

  bool get isPending => status == PaymentProofStatus.pending;

  factory PaymentProof.fromJson(Map<String, dynamic> json) {
    final rawAmount = json["amount"];

    return PaymentProof(
      id: json["id"]?.toString() ?? "",
      username: json["username"]?.toString() ?? "",
      amount: rawAmount is num
          ? rawAmount.toDouble()
          : double.tryParse(rawAmount?.toString() ?? "") ?? 0,
      method: json["method"]?.toString() ?? "",
      reference: json["reference"]?.toString() ?? "",
      note: json["note"]?.toString(),
      proofPath: json["proof_path"]?.toString() ?? "",
      status: PaymentProofStatus.fromName(json["status"]?.toString()),
      adminNote: json["admin_note"]?.toString(),
      createdAt:
          DateTime.tryParse(json["created_at"]?.toString() ?? "") ??
              DateTime.fromMillisecondsSinceEpoch(0),
      reviewedAt: DateTime.tryParse(json["reviewed_at"]?.toString() ?? ""),
      reviewedBy: json["reviewed_by"]?.toString(),
    );
  }
}

/// Why a payment proof submission was refused.
enum PaymentProofValidationError {
  empty,
  amountNotPositive,
  amountTooLarge,
  amountNotFinite,
  missingMethod,
  missingReference,
  referenceTooLong,
  noteTooLong,
}

extension PaymentProofValidationErrorMessage on PaymentProofValidationError {
  String get message {
    switch (this) {
      case PaymentProofValidationError.empty:
        return 'Nothing to submit.';
      case PaymentProofValidationError.amountNotPositive:
        return 'Enter the amount you paid.';
      case PaymentProofValidationError.amountTooLarge:
        return 'That amount is too large.';
      case PaymentProofValidationError.amountNotFinite:
        return 'That amount is not a valid number.';
      case PaymentProofValidationError.missingMethod:
        return 'Choose how you paid.';
      case PaymentProofValidationError.missingReference:
        return 'Enter the transaction reference from your receipt.';
      case PaymentProofValidationError.referenceTooLong:
        return 'That reference is too long.';
      case PaymentProofValidationError.noteTooLong:
        return 'Please keep the note under 500 characters.';
    }
  }
}

/// A user account as the admin panel sees it. Contains no key material.
class AdminUserSummary {
  const AdminUserSummary({
    required this.username,
    required this.isPremium,
    required this.isBanned,
    required this.isAdmin,
    this.bannedReason,
  });

  final String username;
  final bool isPremium;
  final bool isBanned;
  final bool isAdmin;
  final String? bannedReason;

  factory AdminUserSummary.fromJson(Map<String, dynamic> json) {
    return AdminUserSummary(
      username: json["username"]?.toString() ?? "",
      isPremium: json["is_premium"] == true,
      isBanned: json["is_banned"] == true,
      isAdmin: json["is_admin"] == true,
      bannedReason: json["banned_reason"]?.toString(),
    );
  }
}

/// The signed-in user's own server-side flags.
class AccountFlags {
  const AccountFlags({
    required this.username,
    required this.isPremium,
    required this.isBanned,
    required this.isAdmin,
    this.bannedReason,
  });

  final String username;
  final bool isPremium;
  final bool isBanned;
  final bool isAdmin;
  final String? bannedReason;

  factory AccountFlags.fromJson(Map<String, dynamic> json) {
    return AccountFlags(
      username: json["username"]?.toString() ?? "",
      isPremium: json["is_premium"] == true,
      isBanned: json["is_banned"] == true,
      isAdmin: json["is_admin"] == true,
      bannedReason: json["banned_reason"]?.toString(),
    );
  }
}
