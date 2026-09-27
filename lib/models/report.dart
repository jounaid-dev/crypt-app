/// What a report is about.
enum ReportCategory {
  bug,
  abuse,
  spam,
  other;

  static ReportCategory fromName(String? value) {
    return ReportCategory.values.firstWhere(
      (c) => c.name == value,
      orElse: () => ReportCategory.other,
    );
  }
}

/// Where a report is in the moderation queue.
enum ReportStatus {
  open,
  reviewing,
  resolved,
  dismissed;

  static ReportStatus fromName(String? value) {
    return ReportStatus.values.firstWhere(
      (s) => s.name == value,
      orElse: () => ReportStatus.open,
    );
  }
}

/// A user submitted bug report or abuse report.
class Report {
  const Report({
    required this.id,
    required this.reporterUsername,
    required this.category,
    required this.details,
    required this.createdAt,
    this.reportedUsername,
    this.screenshots = const <String>[],
    this.status = ReportStatus.open,
    this.adminNote,
    this.resolvedAt,
    this.resolvedBy,
  });

  final String id;
  final String reporterUsername;
  final String? reportedUsername;
  final ReportCategory category;
  final String details;
  final List<String> screenshots;
  final ReportStatus status;
  final String? adminNote;
  final DateTime createdAt;
  final DateTime? resolvedAt;
  final String? resolvedBy;

  bool get isOpen => status == ReportStatus.open ||
      status == ReportStatus.reviewing;

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json["id"]?.toString() ?? "",
      reporterUsername: json["reporter_username"]?.toString() ?? "",
      reportedUsername: json["reported_username"]?.toString(),
      category: ReportCategory.fromName(json["category"]?.toString()),
      details: json["details"]?.toString() ?? "",
      screenshots: (json["screenshots"] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          const <String>[],
      status: ReportStatus.fromName(json["status"]?.toString()),
      adminNote: json["admin_note"]?.toString(),
      createdAt:
          DateTime.tryParse(json["created_at"]?.toString() ?? "") ??
              DateTime.fromMillisecondsSinceEpoch(0),
      resolvedAt: DateTime.tryParse(json["resolved_at"]?.toString() ?? ""),
      resolvedBy: json["resolved_by"]?.toString(),
    );
  }
}

/// Why a submission was refused before it ever reached the network.
enum ReportValidationError {
  tooShort,
  detailsTooLong,
  invalidReportedUsername,
  tooManyScreenshots,
  empty,
}

extension ReportValidationErrorMessage on ReportValidationError {
  String get message {
    switch (this) {
      case ReportValidationError.tooShort:
        return 'Please describe the problem in at least 10 characters.';
      case ReportValidationError.detailsTooLong:
        return 'Please keep the description under 4000 characters.';
      case ReportValidationError.invalidReportedUsername:
        return 'That username contains characters that are not allowed.';
      case ReportValidationError.tooManyScreenshots:
        return 'You can attach at most 4 screenshots.';
      case ReportValidationError.empty:
        return 'Nothing to report.';
    }
  }
}
