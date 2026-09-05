// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'خوش آمدید';

  @override
  String get login => 'ورود';

  @override
  String get signup => 'ثبت‌نام';

  @override
  String get settings => 'تنظیمات';

  @override
  String get chats => 'گفتگوها';

  @override
  String get typeMessage => 'پیام بنویسید...';

  @override
  String get send => 'ارسال';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'در حال اتصال...';

  @override
  String get connectingP2p => 'در حال اتصال به P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P آماده نیست.';

  @override
  String get searchLanguage => 'جستجوی زبان...';

  @override
  String get language => 'زبان';

  @override
  String get forceEscapeSignOutTitle => 'خروج اضطراری اجباری؟';

  @override
  String get forceEscapeSignOutContent =>
      'هشدار: تمام داده‌های دستگاه پاک خواهند شد.';

  @override
  String get cancel => 'لغو';

  @override
  String get wipeDevice => 'پاک کردن دستگاه';

  @override
  String get accountDestructionAlertTitle => 'حذف حساب';

  @override
  String get accountDestructionWarning =>
      'هشدار: داده‌های دستگاه و پیام‌های راه دور حذف خواهند شد.';

  @override
  String get accountDestructionCriticalNotice =>
      'بحرانی: کدهای اشتباه سیستم را قفل می‌کنند. از رمز عبور حساب یا خروج اضطراری استفاده کنید.';

  @override
  String verificationSecurityKey(String code) {
    return 'کلید امنیتی: $code';
  }

  @override
  String get copyDigitsHint => '۵ رقم بالا را کپی کنید';

  @override
  String get codeMismatchNotice =>
      'کد مطابقت ندارد. رمز عبور اصلی را وارد کنید یا ۱۰ دقیقه صبر کنید.';

  @override
  String get accountPasswordLabel => 'رمز عبور حساب';

  @override
  String get deleteEverythingPermanently => 'حذف همه چیز';

  @override
  String get escapeAndPurgeDeviceData => 'خروج و پاک کردن داده‌ها';

  @override
  String get addContact => 'افزودن مخاطب';

  @override
  String get addContactConfirmation => 'این مخاطب اضافه شود؟';

  @override
  String get noMessagesYet => 'هنوز پیامی وجود ندارد';

  @override
  String get addNewContact => 'مخاطب جدید';

  @override
  String get usernameLabel => 'نام کاربری';

  @override
  String get nicknameOptionalLabel => 'نام مستعار (اختیاری)';

  @override
  String get add => 'افزودن';

  @override
  String get usernameCannotBeEmpty => 'نام کاربری الزامی است';

  @override
  String contactAlreadyExists(String name) {
    return 'مخاطب \'$name\' از قبل وجود دارد.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'کاربر \'$name\' پیدا نشد. امکان ایجاد راز مشترک وجود ندارد.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name با موفقیت اضافه شد!';
  }

  @override
  String get contacts => 'مخاطبین';

  @override
  String get noContactsYet => 'هنوز مخاطبی وجود ندارد';

  @override
  String get securityLockoutActive => 'قفل امنیتی فعال است';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'تلاش‌های بیش از حد. برای $minutes دقیقه قفل شد.';
  }

  @override
  String get acknowledge => 'متوجه شدم';

  @override
  String get accessBlocked => 'دسترسی مسدود شد';

  @override
  String accessSuspended(int minutes) {
    return '۵ تلاش ناموفق. دسترسی برای $minutes دقیقه متوقف شد.';
  }

  @override
  String get ok => 'تأیید';

  @override
  String unlockSecureNode(String username) {
    return 'باز کردن قفل: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'تلاش‌های باقی‌مانده: $count';
  }

  @override
  String get secureKeyPasscode => 'رمز امنیتی';

  @override
  String get warningHardwareLockout =>
      'هشدار: خطای بعدی امنیت سیستم را قفل خواهد کرد.';

  @override
  String get abort => 'لغو';

  @override
  String get authenticate => 'احراز هویت';

  @override
  String get searchPipelinesHint => 'جستجوی اتصالات امن...';

  @override
  String get zeroPipelinesDiscovered => 'هیچ اتصالی پیدا نشد.';

  @override
  String get processingDecryption => 'در حال رمزگشایی...';

  @override
  String get decrypting => 'در حال رمزگشایی...';

  @override
  String get decryptionError => '[خطای رمزگشایی]';

  @override
  String get cryptContainerSecure => 'محفظه CRYPT امن است';

  @override
  String get connectAnAccount => 'اتصال حساب';

  @override
  String get username => 'نام کاربری';

  @override
  String get password => 'رمز عبور';

  @override
  String get enterMasterSecurityPassword => 'رمز عبور اصلی خود را وارد کنید';

  @override
  String get pleaseFillAllFields => 'همه فیلدها را پر کنید';

  @override
  String get wrongUsernameOrPassword => 'نام کاربری یا رمز عبور اشتباه است';

  @override
  String loginError(String error) {
    return 'خطای ورود: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'حساب ندارید؟ ثبت‌نام کنید';

  @override
  String get myIdentity => 'هویت من';

  @override
  String get scanToAddMe => 'برای افزودن من اسکن کنید';

  @override
  String get shareProfileLink => 'اشتراک‌گذاری پروفایل';

  @override
  String addMeOnCrypt(String link) {
    return 'مرا در CRYPT اضافه کنید!\n\n$link';
  }

  @override
  String get scanQr => 'اسکن QR';

  @override
  String get invalidCryptQrFormat => 'کد QR نامعتبر CRYPT.';

  @override
  String get userScanned => 'کاربر اسکن شد!';

  @override
  String addingUser(String username) {
    return 'در حال افزودن $username...';
  }

  @override
  String get defaultUser => 'کاربر';

  @override
  String get createAccount => 'ایجاد حساب';

  @override
  String get keepPasswordSecureHint =>
      'آن را امن نگه دارید. رمز عبور قابل تغییر نیست.';

  @override
  String get pleaseFillInAllFields => 'همه فیلدها را پر کنید';

  @override
  String get usernameExceedsLimit => 'حداکثر ۲۰ کاراکتر';

  @override
  String get invalidUsernameCharacters =>
      'فقط از حروف، اعداد، _ یا - استفاده کنید.';

  @override
  String get weakPasswordNotice => 'حداقل ۸ کاراکتر، ۱ عدد و ۱ حرف بزرگ.';

  @override
  String get unableToGenerateUniqueUsername =>
      'امکان ایجاد نام کاربری منحصربه‌فرد وجود ندارد.';

  @override
  String get accountCreated => 'حساب ایجاد شد';

  @override
  String yourUsernameIs(String username) {
    return 'نام کاربری شما:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'نام کاربری \'$chosen\' قبلاً گرفته شده است.\n\nنام کاربری شما:\n\n$assigned\n\nآن را برای ورود به خاطر بسپارید.';
  }

  @override
  String get continueText => 'ادامه';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ایجاد هویت ناموفق بود: $error';
  }

  @override
  String get welcomeToCrypt => 'به CRYPT خوش آمدید';

  @override
  String get signupDescription =>
      'یک نام کاربری و رمز عبور ایجاد کنید تا کلیدهای P2P ساخته شوند.';

  @override
  String get chooseAUsername => 'یک نام کاربری انتخاب کنید';

  @override
  String get usernameHelperText =>
      'از نام واقعی خود استفاده نکنید. اگر نام کاربری گرفته شده باشد، یک پسوند به‌صورت خودکار اضافه می‌شود.';

  @override
  String get masterAuthenticationRequired => 'احراز هویت اصلی';

  @override
  String get verify => 'تأیید';

  @override
  String get darkThemeMode => 'تم تاریک';

  @override
  String get secureConversations => 'گفتگوهای امن';

  @override
  String get noActiveConversations =>
      'هیچ گفتگوی فعالی وجود ندارد. برای فعال کردن قفل‌ها، یک گفتگو شروع کنید.';

  @override
  String get logout => 'خروج';

  @override
  String get wipeDeviceAndEscape => 'پاک کردن دستگاه';

  @override
  String get falsePassword => 'رمز عبور اشتباه';

  @override
  String accessSuspendedTimer(String time) {
    return 'دسترسی به دلایل امنیتی متوقف شده است. $time دیگر دوباره تلاش کنید.';
  }

  @override
  String get selectSecureLockMethod => 'انتخاب روش قفل';

  @override
  String get selectSecureLockDescription =>
      'با اثر انگشت یا PIN چهار رقمی قفل شود؟';

  @override
  String get fourDigitPin => 'PIN چهار رقمی';

  @override
  String get fingerprintUnlock => 'اثر انگشت 🔓';

  @override
  String get supportSoloDeveloper => 'حمایت از توسعه‌دهنده';

  @override
  String get maybeLater => 'بعداً';

  @override
  String get submitProof => 'ارسال مدرک';

  @override
  String get couldNotOpenWallet => 'کیف پول باز نشد. کد زیر را کپی کنید.';

  @override
  String get proofSubmittedSnackbar =>
      'مدرک ارسال شد. بررسی دستی ۲۴ تا ۴۸ ساعت طول می‌کشد (به‌جز آخر هفته). می‌توانید به‌طور معمول از برنامه استفاده کنید.';
}
