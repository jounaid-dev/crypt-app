// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Ласкаво просимо';

  @override
  String get login => 'Увійти';

  @override
  String get signup => 'Реєстрація';

  @override
  String get settings => 'Налаштування';

  @override
  String get chats => 'Чати';

  @override
  String get typeMessage => 'Введіть повідомлення...';

  @override
  String get send => 'Надіслати';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Підключення...';

  @override
  String get connectingP2p => 'Підключення до P2P...';

  @override
  String get p2pConnectionNotReady => 'Pідключення P2P не готове.';

  @override
  String get searchLanguage => 'Пошук мови...';

  @override
  String get language => 'Мова';

  @override
  String get forceEscapeSignOutTitle => 'ПРИМУСОВИЙ АВАРІЙНИЙ ВИХІД?';

  @override
  String get forceEscapeSignOutContent =>
      'ПОПЕРЕДЖЕННЯ: Усі дані на пристрої буде стерто.';

  @override
  String get cancel => 'Скасувати';

  @override
  String get wipeDevice => 'Очистити пристрій';

  @override
  String get accountDestructionAlertTitle => 'ВИДАЛЕННЯ АКАУНТА';

  @override
  String get accountDestructionWarning =>
      'ПОПЕРЕДЖЕННЯ: Дані пристрою та віддалені повідомлення буде стерто.';

  @override
  String get accountDestructionCriticalNotice =>
      'КРИТИЧНО: Неправильні коди заблокують систему. Використайте пароль акаунта або аварійний вихід.';

  @override
  String verificationSecurityKey(String code) {
    return 'Ключ безпеки: $code';
  }

  @override
  String get copyDigitsHint => 'Скопіюйте 5 цифр вище';

  @override
  String get codeMismatchNotice =>
      'Код не збігається. Введіть головний пароль або зачекайте 10 хвилин.';

  @override
  String get accountPasswordLabel => 'Пароль акаунта';

  @override
  String get deleteEverythingPermanently => 'ВИДАЛИТИ ВСЕ НАЗАВЖДИ';

  @override
  String get escapeAndPurgeDeviceData => 'Вийти та очистити дані';

  @override
  String get addContact => 'Додати контакт';

  @override
  String get addContactConfirmation => 'Додати цей контакт?';

  @override
  String get noMessagesYet => 'Повідомлень поки немає';

  @override
  String get addNewContact => 'Новий контакт';

  @override
  String get usernameLabel => 'Ім\'я користувача';

  @override
  String get nicknameOptionalLabel => 'Псевдонім (необов\'язково)';

  @override
  String get add => 'Додати';

  @override
  String get usernameCannotBeEmpty => 'Ім\'я користувача обов\'язкове';

  @override
  String contactAlreadyExists(String name) {
    return 'Контакт «$name» уже існує.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Користувача «$name» не знайдено. Спільний секрет недоступний.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Контакт $name додано!';
  }

  @override
  String get contacts => 'Контакти';

  @override
  String get noContactsYet => 'Контактів поки немає';

  @override
  String get securityLockoutActive => 'Блокування безпеки';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Забагато спроб. Доступ заблоковано на $minutes хвилин.';
  }

  @override
  String get acknowledge => 'Зрозуміло';

  @override
  String get accessBlocked => 'Доступ заблоковано';

  @override
  String accessSuspended(int minutes) {
    return '5 невдалих спроб. Доступ призупинено на $minutes хвилин.';
  }

  @override
  String get ok => 'ОК';

  @override
  String unlockSecureNode(String username) {
    return 'Розблокувати: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Залишилося спроб: $count';
  }

  @override
  String get secureKeyPasscode => 'Код безпеки';

  @override
  String get warningHardwareLockout =>
      'Увага: наступна помилка спричинить блокування безпеки.';

  @override
  String get abort => 'Скасувати';

  @override
  String get authenticate => 'Автентифікація';

  @override
  String get searchPipelinesHint => 'Пошук захищених з\'єднань...';

  @override
  String get zeroPipelinesDiscovered => 'З\'єднань не знайдено.';

  @override
  String get processingDecryption => 'Розшифрування...';

  @override
  String get decrypting => 'Розшифрування...';

  @override
  String get decryptionError => '[Помилка розшифрування]';

  @override
  String get cryptContainerSecure => 'ЗАХИЩЕНИЙ КОНТЕЙНЕР CRYPT';

  @override
  String get connectAnAccount => 'Підключити акаунт';

  @override
  String get username => 'Ім\'я користувача';

  @override
  String get password => 'Пароль';

  @override
  String get enterMasterSecurityPassword => 'Введіть головний пароль';

  @override
  String get pleaseFillAllFields => 'Заповніть усі поля';

  @override
  String get wrongUsernameOrPassword =>
      'Неправильне ім\'я користувача або пароль';

  @override
  String loginError(String error) {
    return 'Помилка входу: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Немає акаунта? Зареєструватися';

  @override
  String get myIdentity => 'Моя особа';

  @override
  String get scanToAddMe => 'Скануйте, щоб додати мене';

  @override
  String get shareProfileLink => 'Поділитися профілем';

  @override
  String addMeOnCrypt(String link) {
    return 'Додайте мене в CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Сканувати QR';

  @override
  String get invalidCryptQrFormat => 'Недійсний QR-код CRYPT.';

  @override
  String get userScanned => 'Користувача відскановано!';

  @override
  String addingUser(String username) {
    return 'Додавання $username...';
  }

  @override
  String get defaultUser => 'Користувач';

  @override
  String get createAccount => 'Створити акаунт';

  @override
  String get keepPasswordSecureHint =>
      'Зберігайте його в безпеці. Пароль не можна змінити.';

  @override
  String get pleaseFillInAllFields => 'Заповніть усі поля';

  @override
  String get usernameExceedsLimit => 'Ім\'я користувача: максимум 20 символів';

  @override
  String get invalidUsernameCharacters =>
      'Використовуйте лише літери, цифри, _ або -.';

  @override
  String get weakPasswordNotice =>
      'Використовуйте 8+ символів, одну цифру та одну велику літеру.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Не вдалося створити унікальне ім\'я користувача.';

  @override
  String get accountCreated => 'Акаунт створено';

  @override
  String yourUsernameIs(String username) {
    return 'Ваше ім\'я користувача:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Ім\'я користувача «$chosen» уже зайняте.\n\nВаше ім\'я користувача:\n\n$assigned\n\nЗапам\'ятайте його для входу.';
  }

  @override
  String get continueText => 'Продовжити';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Не вдалося створити особу: $error';
  }

  @override
  String get welcomeToCrypt => 'Ласкаво просимо до CRYPT';

  @override
  String get signupDescription =>
      'Створіть ім\'я користувача та пароль для створення ключів P2P.';

  @override
  String get chooseAUsername => 'Виберіть ім\'я користувача';

  @override
  String get usernameHelperText =>
      'Не використовуйте справжнє ім\'я. Якщо ім\'я зайняте, буде додано унікальний суфікс.';

  @override
  String get masterAuthenticationRequired => 'Потрібна головна автентифікація';

  @override
  String get verify => 'Перевірити';

  @override
  String get darkThemeMode => 'Темний режим';

  @override
  String get secureConversations => 'Захищені розмови';

  @override
  String get noActiveConversations =>
      'Активних розмов не знайдено. Почніть розмову, щоб увімкнути блокування.';

  @override
  String get logout => 'Вийти';

  @override
  String get wipeDeviceAndEscape => 'ОЧИСТИТИ ПРИСТРІЙ';

  @override
  String get falsePassword => 'Неправильний пароль';

  @override
  String accessSuspendedTimer(String time) {
    return 'Доступ призупинено. Спробуйте ще раз через $time.';
  }

  @override
  String get selectSecureLockMethod => 'Вибрати спосіб блокування';

  @override
  String get selectSecureLockDescription =>
      'Заблокувати за допомогою відбитка пальця або 4-значного PIN-коду?';

  @override
  String get fourDigitPin => '4-значний PIN';

  @override
  String get fingerprintUnlock => 'Відбиток пальця 🔓';

  @override
  String get supportSoloDeveloper => 'Підтримати розробника';

  @override
  String get maybeLater => 'Можливо, пізніше';

  @override
  String get submitProof => 'Надіслати підтвердження';

  @override
  String get couldNotOpenWallet =>
      'Не вдалося відкрити гаманець. Скопіюйте код нижче.';

  @override
  String get proofSubmittedSnackbar =>
      'Підтвердження надіслано. Ручна перевірка: 24–48 годин (крім вихідних).';
}
