import 'package:flutter/material.dart';

import '../models/payment_proof.dart';
import '../models/report.dart';
import '../services/admin_service.dart';
import '../services/moderation_service.dart';

/// Moderation console: report queue, payment proof queue and user lookup.
///
/// Every action here goes through a Postgres function that re-checks
/// is_admin() server-side, so this page being reachable in a patched build
/// grants nothing.
class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  final AdminService _admin = AdminService.instance;

  bool _checking = true;
  bool _isAdmin = false;

  int _openReports = 0;
  int _pendingPayments = 0;

  @override
  void initState() {
    super.initState();
    _checkAdmin();
  }

  Future<void> _checkAdmin() async {
    bool allowed = false;

    try {
      allowed = await _admin.isAdmin();
    } catch (_) {
      allowed = false;
    }

    if (!mounted) return;

    setState(() {
      _isAdmin = allowed;
      _checking = false;
    });

    if (allowed) {
      _loadCounts();
    }
  }

  Future<void> _loadCounts() async {
    try {
      final counts = await _admin.pendingCounts();

      if (!mounted) return;

      setState(() {
        _openReports = counts.openReports;
        _pendingPayments = counts.pendingPayments;
      });
    } catch (_) {
      // A missing count is not worth interrupting the panel for.
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: _openReports > 0
                    ? 'Reports ($_openReports)'
                    : 'Reports',
              ),
              Tab(
                text: _pendingPayments > 0
                    ? 'Payments ($_pendingPayments)'
                    : 'Payments',
              ),
              const Tab(text: 'Users'),
            ],
          ),
        ),

        body: _checking
            ? const Center(child: CircularProgressIndicator())
            : !_isAdmin
                ? const _NotAuthorised()
                : const TabBarView(
                    children: [
                      _ReportsTab(),
                      _PaymentsTab(),
                      _UsersTab(),
                    ],
                  ),
      ),
    );
  }
}

class _NotAuthorised extends StatelessWidget {
  const _NotAuthorised();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          'This account is not an administrator.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// =============================================================================
// REPORTS
// =============================================================================

class _ReportsTab extends StatefulWidget {
  const _ReportsTab();

  @override
  State<_ReportsTab> createState() => _ReportsTabState();
}

class _ReportsTabState extends State<_ReportsTab> {
  final AdminService _admin = AdminService.instance;

  List<Report> _reports = <Report>[];
  ReportStatus? _filter;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final reports = await _admin.listReports(status: _filter);

      if (!mounted) return;

      setState(() {
        _reports = reports;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = 'Could not load reports.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _setStatus(Report report, ReportStatus status) async {
    try {
      await _admin.setReportStatus(
        reportId: report.id,
        status: status,
      );

      await _load();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not update the report.')),
      );
    }
  }

