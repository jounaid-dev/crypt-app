import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/payment_proof.dart';
import '../models/report.dart';
import 'account_flags_service.dart';

/// Every privileged moderation action.
///
/// Each method calls a Postgres function that re-checks is_admin() inside the
/// database. Nothing here trusts a Dart-side flag, so a patched or repackaged
/// app that calls these directly is still refused by the server.
class AdminService {
  AdminService._();

  static final AdminService instance = AdminService._();

  final SupabaseClient _supabase = Supabase.instance.client;

  /// True when the server says this account is an admin.
  Future<bool> isAdmin() async {
    final response = await _supabase.rpc('is_admin');

    return response == true;
  }

  /// Tries the admin access code typed in Settings.
  ///
  /// The code is checked by admin_unlock() inside the database. It is not
  /// stored in the app, so it cannot be extracted from the APK, and repeated
  /// wrong guesses are throttled server-side.
  Future<bool> unlockWithCode(String accessCode) async {
    final trimmed = accessCode.trim();

    if (trimmed.isEmpty) return false;

    final response = await _supabase.rpc(
      'admin_unlock',
      params: {'access_code': trimmed},
    );

    if (response == true) {
      // The account was just promoted, so the cached flags are stale.
      AccountFlagsService.instance.invalidate();
    }

    return response == true;
  }

  /// How many reports and payment proofs are waiting, for the panel badges.
  Future<({int openReports, int pendingPayments})> pendingCounts() async {
    final response = await _supabase.rpc('admin_pending_counts');

    final rows = response as List;

    if (rows.isEmpty) {
      return (openReports: 0, pendingPayments: 0);
    }

    final row = Map<String, dynamic>.from(rows.first);

    return (
      openReports: (row['open_reports'] as num?)?.toInt() ?? 0,
      pendingPayments: (row['pending_payments'] as num?)?.toInt() ?? 0,
    );
  }

  /// The moderation queue, optionally filtered by status.
  Future<List<Report>> listReports({ReportStatus? status}) async {
    final response = await _supabase.rpc(
      'admin_list_reports',
      params: {'status_filter': status?.name},
    );

    return (response as List)
        .map((e) => Report.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> setReportStatus({
    required String reportId,
    required ReportStatus status,
    String? note,
  }) async {
    await _supabase.rpc(
      'admin_set_report_status',
      params: {
        'report_id': reportId,
        'new_status': status.name,
        'note': note,
      },
    );
  }

  /// Users matching [query], capped at 200 by the server.
  Future<List<AdminUserSummary>> searchUsers({String? query}) async {
    final response = await _supabase.rpc(
      'admin_search_users',
      params: {'query_text': query?.trim().isEmpty ?? true ? null : query!.trim()},
    );

    return (response as List)
        .map((e) => AdminUserSummary.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  /// Grants or revokes premium. Server-side only, so this actually sticks.
  Future<void> setPremium({
    required String username,
    required bool premium,
  }) async {
    await _supabase.rpc(
      'admin_set_premium',
      params: {
        'target_username': username,
        'premium': premium,
      },
    );
  }

  /// Bans or unbans. Bans are reversible and keep the account row.
  Future<void> setBan({
    required String username,
    required bool banned,
    String? reason,
  }) async {
    await _supabase.rpc(
      'admin_set_ban',
      params: {
        'target_username': username,
        'banned': banned,
        'reason': reason,
      },
    );
  }

  /// Payment proofs awaiting review, optionally filtered by status.
  Future<List<PaymentProof>> listPaymentProofs({
    PaymentProofStatus? status,
  }) async {
    final response = await _supabase.rpc(
      'admin_list_payment_proofs',
      params: {'status_filter': status?.name},
    );

    return (response as List)
        .map((e) => PaymentProof.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  /// Approving a proof grants premium inside the same transaction, so the
  /// payment record and the account flag can never disagree.
  Future<void> reviewPaymentProof({
    required String proofId,
    required PaymentProofStatus status,
    String? note,
  }) async {
    if (status == PaymentProofStatus.pending) {
      throw ArgumentError('A proof must be approved or rejected.');
    }

    await _supabase.rpc(
      'admin_review_payment_proof',
      params: {
        'proof_id': proofId,
        'new_status': status.name,
        'note': note,
      },
    );
  }

  /// Short-lived signed URL for an attachment. Valid for five minutes and
  /// only mintable by an admin.
  Future<String> signedUrl({
    required String bucket,
    required String path,
  }) async {
    if (bucket != 'report-screenshots' && bucket != 'payment-proofs') {
      throw ArgumentError('Unknown bucket: $bucket');
    }

    final response = await _supabase.rpc(
      'admin_signed_url',
      params: {
        'bucket_id': bucket,
        'object_path': path,
      },
    );

    return response.toString();
  }
}
