import 'package:crypt_messenger/services/message_service.dart';
import 'package:flutter_test/flutter_test.dart';

/// Regression cover for message writes wedging the whole app.
///
/// Message writes are serialised through one shared queue. If a write that
/// fails completes the queue with its error, the next writer throws while
/// waiting for the queue and never completes its own completer. Every write
/// after that then waits on a future that can never finish, so the app stops
/// persisting messages indefinitely. The queue is process wide, so the freeze
/// was permanent: signing out, navigating and restarting the screen did not
/// help, and the only recovery was killing the app.
///
/// A user reported messages taking minutes to appear. This is the cause.
void main() {
  setUp(MessageService.resetForTest);

  group('write queue sequencing', () {
    test('runs queued operations in order', () async {
      final List<int> order = <int>[];

      final Future<void> first = MessageService.runQueuedForTest(() async {
        await Future<void>.delayed(const Duration(milliseconds: 20));
        order.add(1);
      });

      final Future<void> second = MessageService.runQueuedForTest(() async {
        order.add(2);
      });

      await Future.wait(<Future<void>>[first, second]);

      expect(order, <int>[1, 2]);
    });

    test('a failing write still releases the queue', () async {
      await expectLater(
        MessageService.runQueuedForTest(() async {
          throw StateError('write failed');
        }),
        throwsStateError,
      );

      // The next write must run rather than wait forever. A generous timeout
      // turns a wedged queue into a test failure instead of a hang.
      var ran = false;

      await MessageService.runQueuedForTest(() async {
        ran = true;
      }).timeout(const Duration(seconds: 5));

      expect(ran, isTrue);
    });

    test('keeps working across many writes after a failure', () async {
      for (int i = 0; i < 3; i++) {
        await expectLater(
          MessageService.runQueuedForTest(() async {
            throw StateError('repeated failure $i');
          }),
          throwsStateError,
        );
      }

      final List<int> completed = <int>[];

      for (int i = 0; i < 20; i++) {
        final int index = i;

        await MessageService.runQueuedForTest(() async {
          completed.add(index);
        }).timeout(const Duration(seconds: 5));
      }

      expect(completed, List<int>.generate(20, (int i) => i));
    });

    test('failures and successes interleave without stalling', () async {
      for (int i = 0; i < 10; i++) {
        final int index = i;

        if (index.isEven) {
          await expectLater(
            MessageService.runQueuedForTest(() async {
              throw StateError('even $index');
            }),
            throwsStateError,
          );
        } else {
          await MessageService.runQueuedForTest(() async {}).timeout(
            const Duration(seconds: 5),
          );
        }
      }
    });
  });
}