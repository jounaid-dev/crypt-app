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
  String get termsAndConditions => 'नियम आणि अटी';

  @override
  String get settingsTermsAndConditions => 'नियम आणि अटी';

  @override
  String get termsIntro =>
      'CRYPT हा संभाषणांसाठी थेट लोकांना जोडण्यासाठी प्रारंभिक टप्प्यातील अनुप्रयोग आहे. अनुप्रयोग योग्यरित्या वापरण्यासाठी आणि तुमचे खाते क्रेडेन्शियल्स सुरक्षित ठेवण्यासाठी तुम्ही जबाबदार आहात.';

  @override
  String get termsConnectivity =>
      'डिव्हाइसेस शोधण्यात आणि कनेक्शन स्थापित करण्यात मदत करण्यासाठी CRYPT ऑनलाइन सेवा वापरते. अनुप्रयोग विकसित होताना उपलब्धता आणि कनेक्शन वर्तन बदलू शकते. कृपया तुमच्या संवादाचे एकमेव साधन म्हणून CRYPT वर अवलंबून राहू नका.';

  @override
  String get termsAgreement =>
      'सुरू ठेवून, तुम्ही पुष्टी करता की तुम्ही या अटी वाचल्या आहेत आणि CRYPT वापरण्यास सहमत आहात.';

  @override
  String get agreeTerms => 'मी अटी आणि नियमांशी सहमत आहे';

  @override
  String get agreeAndContinue => 'सहमत आणि सुरू ठेवा';

  @override
  String get beforeYouStart => 'आपण प्रारंभ करण्यापूर्वी';

  @override
  String get connected => 'जोडलेले';

  @override
  String get connectFirstThenChat => 'प्रथम कनेक्ट करा, नंतर चॅट करा';

  @override
  String get betaIntro =>
      'CRYPT ही प्रारंभिक बीटा आवृत्ती आहे, त्यामुळे भविष्यातील आवृत्त्यांमध्ये अनुभव सुधारू शकतो.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT वॉकी-टॉकीप्रमाणे कार्य करते: कनेक्शन स्थापित करण्यासाठी दोन्ही लोक ऑनलाइन असणे आणि CRYPT एकाच वेळी उघडणे आवश्यक आहे.';

  @override
  String get howToUseCrypt =>
      'CRYPT कसे वापरावे:\n1. दुसऱ्या व्यक्तीचा CRYPT QR कोड स्कॅन करा.\n2. दोन्ही लोकांना CRYPT ओपन आणि ऑनलाइन आवश्यक आहे.\n3. CRYPT P2P कनेक्शन स्थापित करेपर्यंत प्रतीक्षा करा.\n4. \"कनेक्टिंग...\" स्थिती अदृश्य होण्याची आणि कनेक्शन स्थापित होण्याची प्रतीक्षा करा.\n5. एकदा कनेक्ट झाल्यानंतर, तुम्ही चॅटिंग सुरू करू शकता.';

  @override
  String get messageStorageExplanation =>
      'तुमचे संदेश थेट कनेक्ट केलेल्या उपकरणांदरम्यान प्रवास करण्यासाठी डिझाइन केलेले आहेत. CRYPT तुमचे चॅट संदेश आमच्या सर्व्हरवर संचयित करत नाही. सर्व्हर सध्या कनेक्शन आणि सिग्नलिंगमध्ये मदत करतो आणि चॅट इतिहास सर्व्हरवर संग्रहित केला जात नाही. दुसरी व्यक्ती ऑफलाइन असल्यास, वर्तमान P2P कनेक्शन स्थापित केले जाऊ शकत नाही.';

  @override
  String get settingsAndSupportExplanation =>
      'तुमचा CRYPT अनुभव सानुकूलित करण्यासाठी सेटिंग्जला भेट द्या. अधिक सानुकूलित पर्याय लवकरच येत आहेत.\n\nCRYPT ला समर्थन देऊ इच्छिता? तुम्ही सेटिंग्जमध्ये देणगीचा पर्याय शोधू शकता.';

  @override
  String get saving => 'सेव्ह करत आहे...';

  @override
  String get continueToCrypt => 'CRYPT वर सुरू ठेवा';

  @override
  String get showSplashScreen => 'स्प्लॅश स्क्रीन दाखवा';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get connectionFailed => 'कनेक्शन अयशस्वी';

  @override
  String get connectionFailedDetails =>
      'कनेक्शन अयशस्वी. कनेक्ट करण्यासाठी CRYPT उघडून दोन्ही उपकरणे ऑनलाइन असणे आवश्यक आहे.';

  @override
  String get gallery => 'गॅलरी';

  @override
  String get alignQrCode => 'QR कोड संरेखित करा';

  @override
  String get scanFromGallery => 'गॅलरीमधून स्कॅन करा';

  @override
  String get couldNotScanImage => 'प्रतिमा स्कॅन करू शकलो नाही.';

  @override
  String couldNotShareQrCode(String error) {
    return 'QR कोड शेअर करू शकलो नाही: $error';
  }

  @override
  String newContact(String username) {
    return 'नवीन संपर्क: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'तुमची सार्वजनिक एन्क्रिप्शन की गहाळ आहे.';

  @override
  String get contactEncryptionKeyMissing => 'संपर्क एन्क्रिप्शन की गहाळ आहे.';

  @override
  String get localEncryptionKeyMissing => 'स्थानिक एन्क्रिप्शन की गहाळ आहे.';

  @override
  String get noQrCodeFound => 'या इमेजमध्ये कोणताही QR कोड आढळला नाही.';

  @override
  String get shareQrCode => 'QR कोड शेअर करा';

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
  String get supportIntro =>
      'अहो! 👋 मी CRYPT वर कठोर परिश्रम करणारा एकटा विकासक आहे. माझ्याकडे बजेट किंवा कॉर्पोरेट फंडिंग नाही. ॲपमध्ये सुधारणा करत राहण्यासाठी मी तुमच्या प्रामाणिकपणावर आणि सहानुभूतीवर पूर्णपणे विसंबून आहे आणि कायमस्वरूपी कोणत्याही जाहिरातींची हमी नाही.';

  @override
  String get chooseSupportAmount =>
      'तुमची किंमत निवडा (समर्थनासाठी स्लाइड करा):';

  @override
  String get poorGang => 'मी गरीब टोळी आहे 🥀✌️';

  @override
  String get launchOfferMinimum => 'ऑफर लाँच करा किमान 🚀';

  @override
  String get buyMeCoffee => 'मला एक कॉफी खरेदी करा ☕';

  @override
  String get superSupporter => 'सुपर सपोर्टर 🔥';

  @override
  String get feature => 'वैशिष्ट्य';

  @override
  String get freeTier => 'मोफत टियर';

  @override
  String get premium => 'प्रीमियम';

  @override
  String get chatLocks => 'चॅट लॉक';

  @override
  String get maxOneRoom => 'कमाल 1 खोली';

  @override
  String get unlimited => 'अमर्यादित';

  @override
  String get biometrics => 'बायोमेट्रिक्स';

  @override
  String get disabled => '🚫 अक्षम';

  @override
  String supportWithSats(String amount) {
    return '$amount sats सह सपोर्ट (फिनिक्स)';
  }

  @override
  String get boltOffer => '⚡ BOLT12 पेमेंट ऑफर • कॉपी करण्यासाठी टॅप करा';

  @override
  String get boltOfferCopied => 'BOLT12 पेमेंट ऑफर कॉपी केली';

  @override
  String get tapToCopyBoltOffer => 'BOLT12 पेमेंट ऑफर कॉपी करण्यासाठी टॅप करा';

  @override
  String get simpleInstructionsToUnlock => '📬 अनलॉक करण्यासाठी सोप्या सूचना:';

  @override
  String unlockInstructions(String username) {
    return '1. Android वर फिनिक्स वॉलेट वापरून पैसे द्या (अनलॉक करण्यासाठी किमान 7,500 — अधिक नेहमीच कौतुक केले जाते).\n2. तुमच्या यशस्वी व्यवहार पुष्टीकरण स्क्रीनचा स्क्रीनशॉट घ्या.\n3. तो स्क्रीनशॉट jounaidnadirmed@gmail.com वर ईमेल करा आणि मला तुमचे अद्वितीय खाते वापरकर्तानाव सांगा: \'$username\' म्हणजे मला कळेल की कोणी पैसे दिले.\n4. या डिव्हाइसवर तुमची विनंती जतन करण्यासाठी खालील बॉक्समध्ये काहीही टाइप करा:';
  }

  @override
  String get supportRequestHint =>
      'तुमचे नाव किंवा व्यवहार माहिती येथे टाइप करा...';

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
