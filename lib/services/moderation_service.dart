import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/payment_proof.dart';
import '../models/report.dart';
import 'account_flags_service.dart';
import 'moderation_validation.dart';

/// User facing moderation actions: filing reports and submitting payment
/// proofs.
///
/// Everything here runs as the signed-in user and is constrained by the RLS
/// policies in supabase/migrations/0001_moderation.sql. No privileged action
/// is reachable from this class.
class ModerationService {
  ModerationService._();

  static final ModerationService instance = ModerationService._();

  static const String screenshotBucket = 'report-screenshots';
  static const String paymentProofBucket = 'payment-proofs';

  final SupabaseClient _supabase = Supabase.instance.client;
  final AccountFlagsService _flags = AccountFlagsService.instance;

  static const Uuid _uuid = Uuid();

  /// Files a bug or abuse report, uploading any screenshots first.
  ///
  /// Screenshots are written to a private bucket under a folder named after
  /// the reporting user, which is the only prefix the storage policy allows.
  Future<Report> submitReport({
    required ReportCategory category,
    required String details,
    String? reportedUsername,
    List<Uint8List> screenshots = const <Uint8List>[],
  }) async {
    final error = ModerationValidation.validateReport(
      details: details,
      reportedUsername: reportedUsername,
      screenshotCount: screenshots.length,
    );

    if (error != null) {
      throw ModerationException(error.message);
    }

    final me = await _flags.requireUsername();

    final reported = reportedUsername?.trim();

    final paths = <String>[];

    for (final bytes in screenshots) {
      paths.add(await _upload(
        bucket: screenshotBucket,
        owner: me,
        bytes: bytes,
        extension: 'png',
      ));
    }

    final response = await _supabase
        .from('reports')
        .insert({
          'reporter_username': me,
          'reported_username':
              (reported == null || reported.isEmpty) ? null : reported,
          'category': category.name,
          'details': details.trim(),
          'screenshots': paths,
        })
        .select()
        .single();

    return Report.fromJson(response);
  }

  /// Submits proof of a premium payment for manual review.
  Future<PaymentProof> submitPaymentProof({
    required String amountText,
    required String method,
    required String reference,
    required Uint8List proofImage,
    String? note,
  }) async {
    final error = ModerationValidation.validatePaymentProof(
      amountText: amountText,
      method: method,
      reference: reference,
      note: note,
    );

    if (error != null) {
      throw ModerationException(error.message);
    }

    if (proofImage.isEmpty) {
      throw ModerationException('Attach a photo of your payment receipt.');
    }

    final me = await _flags.requireUsername();

    final amount = ModerationValidation.trimmedAmount(amountText)!;

    final path = await _upload(
      bucket: paymentProofBucket,
      owner: me,
      bytes: proofImage,
      extension: 'png',
    );

    final response = await _supabase
        .from('payment_proofs')
        .insert({
          'username': me,
          'amount': amount,
          'method': method.trim(),
          'reference': reference.trim(),
          'note': note?.trim(),
          'proof_path': path,
        })
        .select()
        .single();

    return PaymentProof.fromJson(response);
  }

  /// Uploads bytes into a private bucket under `<owner>/`.
  Future<String> _upload({
    required String bucket,
    required String owner,
    required Uint8List bytes,
    required String extension,
  }) async {
    final path = '$owner/${_uuid.v4()}.$extension';

    await _supabase.storage.from(bucket).uploadBinary(
          path,
          bytes,
          fileOptions: const FileOptions(
            upsert: false,
            contentType: 'image/png',
          ),
        );

    return path;
  }
}

/// A moderation action that failed, with a message safe to show the user.
class ModerationException implements Exception {
  ModerationException(this.message);

  final String message;

  @override
  String toString() => message;
}
