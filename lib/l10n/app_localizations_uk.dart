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
  String get termsAndConditions => 'Умови використання';

  @override
  String get settingsTermsAndConditions => 'Умови використання';

  @override
  String get termsIntro =>
      'CRYPT — це застосунок на ранній стадії для прямого спілкування людей. Ви відповідаєте за належне використання застосунку та безпеку даних свого облікового запису.';

  @override
  String get termsConnectivity =>
      'CRYPT використовує онлайн-сервіси, щоб пристрої могли знаходити один одного та встановлювати з\'єднання. Доступність і поведінка з\'єднання можуть змінюватися в міру розвитку застосунку. Не покладайтеся на CRYPT як на єдиний засіб зв\'язку.';

  @override
  String get termsAgreement =>
      'Продовжуючи, ви підтверджуєте, що прочитали ці умови та погоджуєтеся користуватися CRYPT відповідно до них.';

  @override
  String get agreeTerms => 'Я погоджуюся з умовами використання';

  @override
  String get agreeAndContinue => 'Погодитися та продовжити';

  @override
  String get beforeYouStart => 'Перед початком';

  @override
  String get connected => 'З\'єднано';

  @override
  String get connectFirstThenChat => 'Спочатку з\'єднайтеся, потім спілкуйтеся';

  @override
  String get betaIntro =>
      'CRYPT — це рання бета-версія, тому робота застосунку може покращуватися в майбутніх версіях.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT працює як рація: обидві людини мають бути онлайн і одночасно відкрити CRYPT, щоб встановити з\'єднання.';

  @override
  String get howToUseCrypt =>
      'Як користуватися CRYPT:\n1. Відскануйте CRYPT QR-код іншої людини.\n2. Обидва користувачі мають відкрити CRYPT і бути онлайн.\n3. Зачекайте, поки CRYPT встановить P2P-з\'єднання.\n4. Дочекайтеся зникнення стану «Підключення...» і встановлення з\'єднання.\n5. Після з\'єднання можна почати спілкування.';

  @override
  String get messageStorageExplanation =>
      'Ваші повідомлення мають передаватися безпосередньо між з\'єднаними пристроями. CRYPT не зберігає чати на наших серверах. Сервер наразі допомагає зі з\'єднанням і сигналізацією, але історія чатів на ньому не зберігається. Якщо інша людина офлайн, поточне P2P-з\'єднання встановити неможливо.';

  @override
  String get settingsAndSupportExplanation =>
      'Відкрийте налаштування, щоб налаштувати CRYPT. Незабаром з\'явиться більше параметрів.\n\nХочете підтримати CRYPT? Опцію пожертви можна знайти в налаштуваннях.';

  @override
  String get saving => 'Збереження...';

  @override
  String get continueToCrypt => 'Продовжити до CRYPT';

  @override
  String get showSplashScreen => 'Показувати заставку';

  @override
  String get retry => 'Повторити';

  @override
  String get connectionFailed => 'Не вдалося з\'єднатися';

  @override
  String get connectionFailedDetails =>
      'Не вдалося з\'єднатися. Для з\'єднання обидва пристрої мають бути онлайн із відкритим CRYPT.';

  @override
  String get gallery => 'Галерея';

  @override
  String get alignQrCode => 'ВИРІВНЯЙТЕ QR-КОД';

  @override
  String get scanFromGallery => 'СКАНУВАТИ З ГАЛЕРЕЇ';

  @override
  String get couldNotScanImage => 'Не вдалося просканувати зображення.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Не вдалося поділитися QR-кодом: $error';
  }

  @override
  String newContact(String username) {
    return 'Новий контакт: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Відсутній ваш відкритий ключ шифрування.';

  @override
  String get contactEncryptionKeyMissing =>
      'Відсутній ключ шифрування контакту.';

  @override
  String get localEncryptionKeyMissing =>
      'Відсутній локальний ключ шифрування.';

  @override
  String get noQrCodeFound => 'У цьому зображенні не знайдено QR-коду.';

  @override
  String get shareQrCode => 'Поділитися QR-кодом';

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
  String get supportIntro =>
      'привіт! 👋 Я окремий розробник, наполегливо працюю над CRYPT. У мене немає ні бюджету, ні корпоративного фінансування. Я повністю покладаюся на вашу чесність і співчуття, щоб продовжувати вдосконалювати додаток і гарантувати БЕЗ РЕКЛАМИ НАЗАВЖДИ.';

  @override
  String get chooseSupportAmount =>
      'Виберіть свою ціну (проведіть пальцем, щоб підтримати):';

  @override
  String get poorGang => 'Я бідна група 🥀✌️';

  @override
  String get launchOfferMinimum => 'Мінімальна пропозиція запуску 🚀';

  @override
  String get buyMeCoffee => 'Купи мені каву ☕';

  @override
  String get superSupporter => 'Супер прихильник🔥';

  @override
  String get feature => 'Особливість';

  @override
  String get freeTier => 'Вільний рівень';

  @override
  String get premium => 'Преміум';

  @override
  String get chatLocks => 'Блокування чату';

  @override
  String get maxOneRoom => 'Макс 1 кімната';

  @override
  String get unlimited => 'Необмежений';

  @override
  String get biometrics => 'Біометрія';

  @override
  String get disabled => '🚫 Вимкнено';

  @override
  String supportWithSats(String amount) {
    return 'Підтримка з $amount сат (Фенікс)';
  }

  @override
  String get boltOffer =>
      '⚡ Платіжна пропозиція BOLT12 • Натисніть, щоб скопіювати';

  @override
  String get boltOfferCopied => 'Пропозицію оплати BOLT12 скопійовано';

  @override
  String get tapToCopyBoltOffer =>
      'Торкніться, щоб скопіювати платіжну пропозицію BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Прості інструкції для розблокування:';

  @override
  String unlockInstructions(String username) {
    return '1. Сплачуйте за допомогою Phoenix Wallet на Android (мінімум 7500 для розблокування — більше завжди цінується).\n2. Зробіть знімок екрана підтвердження успішної транзакції.\n3. Надішліть цей знімок екрана електронною поштою на jounaidnadirmed@gmail.com і повідомте мені своє унікальне ім’я користувача облікового запису: \'$username\', щоб я знав, хто заплатив.\n4. Введіть що-небудь у поле нижче, щоб зберегти ваш запит на цьому пристрої:';
  }

  @override
  String get supportRequestHint =>
      'Введіть своє ім\'я або інформацію про трансакцію тут...';

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
