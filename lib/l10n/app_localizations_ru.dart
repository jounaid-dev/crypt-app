// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Добро пожаловать';

  @override
  String get login => 'Войти';

  @override
  String get signup => 'Зарегистрироваться';

  @override
  String get settings => 'Настройки';

  @override
  String get chats => 'Чаты';

  @override
  String get typeMessage => 'Введите сообщение...';

  @override
  String get send => 'Отправить';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Подключение...';

  @override
  String get connectingP2p => 'Подключение к P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P не готов.';

  @override
  String get searchLanguage => 'Поиск языка...';

  @override
  String get language => 'Язык';

  @override
  String get forceEscapeSignOutTitle => 'ПРИНУДИТЕЛЬНЫЙ АВАРИЙНЫЙ ВЫХОД?';

  @override
  String get forceEscapeSignOutContent =>
      'ВНИМАНИЕ: Это действие полностью удалит все данные с этого устройства.';

  @override
  String get cancel => 'Отмена';

  @override
  String get wipeDevice => 'ОЧИСТИТЬ УСТРОЙСТВО';

  @override
  String get accountDestructionAlertTitle =>
      'ПРЕДУПРЕЖДЕНИЕ ОБ УДАЛЕНИИ АККАУНТА';

  @override
  String get accountDestructionWarning =>
      'ВНИМАНИЕ: Это действие удалит все ваши данные с этого устройства. После подключения к Интернету будет активирована команда удаленного самоуничтожения. Все сообщения, отправленные с вашего уникального ID пользователя, будут навсегда удалены из памяти всех пиров.';

  @override
  String get accountDestructionCriticalNotice =>
      'КРИТИЧЕСКИ ВАЖНО: Если вы неправильно введете эти проверочные цифры, система будет заблокирована. Чтобы разблокировать ее, необходимо ввести главный пароль аккаунта или использовать аварийный выход, который немедленно полностью очистит данные на этом устройстве.';

  @override
  String verificationSecurityKey(String code) {
    return 'Ключ безопасности проверки: $code';
  }

  @override
  String get copyDigitsHint => 'Скопируйте 5 цифр выше';

  @override
  String get codeMismatchNotice =>
      'Код не совпадает. Введите главный пароль для обхода блокировки или подождите 10 минут.';

  @override
  String get accountPasswordLabel => 'Пароль аккаунта';

  @override
  String get deleteEverythingPermanently => 'УДАЛИТЬ ВСЁ НАВСЕГДА';

  @override
  String get escapeAndPurgeDeviceData => 'Выйти и очистить данные устройства';

  @override
  String get addContact => 'Добавить контакт';

  @override
  String get addContactConfirmation => 'Добавить этот контакт?';

  @override
  String get noMessagesYet => 'Сообщений пока нет';

  @override
  String get addNewContact => 'Добавить новый контакт';

  @override
  String get usernameLabel => 'Имя пользователя';

  @override
  String get nicknameOptionalLabel => 'Псевдоним (необязательно)';

  @override
  String get add => 'Добавить';

  @override
  String get usernameCannotBeEmpty => 'Имя пользователя не может быть пустым';

  @override
  String contactAlreadyExists(String name) {
    return 'Контакт «$name» уже есть в вашей адресной книге.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Пользователь «$name» не найден в сетевом реестре. Невозможно создать общий секрет.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Контакт $name успешно добавлен!';
  }

  @override
  String get contacts => 'Контакты';

  @override
  String get noContactsYet => 'Контактов пока нет';

  @override
  String get securityLockoutActive => 'Активна блокировка безопасности';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Слишком много неверных попыток. Доступ заблокирован на $minutes мин.';
  }

  @override
  String get acknowledge => 'Понятно';

  @override
  String get accessBlocked => 'Доступ заблокирован';

  @override
  String accessSuspended(int minutes) {
    return '5 неверных проверок. Доступ приостановлен на следующие $minutes минут.';
  }

  @override
  String get ok => 'ОК';

  @override
  String unlockSecureNode(String username) {
    return 'Разблокировать защищенный узел: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Осталось попыток проверки: $count';
  }

  @override
  String get secureKeyPasscode => 'Код доступа к ключу безопасности';

  @override
  String get warningHardwareLockout =>
      'ВНИМАНИЕ: Следующая ошибка приведет к блокировке системы безопасности.';

  @override
  String get abort => 'Отмена';

  @override
  String get authenticate => 'Аутентифицировать';

  @override
  String get searchPipelinesHint => 'Поиск активных защищенных соединений...';

  @override
  String get zeroPipelinesDiscovered => 'Подходящих соединений не найдено.';

  @override
  String get processingDecryption => 'Расшифровка...';

  @override
  String get decrypting => 'Расшифровка...';

  @override
  String get decryptionError => '[Ошибка расшифровки]';

  @override
  String get cryptContainerSecure => 'КОНТЕЙНЕР CRYPT ЗАЩИЩЕН';

  @override
  String get connectAnAccount => 'Подключить аккаунт';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get enterMasterSecurityPassword =>
      'Введите главный пароль безопасности';

  @override
  String get pleaseFillAllFields => 'Пожалуйста, заполните все поля';

  @override
  String get wrongUsernameOrPassword => 'Неверное имя пользователя или пароль';

  @override
  String loginError(String error) {
    return 'Ошибка входа: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Нет аккаунта? Зарегистрироваться';

  @override
  String get myIdentity => 'Моя личность';

  @override
  String get scanToAddMe => 'Сканируйте, чтобы добавить меня';

  @override
  String get shareProfileLink => 'Поделиться ссылкой на профиль';

  @override
  String addMeOnCrypt(String link) {
    return 'Добавьте меня в CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Сканировать QR';

  @override
  String get invalidCryptQrFormat => 'Неверный формат QR-кода CRYPT.';

  @override
  String get userScanned => 'Пользователь отсканирован!';

  @override
  String addingUser(String username) {
    return 'Добавление $username...';
  }

  @override
  String get defaultUser => 'Пользователь';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get keepPasswordSecureHint =>
      'Храните его в безопасном месте. Пароль нельзя изменить.';

  @override
  String get pleaseFillInAllFields => 'Пожалуйста, заполните все поля';

  @override
  String get usernameExceedsLimit =>
      'Имя пользователя не может содержать более 20 символов';

  @override
  String get invalidUsernameCharacters =>
      'Имя пользователя может содержать только буквы, цифры, символы подчеркивания и дефисы';

  @override
  String get weakPasswordNotice =>
      'Пароль должен содержать не менее 8 символов, включая цифру и заглавную букву';

  @override
  String get unableToGenerateUniqueUsername =>
      'Не удалось создать уникальное имя пользователя.';

  @override
  String get accountCreated => 'Аккаунт создан';

  @override
  String yourUsernameIs(String username) {
    return 'Ваше имя пользователя:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Имя пользователя «$chosen» уже занято.\n\nВаше имя пользователя:\n\n$assigned\n\nЗапомните его. Оно понадобится для входа.';
  }

  @override
  String get continueText => 'Продолжить';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Не удалось создать защищенную личность: $error';
  }

  @override
  String get welcomeToCrypt => 'Добро пожаловать в CRYPT';

  @override
  String get signupDescription =>
      'Создайте имя пользователя и пароль для генерации ключей P2P-шифрования.';

  @override
  String get chooseAUsername => 'Выберите имя пользователя';

  @override
  String get usernameHelperText =>
      'Не используйте настоящее имя. Если имя пользователя уже занято, мы автоматически добавим уникальный суффикс.';

  @override
  String get masterAuthenticationRequired => 'Требуется главная аутентификация';

  @override
  String get verify => 'Проверить';

  @override
  String get darkThemeMode => 'Темная тема';

  @override
  String get secureConversations => 'Защищенные разговоры';

  @override
  String get noActiveConversations =>
      'Нет активных разговоров. Начните разговор, чтобы включить блокировки безопасности.';

  @override
  String get logout => 'Выйти';

  @override
  String get wipeDeviceAndEscape => 'ОЧИСТИТЬ УСТРОЙСТВО И ВЫЙТИ';

  @override
  String get falsePassword => 'Неверный пароль';

  @override
  String accessSuspendedTimer(String time) {
    return 'Доступ приостановлен в целях безопасности. Повторите попытку через $time.';
  }

  @override
  String get selectSecureLockMethod => 'Выберите способ безопасной блокировки';

  @override
  String get selectSecureLockDescription =>
      'Хотите заблокировать этот разговор с помощью отпечатка пальца устройства или стандартного 4-значного PIN-кода?';

  @override
  String get fourDigitPin => '4-значный PIN-код';

  @override
  String get fingerprintUnlock => 'Отпечаток пальца 🔓';

  @override
  String get supportSoloDeveloper => 'Поддержать независимого разработчика';

  @override
  String get maybeLater => 'Возможно, позже';

  @override
  String get submitProof => 'Отправить подтверждение';

  @override
  String get couldNotOpenWallet =>
      'Не удалось автоматически открыть кошелек. Скопируйте текстовый код ниже.';

  @override
  String get proofSubmittedSnackbar =>
      'Подтверждение отправлено. Ручная проверка занимает 24–48 часов (за исключением выходных). Вы можете продолжать пользоваться приложением в обычном режиме.';
}
