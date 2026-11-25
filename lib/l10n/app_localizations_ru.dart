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
  String get termsAndConditions => 'Условия';

  @override
  String get settingsTermsAndConditions => 'Условия';

  @override
  String get termsIntro =>
      'CRYPT - это приложение на ранней стадии для подключения людей непосредственно к разговорам. Вы несете ответственность за надлежащее использование приложения и обеспечение безопасности учетных данных.';

  @override
  String get termsConnectivity =>
      'CRYPT использует онлайн-сервисы, чтобы помочь устройствам находить и устанавливать соединения. Доступность и поведение подключения могут меняться по мере развития приложения. Пожалуйста, не полагайтесь на КРИПТУ как на единственное средство связи.';

  @override
  String get termsAgreement =>
      'Продолжая, вы подтверждаете, что прочитали и согласны использовать CRYPT в соответствии с настоящими условиями.';

  @override
  String get agreeTerms => 'Я принимаю условия пользовательского соглашения';

  @override
  String get agreeAndContinue => 'Согласиться и продолжить';

  @override
  String get beforeYouStart => 'Перед началом:';

  @override
  String get connected => 'Подключено';

  @override
  String get connectFirstThenChat =>
      'Сначала подключитесь, а затем пообщайтесь';

  @override
  String get betaIntro =>
      'CRYPT - это ранняя бета-версия, поэтому опыт может улучшиться в будущих версиях.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT работает как рация: оба человека должны быть онлайн и иметь КРИПТУ, открытую одновременно, чтобы установить соединение.';

  @override
  String get howToUseCrypt =>
      'Как использовать CRYPT:\n1. Отсканируйте QR-код КРИПТЫ другого человека.\n2. Оба человека нуждаются в КРИПТЕ, открытой и онлайн.\n3. Подождите, пока CRYPT установит P2P-соединение.\n4. Дождитесь исчезновения состояния «Подключение...» и установления соединения.\n5. После подключения вы можете начать чат.';

  @override
  String get messageStorageExplanation =>
      'Ваши сообщения предназначены для передачи непосредственно между подключенными устройствами. CRYPT не хранит ваши сообщения в чате на наших серверах. Сервер в настоящее время помогает с подключением и сигнализацией, а история чата не хранится на сервере. Если другой человек не в сети, текущее P2P-соединение не может быть установлено.';

  @override
  String get settingsAndSupportExplanation =>
      'Откройте «Настройки», чтобы настроить опыт работы с КРИПТОЙ. В ближайшее время появятся дополнительные варианты настройки.\n\nХотите поддержать CRYPT? Вариант пожертвования можно найти в Настройках.';

  @override
  String get saving => 'Сохранение...';

  @override
  String get continueToCrypt => 'Продолжить криптографию';

  @override
  String get showSplashScreen => 'Отображать экран заставки';

  @override
  String get retry => 'Повторить попытку';

  @override
  String get connectionFailed => 'Подключение не выполнено';

  @override
  String get connectionFailedDetails =>
      'Не удалось подключиться. Для подключения оба устройства должны быть подключены к сети с открытой КРИПТОЙ.';

  @override
  String get gallery => 'Галерея';

  @override
  String get alignQrCode => 'ВЫРОВНЯТЬ QR-КОД';

  @override
  String get scanFromGallery => 'из галереи';

  @override
  String get couldNotScanImage => 'Не удалось отсканировать изображение.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Не удалось поделиться QR-кодом: $error';
  }

  @override
  String newContact(String username) {
    return 'Новый контакт: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Отсутствует открытый ключ шифрования.';

  @override
  String get contactEncryptionKeyMissing =>
      'Отсутствует ключ шифрования контактов.';

  @override
  String get localEncryptionKeyMissing =>
      'Отсутствует локальный ключ шифрования.';

  @override
  String get noQrCodeFound => 'На этом изображении нет QR-кода.';

  @override
  String get shareQrCode => 'Поделиться с помощью QR-кода';

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
  String get supportIntro =>
      'Привет! 👋 Я индивидуальный разработчик, усердно работающий над CRYPT. У меня нет ни бюджета, ни корпоративного финансирования. Я полностью полагаюсь на вашу честность и сочувствие, чтобы продолжать улучшать приложение и гарантировать отсутствие рекламы НАВСЕГДА.';

  @override
  String get chooseSupportAmount => 'Выберите свою цену (Слайд для поддержки):';

  @override
  String get poorGang => 'Я бедная банда 🥀✌️';

  @override
  String get launchOfferMinimum => 'Минимум стартового предложения 🚀';

  @override
  String get buyMeCoffee => 'Купи мне кофе ☕';

  @override
  String get superSupporter => 'Супер сторонник 🔥';

  @override
  String get feature => 'Особенность';

  @override
  String get freeTier => 'Уровень бесплатного пользования';

  @override
  String get premium => 'Премиум';

  @override
  String get chatLocks => 'Блокировки чата';

  @override
  String get maxOneRoom => 'Макс. 1 комната';

  @override
  String get unlimited => 'Безлимитный';

  @override
  String get biometrics => 'Биометрия';

  @override
  String get disabled => '🚫 Инвалид';

  @override
  String supportWithSats(String amount) {
    return 'Поддержка с помощью спутников: $amount (Феникс)';
  }

  @override
  String get boltOffer =>
      '⚡ Предложение по оплате BOLT12 • Нажмите, чтобы скопировать';

  @override
  String get boltOfferCopied => 'Предложение по оплате BOLT12 скопировано.';

  @override
  String get tapToCopyBoltOffer =>
      'Нажмите, чтобы скопировать предложение оплаты BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Простые инструкции по разблокировке:';

  @override
  String unlockInstructions(String username) {
    return '1. Оплатите с помощью Phoenix Wallet на Android (минимум 7500 для разблокировки — всегда ценится больше).\n2. Сделайте снимок экрана подтверждения успешной транзакции.\n3. Отправьте этот снимок экрана по адресу jounaidnadirmed@gmail.com и сообщите мне свое уникальное имя пользователя учетной записи: «$username», чтобы я знал, кто заплатил.\n4. Введите что-нибудь в поле ниже, чтобы сохранить запрос на этом устройстве:';
  }

  @override
  String get supportRequestHint =>
      'Введите здесь свое имя или информацию о транзакции...';

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
