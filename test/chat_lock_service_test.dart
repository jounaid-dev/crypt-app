import 'package:crypt_messenger/services/chat_lock_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Guards the contract Settings relies on to render the "Secure conversations"
/// checkboxes.
///
/// Settings used to write its own `locked_conversation_ids` list and
/// `lock_type_$chatId` string, neither of which this service ever read, so a
/// chat could be ticked in the UI and still open with no prompt. These tests
/// pin the single source of truth that replaces that.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const String chatId = 'conversation-1';
  const String otherChatId = 'conversation-2';

  late ChatLockService service;

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    service = ChatLockService();
  });

  group('lock state', () {
    test('a fresh conversation is not locked', () async {
      expect(await service.hasPasscode(chatId), isFalse);
      expect(await service.getLockType(chatId), isNull);
    });

    test('setting a passcode makes the conversation locked', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: '1234',
      );

      expect(await service.hasPasscode(chatId), isTrue);
      expect(await service.isLocked(chatId), isTrue);
    });

    test('locks are stored as a hash, never as the passcode', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: '1234',
      );

      final SharedPreferences prefs =
          await SharedPreferences.getInstance();

      final String? hash = prefs.getString('chat_passcode_hash_$chatId');
      final String? salt = prefs.getString('chat_passcode_salt_$chatId');

      expect(hash, isNotNull);
      expect(salt, isNotNull);
      expect(hash, isNot(contains('1234')));
      expect(salt, isNot(contains('1234')));
    });

    test('removing the passcode unlocks the conversation', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: '1234',
      );

      await service.removePasscode(chatId);

      expect(await service.hasPasscode(chatId), isFalse);
      expect(await service.getLockType(chatId), isNull);
      expect(await service.isLocked(chatId), isFalse);
    });

    test('an empty passcode is rejected', () async {
      // setPasscode is async, so the ArgumentError arrives through the returned
      // Future rather than being thrown synchronously.
      await expectLater(
        service.setPasscode(
          conversationId: chatId,
          passcode: '',
        ),
        throwsArgumentError,
      );
    });
  });

  group('lock type', () {
    test('defaults to a PIN when no type was recorded', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: '1234',
      );

      expect(await service.getLockType(chatId), ChatLockService.lockTypePin);
    });

    test('remembers a biometric lock', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: 'a-random-secret',
        lockType: ChatLockService.lockTypeBiometric,
      );

      expect(
        await service.getLockType(chatId),
        ChatLockService.lockTypeBiometric,
      );
    });

    test('clears the type when the lock is removed', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: 'a-random-secret',
        lockType: ChatLockService.lockTypeBiometric,
      );

      await service.removePasscode(chatId);

      final SharedPreferences prefs =
          await SharedPreferences.getInstance();

      expect(prefs.getString('chat_lock_type_$chatId'), isNull);
    });
  });

  group('per conversation isolation', () {
    test('locking one conversation leaves the others unlocked', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: '1234',
      );

      expect(await service.hasPasscode(chatId), isTrue);
      expect(await service.hasPasscode(otherChatId), isFalse);
    });

    test('unlocking one leaves the other locked', () async {
      await service.setPasscode(
        conversationId: chatId,
        passcode: '1234',
      );

      await service.setPasscode(
        conversationId: otherChatId,
        passcode: '5678',
      );

      await service.removePasscode(chatId);

      expect(await service.hasPasscode(chatId), isFalse);
      expect(await service.hasPasscode(otherChatId), isTrue);
    });
  });
}
