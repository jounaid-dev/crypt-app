import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class BetaIntroPage extends StatefulWidget {
  const BetaIntroPage({super.key});

  @override
  State<BetaIntroPage> createState() => _BetaIntroPageState();
}

class _BetaIntroPageState extends State<BetaIntroPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _acknowledge() async {
    setState(() {
      _saving = true;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('beta_intro_acknowledged', true);

    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.beforeYouStart),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: CustomPaint(
                        painter: _WalkieTalkiePainter(
                          progress: _animationController.value,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: const SizedBox.expand(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _animationController.value > 0.65
                          ? l10n.connected
                          : l10n.connectFirstThenChat,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              l10n.betaIntro,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.walkieTalkieExplanation,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.howToUseCrypt,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.messageStorageExplanation,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.settingsAndSupportExplanation,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saving ? null : _acknowledge,
              child: Text(
                _saving ? l10n.saving : l10n.continueToCrypt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WalkieTalkiePainter extends CustomPainter {
  final double progress;
  final Color color;

  const _WalkieTalkiePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final fill = Paint()..color = color.withValues(alpha: 0.12);
    final centerY = size.height * 0.55;
    final left = Offset(size.width * 0.25, centerY);
    final right = Offset(size.width * 0.75, centerY);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: left, width: 42, height: 78),
        const Radius.circular(8),
      ),
      fill,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: left, width: 42, height: 78),
        const Radius.circular(8),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: right, width: 42, height: 78),
        const Radius.circular(8),
      ),
      fill,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: right, width: 42, height: 78),
        const Radius.circular(8),
      ),
      paint,
    );

    canvas.drawLine(
      Offset(left.dx, centerY - 39),
      Offset(left.dx + 10, centerY - 57),
      paint,
    );
    canvas.drawLine(
      Offset(right.dx, centerY - 39),
      Offset(right.dx - 10, centerY - 57),
      paint,
    );

    final signalPaint = Paint()
      ..color = color.withValues(alpha: 0.25 + progress * 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    for (var i = 0; i < 3; i++) {
      final inset = i * 12.0;
      final arcRect = Rect.fromCenter(
        center: Offset(size.width / 2, centerY),
        width: 70 + inset,
        height: 70 + inset,
      );
      canvas.drawArc(
        arcRect,
        math.pi * (1.15 - progress * 0.2),
        math.pi * (0.7 + progress * 0.25),
        false,
        signalPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_WalkieTalkiePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
