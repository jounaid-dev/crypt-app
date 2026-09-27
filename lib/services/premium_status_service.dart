import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/payment_proof.dart';

/// The signed-in user's own premium standing, used to tell them what is
/// happening with a submitted payment.
class PremiumStatusService {
  PremiumStatusService._();

  static final PremiumStatusService instance = PremiumStatusService._();

  final SupabaseClient _supabase = Supabase.instance.client;

  /// The user's own payment proofs, newest first.
  ///
  /// Reads directly rather than through an admin function: the RLS policy on
  /// payment_proofs lets a user see their own rows.
  Future<List<PaymentProof>> _myPaymentProofs() async {
    final response = await _supabase.rpc('current_username');

    final username = response?.toString();

    if (username == null || username.isEmpty) {
      return <PaymentProof>[];
    }

    final rows = await _supabase
        .from('payment_proofs')
        .select()
        .eq('username', username)
        .order('created_at', ascending: false);

    return (rows as List)
        .map((e) => PaymentProof.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  /// True when a proof is waiting for an administrator.
  Future<bool> hasPendingProof() async {
    final proofs = await _myPaymentProofs();

    return proofs.any((p) => p.isPending);
  }
}
