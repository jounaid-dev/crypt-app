// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'സ്വാഗതം';

  @override
  String get login => 'ലോഗിൻ';

  @override
  String get signup => 'സൈൻ അപ്പ്';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get chats => 'ചാറ്റുകൾ';

  @override
  String get typeMessage => 'സന്ദേശം ടൈപ്പ് ചെയ്യുക...';

  @override
  String get send => 'അയയ്ക്കുക';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'ബന്ധിപ്പിക്കുന്നു...';

  @override
  String get connectingP2p => 'P2P-യിലേക്ക് ബന്ധിപ്പിക്കുന്നു...';

  @override
  String get p2pConnectionNotReady => 'P2P തയ്യാറായിട്ടില്ല.';

  @override
  String get searchLanguage => 'ഭാഷ തിരയുക...';

  @override
  String get language => 'ഭാഷ';

  @override
  String get forceEscapeSignOutTitle => 'നിർബന്ധിതമായി സൈൻ ഔട്ട് ചെയ്യണോ?';

  @override
  String get forceEscapeSignOutContent =>
      'മുന്നറിയിപ്പ്: ഈ ഉപകരണത്തിലെ എല്ലാ ഡാറ്റയും മായ്ക്കപ്പെടും.';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get wipeDevice => 'ഉപകരണം വൈപ്പ് ചെയ്യുക';

  @override
  String get accountDestructionAlertTitle => 'അക്കൗണ്ട് ഇല്ലാതാക്കൽ';

  @override
  String get accountDestructionWarning =>
      'മുന്നറിയിപ്പ്: ഉപകരണ ഡാറ്റയും റിമോട്ട് സന്ദേശങ്ങളും മായ്ക്കപ്പെടും.';

  @override
  String get accountDestructionCriticalNotice =>
      'നിർണ്ണായകം: തെറ്റായ കോഡുകൾ സിസ്റ്റം ലോക്ക് ചെയ്യും. നിങ്ങളുടെ അക്കൗണ്ട് പാസ്‌വേഡ് അല്ലെങ്കിൽ എമർജൻസി എസ്കേപ്പ് ഉപയോഗിക്കുക.';

  @override
  String verificationSecurityKey(String code) {
    return 'സുരക്ഷാ കീ: $code';
  }

  @override
  String get copyDigitsHint => '5 അക്കങ്ങൾ പകർത്തുക';

  @override
  String get codeMismatchNotice =>
      'കോഡ് പൊരുത്തപ്പെടുന്നില്ല. നിങ്ങളുടെ മാസ്റ്റർ പാസ്‌വേഡ് നൽകുക അല്ലെങ്കിൽ 10 മിനിറ്റ് കാത്തിരിക്കുക.';

  @override
  String get accountPasswordLabel => 'അക്കൗണ്ട് പാസ്‌വേഡ്';

  @override
  String get deleteEverythingPermanently => 'എല്ലാം ശാശ്വതമായി ഇല്ലാതാക്കുക';

  @override
  String get escapeAndPurgeDeviceData => 'എസ്കേപ്പ് ചെയ്ത് ഡാറ്റ മായ്ക്കുക';

  @override
  String get addContact => 'കോൺടാക്റ്റ് ചേർക്കുക';

  @override
  String get addContactConfirmation => 'ഈ കോൺടാക്റ്റ് ചേർക്കണോ?';

  @override
  String get noMessagesYet => 'ഇതുവരെ സന്ദേശങ്ങളില്ല';

  @override
  String get addNewContact => 'പുതിയ കോൺടാക്റ്റ്';

  @override
  String get usernameLabel => 'ഉപയോക്തൃനാമം';

  @override
  String get nicknameOptionalLabel => 'വിളിപ്പേര് (ഓപ്ഷണൽ)';

  @override
  String get add => 'ചേർക്കുക';

  @override
  String get usernameCannotBeEmpty => 'ഉപയോക്തൃനാമം ആവശ്യമാണ്';

  @override
  String contactAlreadyExists(String name) {
    return '\'$name\' എന്ന കോൺടാക്റ്റ് ഇതിനകം നിലവിലുണ്ട്.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'ഉപയോക്താവ് \'$name\' കണ്ടെത്തിയില്ല. പങ്കിട്ട രഹസ്യം ലഭ്യമല്ല.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name ചേർത്തു!';
  }

  @override
  String get contacts => 'കോൺടാക്റ്റുകൾ';

  @override
  String get noContactsYet => 'ഇതുവരെ കോൺടാക്റ്റുകളില്ല';

  @override
  String get securityLockoutActive => 'സുരക്ഷാ ലോക്കൗട്ട്';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'വളരെയധികം ശ്രമങ്ങൾ. $minutes മിനിറ്റത്തേക്ക് ലോക്ക് ചെയ്തു.';
  }

  @override
  String get acknowledge => 'സ്ഥിരീകരിക്കുക';

  @override
  String get accessBlocked => 'പ്രവേശനം തടഞ്ഞു';

  @override
  String accessSuspended(int minutes) {
    return '5 പരാജയപ്പെട്ട പൊരുത്തങ്ങൾ. $minutes മിനിറ്റത്തേക്ക് പ്രവേശനം നിർത്തിവച്ചു.';
  }

  @override
  String get ok => 'ശരി';

  @override
  String unlockSecureNode(String username) {
    return 'അൺലോക്ക് ചെയ്യുക: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'ശേഷിക്കുന്ന ശ്രമങ്ങൾ: $count';
  }

  @override
  String get secureKeyPasscode => 'സുരക്ഷാ പാസ്‌കോഡ്';

  @override
  String get warningHardwareLockout =>
      'മുന്നറിയിപ്പ്: അടുത്ത പരാജയം സുരക്ഷാ ലോക്ക് ചെയ്യും.';

  @override
  String get abort => 'നിർത്തുക';

  @override
  String get authenticate => 'പ്രാമാണീകരിക്കുക';

  @override
  String get searchPipelinesHint => 'സുരക്ഷിത കണക്ഷനുകൾ തിരയുക...';

  @override
  String get zeroPipelinesDiscovered => 'കണക്ഷനുകളൊന്നും കണ്ടെത്തിയില്ല.';

  @override
  String get processingDecryption => 'ഡീക്രിപ്റ്റ് ചെയ്യുന്നു...';

  @override
  String get decrypting => 'ഡീക്രിപ്റ്റ് ചെയ്യുന്നു...';

  @override
  String get decryptionError => '[ഡീക്രിപ്ഷൻ പിശക്]';

  @override
  String get cryptContainerSecure => 'CRYPT കണ്ടെയ്നർ സുരക്ഷിതമാണ്';

  @override
  String get connectAnAccount => 'അക്കൗണ്ട് ബന്ധിപ്പിക്കുക';

  @override
  String get username => 'ഉപയോക്തൃനാമം';

  @override
  String get password => 'പാസ്‌വേഡ്';

  @override
  String get enterMasterSecurityPassword =>
      'നിങ്ങളുടെ മാസ്റ്റർ പാസ്‌വേഡ് നൽകുക';

  @override
  String get pleaseFillAllFields => 'എല്ലാ ഫീൽഡുകളും പൂരിപ്പിക്കുക';

  @override
  String get wrongUsernameOrPassword => 'ഉപയോക്തൃനാമമോ പാസ്‌വേഡോ തെറ്റാണ്';

  @override
  String loginError(String error) {
    return 'ലോഗിൻ പിശക്: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'അക്കൗണ്ട് ഇല്ലേ? സൈൻ അപ്പ് ചെയ്യുക';

  @override
  String get myIdentity => 'എന്റെ ഐഡന്റിറ്റി';

  @override
  String get scanToAddMe => 'എന്നെ ചേർക്കാൻ സ്കാൻ ചെയ്യുക';

  @override
  String get shareProfileLink => 'പ്രൊഫൈൽ പങ്കിടുക';

  @override
  String addMeOnCrypt(String link) {
    return 'CRYPT-ൽ എന്നെ ചേർക്കൂ!\n\n$link';
  }

  @override
  String get scanQr => 'QR സ്കാൻ ചെയ്യുക';

  @override
  String get invalidCryptQrFormat => 'അസാധുവായ CRYPT QR കോഡ്.';

  @override
  String get userScanned => 'ഉപയോക്താവിനെ സ്കാൻ ചെയ്തു!';

  @override
  String addingUser(String username) {
    return '$username ചേർക്കുന്നു...';
  }

  @override
  String get defaultUser => 'ഉപയോക്താവ്';

  @override
  String get createAccount => 'അക്കൗണ്ട് സൃഷ്ടിക്കുക';

  @override
  String get keepPasswordSecureHint =>
      'സുരക്ഷിതമായി സൂക്ഷിക്കുക. പാസ്‌വേഡ് മാറ്റാൻ കഴിയില്ല.';

  @override
  String get pleaseFillInAllFields => 'എല്ലാ ഫീൽഡുകളും പൂരിപ്പിക്കുക';

  @override
  String get usernameExceedsLimit => 'ഉപയോക്തൃനാമം പരമാവധി 20 അക്ഷരങ്ങൾ';

  @override
  String get invalidUsernameCharacters =>
      'അക്ഷരങ്ങൾ, അക്കങ്ങൾ, _ അല്ലെങ്കിൽ - മാത്രം ഉപയോഗിക്കുക.';

  @override
  String get weakPasswordNotice =>
      '8+ അക്ഷരങ്ങൾ, 1 അക്കം, 1 വലിയ അക്ഷരം ഉപയോഗിക്കുക.';

  @override
  String get unableToGenerateUniqueUsername =>
      'അദ്വിതീയ ഉപയോക്തൃനാമം സൃഷ്ടിക്കാനായില്ല.';

  @override
  String get accountCreated => 'അക്കൗണ്ട് സൃഷ്ടിച്ചു';

  @override
  String yourUsernameIs(String username) {
    return 'നിങ്ങളുടെ ഉപയോക്തൃനാമം:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'ഉപയോക്തൃനാമം \'$chosen\' ഇതിനകം ഉപയോഗത്തിലാണ്.\n\nനിങ്ങളുടെ ഉപയോക്തൃനാമം:\n\n$assigned\n\nഇത് ലോഗിൻ ചെയ്യാൻ ആവശ്യമായതിനാൽ സൂക്ഷിക്കുക.';
  }

  @override
  String get continueText => 'തുടരുക';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ഐഡന്റിറ്റി സൃഷ്ടിക്കുന്നത് പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT-ലേക്ക് സ്വാഗതം';

  @override
  String get signupDescription =>
      'P2P കീകൾ സൃഷ്ടിക്കാൻ ഒരു ഉപയോക്തൃനാമവും പാസ്‌വേഡും നൽകുക.';

  @override
  String get chooseAUsername => 'ഒരു ഉപയോക്തൃനാമം തിരഞ്ഞെടുക്കുക';

  @override
  String get usernameHelperText =>
      'നിങ്ങളുടെ യഥാർത്ഥ പേര് ഉപയോഗിക്കരുത്. പേര് എടുത്തിട്ടുണ്ടെങ്കിൽ ഒരു സഫിക്സ് ചേർക്കും.';

  @override
  String get masterAuthenticationRequired => 'മാസ്റ്റർ പ്രാമാണീകരണം';

  @override
  String get verify => 'സ്ഥിരീകരിക്കുക';

  @override
  String get darkThemeMode => 'ഡാർക്ക് തീം';

  @override
  String get secureConversations => 'സുരക്ഷിത സംഭാഷണങ്ങൾ';

  @override
  String get noActiveConversations =>
      'സജീവ ചാറ്റുകളൊന്നുമില്ല. ലോക്കുകൾ പ്രവർത്തനക്ഷമമാക്കാൻ ഒന്ന് ആരംഭിക്കുക.';

  @override
  String get logout => 'ലോഗൗട്ട്';

  @override
  String get wipeDeviceAndEscape => 'ഉപകരണം വൈപ്പ് ചെയ്യുക';

  @override
  String get falsePassword => 'തെറ്റായ പാസ്‌വേഡ്';

  @override
  String accessSuspendedTimer(String time) {
    return 'പ്രവേശനം നിർത്തിവച്ചിരിക്കുന്നു. $time കഴിഞ്ഞ് വീണ്ടും ശ്രമിക്കുക.';
  }

  @override
  String get selectSecureLockMethod => 'ലോക്ക് രീതി തിരഞ്ഞെടുക്കുക';

  @override
  String get selectSecureLockDescription =>
      'ഫിംഗർപ്രിന്റ് അല്ലെങ്കിൽ 4 അക്ക PIN ഉപയോഗിച്ച് ലോക്ക് ചെയ്യണോ?';

  @override
  String get fourDigitPin => '4 അക്ക PIN';

  @override
  String get fingerprintUnlock => 'ഫിംഗർപ്രിന്റ് 🔓';

  @override
  String get supportSoloDeveloper => 'ഡെവലപ്പറെ പിന്തുണയ്ക്കുക';

  @override
  String get maybeLater => 'പിന്നീട്';

  @override
  String get submitProof => 'തെളിവ് സമർപ്പിക്കുക';

  @override
  String get couldNotOpenWallet =>
      'വാലറ്റ് തുറക്കാനായില്ല. താഴെയുള്ള കോഡ് പകർത്തുക.';

  @override
  String get proofSubmittedSnackbar =>
      'തെളിവ് സമർപ്പിച്ചു. മാനുവൽ പരിശോധന: 24–48 മണിക്കൂർ (വാരാന്ത്യങ്ങൾ ഒഴികെ).';
}
