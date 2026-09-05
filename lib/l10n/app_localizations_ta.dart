// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'வரவேற்கிறோம்';

  @override
  String get login => 'உள்நுழைய';

  @override
  String get signup => 'பதிவுசெய்ய';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get chats => 'அரட்டைகள்';

  @override
  String get typeMessage => 'செய்தியை உள்ளிடவும்...';

  @override
  String get send => 'அனுப்பு';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'இணைக்கப்படுகிறது...';

  @override
  String get connectingP2p => 'P2P-க்கு இணைக்கப்படுகிறது...';

  @override
  String get p2pConnectionNotReady => 'P2P இணைப்பு தயாராக இல்லை.';

  @override
  String get searchLanguage => 'மொழியைத் தேடுங்கள்...';

  @override
  String get language => 'மொழி';

  @override
  String get forceEscapeSignOutTitle => 'கட்டாய அவசர வெளியேற்றத்தை இயக்கவா?';

  @override
  String get forceEscapeSignOutContent =>
      'எச்சரிக்கை: இதைச் செய்வதன் மூலம் இந்தச் சாதனத்தில் உள்ள அனைத்து தரவும் முழுமையாக நீக்கப்படும்.';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get wipeDevice => 'சாதனத்தை அழி';

  @override
  String get accountDestructionAlertTitle => 'கணக்கு அழிப்பு எச்சரிக்கை';

  @override
  String get accountDestructionWarning =>
      'எச்சரிக்கை: இந்தச் செயல் இந்தச் சாதனத்திலிருந்து உங்கள் தரவு அனைத்தையும் நீக்கும். இணையத்துடன் இணைக்கப்பட்டதும், இது தொலைநிலை சுயஅழிப்பு கட்டளையைச் செயல்படுத்தும். உங்கள் தனிப்பட்ட பயனர் ID-யிலிருந்து அனுப்பப்பட்ட அனைத்து செய்திகளும் அனைத்து பீயர்களின் நினைவகத்திலிருந்தும் நிரந்தரமாக நீக்கப்படும்.';

  @override
  String get accountDestructionCriticalNotice =>
      'முக்கியமானது: இந்தச் சரிபார்ப்பு இலக்கங்களைத் தவறாக உள்ளிட்டால், கணினி பூட்டப்படும். அதைத் திறக்க, உங்கள் முதன்மைக் கணக்கு கடவுச்சொல்லை உள்ளிட வேண்டும் அல்லது இந்தச் சாதனத்தில் உள்ள தரவை உடனடியாக முழுமையாக அழிக்கும் அவசர வெளியேற்றத்தைப் பயன்படுத்த வேண்டும்.';

  @override
  String verificationSecurityKey(String code) {
    return 'சரிபார்ப்பு பாதுகாப்பு விசை: $code';
  }

  @override
  String get copyDigitsHint => 'மேலே உள்ள 5 இலக்கங்களை நகலெடுக்கவும்';

  @override
  String get codeMismatchNotice =>
      'குறியீடு பொருந்தவில்லை. பூட்டைத் தவிர்க்க முதன்மை கடவுச்சொல்லை உள்ளிடவும் அல்லது 10 நிமிடங்கள் காத்திருக்கவும்.';

  @override
  String get accountPasswordLabel => 'கணக்கு கடவுச்சொல்';

  @override
  String get deleteEverythingPermanently => 'அனைத்தையும் நிரந்தரமாக நீக்கு';

  @override
  String get escapeAndPurgeDeviceData => 'வெளியேறி சாதனத் தரவை அழி';

  @override
  String get addContact => 'தொடர்பைச் சேர்';

  @override
  String get addContactConfirmation => 'இந்தத் தொடர்பைச் சேர்க்கவா?';

  @override
  String get noMessagesYet => 'இன்னும் செய்திகள் இல்லை';

  @override
  String get addNewContact => 'புதிய தொடர்பைச் சேர்';

  @override
  String get usernameLabel => 'பயனர் பெயர்';

  @override
  String get nicknameOptionalLabel => 'புனைப்பெயர் (விருப்பத்திற்குரியது)';

  @override
  String get add => 'சேர்';

  @override
  String get usernameCannotBeEmpty => 'பயனர் பெயர் காலியாக இருக்கக்கூடாது';

  @override
  String contactAlreadyExists(String name) {
    return '‘$name’ என்ற தொடர்பு ஏற்கனவே உங்கள் முகவரிப் புத்தகத்தில் உள்ளது.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '‘$name’ என்ற பயனர் பிணையப் பதிவேட்டில் காணப்படவில்லை. பகிரப்பட்ட ரகசியத்தை உருவாக்க முடியவில்லை.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name வெற்றிகரமாகச் சேர்க்கப்பட்டார்!';
  }

  @override
  String get contacts => 'தொடர்புகள்';

  @override
  String get noContactsYet => 'இன்னும் தொடர்புகள் இல்லை';

  @override
  String get securityLockoutActive => 'பாதுகாப்புப் பூட்டு செயலில் உள்ளது';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'பல தவறான முயற்சிகள். அணுகல் $minutes நிமிடங்களுக்கு முடக்கப்பட்டுள்ளது.';
  }

  @override
  String get acknowledge => 'புரிந்தது';

  @override
  String get accessBlocked => 'அணுகல் தடுக்கப்பட்டது';

  @override
  String accessSuspended(int minutes) {
    return '5 தவறான சரிபார்ப்புகள். அடுத்த $minutes நிமிடங்களுக்கு அணுகல் இடைநிறுத்தப்பட்டுள்ளது.';
  }

  @override
  String get ok => 'சரி';

  @override
  String unlockSecureNode(String username) {
    return 'பாதுகாப்பான முனையைத் திறக்கவும்: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'மீதமுள்ள சரிபார்ப்பு முயற்சிகள்: $count';
  }

  @override
  String get secureKeyPasscode => 'பாதுகாப்பு விசை அணுகல் குறியீடு';

  @override
  String get warningHardwareLockout =>
      'எச்சரிக்கை: அடுத்த தவறான சரிபார்ப்பு பாதுகாப்பு அமைப்பு பூட்டப்படுவதற்கு வழிவகுக்கும்.';

  @override
  String get abort => 'ரத்துசெய்';

  @override
  String get authenticate => 'அங்கீகரிக்கவும்';

  @override
  String get searchPipelinesHint =>
      'செயலில் உள்ள பாதுகாப்பான இணைப்புகளைத் தேடுகிறது...';

  @override
  String get zeroPipelinesDiscovered =>
      'பொருத்தமான இணைப்புகள் எதுவும் கண்டறியப்படவில்லை.';

  @override
  String get processingDecryption => 'மறைகுறியாக்கம் செய்யப்படுகிறது...';

  @override
  String get decrypting => 'மறைகுறியாக்கம் செய்யப்படுகிறது...';

  @override
  String get decryptionError => '[மறைகுறியாக்கப் பிழை]';

  @override
  String get cryptContainerSecure => 'CRYPT கொள்கலன் பாதுகாப்பாக உள்ளது';

  @override
  String get connectAnAccount => 'கணக்கை இணைக்கவும்';

  @override
  String get username => 'பயனர் பெயர்';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get enterMasterSecurityPassword =>
      'உங்கள் முதன்மை பாதுகாப்புக் கடவுச்சொல்லை உள்ளிடவும்';

  @override
  String get pleaseFillAllFields =>
      'தயவுசெய்து அனைத்து புலங்களையும் நிரப்பவும்';

  @override
  String get wrongUsernameOrPassword => 'தவறான பயனர் பெயர் அல்லது கடவுச்சொல்';

  @override
  String loginError(String error) {
    return 'உள்நுழைவுப் பிழை: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'கணக்கு இல்லையா? பதிவுசெய்யவும்';

  @override
  String get myIdentity => 'எனது அடையாளம்';

  @override
  String get scanToAddMe => 'என்னைச் சேர்க்க ஸ்கேன் செய்யவும்';

  @override
  String get shareProfileLink => 'சுயவிவர இணைப்பைப் பகிரவும்';

  @override
  String addMeOnCrypt(String link) {
    return 'என்னை CRYPT-ல் சேர்க்கவும்!\n\n$link';
  }

  @override
  String get scanQr => 'QR-ஐ ஸ்கேன் செய்யவும்';

  @override
  String get invalidCryptQrFormat => 'தவறான CRYPT QR குறியீட்டு வடிவம்.';

  @override
  String get userScanned => 'பயனர் ஸ்கேன் செய்யப்பட்டார்!';

  @override
  String addingUser(String username) {
    return '$username சேர்க்கப்படுகிறது...';
  }

  @override
  String get defaultUser => 'பயனர்';

  @override
  String get createAccount => 'கணக்கை உருவாக்கவும்';

  @override
  String get keepPasswordSecureHint =>
      'இதைப் பாதுகாப்பான இடத்தில் வைத்திருங்கள். கடவுச்சொல்லை மாற்ற முடியாது.';

  @override
  String get pleaseFillInAllFields =>
      'தயவுசெய்து அனைத்து புலங்களையும் நிரப்பவும்';

  @override
  String get usernameExceedsLimit =>
      'பயனர் பெயர் 20 எழுத்துகளுக்கு மேல் இருக்கக்கூடாது';

  @override
  String get invalidUsernameCharacters =>
      'பயனர் பெயரில் எழுத்துகள், எண்கள், அடிக்கோடுகள் மற்றும் ஹைபன்கள் மட்டுமே இருக்கலாம்';

  @override
  String get weakPasswordNotice =>
      'கடவுச்சொல்லில் குறைந்தது 8 எழுத்துகள், ஒரு எண் மற்றும் ஒரு பெரிய எழுத்து இருக்க வேண்டும்';

  @override
  String get unableToGenerateUniqueUsername =>
      'தனித்துவமான பயனர் பெயரை உருவாக்க முடியவில்லை.';

  @override
  String get accountCreated => 'கணக்கு உருவாக்கப்பட்டது';

  @override
  String yourUsernameIs(String username) {
    return 'உங்கள் பயனர் பெயர்:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '‘$chosen’ என்ற பயனர் பெயர் ஏற்கனவே பயன்படுத்தப்படுகிறது.\n\nஉங்கள் பயனர் பெயர்:\n\n$assigned\n\nஇதை நினைவில் வைத்துக்கொள்ளுங்கள். உள்நுழைய இது தேவைப்படும்.';
  }

  @override
  String get continueText => 'தொடரவும்';

  @override
  String failedToGenerateIdentity(String error) {
    return 'பாதுகாப்பான அடையாளத்தை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT-க்கு வரவேற்கிறோம்';

  @override
  String get signupDescription =>
      'P2P குறியாக்க விசைகளை உருவாக்க பயனர் பெயர் மற்றும் கடவுச்சொல்லை உள்ளிடவும்.';

  @override
  String get chooseAUsername => 'பயனர் பெயரைத் தேர்ந்தெடுக்கவும்';

  @override
  String get usernameHelperText =>
      'உங்கள் உண்மையான பெயரைப் பயன்படுத்த வேண்டாம். பயனர் பெயர் ஏற்கனவே பயன்படுத்தப்பட்டிருந்தால், தானாகவே தனித்துவமான பின்னொட்டு சேர்க்கப்படும்.';

  @override
  String get masterAuthenticationRequired => 'முதன்மை அங்கீகாரம் தேவை';

  @override
  String get verify => 'சரிபார்க்கவும்';

  @override
  String get darkThemeMode => 'இருண்ட தீம்';

  @override
  String get secureConversations => 'பாதுகாப்பான உரையாடல்கள்';

  @override
  String get noActiveConversations =>
      'செயலில் உள்ள உரையாடல்கள் எதுவும் இல்லை. பாதுகாப்புப் பூட்டுகளை இயக்க முதலில் ஒரு உரையாடலைத் தொடங்கவும்.';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get wipeDeviceAndEscape => 'சாதனத்தை அழித்து வெளியேறு';

  @override
  String get falsePassword => 'தவறான கடவுச்சொல்';

  @override
  String accessSuspendedTimer(String time) {
    return 'பாதுகாப்பு காரணங்களுக்காக அணுகல் இடைநிறுத்தப்பட்டுள்ளது. $time கழித்து மீண்டும் முயற்சிக்கவும்.';
  }

  @override
  String get selectSecureLockMethod =>
      'பாதுகாப்பான பூட்டு முறையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get selectSecureLockDescription =>
      'இந்த உரையாடலை சாதனத்தின் கைரேகை பயோமெட்ரிக் அல்லது நிலையான 4 இலக்க PIN மூலம் பூட்ட விரும்புகிறீர்களா?';

  @override
  String get fourDigitPin => '4 இலக்க PIN';

  @override
  String get fingerprintUnlock => 'கைரேகை 🔓';

  @override
  String get supportSoloDeveloper => 'சுயாதீன டெவலப்பரை ஆதரிக்கவும்';

  @override
  String get maybeLater => 'பின்னர் பார்க்கலாம்';

  @override
  String get submitProof => 'சான்றைச் சமர்ப்பிக்கவும்';

  @override
  String get couldNotOpenWallet =>
      'வாலட்டை தானாகத் திறக்க முடியவில்லை. அதற்கு பதிலாக கீழே உள்ள உரைக் குறியீட்டை நகலெடுக்கவும்.';

  @override
  String get proofSubmittedSnackbar =>
      'சான்று சமர்ப்பிக்கப்பட்டது. கைமுறை மதிப்பாய்வுக்கு 24–48 மணிநேரம் ஆகும் (வார இறுதி நாட்கள் தவிர). பயன்பாட்டை வழக்கம்போல் தொடர்ந்து பயன்படுத்தலாம்.';
}
