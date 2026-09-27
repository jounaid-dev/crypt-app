import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/report.dart';
import '../services/moderation_service.dart';
import '../services/moderation_validation.dart';

/// Lets a user file a bug or abuse report, optionally naming another user and
/// attaching screenshots.
class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _reportedController = TextEditingController();

  final List<Uint8List> _screenshots = <Uint8List>[];

  ReportCategory _category = ReportCategory.bug;

  bool _submitting = false;

  @override
  void dispose() {
    _detailsController.dispose();
    _reportedController.dispose();
    super.dispose();
  }

  Future<void> _addScreenshot() async {
    if (_screenshots.length >= ModerationValidation.maxScreenshots) {
      return;
    }

    final ImagePicker picker = ImagePicker();

    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 85,
    );

    if (picked == null) return;

    final Uint8List bytes = await picked.readAsBytes();

    if (!mounted) return;

    setState(() {
      _screenshots.add(bytes);
    });
  }

  Future<void> _submit() async {
    if (_submitting) return;

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final String reported = _reportedController.text.trim();

    final error = ModerationValidation.validateReport(
      details: _detailsController.text,
      reportedUsername: reported,
      screenshotCount: _screenshots.length,
    );

    if (error != null) {
      _showError(error.message);
      return;
    }

    setState(() {
      _submitting = true;
    });

    try {
      await ModerationService.instance.submitReport(
        category: _category,
        details: _detailsController.text,
        reportedUsername: reported.isEmpty ? null : reported,
        screenshots: _screenshots,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Report sent. Thank you.'),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      _showError(
        e is ModerationException ? e.message : 'Could not send the report.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Report a problem')),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            children: [
              Text(
                'Tell us what happened. If you are reporting another person, '
                'add their username so we can act on the right account.',
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              Text('Type of report', style: theme.textTheme.titleSmall),

              const SizedBox(height: 8),

              // ======================================================
              // REPORT TYPE
              //
              // Four segments share the width of the screen, so a long word
              // like "SPAM" used to break mid-word into "SPA" / "M" and
              // "ABUSE" into "ABU" / "SE". The labels are pinned to a single
              // line and given a smaller size, and the segments are compacted
              // so the text has room to sit on one line.
              // ======================================================
              SegmentedButton<ReportCategory>(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 6),
                  ),
                  textStyle: WidgetStatePropertyAll<TextStyle>(
                    TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                segments: const [
                  ButtonSegment(
                    value: ReportCategory.bug,
                    label: _SegmentLabel('Bug', Icons.bug_report_outlined),
                  ),
                  ButtonSegment(
                    value: ReportCategory.abuse,
                    label: _SegmentLabel(
                      'Abuse',
                      Icons.gavel_outlined,
                    ),
                  ),
                  ButtonSegment(
                    value: ReportCategory.spam,
                    label: _SegmentLabel(
                      'Spam',
                      Icons.campaign_outlined,
                    ),
                  ),
                  ButtonSegment(
                    value: ReportCategory.other,
                    label: _SegmentLabel('Other', Icons.more_horiz),
                  ),
                ],
                selected: <ReportCategory>{_category},
                onSelectionChanged: (value) {
                  setState(() {
                    _category = value.first;
                  });
                },
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: _reportedController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Their username (optional)',
                  hintText: 'e.g. someone_you_want_reported',
                ),
                validator: (value) {
                  final text = value?.trim() ?? '';

                  if (text.isEmpty) return null;

                  if (!ModerationValidation.isValidUsername(text)) {
                    return ReportValidationError
                        .invalidReportedUsername.message;
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _detailsController,
                minLines: 5,
                maxLines: 10,
                maxLength: ModerationValidation.maxDetailsLength,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  labelText: 'What happened?',
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  final error = ModerationValidation.validateReport(
                    details: value ?? '',
                    reportedUsername: _reportedController.text,
                  );

                  return error?.message;
                },
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Text(
                    'Screenshots',
                    style: theme.textTheme.titleSmall,
                  ),

                  const Spacer(),

                  Text(
                    '${_screenshots.length}/'
                    '${ModerationValidation.maxScreenshots}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),

              const SizedBox(height: 8),

              if (_screenshots.isNotEmpty)
                SizedBox(
                  height: 84,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _screenshots.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(
                              _screenshots[index],
                              width: 84,
                              height: 84,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _screenshots.removeAt(index);
                                });
                              },
                              child: const CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.black54,
                                child: Icon(
                                  Icons.close,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: _screenshots.length >=
                        ModerationValidation.maxScreenshots
                    ? null
                    : _addScreenshot,
                icon: const Icon(Icons.add_photo_alternate_outlined),
                label: const Text('Add screenshot'),
              ),

              const SizedBox(height: 28),

              FilledButton(
                onPressed: _submitting ? null : _submit,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: _submitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Send report'),
              ),

              const SizedBox(height: 12),

              Text(
                'Reports are reviewed by an administrator. Screenshots are '
                'stored privately and are only visible to moderators.',
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One option inside the report type selector.
///
/// A word that cannot fit the available width is broken mid-word by Flutter,
/// so the label opts out of wrapping and shrinks slightly before it will ever
/// be cut off. The shrink is the last resort: at the normal width the text
/// renders at full size.
class _SegmentLabel extends StatelessWidget {
  final String text;

  final IconData icon;

  const _SegmentLabel(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),

          const SizedBox(width: 4),

          Text(
            text,
            maxLines: 1,
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
