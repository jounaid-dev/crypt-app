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

  @override
  String get loadingChats => 'Loading chats...';

  @override
  String get noChatsYetTitle => 'No chats yet';

  @override
  String get noChatsYetHint =>
      'A chat starts when you scan the other person\'s CRYPT QR code. Open your identity page to share yours so they can scan it.';

  @override
  String get scanQrToStartChat => 'Scan a QR code';

  @override
  String get noChatsMatchSearch => 'No chats match your search';

  @override
  String get noChatsMatchSearchHint =>
      'Try a different name, or clear the search to see every chat.';

  @override
  String get requestSentTitle => 'Request sent';

  @override
  String requestSentBody(String username) {
    return 'Your request went to $username. Please wait while they accept it.';
  }

  @override
  String get requestSentKeepOpen =>
      'The chat opens as soon as they accept. Keep CRYPT open on this device so you do not miss it.';

  @override
  String get requestSentGotIt => 'Got it';

  @override
  String get scanCouldNotReadCode =>
      'That code could not be read. Scan a CRYPT QR code.';

  @override
  String get scanMissingTheirIdentity =>
      'That code is missing the person\'s identity. Scan the code from their identity page.';

  @override
  String get scanOwnIdentityMissing =>
      'Your own encryption key is missing. Sign out and back in, then scan again.';

  @override
  String get noLightningWalletFound =>
      'No Lightning wallet found. Install one, or copy the address and paste it into a wallet.';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionPrivacy => 'Privacy and security';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Help and legal';

  @override
  String get settingsSectionAdministration => 'Administration';

  @override
  String get settingsSectionAccount => 'Account';

  @override
  String get settingsProtectTitle => 'Protect settings with master password';

  @override
  String get settingsProtectSubtitle => 'Require password to access settings';

  @override
  String get chatLockSetPinSubtitle => 'Tap to set your own PIN for this chat';

  @override
  String get premiumTileTitle => 'Get Lifetime Premium';

  @override
  String get premiumActiveSubtitle => 'Premium is on for your account';

  @override
  String get premiumPendingSubtitle =>
      'Waiting for an admin to review your screenshot';

  @override
  String get premiumHowItWorks => 'How premium works';

  @override
  String get reportProblemTitle => 'Report a problem';

  @override
  String get reportProblemSubtitle => 'Bugs, abuse or spam';

  @override
  String get adminAccessTitle => 'Admin access';

  @override
  String get adminAccessSubtitle => 'Enter your admin code to open the panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — own code, this chat only';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount once with your Lightning wallet, then send a screenshot';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Your screenshot is in. An admin checks it and premium turns on for your account within $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Pay $amount with $method, or $wallet.\n2. Screenshot the payment confirmation.\n3. Send it from Submit payment proof.\n4. Premium turns on and stays on for life.\n\nCRYPT is built by a solo developer, and this is the whole offer: one payment, no subscription.';
  }

  @override
  String get reportIntro =>
      'Tell us what happened. If you are reporting another person, add their username so we can act on the right account.';

  @override
  String get reportSent => 'Report sent. Thank you.';

  @override
  String get reportSendFailed => 'Could not send the report.';

  @override
  String get reportTypeLabel => 'Type of report';

  @override
  String get reportCategoryBug => 'Bug';

  @override
  String get reportCategoryAbuse => 'Abuse';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Other';

  @override
  String get reportUsernameLabel => 'Their username (optional)';

  @override
  String get reportUsernameHint => 'e.g. someone_you_want_reported';

  @override
  String get reportDetailsLabel => 'What happened?';

  @override
  String get reportScreenshotsLabel => 'Screenshots';

  @override
  String get reportAddScreenshot => 'Add screenshot';

  @override
  String get reportSendButton => 'Send report';

  @override
  String get reportPrivacyNote =>
      'Reports are reviewed by an administrator. Screenshots are stored privately and are only visible to moderators.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount once, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'No subscription and nothing to renew. Pay with $method, send a screenshot of the confirmation, and premium is switched on within $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT is built by a solo developer. Premium is what keeps it ad-free and actively maintained.';

  @override
  String get premiumStepPay => 'Pay with your wallet';

  @override
  String get premiumLightningAddressLabel => 'Lightning address';

  @override
  String get premiumOpenWallet => 'Open wallet';

  @override
  String get premiumCopyAddress => 'Copy address';

  @override
  String get premiumWorksWith =>
      'Works with Phoenix and any other Lightning wallet.';

  @override
  String get premiumStepScreenshot => 'Send your screenshot';

  @override
  String get premiumScreenshotHint =>
      'Take a screenshot of the payment confirmation in your Lightning wallet and attach it below.';

  @override
  String get premiumAttachScreenshot => 'Attach screenshot';

  @override
  String get premiumReplaceScreenshot => 'Replace screenshot';

  @override
  String get premiumStepAmount => 'Confirm the amount';

  @override
  String get premiumAmountLabel => 'Amount you paid (USD)';

  @override
  String get premiumNoteLabel => 'Note (optional)';

  @override
  String get premiumSendProof => 'Send my proof';

  @override
  String get premiumAddressCopied => 'Lightning address copied.';

  @override
  String get premiumAttachConfirmation =>
      'Attach a screenshot of your payment confirmation.';

  @override
  String get premiumSendProofFailed => 'Could not send the payment proof.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Minimum $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Activation takes $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Proof received. Premium is switched on within $window.';
  }

  @override
  String get premiumTableFeature => 'Feature';

  @override
  String get premiumTableFree => 'Free';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Encrypted peer-to-peer messaging';

  @override
  String get premiumTableMessagesStay => 'Messages stay on your devices';

  @override
  String get premiumTableChatLocks => 'Chats locked with your own PIN';

  @override
  String get premiumTableFingerprint => 'Unlock with fingerprint or face';

  @override
  String get premiumTablePrice => 'Price';

  @override
  String get premiumTableAccess => 'Access';

  @override
  String get premiumTableIncluded => 'Included';

  @override
  String get premiumTableOneChat => '1 chat';

  @override
  String get premiumTableUnlimited => 'Unlimited';

  @override
  String get premiumTableNotIncluded => 'Not included';

  @override
  String get premiumTableFreeValue => 'Free';

  @override
  String get premiumTableWhileFree => 'While the app is free';

  @override
  String get premiumTableLifetime => 'Lifetime';

  @override
  String premiumTableOnePayment(String amount) {
    return 'One payment of $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'One payment of $amount and premium is yours for life. There is no subscription and nothing to renew.';
  }

  @override
  String get settingsSaveFailed => 'Could not save that setting. Try again.';

  @override
  String get settingsLockFailed => 'Could not lock this chat. Try again.';

  @override
  String get settingsUnlockFailed => 'Could not unlock this chat. Try again.';

  @override
  String pinSetTitle(String chat) {
    return 'Set a PIN for $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Confirm the PIN for $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'This PIN opens $chat only. Every chat has its own PIN, chosen by you. There is no single code for the app.';
  }

  @override
  String get pinMismatch => 'The PINs did not match. Lock not enabled.';

  @override
  String get biometricNotSetUp =>
      'No fingerprint or face unlock is set up on this device.';

  @override
  String get biometricVerifyFailed =>
      'Could not verify it is you on this device.';

  @override
  String get lightningAddressCopied =>
      'Lightning address copied. Paste it into a wallet to pay.';

  @override
  String get accountSuspended => 'Account suspended';

  @override
  String get premiumLifetimeAccess => 'Lifetime Premium Access';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Pay $amount from $method to the Lightning address above.';
  }

  @override
  String get premiumActivationStep2 =>
      'Take a screenshot of the payment confirmation and send it in as your proof of payment.';
}
