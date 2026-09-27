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
  ///
  /// Returns what the server actually said. The old version collapsed every
  /// failure into a single false, so a code that had never been set on the
  /// server, a throttle, and a network error all reached the user as "Wrong
  /// code."
  Future<AdminUnlockResult> unlockWithCode(String accessCode) async {
    final trimmed = accessCode.trim();

    if (trimmed.isEmpty) {
      return const AdminUnlockResult.wrongCode();
    }

    final response = await _supabase.rpc(
      'admin_unlock',
      params: {'access_code': trimmed},
    );

    final status = response?.toString() ?? '';

    if (status == 'ok') {
      // The account was just promoted, so the cached flags are stale.
      AccountFlagsService.instance.invalidate();

      return const AdminUnlockResult.ok();
    }

    return AdminUnlockResult.fromStatus(status);
  }

  /// Whether an admin code has actually been set on the server.
  ///
  /// Lets the access screen say so up front instead of letting the user guess
  /// at a code that could never match.
  Future<AdminAccessState> accessState() async {
    final response = await _supabase.rpc('admin_access_state');

    if (response is! List || response.isEmpty) {
      return const AdminAccessState(
        configured: false,
        failedCount: 0,
        lockedOut: false,
      );
    }

    final row = Map<String, dynamic>.from(response.first);

    return AdminAccessState(
      configured: row['configured'] == true,
      failedCount: (row['failed_count'] as num?)?.toInt() ?? 0,
      lockedOut: row['locked_out'] == true,
    );
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

/// What the server said when an admin code was tried.
///
/// The messages are written to be shown to the person holding the code, so
/// each one says what to do next rather than just refusing.
class AdminUnlockResult {
  const AdminUnlockResult._(this.status, this.message);

  const AdminUnlockResult.ok()
    : this._('ok', 'Admin access granted.');

  const AdminUnlockResult.wrongCode()
    : this._('wrong_code', 'That code is not right. Check it and try again.');

  const AdminUnlockResult.notConfigured()
    : this._(
        'not_configured',
        'No admin code is set on the server yet. The database owner has to '
        'run supabase/seed_admin.sql once to choose one.',
      );

  const AdminUnlockResult.lockedOut()
    : this._(
        'locked_out',
        'Too many wrong attempts. The code is blocked for 15 minutes, then '
        'it works again.',
      );

  const AdminUnlockResult.noAccount()
    : this._(
        'no_account',
        'This account is not signed in to the server. Sign out and back in, '
        'then try the code again.',
      );

  const AdminUnlockResult.noUserRow()
    : this._(
        'no_user_row',
        'The code was right but this account could not be promoted. Sign out '
        'and back in, then try again.',
      );

  const AdminUnlockResult.failed(String reason)
    : this._('error', 'Could not reach the server. $reason');

  /// A status the server sent that this build does not know about.
  factory AdminUnlockResult.fromStatus(String status) {
    return switch (status) {
      'ok' => const AdminUnlockResult.ok(),
      'wrong_code' => const AdminUnlockResult.wrongCode(),
      'not_configured' => const AdminUnlockResult.notConfigured(),
      'locked_out' => const AdminUnlockResult.lockedOut(),
      'no_account' => const AdminUnlockResult.noAccount(),
      'no_user_row' => const AdminUnlockResult.noUserRow(),
      // A bare true is what admin_unlock returned before migration 0002. The
      // server has not been updated yet, so the code did work.
      'true' => const AdminUnlockResult.ok(),
      _ => const AdminUnlockResult.wrongCode(),
    };
  }

  final String status;

  final String message;

  bool get isSuccess => status == 'ok';

  /// True when retrying the same code cannot help until something changes.
  ///
  /// The screen stops inviting another attempt in these cases instead of
  /// letting the user burn through the throttle.
  bool get isRetryable =>
      status == 'wrong_code' || status == 'error' || status.isEmpty;
}

/// Whether an admin code exists on the server, and whether it is throttled.
class AdminAccessState {
  const AdminAccessState({
    required this.configured,
    required this.failedCount,
    required this.lockedOut,
  });

  final bool configured;

  final int failedCount;

  final bool lockedOut;
}
