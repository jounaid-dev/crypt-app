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
}
