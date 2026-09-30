import 'package:crypt_messenger/l10n/app_localizations.dart';
import 'package:crypt_messenger/widgets/pin_entry_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Regression cover for the red screen reported when tapping a chat lock.
///
/// The failure was `Failed assertion: line 6281 pos 12: 'dependents.isEmpty'`,
/// thrown by Flutter when an element was torn down while something still
/// depended on it. Two things in the old PIN dialog caused it:
///
///   1. The [TextEditingController] was disposed by the caller the instant
///      `showDialog` returned, which is before the dismissed dialog has
///      finished animating out, so the text field was still attached to a
///      disposed controller.
///   2. `controller.text` was reassigned from inside `onChanged` to strip
///      non digits, re-entering the text field's own listener mid-update.
///
/// The dialog now owns its controller and disposes it in its own `dispose`,
/// and filters input with a formatter instead. Opening and dismissing it, and
/// typing into it, must not throw.
void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: Builder(builder: (_) => child)),
    );
  }

  Future<String?> showPinDialog(WidgetTester tester) async {
    String? result;

    await tester.pumpWidget(
      wrap(
        Builder(
          builder: (context) {
            return TextButton(
              onPressed: () async {
                result = await showDialog<String>(
                  context: context,
                  builder: (_) => const PinEntryDialog(
                    title: 'Set a PIN for alex',
                    helper: 'This PIN opens this chat only.',
                  ),
                );
              },
              child: const Text('open'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    return result;
  }

  testWidgets('opening the PIN dialog does not throw', (tester) async {
    await showPinDialog(tester);

    expect(find.text('Set a PIN for alex'), findsOneWidget);
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('accepts four digits and returns them', (tester) async {
    String? returned;

    await tester.pumpWidget(
      wrap(
        Builder(
          builder: (context) {
            return TextButton(
              onPressed: () async {
                returned = await showDialog<String>(
                  context: context,
                  builder: (_) => const PinEntryDialog(
                    title: 'Set a PIN for alex',
                    helper: 'helper',
                  ),
                );
              },
              child: const Text('open'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '1234');
    await tester.pump();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(returned, '1234');
    expect(tester.takeException(), isNull);
  });

  testWidgets('rejects a short PIN and stays open', (tester) async {
    await showPinDialog(tester);

    await tester.enterText(find.byType(TextField), '12');
    await tester.pump();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Still on screen, complaining, and nothing was thrown while it did so.
    expect(find.text('Enter exactly 4 digits.'), findsOneWidget);
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'dismissing mid-animation does not throw '
    'the dependents.isEmpty assertion',
    (tester) async {
      await showPinDialog(tester);

      await tester.enterText(find.byType(TextField), '12');
      await tester.pump();

      // Cancel, then advance only part of the way through the dismissal so the
      // dialog is still animating out. This is the window in which the old code
      // disposed the controller too early.
      await tester.tap(find.text('Cancel'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));

      expect(tester.takeException(), isNull);

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('typing does not throw from the input formatter', (
    tester,
  ) async {
    await showPinDialog(tester);

    // Letters are filtered out rather than written back to the controller.
    await tester.enterText(find.byType(TextField), 'ab12cd3456');
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    expect(tester.takeException(), isNull);
  });
}