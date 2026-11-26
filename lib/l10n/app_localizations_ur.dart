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
  String get termsAndConditions => 'شرائط و ضوابط';

  @override
  String get settingsTermsAndConditions => 'شرائط و ضوابط';

  @override
  String get termsIntro =>
      'CRYPT لوگوں کو براہ راست گفتگو کے لیے جوڑنے والی ابتدائی مرحلے کی ایپلی کیشن ہے۔ ایپ کو مناسب طریقے سے استعمال کرنا اور اپنے اکاؤنٹ کی اسناد محفوظ رکھنا آپ کی ذمہ داری ہے۔';

  @override
  String get termsConnectivity =>
      'CRYPT آلات کو ایک دوسرے کو تلاش کرنے اور رابطہ قائم کرنے میں مدد دینے کے لیے آن لائن خدمات استعمال کرتا ہے۔ ایپ کی ترقی کے ساتھ دستیابی اور رابطے کا طریقہ بدل سکتا ہے۔ براہ کرم CRYPT کو رابطے کا اپنا واحد ذریعہ نہ سمجھیں۔';

  @override
  String get termsAgreement =>
      'جاری رکھ کر آپ تصدیق کرتے ہیں کہ آپ نے یہ شرائط پڑھ لی ہیں اور ان کے تحت CRYPT استعمال کرنے سے اتفاق کرتے ہیں۔';

  @override
  String get agreeTerms => 'میں شرائط و ضوابط سے اتفاق کرتا ہوں';

  @override
  String get agreeAndContinue => 'اتفاق کریں اور جاری رکھیں';

  @override
  String get beforeYouStart => 'شروع کرنے سے پہلے';

  @override
  String get connected => 'منسلک';

  @override
  String get connectFirstThenChat => 'پہلے منسلک ہوں، پھر چیٹ کریں';

  @override
  String get betaIntro =>
      'CRYPT ابتدائی بیٹا ورژن ہے، اس لیے آئندہ ورژنز میں تجربہ بہتر ہو سکتا ہے۔';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT واکی ٹاکی کی طرح کام کرتا ہے: رابطہ قائم کرنے کے لیے دونوں افراد کا آن لائن ہونا اور ایک ہی وقت میں CRYPT کھولنا ضروری ہے۔';

  @override
  String get howToUseCrypt =>
      'CRYPT استعمال کرنے کا طریقہ:\n1. دوسرے شخص کا CRYPT QR کوڈ اسکین کریں۔\n2. دونوں افراد کے لیے CRYPT کھلا اور آن لائن ہونا ضروری ہے۔\n3. CRYPT کے P2P رابطہ قائم کرنے تک انتظار کریں۔\n4. “رابطہ ہو رہا ہے...” کی حالت ختم ہونے اور رابطہ قائم ہونے تک انتظار کریں۔\n5. منسلک ہونے کے بعد آپ چیٹ شروع کر سکتے ہیں۔';

  @override
  String get messageStorageExplanation =>
      'آپ کے پیغامات منسلک آلات کے درمیان براہ راست منتقل ہونے کے لیے بنائے گئے ہیں۔ CRYPT آپ کے چیٹ پیغامات ہمارے سرورز پر محفوظ نہیں کرتا۔ سرور فی الحال رابطے اور سگنلنگ میں مدد کرتا ہے، جبکہ چیٹ کی تاریخ سرور پر محفوظ نہیں ہوتی۔ اگر دوسرا شخص آف لائن ہو تو موجودہ P2P رابطہ قائم نہیں ہو سکتا۔';

  @override
  String get settingsAndSupportExplanation =>
      'اپنا CRYPT تجربہ حسب ضرورت بنانے کے لیے Settings کھولیں۔ مزید تخصیصی اختیارات جلد آ رہے ہیں۔\n\nکیا آپ CRYPT کی مدد کرنا چاہتے ہیں؟ عطیہ دینے کا اختیار Settings میں موجود ہے۔';

  @override
  String get saving => 'محفوظ کیا جا رہا ہے...';

  @override
  String get continueToCrypt => 'CRYPT پر جاری رکھیں';

  @override
  String get showSplashScreen => 'اسپلش اسکرین دکھائیں';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get connectionFailed => 'رابطہ ناکام ہو گیا';

  @override
  String get connectionFailedDetails =>
      'رابطہ ناکام ہو گیا۔ منسلک ہونے کے لیے دونوں آلات کا CRYPT کے ساتھ آن لائن ہونا ضروری ہے۔';

  @override
  String get gallery => 'گیلری';

  @override
  String get alignQrCode => 'QR کوڈ سیدھا کریں';

  @override
  String get scanFromGallery => 'گیلری سے اسکین کریں';

  @override
  String get couldNotScanImage => 'تصویر اسکین نہیں ہو سکی۔';

  @override
  String couldNotShareQrCode(String error) {
    return 'QR کوڈ شیئر نہیں ہو سکا: $error';
  }

  @override
  String newContact(String username) {
    return 'نیا رابطہ: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'آپ کی عوامی انکرپشن کلید موجود نہیں ہے۔';

  @override
  String get contactEncryptionKeyMissing =>
      'رابطے کی انکرپشن کلید موجود نہیں ہے۔';

  @override
  String get localEncryptionKeyMissing => 'مقامی انکرپشن کلید موجود نہیں ہے۔';

  @override
  String get noQrCodeFound => 'اس تصویر میں کوئی QR کوڈ نہیں ملا۔';

  @override
  String get shareQrCode => 'QR کوڈ شیئر کریں';

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
  String get supportIntro =>
      'ارے! 👋 میں ایک سولو ڈویلپر ہوں جو CRYPT پر سخت محنت کر رہا ہوں۔ میرے پاس بجٹ یا کارپوریٹ فنڈنگ ​​نہیں ہے۔ میں ایپ کو بہتر بنانے کے لیے آپ کی ایمانداری اور ہمدردی پر مکمل انحصار کرتا ہوں اور ہمیشہ کے لیے کسی اشتہار کی ضمانت نہیں دیتا ہوں۔';

  @override
  String get chooseSupportAmount =>
      'اپنی قیمت کا انتخاب کریں (سپورٹ کے لیے سلائیڈ):';

  @override
  String get poorGang => 'میں غریب گینگ ہوں 🥀✌️';

  @override
  String get launchOfferMinimum => 'کم از کم پیشکش لانچ کریں 🚀';

  @override
  String get buyMeCoffee => 'مجھے ایک کافی خریدیں ☕';

  @override
  String get superSupporter => 'سپر سپورٹر 🔥';

  @override
  String get feature => 'فیچر';

  @override
  String get freeTier => 'مفت درجے';

  @override
  String get premium => 'پریمیم';

  @override
  String get chatLocks => 'چیٹ لاک';

  @override
  String get maxOneRoom => 'زیادہ سے زیادہ 1 کمرہ';

  @override
  String get unlimited => 'لا محدود';

  @override
  String get biometrics => 'بایومیٹرکس';

  @override
  String get disabled => '🚫 معذور';

  @override
  String supportWithSats(String amount) {
    return '$amount sats کے ساتھ سپورٹ (فینکس)';
  }

  @override
  String get boltOffer =>
      '⚡ BOLT12 ادائیگی کی پیشکش • کاپی کرنے کے لیے تھپتھپائیں۔';

  @override
  String get boltOfferCopied => 'BOLT12 ادائیگی کی پیشکش کاپی ہو گئی۔';

  @override
  String get tapToCopyBoltOffer =>
      'BOLT12 ادائیگی کی پیشکش کاپی کرنے کے لیے تھپتھپائیں۔';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 غیر مقفل کرنے کے لیے آسان ہدایات:';

  @override
  String unlockInstructions(String username) {
    return '1. Android پر Phoenix Wallet کا استعمال کرتے ہوئے ادائیگی کریں (انلاک کرنے کے لیے کم از کم 7,500 — زیادہ کی ہمیشہ تعریف کی جاتی ہے)۔\n2. اپنی کامیاب ٹرانزیکشن کی تصدیق کی اسکرین کا اسکرین شاٹ لیں۔\n3. اس اسکرین شاٹ کو jounaidnadirmed@gmail.com پر ای میل کریں اور مجھے اپنے منفرد اکاؤنٹ کا صارف نام بتائیں: \'$username\' تاکہ مجھے معلوم ہو کہ کس نے ادائیگی کی۔\n4. اس ڈیوائس پر اپنی درخواست محفوظ کرنے کے لیے نیچے دیے گئے باکس میں کچھ بھی ٹائپ کریں:';
  }

  @override
  String get supportRequestHint =>
      'اپنا نام یا لین دین کی معلومات یہاں ٹائپ کریں...';

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

  @override
  String get loadingChats => 'چیٹس لوڈ ہو رہی ہیں...';

  @override
  String get noChatsYetTitle => 'ابھی تک کوئی چیٹس نہیں ہیں۔';

  @override
  String get noChatsYetHint =>
      'جب آپ دوسرے شخص کا CRYPT QR کوڈ اسکین کرتے ہیں تو چیٹ شروع ہوتی ہے۔ اپنا اشتراک کرنے کے لیے اپنا شناختی صفحہ کھولیں تاکہ وہ اسے اسکین کر سکیں۔';

  @override
  String get scanQrToStartChat => 'QR کوڈ اسکین کریں۔';

  @override
  String get noChatsMatchSearch => 'کوئی چیٹ آپ کی تلاش سے مماثل نہیں ہے۔';

  @override
  String get noChatsMatchSearchHint =>
      'ایک مختلف نام آزمائیں، یا ہر چیٹ دیکھنے کے لیے تلاش کو صاف کریں۔';

  @override
  String get requestSentTitle => 'درخواست بھیج دی گئی۔';

  @override
  String requestSentBody(String username) {
    return 'آپ کی فرمائش اس کے پاس گئی۔ $username. براہ کرم انتظار کریں جب تک وہ اسے قبول کریں۔';
  }

  @override
  String get requestSentKeepOpen =>
      'جیسے ہی وہ قبول کرتے ہیں چیٹ کھل جاتی ہے۔ اس ڈیوائس پر CRYPT کو کھلا رکھیں تاکہ آپ اسے یاد نہ کریں۔';

  @override
  String get requestSentGotIt => 'سمجھ گیا';

  @override
  String get scanCouldNotReadCode =>
      'وہ کوڈ پڑھا نہیں جا سکا۔ ایک CRYPT QR کوڈ اسکین کریں۔';

  @override
  String get scanMissingTheirIdentity =>
      'اس کوڈ میں اس شخص کی شناخت موجود نہیں ہے۔ کوڈ کو ان کے شناختی صفحہ سے اسکین کریں۔';

  @override
  String get scanOwnIdentityMissing =>
      'آپ کی اپنی خفیہ کاری کی کلید غائب ہے۔ سائن آؤٹ اور واپس ان کریں، پھر دوبارہ اسکین کریں۔';

  @override
  String get noLightningWalletFound =>
      'کوئی Lightning والا پرس نہیں ملا۔ ایک انسٹال کریں، یا ایڈریس کاپی کریں اور اسے بٹوے میں چسپاں کریں۔';

  @override
  String get settingsSectionAppearance => 'ظاہری شکل';

  @override
  String get settingsSectionPrivacy => 'رازداری اور سلامتی';

  @override
  String get settingsSectionPremium => 'پریمیم';

  @override
  String get settingsSectionHelp => 'مدد اور قانونی';

  @override
  String get settingsSectionAdministration => 'انتظامیہ';

  @override
  String get settingsSectionAccount => 'اکاؤنٹ';

  @override
  String get settingsProtectTitle =>
      'ماسٹر پاس ورڈ کے ساتھ ترتیبات کی حفاظت کریں۔';

  @override
  String get settingsProtectSubtitle =>
      'ترتیبات تک رسائی کے لیے پاس ورڈ کی ضرورت ہے۔';

  @override
  String get chatLockSetPinSubtitle =>
      'اس چیٹ کے لیے اپنا PIN سیٹ کرنے کے لیے تھپتھپائیں۔';

  @override
  String get premiumTileTitle => 'لائف ٹائم پریمیم حاصل کریں۔';

  @override
  String get premiumActiveSubtitle => 'آپ کے اکاؤنٹ کے لیے پریمیم آن ہے۔';

  @override
  String get premiumPendingSubtitle =>
      'آپ کے اسکرین شاٹ کا جائزہ لینے کے لیے منتظم کا انتظار ہے۔';

  @override
  String get premiumHowItWorks => 'پریمیم کیسے کام کرتا ہے۔';

  @override
  String get reportProblemTitle => 'کسی مسئلے کی اطلاع دیں۔';

  @override
  String get reportProblemSubtitle => 'کیڑے، غلط استعمال یا فضول';

  @override
  String get adminAccessTitle => 'ایڈمن تک رسائی';

  @override
  String get adminAccessSubtitle =>
      'پینل کھولنے کے لیے اپنا ایڈمن کوڈ درج کریں۔';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method - اپنا کوڈ، صرف یہ چیٹ';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount ایک بار اپنے لائٹننگ والیٹ کے ساتھ، پھر اسکرین شاٹ بھیجیں۔';
  }

  @override
  String premiumPendingBody(String window) {
    return 'آپ کا اسکرین شاٹ اندر ہے۔ ایک منتظم اسے چیک کرتا ہے اور اندر ہی آپ کے اکاؤنٹ کے لیے پریمیم آن ہو جاتا ہے۔ $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. ادا کرنا $amount کے ساتھ $method، یا $wallet.\n2. ادائیگی کی تصدیق کا اسکرین شاٹ۔\n3. اسے جمع کروائیں ادائیگی کے ثبوت سے بھیجیں۔\n4. پریمیم آن ہوتا ہے اور تاحیات جاری رہتا ہے۔\n\nCRYPT ایک سولو ڈویلپر کے ذریعہ بنایا گیا ہے، اور یہ پوری پیشکش ہے: ایک ادائیگی، کوئی رکنیت نہیں۔';
  }

  @override
  String get reportIntro =>
      'ہمیں بتائیں کیا ہوا؟ اگر آپ کسی دوسرے شخص کی اطلاع دے رہے ہیں، تو اس کا صارف نام شامل کریں تاکہ ہم صحیح اکاؤنٹ پر کام کر سکیں۔';

  @override
  String get reportSent => 'رپورٹ بھیج دی گئی۔ شکریہ';

  @override
  String get reportSendFailed => 'رپورٹ نہیں بھیج سکی۔';

  @override
  String get reportTypeLabel => 'رپورٹ کی قسم';

  @override
  String get reportCategoryBug => 'بگ';

  @override
  String get reportCategoryAbuse => 'گالی';

  @override
  String get reportCategorySpam => 'سپیم';

  @override
  String get reportCategoryOther => 'دیگر';

  @override
  String get reportUsernameLabel => 'ان کا صارف نام (اختیاری)';

  @override
  String get reportUsernameHint => 'جیسے کسی نے_آپ_چاہتی_رپورٹ کی';

  @override
  String get reportDetailsLabel => 'کیا ہوا؟';

  @override
  String get reportScreenshotsLabel => 'اسکرین شاٹس';

  @override
  String get reportAddScreenshot => 'اسکرین شاٹ شامل کریں۔';

  @override
  String get reportSendButton => 'رپورٹ بھیجیں۔';

  @override
  String get reportPrivacyNote =>
      'رپورٹس کا جائزہ منتظم کے ذریعے کیا جاتا ہے۔ اسکرین شاٹس پرائیویٹ طور پر اسٹور کیے جاتے ہیں اور صرف ماڈریٹرز کو دکھائی دیتے ہیں۔';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount ایک بار، $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'کوئی رکنیت نہیں اور تجدید کے لیے کچھ نہیں۔ کے ساتھ ادائیگی کریں۔ $method تصدیق کا ایک اسکرین شاٹ بھیجیں، اور پریمیم اندر ہی آن کر دیا جاتا ہے۔ $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT ایک سولو ڈویلپر کے ذریعہ بنایا گیا ہے۔ پریمیم وہی ہے جو اسے اشتہارات سے پاک اور فعال طور پر برقرار رکھتا ہے۔';

  @override
  String get premiumStepPay => 'اپنے بٹوے سے ادائیگی کریں۔';

  @override
  String get premiumLightningAddressLabel => 'Lightning کا پتہ';

  @override
  String get premiumOpenWallet => 'پرس کھولیں۔';

  @override
  String get premiumCopyAddress => 'ایڈریس کاپی کریں۔';

  @override
  String get premiumWorksWith =>
      'فینکس اور کسی دوسرے لائٹننگ والیٹ کے ساتھ کام کرتا ہے۔';

  @override
  String get premiumStepScreenshot => 'اپنا اسکرین شاٹ بھیجیں۔';

  @override
  String get premiumScreenshotHint =>
      'اپنے Lightning والیٹ میں ادائیگی کی تصدیق کا اسکرین شاٹ لیں اور اسے نیچے منسلک کریں۔';

  @override
  String get premiumAttachScreenshot => 'اسکرین شاٹ منسلک کریں۔';

  @override
  String get premiumReplaceScreenshot => 'اسکرین شاٹ کو تبدیل کریں۔';

  @override
  String get premiumStepAmount => 'رقم کی تصدیق کریں۔';

  @override
  String get premiumAmountLabel => 'آپ کی ادا کردہ رقم (USD)';

  @override
  String get premiumNoteLabel => 'نوٹ (اختیاری)';

  @override
  String get premiumSendProof => 'میرا ثبوت بھیج دو';

  @override
  String get premiumAddressCopied => 'Lightning کا پتہ کاپی ہو گیا۔';

  @override
  String get premiumAttachConfirmation =>
      'اپنی ادائیگی کی تصدیق کا اسکرین شاٹ منسلک کریں۔';

  @override
  String get premiumSendProofFailed => 'ادائیگی کا ثبوت نہیں بھیج سکا۔';

  @override
  String premiumAmountHelper(String amount) {
    return 'کم از کم $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'ایکٹیویشن لیتا ہے۔ $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'ثبوت مل گیا۔ پریمیم اندر ہی آن ہے۔ $window.';
  }

  @override
  String get premiumTableFeature => 'فیچر';

  @override
  String get premiumTableFree => 'مفت';

  @override
  String get premiumTablePremium => 'پریمیم';

  @override
  String get premiumTableEncrypted => 'انکرپٹڈ پیئر ٹو پیئر میسجنگ';

  @override
  String get premiumTableMessagesStay => 'پیغامات آپ کے آلات پر رہتے ہیں۔';

  @override
  String get premiumTableChatLocks => 'چیٹس آپ کے اپنے PIN کے ساتھ مقفل ہیں۔';

  @override
  String get premiumTableFingerprint =>
      'فنگر پرنٹ یا چہرے کے ساتھ غیر مقفل کریں۔';

  @override
  String get premiumTablePrice => 'قیمت';

  @override
  String get premiumTableAccess => 'رسائی';

  @override
  String get premiumTableIncluded => 'شامل';

  @override
  String get premiumTableOneChat => '1 چیٹ';

  @override
  String get premiumTableUnlimited => 'لا محدود';

  @override
  String get premiumTableNotIncluded => 'شامل نہیں';

  @override
  String get premiumTableFreeValue => 'مفت';

  @override
  String get premiumTableWhileFree => 'جبکہ ایپ مفت ہے۔';

  @override
  String get premiumTableLifetime => 'زندگی بھر';

  @override
  String premiumTableOnePayment(String amount) {
    return 'کی ایک ادائیگی $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'کی ایک ادائیگی $amount اور پریمیم زندگی کے لیے آپ کا ہے۔ کوئی رکنیت نہیں ہے اور تجدید کرنے کے لئے کچھ بھی نہیں ہے۔';
  }

  @override
  String get settingsSaveFailed =>
      'اس ترتیب کو محفوظ نہیں کیا جا سکا۔ دوبارہ کوشش کریں۔';

  @override
  String get settingsLockFailed =>
      'اس چیٹ کو لاک نہیں کیا جا سکا۔ دوبارہ کوشش کریں۔';

  @override
  String get settingsUnlockFailed =>
      'اس چیٹ کو غیر مقفل نہیں کیا جا سکا۔ دوبارہ کوشش کریں۔';

  @override
  String pinSetTitle(String chat) {
    return 'کے لیے ایک پن سیٹ کریں۔ $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'کے لیے پن کی تصدیق کریں۔ $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'یہ PIN کھلتا ہے۔ $chat صرف ہر چیٹ کا اپنا PIN ہوتا ہے، جسے آپ نے منتخب کیا ہے۔ ایپ کے لیے کوئی واحد کوڈ نہیں ہے۔';
  }

  @override
  String get pinMismatch => 'PINs مماثل نہیں ہیں۔ لاک فعال نہیں ہے۔';

  @override
  String get biometricNotSetUp =>
      'اس ڈیوائس پر کوئی فنگر پرنٹ یا فیس ان لاک سیٹ اپ نہیں ہے۔';

  @override
  String get biometricVerifyFailed =>
      'اس بات کی توثیق نہیں کی جا سکی کہ یہ اس آلہ پر آپ ہی ہیں۔';

  @override
  String get lightningAddressCopied =>
      'Lightning کا پتہ کاپی ہو گیا۔ ادائیگی کے لیے اسے بٹوے میں چسپاں کریں۔';

  @override
  String get accountSuspended => 'اکاؤنٹ معطل';

  @override
  String get premiumLifetimeAccess => 'لائف ٹائم پریمیم رسائی';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'ادا کریں۔ $amount سے $method اوپر Lightning کے پتے پر۔';
  }

  @override
  String get premiumActivationStep2 =>
      'ادائیگی کی تصدیق کا اسکرین شاٹ لیں اور اسے اپنے ادائیگی کے ثبوت کے طور پر بھیجیں۔';

  @override
  String get pinFourDigits => 'بالکل 4 ہندسے درج کریں۔';

  @override
  String get scanOwnCode =>
      'یہ آپ کا اپنا کوڈ ہے۔ کسی اور کے ساتھ چیٹ شروع کرنے کے لیے اس کا CRYPT کوڈ اسکین کریں۔';

  @override
  String get couldNotGenerateQrImage => 'QR تصویر نہیں بن سکی';

  @override
  String get conversationUpdateFailed =>
      'بات چیت کی تازہ کاری ناکام ہو گئی۔ دوبارہ کوشش کریں۔';

  @override
  String get conversationCreationFailed =>
      'بات چیت کی تخلیق ناکام ہو گئی۔ دوبارہ کوشش کریں۔';

  @override
  String get accountSuspendedByAdmin =>
      'اس اکاؤنٹ کو ایک منتظم نے معطل کر دیا ہے۔';

  @override
  String get unlockCrypt => 'ایپ کو غیر مقفل کریں۔';

  @override
  String get unlockCryptBody =>
      'اس ڈیوائس پر اپنے پیغامات کو ڈکرپٹ کرنے کے لیے اپنا ماسٹر پاس ورڈ درج کریں۔';

  @override
  String get unlock => 'ابھی غیر مقفل کریں۔';

  @override
  String get attachPhoto => 'تصویر';

  @override
  String get attachFile => 'فائل';

  @override
  String attachmentTooLarge(int mb) {
    return 'وہ فائل بہت بڑی ہے۔ حد $mb MB ہے۔';
  }

  @override
  String get attachmentSendFailed => 'وہ منسلکہ نہیں بھیج سکا۔';

  @override
  String get attachmentOpenFailed => 'وہ منسلکہ نہیں کھول سکا۔';
}