  Future<void> _banReporter(Report report) async {
    final reason = await _promptBanReason(context, report.reporterUsername);

    if (reason == null) return;

    try {
      await _admin.setBan(
        username: report.reporterUsername,
        banned: true,
        reason: reason,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Banned ${report.reporterUsername}.'),
        ),
      );

      await _load();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not ban that account.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final ReportStatus? status in <ReportStatus?>[
                  null,
                  ...ReportStatus.values,
                ])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(status?.name ?? 'all'),
                      selected: _filter == status,
                      onSelected: (_) {
                        setState(() {
                          _filter = status;
                        });
                        _load();
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),

        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_error!),
                          const SizedBox(height: 12),
                          FilledButton(
                            onPressed: _load,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    )
                  : _reports.isEmpty
                      ? const Center(child: Text('No reports.'))
                      : RefreshIndicator(
                          onRefresh: _load,
                          child: ListView.builder(
                            itemCount: _reports.length,
                            itemBuilder: (context, index) {
                              final report = _reports[index];

                              return Card(
                                margin: const EdgeInsets.all(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Chip(
                                            label: Text(report.category.name),
                                            visualDensity:
                                                VisualDensity.compact,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            report.status.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                          const Spacer(),
                                          Text(
                                            _shortDate(report.createdAt),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8),

                                      Text(
                                        'from ${report.reporterUsername}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),

                                      if (report.reportedUsername != null)
                                        Text(
                                          'about ${report.reportedUsername}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),

                                      const SizedBox(height: 8),

                                      Text(report.details),

                                      if (report.screenshots.isNotEmpty)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Wrap(
                                            spacing: 8,
                                            children: report.screenshots
                                                .map(
                                                  (path) =>
                                                      _Thumb(
                                                    bucket:
                                                        ModerationService
                                                            .screenshotBucket,
                                                    path: path,
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),

                                      const SizedBox(height: 8),

                                      Wrap(
                                        spacing: 8,
                                        children: [
                                          if (report.status ==
                                              ReportStatus.open)
                                            TextButton.icon(
                                              onPressed: () => _setStatus(
                                                report,
                                                ReportStatus.reviewing,
                                              ),
                                              icon: const Icon(
                                                Icons.visibility_outlined,
                                                size: 18,
                                              ),
                                              label: const Text('Review'),
                                            ),
                                          if (report.status ==
                                              ReportStatus.reviewing)
                                            TextButton.icon(
                                              onPressed: () => _setStatus(
                                                report,
                                                ReportStatus.resolved,
                                              ),
                                              icon: const Icon(
                                                Icons.check,
                                                size: 18,
                                              ),
                                              label: const Text('Resolve'),
                                            ),
                                          if (!report.isOpen)
                                            TextButton.icon(
                                              onPressed: () => _setStatus(
                                                report,
                                                ReportStatus.open,
                                              ),
                                              icon: const Icon(
                                                Icons.undo,
                                                size: 18,
                                              ),
                                              label: const Text('Reopen'),
                                            ),
                                          TextButton.icon(
                                            onPressed: () => _setStatus(
                                              report,
                                              ReportStatus.dismissed,
                                            ),
                                            icon: const Icon(
                                              Icons.close,
                                              size: 18,
                                            ),
                                            label: const Text('Dismiss'),
                                          ),
                                          TextButton.icon(
                                            onPressed: () =>
                                                _banReporter(report),
                                            icon: const Icon(
                                              Icons.block,
                                              size: 18,
                                            ),
                                            label: const Text('Ban'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
        ),
      ],
    );
  }
}

// =============================================================================
// PAYMENTS
// =============================================================================

class _PaymentsTab extends StatefulWidget {
  const _PaymentsTab();

  @override
  State<_PaymentsTab> createState() => _PaymentsTabState();
}

class _PaymentsTabState extends State<_PaymentsTab> {
  final AdminService _admin = AdminService.instance;

  List<PaymentProof> _proofs = <PaymentProof>[];
  PaymentProofStatus? _filter;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final proofs = await _admin.listPaymentProofs(status: _filter);

      if (!mounted) return;

      setState(() {
        _proofs = proofs;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = 'Could not load payment proofs.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _review(
    PaymentProof proof,
    PaymentProofStatus status,
  ) async {
    try {
      await _admin.reviewPaymentProof(
        proofId: proof.id,
        status: status,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            status == PaymentProofStatus.approved
                ? 'Approved. Premium is now on for ${proof.username}.'
                : 'Rejected.',
          ),
        ),
      );

      await _load();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not review that proof.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final PaymentProofStatus? status
                    in <PaymentProofStatus?>[null, ...PaymentProofStatus.values])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(status?.name ?? 'all'),
                      selected: _filter == status,
                      onSelected: (_) {
                        setState(() {
                          _filter = status;
                        });
                        _load();
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),

        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_error!),
                          const SizedBox(height: 12),
                          FilledButton(
                            onPressed: _load,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    )
                  : _proofs.isEmpty
                      ? const Center(child: Text('No payment proofs.'))
                      : RefreshIndicator(
                          onRefresh: _load,
                          child: ListView.builder(
                            itemCount: _proofs.length,
                            itemBuilder: (context, index) {
                              final proof = _proofs[index];

                              return Card(
                                margin: const EdgeInsets.all(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            proof.username,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Spacer(),
                                          Chip(
                                            label: Text(proof.status.name),
                                            visualDensity:
                                                VisualDensity.compact,
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        '${proof.amount.toStringAsFixed(2)}'
                                        '  via ${proof.method}',
                                      ),

                                      Text('ref: ${proof.reference}'),

                                      if (proof.note != null &&
                                          proof.note!.isNotEmpty)
                                        Text('note: ${proof.note}'),

                                      const SizedBox(height: 8),

                                      _Thumb(
                                        bucket: ModerationService
                                            .paymentProofBucket,
                                        path: proof.proofPath,
                                      ),

                                      if (proof.isPending) ...[
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: FilledButton.icon(
                                                onPressed: () => _review(
                                                  proof,
                                                  PaymentProofStatus
                                                      .approved,
                                                ),
                                                icon: const Icon(
                                                  Icons.check,
                                                  size: 18,
                                                ),
                                                label: const Text(
                                                  'Approve',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: OutlinedButton.icon(
                                                onPressed: () => _review(
                                                  proof,
                                                  PaymentProofStatus
                                                      .rejected,
                                                ),
                                                icon: const Icon(
                                                  Icons.close,
                                                  size: 18,
                                                ),
                                                label: const Text(
                                                  'Reject',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],

                                      if (proof.reviewedAt != null) ...[
                                        const SizedBox(height: 6),
                                        Text(
                                          'reviewed '
                                          '${_shortDate(proof.reviewedAt!)}'
                                          '${proof.reviewedBy == null ? '' : ' by ${proof.reviewedBy}'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
        ),
      ],
    );
  }
}

// =============================================================================
// USERS
// =============================================================================

class _UsersTab extends StatefulWidget {
  const _UsersTab();

  @override
  State<_UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<_UsersTab> {
  final AdminService _admin = AdminService.instance;
  final TextEditingController _searchController = TextEditingController();

  List<AdminUserSummary> _users = <AdminUserSummary>[];
  bool _loading = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _search([String? query]) async {
    setState(() {
      _loading = true;
    });

    try {
      final users = await _admin.searchUsers(query: query);

      if (!mounted) return;

      setState(() {
        _users = users;
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not search users.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _search();
  }

  Future<void> _togglePremium(AdminUserSummary user) async {
    try {
      await _admin.setPremium(
        username: user.username,
        premium: !user.isPremium,
      );

      await _search(_searchController.text);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            user.isPremium
                ? 'Premium removed from ${user.username}.'
                : 'Premium enabled for ${user.username}.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not change premium.')),
      );
    }
  }

  Future<void> _toggleBan(AdminUserSummary user) async {
    String? reason;

    if (!user.isBanned) {
      reason = await _promptBanReason(context, user.username);

      if (reason == null) return;
    }

    try {
      await _admin.setBan(
        username: user.username,
        banned: !user.isBanned,
        reason: reason,
      );

      await _search(_searchController.text);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            user.isBanned
                ? 'Unbanned ${user.username}.'
                : 'Banned ${user.username}.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not change the ban. An admin cannot ban themselves.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onSubmitted: _search,
            decoration: InputDecoration(
              hintText: 'Search username',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => _search(_searchController.text),
              ),
            ),
          ),
        ),

        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _users.isEmpty
                  ? const Center(child: Text('No users found.'))
                  : RefreshIndicator(
                      onRefresh: () => _search(_searchController.text),
                      child: ListView.builder(
                        itemCount: _users.length,
                        itemBuilder: (context, index) {
                          final user = _users[index];

                          return ListTile(
                            title: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    user.username,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (user.isAdmin)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 6),
                                    child: Icon(
                                      Icons.shield_outlined,
                                      size: 16,
                                    ),
                                  ),
                              ],
                            ),
                            subtitle: Text(
                              user.isBanned
                                  ? 'banned'
                                      '${user.bannedReason == null ? '' : ': ${user.bannedReason}'}'
                                  : user.isPremium
                                      ? 'premium'
                                      : 'free',
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: user.isPremium
                                      ? 'Remove premium'
                                      : 'Enable premium',
                                  icon: Icon(
                                    user.isPremium
                                        ? Icons.workspace_premium
                                        : Icons.workspace_premium_outlined,
                                  ),
                                  onPressed: () => _togglePremium(user),
                                ),
                                IconButton(
                                  tooltip: user.isBanned
                                      ? 'Unban'
                                      : 'Ban',
                                  icon: Icon(
                                    user.isBanned
                                        ? Icons.block
                                        : Icons.block_outlined,
                                  ),
                                  onPressed: () => _toggleBan(user),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}

// =============================================================================
// SHARED BITS
// =============================================================================

/// Private attachment preview. The URL is minted by the server on demand and
/// expires after five minutes.
class _Thumb extends StatefulWidget {
  const _Thumb({required this.bucket, required this.path});

  final String bucket;
  final String path;

  @override
  State<_Thumb> createState() => _ThumbState();
}

class _ThumbState extends State<_Thumb> {
  String? _url;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final url = await AdminService.instance.signedUrl(
        bucket: widget.bucket,
        path: widget.path,
      );

      if (!mounted) return;

      setState(() {
        _url = url;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _failed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_failed) {
      return const SizedBox(
        height: 40,
        child: Text('Attachment unavailable'),
      );
    }

    if (_url == null) {
      return const SizedBox(
        height: 80,
        width: 80,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        _url!,
        height: 80,
        width: 80,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const SizedBox(
          height: 80,
          width: 80,
          child: Icon(Icons.broken_image_outlined),
        ),
      ),
    );
  }
}

Future<String?> _promptBanReason(
  BuildContext context,
  String username,
) async {
  final TextEditingController controller = TextEditingController();

  final String? reason = await showDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text('Ban $username'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bans are reversible and keep the account data.',
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Reason'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(dialogContext, controller.text),
          child: const Text('Ban'),
        ),
      ],
    ),
  );

  controller.dispose();

  return reason;
}

String _shortDate(DateTime value) {
  final String month = value.month.toString().padLeft(2, '0');
  final String day = value.day.toString().padLeft(2, '0');

  return '${value.year}-$month-$day';
}
