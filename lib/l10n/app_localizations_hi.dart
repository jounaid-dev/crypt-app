// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'स्वागत है';

  @override
  String get login => 'लॉग इन';

  @override
  String get signup => 'साइन अप';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get chats => 'चैट्स';

  @override
  String get typeMessage => 'संदेश लिखें...';

  @override
  String get send => 'भेजें';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'कनेक्ट हो रहा है...';

  @override
  String get connectingP2p => 'P2P से कनेक्ट हो रहा है...';

  @override
  String get p2pConnectionNotReady => 'P2P तैयार नहीं है.';

  @override
  String get searchLanguage => 'भाषा खोजें...';

  @override
  String get language => 'भाषा';

  @override
  String get forceEscapeSignOutTitle => 'इमरजेंसी साइन आउट?';

  @override
  String get forceEscapeSignOutContent =>
      'चेतावनी: डिवाइस का सारा डेटा पूरी तरह मिट जाएगा.';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get wipeDevice => 'डिवाइस वाइप करें';

  @override
  String get accountDestructionAlertTitle => 'अकाउंट हटाने की चेतावनी';

  @override
  String get accountDestructionWarning =>
      'चेतावनी: डिवाइस का सारा डेटा मिट जाएगा. इंटरनेट से जुड़ने पर रिमोट सेल्फ-डिस्ट्रक्ट कमांड चलेगा. आपके यूज़र ID से भेजे संदेश सभी पीयर मेमोरी से स्थायी रूप से मिटेंगे.';

  @override
  String get accountDestructionCriticalNotice =>
      'महत्वपूर्ण: गलत सत्यापन कोड से सिस्टम लॉक होगा. इसे खोलने के लिए मास्टर अकाउंट पासवर्ड दें या इमरजेंसी एस्केप से डिवाइस का सारा डेटा तुरंत मिटाएं.';

  @override
  String verificationSecurityKey(String code) {
    return 'सुरक्षा कुंजी: $code';
  }

  @override
  String get copyDigitsHint => 'ऊपर के 5 अंक कॉपी करें';

  @override
  String get codeMismatchNotice =>
      'कोड गलत है! मास्टर पासवर्ड डालें या 10 मिनट के लॉक का सामना करें.';

  @override
  String get accountPasswordLabel => 'अकाउंट पासवर्ड';

  @override
  String get deleteEverythingPermanently => 'सब कुछ स्थायी रूप से मिटाएं';

  @override
  String get escapeAndPurgeDeviceData => 'एस्केप करें और डिवाइस डेटा मिटाएं';

  @override
  String get addContact => 'कॉन्टैक्ट जोड़ें';

  @override
  String get addContactConfirmation => 'यह कॉन्टैक्ट जोड़ें?';

  @override
  String get noMessagesYet => 'अभी कोई संदेश नहीं है';

  @override
  String get addNewContact => 'नया कॉन्टैक्ट';

  @override
  String get usernameLabel => 'यूज़रनेम';

  @override
  String get nicknameOptionalLabel => 'निकनेम (वैकल्पिक)';

  @override
  String get add => 'जोड़ें';

  @override
  String get usernameCannotBeEmpty => 'यूज़रनेम खाली नहीं हो सकता';

  @override
  String contactAlreadyExists(String name) {
    return 'कॉन्टैक्ट \'$name\' पहले से आपकी एड्रेस बुक में है.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'यूज़र \'$name\' नेटवर्क रजिस्ट्री में नहीं मिला. साझा सीक्रेट नहीं बनाया जा सकता.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name सफलतापूर्वक जोड़ा गया!';
  }

  @override
  String get contacts => 'कॉन्टैक्ट्स';

  @override
  String get noContactsYet => 'अभी कोई कॉन्टैक्ट नहीं है';

  @override
  String get securityLockoutActive => 'सुरक्षा लॉक सक्रिय है';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'बहुत अधिक गलत प्रयास. $minutes मिनट के लिए लॉक.';
  }

  @override
  String get acknowledge => 'स्वीकार करें';

  @override
  String get accessBlocked => 'पहुंच ब्लॉक है';

  @override
  String accessSuspended(int minutes) {
    return '5 गलत सत्यापन प्रयास. $minutes मिनट के लिए पहुंच निलंबित.';
  }

  @override
  String get ok => 'ठीक है';

  @override
  String unlockSecureNode(String username) {
    return 'सुरक्षित नोड अनलॉक करें: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'बचे सत्यापन प्रयास: $count';
  }

  @override
  String get secureKeyPasscode => 'सुरक्षा कुंजी पासकोड';

  @override
  String get warningHardwareLockout =>
      'चेतावनी: अगली गलत कोशिश से हार्डवेयर सुरक्षा लॉक सक्रिय होगा.';

  @override
  String get abort => 'रोकें';

  @override
  String get authenticate => 'प्रमाणित करें';

  @override
  String get searchPipelinesHint => 'सक्रिय सुरक्षित कनेक्शन खोजें...';

  @override
  String get zeroPipelinesDiscovered => 'कोई मेल खाता कनेक्शन नहीं मिला.';

  @override
  String get processingDecryption => 'डिक्रिप्शन हो रहा है...';

  @override
  String get decrypting => 'डिक्रिप्ट हो रहा है...';

  @override
  String get decryptionError => '[डिक्रिप्शन त्रुटि]';

  @override
  String get cryptContainerSecure => 'CRYPT कंटेनर सुरक्षित है';

  @override
  String get connectAnAccount => 'अकाउंट कनेक्ट करें';

  @override
  String get username => 'यूज़रनेम';

  @override
  String get password => 'पासवर्ड';

  @override
  String get enterMasterSecurityPassword => 'मास्टर सुरक्षा पासवर्ड डालें';

  @override
  String get pleaseFillAllFields => 'सभी फ़ील्ड भरें';

  @override
  String get wrongUsernameOrPassword => 'यूज़रनेम या पासवर्ड गलत है';

  @override
  String loginError(String error) {
    return 'लॉगिन त्रुटि: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'अकाउंट नहीं है? साइन अप करें';

  @override
  String get myIdentity => 'मेरी पहचान';

  @override
  String get scanToAddMe => 'मुझे जोड़ने के लिए स्कैन करें';

  @override
  String get shareProfileLink => 'प्रोफ़ाइल लिंक साझा करें';

  @override
  String addMeOnCrypt(String link) {
    return 'मुझे CRYPT पर जोड़ें!\n\n$link';
  }

  @override
  String get scanQr => 'QR स्कैन करें';

  @override
  String get invalidCryptQrFormat => 'अमान्य CRYPT QR कोड.';

  @override
  String get userScanned => 'यूज़र स्कैन किया गया!';

  @override
  String addingUser(String username) {
    return '$username जोड़ा जा रहा है...';
  }

  @override
  String get defaultUser => 'यूज़र';

  @override
  String get createAccount => 'अकाउंट बनाएं';

  @override
  String get keepPasswordSecureHint =>
      'इसे सुरक्षित रखें. पासवर्ड बदला नहीं जा सकता.';

  @override
  String get pleaseFillInAllFields => 'सभी फ़ील्ड भरें';

  @override
  String get usernameExceedsLimit => 'यूज़रनेम 20 वर्णों से अधिक नहीं हो सकता';

  @override
  String get invalidUsernameCharacters =>
      'केवल अक्षर, अंक, _ या - का उपयोग करें.';

  @override
  String get weakPasswordNotice => '8+ वर्ण, 1 अंक और 1 बड़ा अक्षर होना चाहिए.';

  @override
  String get unableToGenerateUniqueUsername =>
      'यूनीक यूज़रनेम नहीं बनाया जा सका.';

  @override
  String get accountCreated => 'अकाउंट बन गया';

  @override
  String yourUsernameIs(String username) {
    return 'आपका यूज़रनेम:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '\'$chosen\' पहले से लिया गया है.\n\nआपका यूज़रनेम:\n\n$assigned\n\nइसे याद रखें. लॉगिन के लिए इसकी जरूरत होगी.';
  }

  @override
  String get continueText => 'जारी रखें';

  @override
  String failedToGenerateIdentity(String error) {
    return 'सुरक्षित पहचान नहीं बन सकी: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT में आपका स्वागत है';

  @override
  String get signupDescription =>
      'P2P एन्क्रिप्शन कुंजियां बनाने के लिए यूज़रनेम और पासवर्ड बनाएं.';

  @override
  String get chooseAUsername => 'यूज़रनेम चुनें';

  @override
  String get usernameHelperText =>
      'अपना असली नाम न दें. यूज़रनेम लिया गया हो तो अपने आप यूनीक प्रत्यय जोड़ा जाएगा.';

  @override
  String get masterAuthenticationRequired => 'मास्टर प्रमाणीकरण आवश्यक है';

  @override
  String get verify => 'सत्यापित करें';

  @override
  String get darkThemeMode => 'डार्क थीम';

  @override
  String get secureConversations => 'सुरक्षित बातचीत';

  @override
  String get noActiveConversations =>
      'कोई सक्रिय बातचीत नहीं है. कस्टम सुरक्षा लॉक के लिए पहले बातचीत शुरू करें.';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get wipeDeviceAndEscape => 'डिवाइस वाइप करें और बाहर निकलें';

  @override
  String get falsePassword => 'गलत पासवर्ड';

  @override
  String accessSuspendedTimer(String time) {
    return 'सुरक्षा के लिए पहुंच निलंबित है. $time में फिर प्रयास करें.';
  }

  @override
  String get selectSecureLockMethod => 'सुरक्षित लॉक विधि चुनें';

  @override
  String get selectSecureLockDescription =>
      'इस बातचीत को फ़िंगरप्रिंट या 4-अंकीय PIN से लॉक करें?';

  @override
  String get fourDigitPin => '4-अंकीय PIN';

  @override
  String get fingerprintUnlock => 'फ़िंगरप्रिंट 🔓';

  @override
  String get supportSoloDeveloper => 'सोलो डेवलपर को सपोर्ट करें';

  @override
  String get maybeLater => 'बाद में';

  @override
  String get submitProof => 'प्रमाण सबमिट करें';

  @override
  String get couldNotOpenWallet =>
      'वॉलेट अपने आप नहीं खुला. नीचे दिया टेक्स्ट कोड कॉपी करें.';

  @override
  String get proofSubmittedSnackbar =>
      'प्रमाण सबमिट हो गया. मैन्युअल समीक्षा में 24–48 घंटे लगते हैं, सप्ताहांत को छोड़कर. आप ऐप सामान्य रूप से इस्तेमाल कर सकते हैं.';
}
