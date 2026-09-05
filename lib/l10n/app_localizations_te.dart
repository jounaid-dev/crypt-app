// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'స్వాగతం';

  @override
  String get login => 'లాగిన్';

  @override
  String get signup => 'సైన్ అప్';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get chats => 'చాట్‌లు';

  @override
  String get typeMessage => 'సందేశాన్ని టైప్ చేయండి...';

  @override
  String get send => 'పంపు';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'కనెక్ట్ అవుతోంది...';

  @override
  String get connectingP2p => 'P2Pకి కనెక్ట్ అవుతోంది...';

  @override
  String get p2pConnectionNotReady => 'P2P ఇంకా సిద్ధంగా లేదు.';

  @override
  String get searchLanguage => 'భాషను వెతకండి...';

  @override
  String get language => 'భాష';

  @override
  String get forceEscapeSignOutTitle => 'ఎమర్జెన్సీ లాగ్ అవుట్ చేయాలా?';

  @override
  String get forceEscapeSignOutContent =>
      'హెచ్చరిక: ఈ చర్య ఈ పరికరం నుండి మొత్తం డేటాను పూర్తిగా తొలగిస్తుంది.';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get wipeDevice => 'పరికరాన్ని పూర్తిగా తొలగించు';

  @override
  String get accountDestructionAlertTitle => 'ఖాతా తొలగింపు హెచ్చరిక';

  @override
  String get accountDestructionWarning =>
      'హెచ్చరిక: ఈ చర్య ఈ పరికరం నుండి మీ మొత్తం డేటాను తొలగిస్తుంది. ఇంటర్నెట్‌కు కనెక్ట్ అయిన తర్వాత, ఇది రిమోట్ స్వీయ-తొలగింపు ఆదేశాన్ని ప్రారంభిస్తుంది. మీ ప్రత్యేక యూజర్ ID నుండి పంపిన ప్రతి సందేశం అన్ని పీర్‌ల మెమరీల నుండి శాశ్వతంగా తొలగించబడుతుంది.';

  @override
  String get accountDestructionCriticalNotice =>
      'కీలక హెచ్చరిక: మీరు ఈ ధృవీకరణ సంఖ్యలను తప్పుగా నమోదు చేస్తే, సిస్టమ్ లాక్ అవుతుంది. దాన్ని అన్‌లాక్ చేయడానికి, మీరు మీ మాస్టర్ అకౌంట్ పాస్‌వర్డ్‌ను నమోదు చేయాలి లేదా ఈ పరికరంలోని మొత్తం డేటాను వెంటనే పూర్తిగా తొలగించే ఎమర్జెన్సీ ఎస్కేప్ ఎంపికను ఉపయోగించాలి.';

  @override
  String verificationSecurityKey(String code) {
    return 'ధృవీకరణ భద్రతా కీ: $code';
  }

  @override
  String get copyDigitsHint => 'పైన ఉన్న 5 అంకెలను కాపీ చేయండి';

  @override
  String get codeMismatchNotice =>
      'కోడ్ సరిపోలలేదు. లాక్‌ను దాటవేయడానికి మాస్టర్ పాస్‌వర్డ్‌ను నమోదు చేయండి లేదా 10 నిమిషాల లాక్‌ను ఎదుర్కోవాలి.';

  @override
  String get accountPasswordLabel => 'ఖాతా పాస్‌వర్డ్';

  @override
  String get deleteEverythingPermanently => 'అన్నింటినీ శాశ్వతంగా తొలగించు';

  @override
  String get escapeAndPurgeDeviceData =>
      'లాగ్ అవుట్ చేసి పరికర డేటాను తొలగించు';

  @override
  String get addContact => 'పరిచయాన్ని జోడించు';

  @override
  String get addContactConfirmation => 'ఈ పరిచయాన్ని జోడించాలా?';

  @override
  String get noMessagesYet => 'ఇంకా సందేశాలు లేవు';

  @override
  String get addNewContact => 'కొత్త పరిచయాన్ని జోడించు';

  @override
  String get usernameLabel => 'యూజర్ పేరు';

  @override
  String get nicknameOptionalLabel => 'మారుపేరు (ఐచ్ఛికం)';

  @override
  String get add => 'జోడించు';

  @override
  String get usernameCannotBeEmpty => 'యూజర్ పేరు ఖాళీగా ఉండకూడదు';

  @override
  String contactAlreadyExists(String name) {
    return 'పరిచయం «$name» ఇప్పటికే మీ అడ్రస్ బుక్‌లో ఉంది.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'యూజర్ «$name» నెట్‌వర్క్ రిజిస్ట్రీలో కనుగొనబడలేదు. భాగస్వామ్య రహస్యాన్ని సృష్టించడం సాధ్యం కాదు.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'పరిచయం $name విజయవంతంగా జోడించబడింది!';
  }

  @override
  String get contacts => 'పరిచయాలు';

  @override
  String get noContactsYet => 'ఇంకా పరిచయాలు లేవు';

  @override
  String get securityLockoutActive => 'భద్రతా లాక్ సక్రియంగా ఉంది';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'చాలా తప్పు ప్రయత్నాలు జరిగాయి. $minutes నిమిషాల పాటు యాక్సెస్ బ్లాక్ చేయబడింది.';
  }

  @override
  String get acknowledge => 'అర్థమైంది';

  @override
  String get accessBlocked => 'యాక్సెస్ బ్లాక్ చేయబడింది';

  @override
  String accessSuspended(int minutes) {
    return '5 తప్పు ధృవీకరణలు జరిగాయి. తదుపరి $minutes నిమిషాల పాటు యాక్సెస్ నిలిపివేయబడింది.';
  }

  @override
  String get ok => 'సరే';

  @override
  String unlockSecureNode(String username) {
    return 'సురక్షిత నోడ్‌ను అన్‌లాక్ చేయి: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'మిగిలిన ధృవీకరణ ప్రయత్నాలు: $count';
  }

  @override
  String get secureKeyPasscode => 'సురక్షిత కీ పాస్‌కోడ్';

  @override
  String get warningHardwareLockout =>
      'హెచ్చరిక: తదుపరి తప్పు ధృవీకరణ భద్రతా సిస్టమ్‌ను లాక్ చేస్తుంది.';

  @override
  String get abort => 'రద్దు చేయి';

  @override
  String get authenticate => 'ప్రమాణీకరించు';

  @override
  String get searchPipelinesHint =>
      'సక్రియంగా ఉన్న సురక్షిత కనెక్షన్‌ల కోసం వెతుకుతోంది...';

  @override
  String get zeroPipelinesDiscovered =>
      'సరిపోలే కమ్యూనికేషన్ కనెక్షన్‌లు ఏవీ కనుగొనబడలేదు.';

  @override
  String get processingDecryption => 'డీక్రిప్షన్ జరుగుతోంది...';

  @override
  String get decrypting => 'డీక్రిప్ట్ చేస్తోంది...';

  @override
  String get decryptionError => '[డీక్రిప్షన్ లోపం]';

  @override
  String get cryptContainerSecure => 'CRYPT కంటైనర్ సురక్షితం';

  @override
  String get connectAnAccount => 'ఖాతాను కనెక్ట్ చేయి';

  @override
  String get username => 'యూజర్ పేరు';

  @override
  String get password => 'పాస్‌వర్డ్';

  @override
  String get enterMasterSecurityPassword =>
      'మీ మాస్టర్ సెక్యూరిటీ పాస్‌వర్డ్‌ను నమోదు చేయండి';

  @override
  String get pleaseFillAllFields => 'దయచేసి అన్ని ఫీల్డ్‌లను పూరించండి';

  @override
  String get wrongUsernameOrPassword =>
      'యూజర్ పేరు లేదా పాస్‌వర్డ్ తప్పుగా ఉంది';

  @override
  String loginError(String error) {
    return 'లాగిన్ లోపం: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'ఖాతా లేదా? సైన్ అప్ చేయండి';

  @override
  String get myIdentity => 'నా గుర్తింపు';

  @override
  String get scanToAddMe => 'నన్ను జోడించడానికి స్కాన్ చేయండి';

  @override
  String get shareProfileLink => 'ప్రొఫైల్ లింక్‌ను షేర్ చేయండి';

  @override
  String addMeOnCrypt(String link) {
    return 'నన్ను CRYPTలో జోడించండి!\n\n$link';
  }

  @override
  String get scanQr => 'QR స్కాన్ చేయి';

  @override
  String get invalidCryptQrFormat => 'చెల్లని CRYPT QR కోడ్ ఫార్మాట్.';

  @override
  String get userScanned => 'యూజర్ స్కాన్ చేయబడ్డారు!';

  @override
  String addingUser(String username) {
    return '$usernameను జోడిస్తోంది...';
  }

  @override
  String get defaultUser => 'యూజర్';

  @override
  String get createAccount => 'ఖాతాను సృష్టించు';

  @override
  String get keepPasswordSecureHint =>
      'దీన్ని సురక్షితంగా ఉంచండి. పాస్‌వర్డ్‌ను మార్చలేరు.';

  @override
  String get pleaseFillInAllFields => 'దయచేసి అన్ని ఫీల్డ్‌లను పూరించండి';

  @override
  String get usernameExceedsLimit => 'యూజర్ పేరు 20 అక్షరాలకు మించకూడదు';

  @override
  String get invalidUsernameCharacters =>
      'యూజర్ పేరు అక్షరాలు, సంఖ్యలు, అండర్‌స్కోర్‌లు మరియు హైఫన్‌లను మాత్రమే కలిగి ఉండవచ్చు';

  @override
  String get weakPasswordNotice =>
      'పాస్‌వర్డ్‌లో కనీసం 8 అక్షరాలు, ఒక సంఖ్య మరియు ఒక పెద్ద అక్షరం ఉండాలి';

  @override
  String get unableToGenerateUniqueUsername =>
      'ప్రత్యేకమైన యూజర్ పేరును సృష్టించడం సాధ్యం కాలేదు.';

  @override
  String get accountCreated => 'ఖాతా సృష్టించబడింది';

  @override
  String yourUsernameIs(String username) {
    return 'మీ యూజర్ పేరు:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'యూజర్ పేరు «$chosen» ఇప్పటికే తీసుకోబడింది.\n\nమీ యూజర్ పేరు:\n\n$assigned\n\nదయచేసి దీన్ని గుర్తుంచుకోండి. లాగిన్ చేయడానికి ఇది అవసరం.';
  }

  @override
  String get continueText => 'కొనసాగించు';

  @override
  String failedToGenerateIdentity(String error) {
    return 'సురక్షిత గుర్తింపును సృష్టించడం విఫలమైంది: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPTకి స్వాగతం';

  @override
  String get signupDescription =>
      'మీ P2P ఎన్‌క్రిప్షన్ కీలను రూపొందించడానికి యూజర్ పేరు మరియు పాస్‌వర్డ్‌ను నమోదు చేయండి.';

  @override
  String get chooseAUsername => 'యూజర్ పేరును ఎంచుకోండి';

  @override
  String get usernameHelperText =>
      'మీ నిజమైన పేరును ఉపయోగించవద్దు. యూజర్ పేరు ఇప్పటికే తీసుకోబడితే, మేము స్వయంచాలకంగా ప్రత్యేకమైన ప్రత్యయాన్ని జోడిస్తాము.';

  @override
  String get masterAuthenticationRequired => 'మాస్టర్ ప్రమాణీకరణ అవసరం';

  @override
  String get verify => 'ధృవీకరించు';

  @override
  String get darkThemeMode => 'డార్క్ థీమ్';

  @override
  String get secureConversations => 'సురక్షిత సంభాషణలు';

  @override
  String get noActiveConversations =>
      'సక్రియ సంభాషణలు ఏవీ కనుగొనబడలేదు. భద్రతా లాక్‌లను ఉపయోగించడానికి ముందుగా సంభాషణను ప్రారంభించండి.';

  @override
  String get logout => 'లాగ్ అవుట్';

  @override
  String get wipeDeviceAndEscape =>
      'పరికరాన్ని పూర్తిగా తొలగించి లాగ్ అవుట్ చేయి';

  @override
  String get falsePassword => 'తప్పు పాస్‌వర్డ్';

  @override
  String accessSuspendedTimer(String time) {
    return 'భద్రతా కారణాల వల్ల యాక్సెస్ నిలిపివేయబడింది. $time తర్వాత మళ్లీ ప్రయత్నించండి.';
  }

  @override
  String get selectSecureLockMethod => 'సురక్షిత లాక్ పద్ధతిని ఎంచుకోండి';

  @override
  String get selectSecureLockDescription =>
      'ఈ సంభాషణను పరికరం యొక్క వేలిముద్ర బయోమెట్రిక్స్ లేదా సాధారణ 4-అంకెల PINతో లాక్ చేయాలనుకుంటున్నారా?';

  @override
  String get fourDigitPin => '4-అంకెల PIN';

  @override
  String get fingerprintUnlock => 'వేలిముద్ర 🔓';

  @override
  String get supportSoloDeveloper => 'స్వతంత్ర డెవలపర్‌కు మద్దతు ఇవ్వండి';

  @override
  String get maybeLater => 'బహుశా తర్వాత';

  @override
  String get submitProof => 'ధృవీకరణను సమర్పించు';

  @override
  String get couldNotOpenWallet =>
      'వాలెట్‌ను స్వయంచాలకంగా తెరవడం సాధ్యం కాలేదు. బదులుగా క్రింది టెక్స్ట్ కోడ్‌ను కాపీ చేయండి.';

  @override
  String get proofSubmittedSnackbar =>
      'ధృవీకరణ సమర్పించబడింది! మాన్యువల్ సమీక్షకు 24–48 గంటలు పడుతుంది (వారాంతాలు మినహా). మీరు యాప్‌ను సాధారణంగా ఉపయోగించడం కొనసాగించవచ్చు.';
}
