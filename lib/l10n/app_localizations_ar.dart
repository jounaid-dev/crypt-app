// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'الشروط والأحكام';

  @override
  String get settingsTermsAndConditions => 'الشروط والأحكام';

  @override
  String get termsIntro =>
      'CRYPT هو تطبيق في مرحلة مبكرة لربط الأشخاص مباشرةً لإجراء المحادثات. أنت مسؤول عن استخدام التطبيق بشكل مناسب والحفاظ على بيانات اعتماد حسابك آمنة.';

  @override
  String get termsConnectivity =>
      'يستخدم CRYPT الخدمات عبر الإنترنت لمساعدة الأجهزة على اكتشاف الاتصالات وإنشاءها. قد يتغير سلوك التوفر والاتصال مع تطور التطبيق. من فضلك لا تعتمد على CRYPT كوسيلة الاتصال الوحيدة لديك.';

  @override
  String get termsAgreement =>
      'من خلال المتابعة، فإنك تؤكد أنك قرأت ووافقت على استخدام CRYPT بموجب هذه الشروط.';

  @override
  String get agreeTerms => 'أوافق على الشروط والأحكام';

  @override
  String get agreeAndContinue => 'وافق واستمر';

  @override
  String get beforeYouStart => 'قبل أن تبدأ';

  @override
  String get connected => 'متصل';

  @override
  String get connectFirstThenChat => 'الاتصال أولا، ثم الدردشة';

  @override
  String get betaIntro =>
      'CRYPT هو إصدار تجريبي مبكر، لذا قد تتحسن التجربة في الإصدارات المستقبلية.';

  @override
  String get walkieTalkieExplanation =>
      'يعمل CRYPT مثل جهاز اتصال لاسلكي: يحتاج كلا الشخصين إلى الاتصال بالإنترنت وفتح CRYPT في نفس الوقت لتأسيس الاتصال.';

  @override
  String get howToUseCrypt =>
      'كيفية استخدام كريبت:\n1. قم بمسح رمز CRYPT QR الخاص بالشخص الآخر.\n2. يحتاج كلا الشخصين إلى CRYPT مفتوحًا ومتصلًا بالإنترنت.\n3. انتظر حتى يقوم CRYPT بإنشاء اتصال P2P.\n4. انتظر حتى تختفي حالة \"الاتصال...\" ويتم إنشاء الاتصال.\n5. بمجرد الاتصال، يمكنك البدء في الدردشة.';

  @override
  String get messageStorageExplanation =>
      'تم تصميم رسائلك للانتقال مباشرة بين الأجهزة المتصلة. لا يقوم CRYPT بتخزين رسائل الدردشة الخاصة بك على خوادمنا. يساعد الخادم حاليًا في الاتصال وإرسال الإشارات، ولا يتم تخزين سجل الدردشة على الخادم. إذا كان الشخص الآخر غير متصل بالإنترنت، فلا يمكن إنشاء اتصال P2P الحالي.';

  @override
  String get settingsAndSupportExplanation =>
      'قم بزيارة الإعدادات لتخصيص تجربة CRYPT الخاصة بك. المزيد من خيارات التخصيص تأتي في وقت قريب.\n\nهل تريد دعم CRYPT؟ يمكنك العثور على خيار التبرع في الإعدادات.';

  @override
  String get saving => 'توفير...';

  @override
  String get continueToCrypt => 'المتابعة إلى التشفير';

  @override
  String get showSplashScreen => 'إظهار شاشة البداية';

  @override
  String get retry => 'أعد المحاولة';

  @override
  String get connectionFailed => 'فشل الاتصال';

  @override
  String get connectionFailedDetails =>
      'فشل الاتصال. يجب أن يكون كلا الجهازين متصلين بالإنترنت مع فتح CRYPT للاتصال.';

  @override
  String get gallery => 'معرض';

  @override
  String get alignQrCode => 'محاذاة رمز الاستجابة السريعة';

  @override
  String get scanFromGallery => 'مسح من المعرض';

  @override
  String get couldNotScanImage => 'تعذر مسح الصورة ضوئيًا.';

  @override
  String couldNotShareQrCode(String error) {
    return 'تعذرت مشاركة رمز الاستجابة السريعة: $error';
  }

  @override
  String newContact(String username) {
    return 'جهة اتصال جديدة: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'مفتاح التشفير العام الخاص بك مفقود.';

  @override
  String get contactEncryptionKeyMissing => 'مفتاح تشفير جهة الاتصال مفقود.';

  @override
  String get localEncryptionKeyMissing => 'مفتاح التشفير المحلي مفقود.';

  @override
  String get noQrCodeFound => 'لم يتم العثور على رمز QR في هذه الصورة.';

  @override
  String get shareQrCode => 'مشاركة رمز الاستجابة السريعة';

  @override
  String get welcome => 'مرحبًا';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get settings => 'الإعدادات';

  @override
  String get chats => 'المحادثات';

  @override
  String get typeMessage => 'اكتب رسالة...';

  @override
  String get send => 'إرسال';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'جارٍ الاتصال...';

  @override
  String get connectingP2p => 'جارٍ الاتصال بـ P2P...';

  @override
  String get p2pConnectionNotReady => 'اتصال P2P غير جاهز.';

  @override
  String get searchLanguage => 'البحث عن لغة...';

  @override
  String get language => 'اللغة';

  @override
  String get forceEscapeSignOutTitle => 'فرض تسجيل الخروج؟';

  @override
  String get forceEscapeSignOutContent => 'تحذير: سيتم مسح جميع بيانات الجهاز.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get wipeDevice => 'مسح الجهاز';

  @override
  String get accountDestructionAlertTitle => 'حذف الحساب';

  @override
  String get accountDestructionWarning =>
      'تحذير: سيتم مسح بيانات الجهاز والرسائل البعيدة.';

  @override
  String get accountDestructionCriticalNotice =>
      'حرج: ستؤدي الرموز الخاطئة إلى قفل النظام. استخدم كلمة مرور الحساب أو الخروج الطارئ.';

  @override
  String verificationSecurityKey(String code) {
    return 'مفتاح الأمان: $code';
  }

  @override
  String get copyDigitsHint => 'انسخ الأرقام الخمسة';

  @override
  String get codeMismatchNotice =>
      'الرمز غير متطابق. أدخل كلمة المرور الرئيسية أو انتظر 10 دقائق.';

  @override
  String get accountPasswordLabel => 'كلمة مرور الحساب';

  @override
  String get deleteEverythingPermanently => 'حذف كل شيء نهائيًا';

  @override
  String get escapeAndPurgeDeviceData => 'الخروج ومسح البيانات';

  @override
  String get addContact => 'إضافة جهة اتصال';

  @override
  String get addContactConfirmation => 'إضافة جهة الاتصال هذه؟';

  @override
  String get noMessagesYet => 'لا توجد رسائل بعد';

  @override
  String get addNewContact => 'جهة اتصال جديدة';

  @override
  String get usernameLabel => 'اسم المستخدم';

  @override
  String get nicknameOptionalLabel => 'اسم مستعار (اختياري)';

  @override
  String get add => 'إضافة';

  @override
  String get usernameCannotBeEmpty => 'اسم المستخدم مطلوب';

  @override
  String contactAlreadyExists(String name) {
    return 'جهة الاتصال \'$name\' موجودة بالفعل.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'المستخدم \'$name\' غير موجود. السر المشترك غير متاح.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'تمت إضافة $name!';
  }

  @override
  String get contacts => 'جهات الاتصال';

  @override
  String get noContactsYet => 'لا توجد جهات اتصال بعد';

  @override
  String get securityLockoutActive => 'قفل الأمان';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'محاولات كثيرة جدًا. تم القفل لمدة $minutes دقيقة.';
  }

  @override
  String get acknowledge => 'فهمت';

  @override
  String get accessBlocked => 'الوصول محظور';

  @override
  String accessSuspended(int minutes) {
    return '5 محاولات فاشلة. تم تعليق الوصول لمدة $minutes دقيقة.';
  }

  @override
  String get ok => 'موافق';

  @override
  String unlockSecureNode(String username) {
    return 'فتح القفل: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'المحاولات المتبقية: $count';
  }

  @override
  String get secureKeyPasscode => 'رمز الأمان';

  @override
  String get warningHardwareLockout =>
      'تحذير: سيؤدي الفشل التالي إلى قفل الأمان.';

  @override
  String get abort => 'إلغاء';

  @override
  String get authenticate => 'مصادقة';

  @override
  String get searchPipelinesHint => 'البحث عن اتصالات آمنة...';

  @override
  String get zeroPipelinesDiscovered => 'لم يتم العثور على اتصالات.';

  @override
  String get processingDecryption => 'جارٍ فك التشفير...';

  @override
  String get decrypting => 'جارٍ فك التشفير...';

  @override
  String get decryptionError => '[خطأ في فك التشفير]';

  @override
  String get cryptContainerSecure => 'حاوية CRYPT آمنة';

  @override
  String get connectAnAccount => 'ربط حساب';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get enterMasterSecurityPassword => 'أدخل كلمة المرور الرئيسية';

  @override
  String get pleaseFillAllFields => 'املأ جميع الحقول';

  @override
  String get wrongUsernameOrPassword => 'اسم المستخدم أو كلمة المرور غير صحيحة';

  @override
  String loginError(String error) {
    return 'خطأ في تسجيل الدخول: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'ليس لديك حساب؟ سجّل الآن';

  @override
  String get myIdentity => 'هويتي';

  @override
  String get scanToAddMe => 'امسح لإضافتي';

  @override
  String get shareProfileLink => 'مشاركة الملف الشخصي';

  @override
  String addMeOnCrypt(String link) {
    return 'أضفني على CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'مسح QR';

  @override
  String get invalidCryptQrFormat => 'رمز QR الخاص بـ CRYPT غير صالح.';

  @override
  String get userScanned => 'تم مسح المستخدم!';

  @override
  String addingUser(String username) {
    return 'جارٍ إضافة $username...';
  }

  @override
  String get defaultUser => 'مستخدم';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get keepPasswordSecureHint =>
      'احتفظ به بأمان. لا يمكن تغيير كلمة المرور.';

  @override
  String get pleaseFillInAllFields => 'املأ جميع الحقول';

  @override
  String get usernameExceedsLimit => 'الحد الأقصى لاسم المستخدم: 20 حرفًا';

  @override
  String get invalidUsernameCharacters =>
      'استخدم الأحرف والأرقام و _ أو - فقط.';

  @override
  String get weakPasswordNotice =>
      'استخدم 8 أحرف أو أكثر، ورقمًا واحدًا وحرفًا كبيرًا واحدًا.';

  @override
  String get unableToGenerateUniqueUsername => 'تعذر إنشاء اسم مستخدم فريد.';

  @override
  String get accountCreated => 'تم إنشاء الحساب';

  @override
  String yourUsernameIs(String username) {
    return 'اسم المستخدم الخاص بك:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'اسم المستخدم \'$chosen\' مستخدم بالفعل.\n\nاسم المستخدم الخاص بك:\n\n$assigned\n\nاحتفظ به لتسجيل الدخول.';
  }

  @override
  String get continueText => 'متابعة';

  @override
  String failedToGenerateIdentity(String error) {
    return 'فشل إنشاء الهوية: $error';
  }

  @override
  String get welcomeToCrypt => 'مرحبًا بك في CRYPT';

  @override
  String get signupDescription =>
      'أنشئ اسم مستخدم وكلمة مرور لإنشاء مفاتيح P2P.';

  @override
  String get chooseAUsername => 'اختر اسم مستخدم';

  @override
  String get usernameHelperText =>
      'لا تستخدم اسمك الحقيقي. ستتم إضافة لاحقة إذا كان الاسم مستخدمًا.';

  @override
  String get masterAuthenticationRequired => 'المصادقة الرئيسية';

  @override
  String get verify => 'تحقق';

  @override
  String get darkThemeMode => 'الوضع الداكن';

  @override
  String get secureConversations => 'محادثات آمنة';

  @override
  String get noActiveConversations =>
      'لا توجد محادثات نشطة. ابدأ محادثة لتفعيل الأقفال.';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get wipeDeviceAndEscape => 'مسح الجهاز';

  @override
  String get falsePassword => 'كلمة مرور خاطئة';

  @override
  String accessSuspendedTimer(String time) {
    return 'تم تعليق الوصول. حاول مرة أخرى خلال $time.';
  }

  @override
  String get selectSecureLockMethod => 'اختيار طريقة القفل';

  @override
  String get selectSecureLockDescription =>
      'القفل باستخدام بصمة الإصبع أو PIN من 4 أرقام؟';

  @override
  String get fourDigitPin => 'PIN من 4 أرقام';

  @override
  String get fingerprintUnlock => 'بصمة الإصبع 🔓';

  @override
  String get supportSoloDeveloper => 'دعم المطور';

  @override
  String get supportIntro =>
      'مرحبًا! أنا مطور مستقل أعمل بجد على CRYPT. لا أملك ميزانية أو تمويلًا مؤسسيًا، وأعتمد على صدقك وتعاطفك لتحسين التطبيق وضمان عدم وجود إعلانات أبدًا.';

  @override
  String get chooseSupportAmount => 'اختر مبلغ الدعم:';

  @override
  String get poorGang => 'أنا من مجموعة الفقراء 🥀✌️';

  @override
  String get launchOfferMinimum => 'الحد الأدنى لعرض الإطلاق 🚀';

  @override
  String get buyMeCoffee => 'اشترِ لي قهوة ☕';

  @override
  String get superSupporter => 'داعِم مميز 🔥';

  @override
  String get feature => 'الميزة';

  @override
  String get freeTier => 'الخطة المجانية';

  @override
  String get premium => 'مميزة';

  @override
  String get chatLocks => 'أقفال الدردشة';

  @override
  String get maxOneRoom => 'غرفة واحدة كحد أقصى';

  @override
  String get unlimited => 'غير محدود';

  @override
  String get biometrics => 'القياسات الحيوية';

  @override
  String get disabled => 'معطل 🚫';

  @override
  String supportWithSats(String amount) {
    return 'ادعم بـ $amount ساتوشي (Phoenix)';
  }

  @override
  String get boltOffer => 'عرض دفع BOLT12 ⚡ • اضغط للنسخ';

  @override
  String get boltOfferCopied => 'تم نسخ عرض الدفع BOLT12';

  @override
  String get tapToCopyBoltOffer => 'اضغط لنسخ عرض الدفع BOLT12';

  @override
  String get simpleInstructionsToUnlock => 'تعليمات بسيطة لفتح القفل 📬:';

  @override
  String unlockInstructions(String username) {
    return '1. ادفع باستخدام Phoenix على أندرويد (الحد الأدنى 7,500).\n2. التقط صورة لتأكيد المعاملة الناجحة.\n3. أرسل الصورة إلى jounaidnadirmed@gmail.com واذكر اسم المستخدم \'$username\'.\n4. اكتب أي شيء أدناه لحفظ طلبك على هذا الجهاز:';
  }

  @override
  String get supportRequestHint => 'اكتب اسمك أو معلومات المعاملة هنا...';

  @override
  String get maybeLater => 'ربما لاحقًا';

  @override
  String get submitProof => 'إرسال الإثبات';

  @override
  String get couldNotOpenWallet => 'تعذر فتح المحفظة. انسخ الرمز أدناه.';

  @override
  String get proofSubmittedSnackbar =>
      'تم إرسال الإثبات. المراجعة اليدوية: 24–48 ساعة (باستثناء عطلات نهاية الأسبوع).';

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
