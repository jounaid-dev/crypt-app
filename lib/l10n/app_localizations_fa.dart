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
  String get termsAndConditions => 'شرایط و ضوابط';

  @override
  String get settingsTermsAndConditions => 'شرایط و ضوابط';

  @override
  String get termsIntro =>
      'CRYPT یک برنامه کاربردی در مراحل اولیه برای ارتباط مستقیم افراد برای مکالمه است. شما مسئول استفاده مناسب از برنامه و حفظ امنیت اعتبار حساب خود هستید.';

  @override
  String get termsConnectivity =>
      'CRYPT از خدمات آنلاین برای کمک به دستگاه‌ها برای کشف و ایجاد اتصالات استفاده می‌کند. در دسترس بودن و رفتار اتصال ممکن است با توسعه برنامه تغییر کند. لطفا به CRYPT به عنوان تنها وسیله ارتباطی خود اعتماد نکنید.';

  @override
  String get termsAgreement =>
      'با ادامه، تأیید می کنید که مطالعه کرده اید و با استفاده از CRYPT تحت این شرایط موافقت می کنید.';

  @override
  String get agreeTerms => 'من با شرایط و ضوابط موافقم';

  @override
  String get agreeAndContinue => 'موافقت کنید و ادامه دهید';

  @override
  String get beforeYouStart => 'قبل از شروع';

  @override
  String get connected => 'متصل شد';

  @override
  String get connectFirstThenChat => 'ابتدا وصل شوید، سپس چت کنید';

  @override
  String get betaIntro =>
      'CRYPT یک نسخه بتا اولیه است، بنابراین تجربه ممکن است در نسخه های بعدی بهبود یابد.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT مانند یک دستگاه واکی تاکی کار می کند: هر دو نفر باید آنلاین باشند و CRYPT را به طور همزمان باز کنند تا اتصال برقرار شود.';

  @override
  String get howToUseCrypt =>
      'نحوه استفاده از CRYPT:\n1. کد CRYPT QR شخص دیگر را اسکن کنید.\n2. هر دو نفر به CRYPT باز و آنلاین نیاز دارند.\n3. صبر کنید تا CRYPT اتصال P2P را برقرار کند.\n4. منتظر بمانید تا حالت \"اتصال...\" ناپدید شود و اتصال برقرار شود.\n5. پس از اتصال، می توانید چت را شروع کنید.';

  @override
  String get messageStorageExplanation =>
      'پیام‌های شما طوری طراحی شده‌اند که مستقیماً بین دستگاه‌های متصل حرکت کنند. CRYPT پیام های چت شما را در سرورهای ما ذخیره نمی کند. سرور در حال حاضر به اتصال و سیگنال دهی کمک می کند و سابقه چت در سرور ذخیره نمی شود. اگر شخص دیگر آفلاین باشد، اتصال P2P فعلی نمی تواند برقرار شود.';

  @override
  String get settingsAndSupportExplanation =>
      'برای سفارشی کردن تجربه CRYPT خود از تنظیمات دیدن کنید. گزینه های سفارشی سازی بیشتر به زودی ارائه می شود.\n\nآیا می خواهید از CRYPT پشتیبانی کنید؟ می‌توانید گزینه کمک مالی را در تنظیمات پیدا کنید.';

  @override
  String get saving => 'در حال ذخیره...';

  @override
  String get continueToCrypt => 'به CRYPT ادامه دهید';

  @override
  String get showSplashScreen => 'نمایش صفحه نمایش اسپلش';

  @override
  String get retry => 'دوباره امتحان کنید';

  @override
  String get connectionFailed => 'اتصال ناموفق بود';

  @override
  String get connectionFailedDetails =>
      'اتصال ناموفق بود. هر دو دستگاه باید با CRYPT باز برای اتصال آنلاین باشند.';

  @override
  String get gallery => 'گالری';

  @override
  String get alignQrCode => 'کد QR را تراز کنید';

  @override
  String get scanFromGallery => 'اسکن از گالری';

  @override
  String get couldNotScanImage => 'اسکن تصویر ممکن نیست.';

  @override
  String couldNotShareQrCode(String error) {
    return 'کد QR به اشتراک گذاشته نشد: $error';
  }

  @override
  String newContact(String username) {
    return 'مخاطب جدید: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'کلید رمزگذاری عمومی شما گم شده است.';

  @override
  String get contactEncryptionKeyMissing => 'کلید رمزگذاری مخاطب وجود ندارد.';

  @override
  String get localEncryptionKeyMissing => 'کلید رمزگذاری محلی وجود ندارد.';

  @override
  String get noQrCodeFound => 'هیچ کد QR در این تصویر یافت نشد.';

  @override
  String get shareQrCode => 'کد QR را به اشتراک بگذارید';

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
  String get supportIntro =>
      'سلام! من یک توسعه‌دهنده مستقل هستم که روی CRYPT سخت کار می‌کنم. بودجه یا پشتیبانی شرکتی ندارم و برای بهبود برنامه و تضمین نبود تبلیغات، به صداقت و همدلی شما تکیه می‌کنم.';

  @override
  String get chooseSupportAmount => 'مبلغ حمایت را انتخاب کنید:';

  @override
  String get poorGang => 'من از گروه فقرا هستم 🥀✌️';

  @override
  String get launchOfferMinimum => 'حداقل پیشنهاد آغازین 🚀';

  @override
  String get buyMeCoffee => 'یک قهوه برایم بخرید ☕';

  @override
  String get superSupporter => 'حامی ویژه 🔥';

  @override
  String get feature => 'ویژگی';

  @override
  String get freeTier => 'سطح رایگان';

  @override
  String get premium => 'ویژه';

  @override
  String get chatLocks => 'قفل‌های گفتگو';

  @override
  String get maxOneRoom => 'حداکثر یک اتاق';

  @override
  String get unlimited => 'نامحدود';

  @override
  String get biometrics => 'زیست‌سنجی';

  @override
  String get disabled => 'غیرفعال 🚫';

  @override
  String supportWithSats(String amount) {
    return 'با $amount ساتوشی حمایت کنید (Phoenix)';
  }

  @override
  String get boltOffer => 'پیشنهاد پرداخت BOLT12 ⚡ • برای کپی لمس کنید';

  @override
  String get boltOfferCopied => 'پیشنهاد پرداخت BOLT12 کپی شد';

  @override
  String get tapToCopyBoltOffer => 'برای کپی پیشنهاد پرداخت BOLT12 لمس کنید';

  @override
  String get simpleInstructionsToUnlock => 'راهنمای ساده باز کردن قفل 📬:';

  @override
  String unlockInstructions(String username) {
    return '۱. با Phoenix Wallet در اندروید پرداخت کنید (حداقل ۷۵۰۰ برای باز کردن قفل).\n۲. از تأیید تراکنش موفق عکس بگیرید.\n۳. عکس را به jounaidnadirmed@gmail.com بفرستید و نام کاربری \'$username\' را بنویسید.\n۴. برای ذخیره درخواست در این دستگاه، در کادر زیر چیزی بنویسید:';
  }

  @override
  String get supportRequestHint =>
      'نام یا اطلاعات تراکنش خود را اینجا بنویسید...';

  @override
  String get maybeLater => 'بعداً';

  @override
  String get submitProof => 'ارسال مدرک';

  @override
  String get couldNotOpenWallet => 'کیف پول باز نشد. کد زیر را کپی کنید.';

  @override
  String get proofSubmittedSnackbar =>
      'مدرک ارسال شد. بررسی دستی ۲۴ تا ۴۸ ساعت طول می‌کشد (به‌جز آخر هفته). می‌توانید به‌طور معمول از برنامه استفاده کنید.';

  @override
  String get loadingChats => 'در حال بارگیری چت ها...';

  @override
  String get noChatsYetTitle => 'هنوز چت وجود ندارد';

  @override
  String get noChatsYetHint =>
      'هنگامی که شما کد QR CRYPT شخص دیگر را اسکن می کنید، چت شروع می شود. صفحه هویت خود را برای به اشتراک گذاشتن صفحه خود باز کنید تا آنها بتوانند آن را اسکن کنند.';

  @override
  String get scanQrToStartChat => 'یک کد QR را اسکن کنید';

  @override
  String get noChatsMatchSearch => 'هیچ گپی با جستجوی شما مطابقت ندارد';

  @override
  String get noChatsMatchSearchHint =>
      'نام دیگری را امتحان کنید، یا جستجو را پاک کنید تا هر چت را ببینید.';

  @override
  String get requestSentTitle => 'درخواست ارسال شد';

  @override
  String requestSentBody(String username) {
    return 'درخواست شما به $username. لطفا صبر کنید تا آنها آن را قبول کنند.';
  }

  @override
  String get requestSentKeepOpen =>
      'چت به محض پذیرش باز می شود. CRYPT را در این دستگاه باز نگه دارید تا آن را از دست ندهید.';

  @override
  String get requestSentGotIt => 'متوجه شدم';

  @override
  String get scanCouldNotReadCode =>
      'آن کد قابل خواندن نبود. یک کد QR CRYPT را اسکن کنید.';

  @override
  String get scanMissingTheirIdentity =>
      'آن کد هویت فرد را ندارد. کد را از صفحه هویت آنها اسکن کنید.';

  @override
  String get scanOwnIdentityMissing =>
      'کلید رمزگذاری خود شما گم شده است. از سیستم خارج شوید و دوباره وارد شوید، سپس دوباره اسکن کنید.';

  @override
  String get noLightningWalletFound =>
      'کیف پول لایتنینگ پیدا نشد. یکی را نصب کنید، یا آدرس را کپی کرده و در کیف پول قرار دهید.';

  @override
  String get settingsSectionAppearance => 'ظاهر';

  @override
  String get settingsSectionPrivacy => 'حریم خصوصی و امنیت';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'کمک و قانونی';

  @override
  String get settingsSectionAdministration => 'اداره';

  @override
  String get settingsSectionAccount => 'حساب';

  @override
  String get settingsProtectTitle => 'از تنظیمات با رمز عبور اصلی محافظت کنید';

  @override
  String get settingsProtectSubtitle =>
      'برای دسترسی به تنظیمات رمز عبور لازم است';

  @override
  String get chatLockSetPinSubtitle =>
      'برای تنظیم پین خود برای این گپ ضربه بزنید';

  @override
  String get premiumTileTitle => 'مادام العمر Premium را دریافت کنید';

  @override
  String get premiumActiveSubtitle => 'Premium برای حساب شما روشن است';

  @override
  String get premiumPendingSubtitle =>
      'در انتظار یک سرپرست برای بررسی اسکرین شات شما';

  @override
  String get premiumHowItWorks => 'Premium چگونه کار می کند';

  @override
  String get reportProblemTitle => 'یک مشکل را گزارش کنید';

  @override
  String get reportProblemSubtitle => 'اشکال، سوء استفاده یا هرزنامه';

  @override
  String get adminAccessTitle => 'دسترسی ادمین';

  @override
  String get adminAccessSubtitle => 'کد مدیریت خود را وارد کنید تا پنل باز شود';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method - کد خود، فقط این چت';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount یک بار با کیف پول لایتنینگ خود، سپس یک اسکرین شات بفرستید';
  }

  @override
  String premiumPendingBody(String window) {
    return 'نماگرفت شما وارد شده است. یک سرپرست آن را بررسی می‌کند و Premium برای حساب شما در داخل روشن می‌شود $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. پرداخت کنید $amount با $method، یا $wallet.\n2. تصویر تایید پرداخت.\n3. آن را از ارسال اثبات پرداخت ارسال کنید.\n4. Premium روشن می شود و مادام العمر روشن می ماند.\n\nCRYPT توسط یک توسعه دهنده انفرادی ساخته شده است، و این کل پیشنهاد است: یک پرداخت، بدون اشتراک.';
  }

  @override
  String get reportIntro =>
      'به ما بگویید چه اتفاقی افتاده است. اگر شخص دیگری را گزارش می‌دهید، نام کاربری او را اضافه کنید تا بتوانیم روی حساب درست عمل کنیم.';

  @override
  String get reportSent => 'گزارش ارسال شد. متشکرم.';

  @override
  String get reportSendFailed => 'گزارش ارسال نشد.';

  @override
  String get reportTypeLabel => 'نوع گزارش';

  @override
  String get reportCategoryBug => 'اشکال';

  @override
  String get reportCategoryAbuse => 'سوء استفاده';

  @override
  String get reportCategorySpam => 'هرزنامه';

  @override
  String get reportCategoryOther => 'دیگر';

  @override
  String get reportUsernameLabel => 'نام کاربری آنها (اختیاری)';

  @override
  String get reportUsernameHint => 'به عنوان مثال کسی_تو_میخوای_گزارش کرد';

  @override
  String get reportDetailsLabel => 'چه اتفاقی افتاد؟';

  @override
  String get reportScreenshotsLabel => 'اسکرین شات ها';

  @override
  String get reportAddScreenshot => 'اضافه کردن اسکرین شات';

  @override
  String get reportSendButton => 'ارسال گزارش';

  @override
  String get reportPrivacyNote =>
      'گزارش ها توسط یک مدیر بررسی می شود. اسکرین شات ها به صورت خصوصی ذخیره می شوند و فقط برای گردانندگان قابل مشاهده هستند.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount یک بار، $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'بدون اشتراک و چیزی برای تمدید. پرداخت با $method، یک اسکرین شات از تایید ارسال کنید، و Premium در داخل روشن می شود $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT توسط یک توسعه دهنده انفرادی ساخته شده است. Premium چیزی است که آن را بدون آگهی و به طور فعال حفظ می کند.';

  @override
  String get premiumStepPay => 'با کیف پول خود پرداخت کنید';

  @override
  String get premiumLightningAddressLabel => 'آدرس رعد و برق';

  @override
  String get premiumOpenWallet => 'باز کردن کیف پول';

  @override
  String get premiumCopyAddress => 'آدرس را کپی کنید';

  @override
  String get premiumWorksWith =>
      'با فونیکس و هر کیف پول لایتنینگ دیگری کار می کند.';

  @override
  String get premiumStepScreenshot => 'اسکرین شات خود را ارسال کنید';

  @override
  String get premiumScreenshotHint =>
      'یک اسکرین شات از تایید پرداخت در کیف پول لایتنینگ خود بگیرید و آن را در زیر پیوست کنید.';

  @override
  String get premiumAttachScreenshot => 'اسکرین شات را پیوست کنید';

  @override
  String get premiumReplaceScreenshot => 'اسکرین شات را جایگزین کنید';

  @override
  String get premiumStepAmount => 'مبلغ را تایید کنید';

  @override
  String get premiumAmountLabel => 'مبلغ پرداختی شما (دلار آمریکا)';

  @override
  String get premiumNoteLabel => 'توجه (اختیاری)';

  @override
  String get premiumSendProof => 'مدرک من را بفرست';

  @override
  String get premiumAddressCopied => 'آدرس Lightning کپی شد.';

  @override
  String get premiumAttachConfirmation =>
      'اسکرین شات تایید پرداخت خود را پیوست کنید.';

  @override
  String get premiumSendProofFailed => 'مدرک پرداخت ارسال نشد.';

  @override
  String premiumAmountHelper(String amount) {
    return 'حداقل $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'فعال سازی طول می کشد $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'مدرک دریافت شد. Premium در داخل روشن می شود $window.';
  }

  @override
  String get premiumTableFeature => 'ویژگی';

  @override
  String get premiumTableFree => 'رایگان';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'پیام های همتا به همتا رمزگذاری شده';

  @override
  String get premiumTableMessagesStay =>
      'پیام‌ها در دستگاه‌های شما باقی می‌مانند';

  @override
  String get premiumTableChatLocks => 'چت ها با پین شخصی شما قفل شده اند';

  @override
  String get premiumTableFingerprint => 'قفل را با اثر انگشت یا چهره باز کنید';

  @override
  String get premiumTablePrice => 'قیمت';

  @override
  String get premiumTableAccess => 'دسترسی داشته باشید';

  @override
  String get premiumTableIncluded => 'گنجانده شده است';

  @override
  String get premiumTableOneChat => '1 چت';

  @override
  String get premiumTableUnlimited => 'نامحدود';

  @override
  String get premiumTableNotIncluded => 'گنجانده نشده است';

  @override
  String get premiumTableFreeValue => 'رایگان';

  @override
  String get premiumTableWhileFree => 'در حالی که برنامه رایگان است';

  @override
  String get premiumTableLifetime => 'طول عمر';

  @override
  String premiumTableOnePayment(String amount) {
    return 'یک پرداخت از $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'یک پرداخت از $amount و Premium مادام العمر متعلق به شماست. هیچ اشتراک و چیزی برای تمدید وجود ندارد.';
  }

  @override
  String get settingsSaveFailed =>
      'نمی توان آن تنظیم را ذخیره کرد. دوباره امتحان کنید.';

  @override
  String get settingsLockFailed =>
      'نمی توان این چت را قفل کرد. دوباره امتحان کنید.';

  @override
  String get settingsUnlockFailed => 'قفل این چت باز نشد. دوباره امتحان کنید.';

  @override
  String pinSetTitle(String chat) {
    return 'یک پین برای $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'پین را برای $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'این پین باز می شود $chat فقط هر چت پین مخصوص به خود را دارد که توسط شما انتخاب شده است. هیچ کد واحدی برای برنامه وجود ندارد.';
  }

  @override
  String get pinMismatch => 'پین ها مطابقت نداشتند. قفل فعال نیست';

  @override
  String get biometricNotSetUp =>
      'اثر انگشت یا قفل با چهره در این دستگاه تنظیم نشده است.';

  @override
  String get biometricVerifyFailed =>
      'نمی‌توان تأیید کرد که شما در این دستگاه هستید.';

  @override
  String get lightningAddressCopied =>
      'آدرس Lightning کپی شد. برای پرداخت آن را در کیف پول قرار دهید.';

  @override
  String get accountSuspended => 'حساب به حالت تعلیق درآمد';

  @override
  String get premiumLifetimeAccess => 'دسترسی Premium مادام العمر';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'پرداخت کنید $amount از $method به آدرس لایتنینگ بالا';
  }

  @override
  String get premiumActivationStep2 =>
      'یک اسکرین شات از تایید پرداخت بگیرید و آن را به عنوان مدرک پرداخت خود ارسال کنید.';

  @override
  String get pinFourDigits => 'دقیقا 4 رقم وارد کنید.';

  @override
  String get scanOwnCode =>
      'این کد خود شماست. کد CRYPT شخص دیگری را اسکن کنید تا با او چت کنید.';

  @override
  String get couldNotGenerateQrImage => 'تصویر QR ایجاد نشد';

  @override
  String get conversationUpdateFailed =>
      'به‌روزرسانی مکالمه انجام نشد. دوباره امتحان کنید.';

  @override
  String get conversationCreationFailed =>
      'مکالمه ایجاد نشد. دوباره امتحان کنید.';

  @override
  String get accountSuspendedByAdmin =>
      'این حساب توسط یک سرپرست به حالت تعلیق درآمده است.';

  @override
  String get unlockCrypt => 'باز کردن قفل برنامه';

  @override
  String get unlockCryptBody =>
      'رمز عبور اصلی خود را برای رمزگشایی پیام های خود در این دستگاه وارد کنید.';

  @override
  String get unlock => 'اکنون قفل را باز کنید';

  @override
  String get attachPhoto => 'عکس';

  @override
  String get attachFile => 'فایل';

  @override
  String attachmentTooLarge(int mb) {
    return 'اون فایل خیلی بزرگه حد مجاز $mb مگابایت است.';
  }

  @override
  String get attachmentSendFailed => 'آن پیوست ارسال نشد.';

  @override
  String get attachmentOpenFailed => 'آن پیوست باز نشد.';
}
