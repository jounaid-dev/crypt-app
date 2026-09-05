// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'स्वागत आहे';

  @override
  String get login => 'लॉग इन';

  @override
  String get signup => 'साइन अप';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get chats => 'चॅट्स';

  @override
  String get typeMessage => 'संदेश टाईप करा...';

  @override
  String get send => 'पाठवा';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'कनेक्ट होत आहे...';

  @override
  String get connectingP2p => 'P2P शी कनेक्ट होत आहे...';

  @override
  String get p2pConnectionNotReady => 'P2P तयार नाही.';

  @override
  String get searchLanguage => 'भाषा शोधा...';

  @override
  String get language => 'भाषा';

  @override
  String get forceEscapeSignOutTitle => 'फोर्स साइन आउट करायचे?';

  @override
  String get forceEscapeSignOutContent =>
      'इशारा: डिव्हाइसवरील सर्व डेटा मिटवला जाईल.';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get wipeDevice => 'डिव्हाइस वाईप करा';

  @override
  String get accountDestructionAlertTitle => 'अकाउंट हटवणे';

  @override
  String get accountDestructionWarning =>
      'इशारा: डिव्हाइस डेटा आणि रिमोट संदेश मिटवले जातील.';

  @override
  String get accountDestructionCriticalNotice =>
      'गंभीर: चुकीचे कोड सिस्टम लॉक करतील. तुमचा अकाउंट पासवर्ड किंवा इमर्जन्सी एस्केप वापरा.';

  @override
  String verificationSecurityKey(String code) {
    return 'सुरक्षा की: $code';
  }

  @override
  String get copyDigitsHint => '५ अंक कॉपी करा';

  @override
  String get codeMismatchNotice =>
      'कोड जुळत नाही. तुमचा मास्टर पासवर्ड प्रविष्ट करा किंवा १० मिनिटे प्रतीक्षा करा.';

  @override
  String get accountPasswordLabel => 'अकाउंट पासवर्ड';

  @override
  String get deleteEverythingPermanently => 'सर्व काही कायमचे हटवा';

  @override
  String get escapeAndPurgeDeviceData => 'एस्केप करा आणि डेटा मिटवा';

  @override
  String get addContact => 'काँटॅक्ट जोडा';

  @override
  String get addContactConfirmation => 'हा काँटॅक्ट जोडायचा का?';

  @override
  String get noMessagesYet => 'अद्याप संदेश नाहीत';

  @override
  String get addNewContact => 'नवीन काँटॅक्ट';

  @override
  String get usernameLabel => 'युझरनेम';

  @override
  String get nicknameOptionalLabel => 'टोपणनाव (पर्यायी)';

  @override
  String get add => 'जोडा';

  @override
  String get usernameCannotBeEmpty => 'युझरनेम आवश्यक आहे';

  @override
  String contactAlreadyExists(String name) {
    return '\'$name\' हा काँटॅक्ट आधीपासून अस्तित्वात आहे.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '\'$name\' वापरकर्ता सापडला नाही. शेअर केलेले गुप्त उपलब्ध नाही.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name जोडले!';
  }

  @override
  String get contacts => 'काँटॅक्ट्स';

  @override
  String get noContactsYet => 'अद्याप काँटॅक्ट्स नाहीत';

  @override
  String get securityLockoutActive => 'सुरक्षा लॉकआउट';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'खूप जास्त प्रयत्न. $minutes मिनिटांसाठी लॉक केले आहे.';
  }

  @override
  String get acknowledge => 'मान्य करा';

  @override
  String get accessBlocked => 'प्रवेश अवरोधित';

  @override
  String accessSuspended(int minutes) {
    return '५ अयशस्वी जुळण्या. $minutes मिनिटांसाठी प्रवेश निलंबित.';
  }

  @override
  String get ok => 'ठीक आहे';

  @override
  String unlockSecureNode(String username) {
    return 'अनलॉक करा: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'उर्वरित प्रयत्न: $count';
  }

  @override
  String get secureKeyPasscode => 'सुरक्षा पासकोड';

  @override
  String get warningHardwareLockout =>
      'इशारा: पुढील अपयशामुळे सुरक्षा लॉक होईल.';

  @override
  String get abort => 'थांबवा';

  @override
  String get authenticate => 'प्रमाणित करा';

  @override
  String get searchPipelinesHint => 'सुरक्षित कनेक्शन्स शोधा...';

  @override
  String get zeroPipelinesDiscovered => 'कोणतेही कनेक्शन सापडले नाही.';

  @override
  String get processingDecryption => 'डिक्रिप्ट करत आहे...';

  @override
  String get decrypting => 'डिक्रिप्ट करत आहे...';

  @override
  String get decryptionError => '[डिक्रिप्शन त्रुटी]';

  @override
  String get cryptContainerSecure => 'CRYPT कंटेनर सुरक्षित आहे';

  @override
  String get connectAnAccount => 'अकाउंट कनेक्ट करा';

  @override
  String get username => 'युझरनेम';

  @override
  String get password => 'पासवर्ड';

  @override
  String get enterMasterSecurityPassword => 'तुमचा मास्टर पासवर्ड प्रविष्ट करा';

  @override
  String get pleaseFillAllFields => 'सर्व फील्ड भरा';

  @override
  String get wrongUsernameOrPassword => 'चुकीचे युझरनेम किंवा पासवर्ड';

  @override
  String loginError(String error) {
    return 'लॉगिन त्रुटी: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'अकाउंट नाही? साइन अप करा';

  @override
  String get myIdentity => 'माझी ओळख';

  @override
  String get scanToAddMe => 'मला जोडण्यासाठी स्कॅन करा';

  @override
  String get shareProfileLink => 'प्रोफाइल शेअर करा';

  @override
  String addMeOnCrypt(String link) {
    return 'मला CRYPT वर जोडा!\n\n$link';
  }

  @override
  String get scanQr => 'QR स्कॅन करा';

  @override
  String get invalidCryptQrFormat => 'अवैध CRYPT QR कोड.';

  @override
  String get userScanned => 'युझर स्कॅन झाला!';

  @override
  String addingUser(String username) {
    return '$username जोडत आहे...';
  }

  @override
  String get defaultUser => 'युझर';

  @override
  String get createAccount => 'अकाउंट तयार करा';

  @override
  String get keepPasswordSecureHint =>
      'ते सुरक्षित ठेवा. पासवर्ड बदलता येणार नाही.';

  @override
  String get pleaseFillInAllFields => 'सर्व फील्ड भरा';

  @override
  String get usernameExceedsLimit => 'युझरनेम कमाल २० अक्षरांचे असू शकते';

  @override
  String get invalidUsernameCharacters =>
      'फक्त अक्षरे, संख्या, _ किंवा - वापरा.';

  @override
  String get weakPasswordNotice =>
      '८+ अक्षरे, १ संख्या आणि १ मोठे अक्षर वापरा.';

  @override
  String get unableToGenerateUniqueUsername =>
      'युनिक युझरनेम तयार करता आले नाही.';

  @override
  String get accountCreated => 'अकाउंट तयार झाले';

  @override
  String yourUsernameIs(String username) {
    return 'तुमचे युझरनेम:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'युझरनेम \'$chosen\' आधीपासून वापरात आहे.\n\nतुमचे युझरनेम:\n\n$assigned\n\nते लॉग इन करण्यासाठी आवश्यक असल्याने जपून ठेवा.';
  }

  @override
  String get continueText => 'पुढे जा';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ओळख तयार करण्यात अयशस्वी: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT मध्ये स्वागत आहे';

  @override
  String get signupDescription =>
      'P2P की तयार करण्यासाठी युझरनेम आणि पासवर्ड तयार करा.';

  @override
  String get chooseAUsername => 'युझरनेम निवडा';

  @override
  String get usernameHelperText =>
      'तुमचे खरे नाव वापरू नका. युझरनेम आधीपासून वापरात असल्यास एक प्रत्यय जोडला जाईल.';

  @override
  String get masterAuthenticationRequired => 'मास्टर ऑथेंटिकेशन';

  @override
  String get verify => 'पडताळा';

  @override
  String get darkThemeMode => 'डार्क थीम';

  @override
  String get secureConversations => 'सुरक्षित संभाषणे';

  @override
  String get noActiveConversations =>
      'सक्रिय चॅट्स नाहीत. लॉक सक्षम करण्यासाठी एक सुरू करा.';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get wipeDeviceAndEscape => 'डिव्हाइस वाईप करा';

  @override
  String get falsePassword => 'चुकीचा पासवर्ड';

  @override
  String accessSuspendedTimer(String time) {
    return 'प्रवेश निलंबित आहे. $time नंतर पुन्हा प्रयत्न करा.';
  }

  @override
  String get selectSecureLockMethod => 'लॉक पद्धत निवडा';

  @override
  String get selectSecureLockDescription =>
      'फिंगरप्रिंट किंवा ४-अंकी PIN ने लॉक करायचे का?';

  @override
  String get fourDigitPin => '४-अंकी PIN';

  @override
  String get fingerprintUnlock => 'फिंगरप्रिंट 🔓';

  @override
  String get supportSoloDeveloper => 'डेव्हलपरला सपोर्ट करा';

  @override
  String get maybeLater => 'नंतर कदाचित';

  @override
  String get submitProof => 'पुरावा सबमिट करा';

  @override
  String get couldNotOpenWallet => 'वॉलेट उघडता आले नाही. खालील कोड कॉपी करा.';

  @override
  String get proofSubmittedSnackbar =>
      'पुरावा सबमिट केला. मॅन्युअल पुनरावलोकन: २४–४८ तास (शनिवार-रविवार वगळून).';
}
