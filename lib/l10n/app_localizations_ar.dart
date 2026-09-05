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
  String get maybeLater => 'ربما لاحقًا';

  @override
  String get submitProof => 'إرسال الإثبات';

  @override
  String get couldNotOpenWallet => 'تعذر فتح المحفظة. انسخ الرمز أدناه.';

  @override
  String get proofSubmittedSnackbar =>
      'تم إرسال الإثبات. المراجعة اليدوية: 24–48 ساعة (باستثناء عطلات نهاية الأسبوع).';
}
