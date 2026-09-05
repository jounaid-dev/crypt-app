// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'خوش آمدید';

  @override
  String get login => 'لاگ ان';

  @override
  String get signup => 'سائن اپ';

  @override
  String get settings => 'ترتیبات';

  @override
  String get chats => 'چیٹس';

  @override
  String get typeMessage => 'پیغام لکھیں...';

  @override
  String get send => 'بھیجیں';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'کنکشن قائم ہو رہا ہے...';

  @override
  String get connectingP2p => 'P2P سے کنیکٹ ہو رہا ہے...';

  @override
  String get p2pConnectionNotReady => 'P2P کنکشن ابھی تیار نہیں ہے.';

  @override
  String get searchLanguage => 'زبان تلاش کریں...';

  @override
  String get language => 'زبان';

  @override
  String get forceEscapeSignOutTitle => 'ہنگامی لاگ آؤٹ کریں؟';

  @override
  String get forceEscapeSignOutContent =>
      'انتباہ: اس عمل سے ڈیوائس کا تمام ڈیٹا مکمل طور پر مٹ جائے گا۔';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get wipeDevice => 'ڈیوائس مٹائیں';

  @override
  String get accountDestructionAlertTitle => 'اکاؤنٹ حذف کرنے کا انتباہ';

  @override
  String get accountDestructionWarning =>
      'انتباہ: اس عمل سے ڈیوائس کا تمام ڈیٹا حذف ہو جائے گا۔ انٹرنیٹ سے منسلک ہونے پر یہ ریموٹ خودکار حذف کمانڈ کو متحرک کرے گا۔ آپ کی منفرد یوزر آئی ڈی سے بھیجا گیا ہر پیغام تمام پیئرز کی میموری سے مستقل طور پر مٹا دیا جائے گا۔';

  @override
  String get accountDestructionCriticalNotice =>
      'اہم: اگر آپ یہ تصدیقی اعداد غلط درج کرتے ہیں تو سسٹم لاک ہو جائے گا۔ اسے ان لاک کرنے کے لیے ماسٹر اکاؤنٹ پاس ورڈ درج کریں یا ایمرجنسی ایسکیپ استعمال کریں، جو ڈیوائس کا ڈیٹا فوری طور پر صاف کر دیتا ہے۔';

  @override
  String verificationSecurityKey(String code) {
    return 'تصدیقی سیکیورٹی کی: $code';
  }

  @override
  String get copyDigitsHint => 'اوپر دیے گئے 5 ہندسے کاپی کریں';

  @override
  String get codeMismatchNotice =>
      'کوڈ مماثل نہیں ہے۔ ماسٹر پاس ورڈ درج کریں یا 10 منٹ کے لیے لاک کا سامنا کریں۔';

  @override
  String get accountPasswordLabel => 'اکاؤنٹ پاس ورڈ';

  @override
  String get deleteEverythingPermanently => 'سب کچھ مستقل طور پر حذف کریں';

  @override
  String get escapeAndPurgeDeviceData =>
      'ایمرجنسی ایسکیپ اور ڈیوائس کا ڈیٹا صاف کریں';

  @override
  String get addContact => 'کانٹیکٹ شامل کریں';

  @override
  String get addContactConfirmation => 'کیا آپ یہ کانٹیکٹ شامل کرنا چاہتے ہیں؟';

  @override
  String get noMessagesYet => 'ابھی تک کوئی پیغام نہیں';

  @override
  String get addNewContact => 'نیا کانٹیکٹ شامل کریں';

  @override
  String get usernameLabel => 'یوزر نیم';

  @override
  String get nicknameOptionalLabel => 'عرفی نام (اختیاری)';

  @override
  String get add => 'شامل کریں';

  @override
  String get usernameCannotBeEmpty => 'یوزر نیم خالی نہیں ہو سکتا';

  @override
  String contactAlreadyExists(String name) {
    return 'کانٹیکٹ \'$name\' پہلے ہی آپ کی ایڈریس بک میں موجود ہے۔';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'صارف \'$name\' نیٹ ورک رجسٹری میں نہیں ملا۔ مشترکہ خفیہ کلید بنانا ممکن نہیں۔';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name کامیابی سے شامل کر لیا گیا!';
  }

  @override
  String get contacts => 'کانٹیکٹس';

  @override
  String get noContactsYet => 'ابھی تک کوئی کانٹیکٹ نہیں ہے';

  @override
  String get securityLockoutActive => 'سیکیورٹی لاک فعال ہے';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'بہت زیادہ غلط کوششیں۔ رسائی $minutes منٹ کے لیے منجمد کر دی گئی ہے۔';
  }

  @override
  String get acknowledge => 'سمجھ گیا';

  @override
  String get accessBlocked => 'رسائی مسدود ہے';

  @override
  String accessSuspended(int minutes) {
    return '5 غلط تصدیقی کوششیں۔ رسائی اگلے $minutes منٹ کے لیے معطل کر دی گئی ہے۔';
  }

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String unlockSecureNode(String username) {
    return 'محفوظ نوڈ ان لاک کریں: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'باقی تصدیقی کوششیں: $count';
  }

  @override
  String get secureKeyPasscode => 'محفوظ کلید کا پاس کوڈ';

  @override
  String get warningHardwareLockout =>
      'انتباہ: اگلی غلطی ہارڈویئر سیکیورٹی لاک کو فعال کر دے گی۔';

  @override
  String get abort => 'منسوخ کریں';

  @override
  String get authenticate => 'تصدیق کریں';

  @override
  String get searchPipelinesHint => 'فعال محفوظ کنکشنز تلاش کیے جا رہے ہیں...';

  @override
  String get zeroPipelinesDiscovered => 'کوئی مماثل کمیونیکیشن کنکشن نہیں ملا۔';

  @override
  String get processingDecryption => 'ڈیکرپشن جاری ہے...';

  @override
  String get decrypting => 'ڈیکرپٹ کیا جا رہا ہے...';

  @override
  String get decryptionError => '[ڈیکرپشن میں خرابی]';

  @override
  String get cryptContainerSecure => 'CRYPT کنٹینر محفوظ ہے';

  @override
  String get connectAnAccount => 'اکاؤنٹ کنیکٹ کریں';

  @override
  String get username => 'یوزر نیم';

  @override
  String get password => 'پاس ورڈ';

  @override
  String get enterMasterSecurityPassword =>
      'اپنا ماسٹر سیکیورٹی پاس ورڈ درج کریں';

  @override
  String get pleaseFillAllFields => 'براہ کرم تمام فیلڈز پُر کریں';

  @override
  String get wrongUsernameOrPassword => 'غلط یوزر نیم یا پاس ورڈ';

  @override
  String loginError(String error) {
    return 'لاگ ان میں خرابی: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'اکاؤنٹ نہیں ہے؟ سائن اپ کریں';

  @override
  String get myIdentity => 'میری شناخت';

  @override
  String get scanToAddMe => 'مجھے شامل کرنے کے لیے اسکین کریں';

  @override
  String get shareProfileLink => 'پروفائل لنک شیئر کریں';

  @override
  String addMeOnCrypt(String link) {
    return 'مجھے CRYPT پر شامل کریں!\n\n$link';
  }

  @override
  String get scanQr => 'QR اسکین کریں';

  @override
  String get invalidCryptQrFormat => 'غلط CRYPT QR کوڈ فارمیٹ۔';

  @override
  String get userScanned => 'صارف اسکین ہو گیا!';

  @override
  String addingUser(String username) {
    return '$username کو شامل کیا جا رہا ہے...';
  }

  @override
  String get defaultUser => 'صارف';

  @override
  String get createAccount => 'اکاؤنٹ بنائیں';

  @override
  String get keepPasswordSecureHint =>
      'اسے محفوظ رکھیں؛ پاس ورڈ بعد میں تبدیل نہیں کیا جا سکتا۔';

  @override
  String get pleaseFillInAllFields => 'براہ کرم تمام فیلڈز پُر کریں';

  @override
  String get usernameExceedsLimit => 'یوزر نیم 20 حروف سے زیادہ نہیں ہو سکتا';

  @override
  String get invalidUsernameCharacters =>
      'یوزر نیم میں صرف حروف، اعداد، انڈر اسکور اور ہائفن شامل ہو سکتے ہیں';

  @override
  String get weakPasswordNotice =>
      'پاس ورڈ کم از کم 8 حروف کا ہونا چاہیے اور اس میں ایک عدد اور ایک بڑا حرف شامل ہونا چاہیے';

  @override
  String get unableToGenerateUniqueUsername =>
      'منفرد یوزر نیم بنانے میں ناکامی۔';

  @override
  String get accountCreated => 'اکاؤنٹ بن گیا';

  @override
  String yourUsernameIs(String username) {
    return 'آپ کا یوزر نیم:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'یوزر نیم \'$chosen\' پہلے ہی لیا جا چکا ہے۔\n\nآپ کا یوزر نیم:\n\n$assigned\n\nاسے یاد رکھیں۔ لاگ ان کرنے کے لیے آپ کو اس کی ضرورت ہوگی۔';
  }

  @override
  String get continueText => 'جاری رکھیں';

  @override
  String failedToGenerateIdentity(String error) {
    return 'محفوظ شناخت بنانے میں ناکامی: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT میں خوش آمدید';

  @override
  String get signupDescription =>
      'اپنی پیئر ٹو پیئر (P2P) انکرپشن کیز شروع کرنے کے لیے یوزر نیم اور پاس ورڈ درج کریں۔';

  @override
  String get chooseAUsername => 'یوزر نیم منتخب کریں';

  @override
  String get usernameHelperText =>
      'اپنا اصلی نام استعمال نہ کریں۔ اگر یوزر نیم پہلے سے لیا جا چکا ہو تو ہم خود بخود ایک منفرد لاحقہ شامل کر دیں گے۔';

  @override
  String get masterAuthenticationRequired => 'ماسٹر تصدیق درکار ہے';

  @override
  String get verify => 'تصدیق کریں';

  @override
  String get darkThemeMode => 'ڈارک تھیم موڈ';

  @override
  String get secureConversations => 'محفوظ گفتگو';

  @override
  String get noActiveConversations =>
      'کوئی فعال گفتگو نہیں ملی۔ سیکیورٹی لاکس استعمال کرنے کے لیے پہلے ایک گفتگو شروع کریں۔';

  @override
  String get logout => 'لاگ آؤٹ';

  @override
  String get wipeDeviceAndEscape => 'ڈیوائس مٹائیں اور ایمرجنسی ایسکیپ کریں';

  @override
  String get falsePassword => 'غلط پاس ورڈ';

  @override
  String accessSuspendedTimer(String time) {
    return 'سیکیورٹی کی وجہ سے رسائی معطل ہے۔ $time بعد دوبارہ کوشش کریں۔';
  }

  @override
  String get selectSecureLockMethod => 'محفوظ لاک کا طریقہ منتخب کریں';

  @override
  String get selectSecureLockDescription =>
      'کیا آپ اس گفتگو کو ڈیوائس کے فنگر پرنٹ بائیومیٹرکس یا معیاری 4 ہندسوں کے PIN سے لاک کرنا چاہتے ہیں؟';

  @override
  String get fourDigitPin => '4 ہندسوں کا PIN';

  @override
  String get fingerprintUnlock => 'فنگر پرنٹ 🔓';

  @override
  String get supportSoloDeveloper => 'ایک سولو ڈویلپر کو سپورٹ کریں';

  @override
  String get maybeLater => 'شاید بعد میں';

  @override
  String get submitProof => 'ثبوت جمع کریں';

  @override
  String get couldNotOpenWallet =>
      'والیٹ خود بخود نہیں کھل سکا۔ براہ کرم اس کے بجائے نیچے دیا گیا ٹیکسٹ کوڈ کاپی کریں۔';

  @override
  String get proofSubmittedSnackbar =>
      'ثبوت جمع کر دیا گیا! دستی جائزے میں 24–48 گھنٹے لگتے ہیں (ہفتہ وار تعطیلات کے علاوہ)۔ آپ ایپ کو معمول کے مطابق استعمال کرتے رہ سکتے ہیں۔';
}
