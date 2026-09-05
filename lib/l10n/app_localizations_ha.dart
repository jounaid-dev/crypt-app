// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class AppLocalizationsHa extends AppLocalizations {
  AppLocalizationsHa([String locale = 'ha']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Barka da Zuwa';

  @override
  String get login => 'Shiga';

  @override
  String get signup => 'Yi Rajista';

  @override
  String get settings => 'Saituna';

  @override
  String get chats => 'Tattaunawa';

  @override
  String get typeMessage => 'Rubuta saƙo...';

  @override
  String get send => 'Aika';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Ana haɗawa...';

  @override
  String get connectingP2p => 'Ana haɗawa da P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P bai shirya ba.';

  @override
  String get searchLanguage => 'Nemi harshe...';

  @override
  String get language => 'Harshe';

  @override
  String get forceEscapeSignOutTitle => 'TILASTA FITAR GAGGawa?';

  @override
  String get forceEscapeSignOutContent =>
      'GARƘADI: Yin hakan zai goge duk wani bayanai gaba ɗaya daga wannan na\'ura.';

  @override
  String get cancel => 'Soke';

  @override
  String get wipeDevice => 'GOGE NA\'URA';

  @override
  String get accountDestructionAlertTitle => 'GARGADI GAME DA RUSHE ASUSU';

  @override
  String get accountDestructionWarning =>
      'GARƘADI: Wannan mataki zai goge dukkan bayanan ku daga wannan na\'ura. Lokacin da kuke da alaƙa da Intanet, hakan zai haifar da umarnin lalata kai na nesa. Kowane saƙo da aka aika daga keɓantaccen ID na Mai amfani za a goge shi na dindindin daga duk tunanin abokan hulɗa.';

  @override
  String get accountDestructionCriticalNotice =>
      'MAHIMMI: Idan kun rubuta waɗannan lambobin tabbatarwa ba daidai ba, tsarin zai kulle. Don buɗe shi, dole ne ku samar da Babban Kalmar Sirri ta Asusun ku, ko amfani da hanyar fita ta gaggawa wacce ke share dukkan bayanan na\'urar nan take.';

  @override
  String verificationSecurityKey(String code) {
    return 'Mabuɗin Tsaron Tabbatarwa: $code';
  }

  @override
  String get copyDigitsHint => 'Kwafi lambobi 5 na sama';

  @override
  String get codeMismatchNotice =>
      'Lambar Ba Ta Dace Ba! Shigar da Babban Kalmar Sirri don soke ko fuskanci Kullewa na Minti 10:';

  @override
  String get accountPasswordLabel => 'Kalmar Sirri ta Asusun';

  @override
  String get deleteEverythingPermanently => 'GOGE KOWANE ABU NA DINDINDIN';

  @override
  String get escapeAndPurgeDeviceData => 'Fita & Share Bayanan Na\'ura';

  @override
  String get addContact => 'Ƙara Lambar Tuntuɓi';

  @override
  String get addContactConfirmation =>
      'Shin kuna son ƙara wannan lambar tuntuɓar?';

  @override
  String get noMessagesYet => 'Babu saƙonni tukunna';

  @override
  String get addNewContact => 'Ƙara Sabuwar Lamba';

  @override
  String get usernameLabel => 'Sunan mai amfani';

  @override
  String get nicknameOptionalLabel => 'Inkiya (Na Zabi)';

  @override
  String get add => 'Ƙara';

  @override
  String get usernameCannotBeEmpty =>
      'Sunan mai amfani ba zai iya kasancewa tupu ba';

  @override
  String contactAlreadyExists(String name) {
    return 'Lambar tuntuɓar \'$name\' tana cikin littafin adireshi na ku riga.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Ba a sami mai amfani \'$name\' a cikin rajistar hanyar sadarwa ba. Ba za a iya samar da asirin raba kaddara ba.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'An yi nasarar ƙara $name!';
  }

  @override
  String get contacts => 'Lambobi';

  @override
  String get noContactsYet => 'Babu lambobi tukunna';

  @override
  String get securityLockoutActive => 'Kullewar Tsaro Tana Aiki';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Yawan gwaji mara kyau. An dakatar da ku na tsadin mintuna $minutes.';
  }

  @override
  String get acknowledge => 'Yarda';

  @override
  String get accessBlocked => 'An Kulle Hanyar Shiga';

  @override
  String accessSuspended(int minutes) {
    return 'An sami kuskuren tabbatarwa har sau 5. An dakatar da damar shiga na tsawon mintuna $minutes masu zuwa.';
  }

  @override
  String get ok => 'Lafiya';

  @override
  String unlockSecureNode(String username) {
    return 'Buɗe Kullin Tsaro: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Sauran ma\'aunin tabbatarwa: Gwaji $count.';
  }

  @override
  String get secureKeyPasscode => 'Lambar Sirri ta Mabuɗin Tsaro';

  @override
  String get warningHardwareLockout =>
      'GARƘADI: Rashin dacewar tsari na gaba zai haifar da kullewar tsaro ta kayan aiki.';

  @override
  String get abort => 'Soke';

  @override
  String get authenticate => 'Tabbatar da Shaidarka';

  @override
  String get searchPipelinesHint =>
      'Bincika hanyoyin sadarwa amintattu da ke aiki...';

  @override
  String get zeroPipelinesDiscovered =>
      'Babu wasu hanyoyin sadarwa masu dacewa da aka gano.';

  @override
  String get processingDecryption => 'Ana sarrafa buɗe sirrin...';

  @override
  String get decrypting => 'Ana buɗe sirrin...';

  @override
  String get decryptionError => '[Kuskuren Buɗe Sirrin]';

  @override
  String get cryptContainerSecure => 'AKWANTIN CRYPT CIKIN TSARO YAKE';

  @override
  String get connectAnAccount => 'Haɗa Asusun';

  @override
  String get username => 'Sunan mai amfani';

  @override
  String get password => 'Kalmar sirri';

  @override
  String get enterMasterSecurityPassword =>
      'Shigar da babban kalmar sirri ta tsaro';

  @override
  String get pleaseFillAllFields => 'Tafadhali cika dukkan wurare';

  @override
  String get wrongUsernameOrPassword =>
      'Sunan mai amfani ko kalmar sirri ba daidai ba';

  @override
  String loginError(String error) {
    return 'Kuskuren shiga: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Ba ku da asusu? Yi rajista';

  @override
  String get myIdentity => 'Shaidata ta Keɓance';

  @override
  String get scanToAddMe => 'Bincika QR code don ƙara ni';

  @override
  String get shareProfileLink => 'Raba Haɗin Bayanan Labari';

  @override
  String addMeOnCrypt(String link) {
    return 'Ƙara ni a CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Duba QR';

  @override
  String get invalidCryptQrFormat =>
      'Tsarin Lambar QR ta CRYPT ba daidai ba ne.';

  @override
  String get userScanned => 'An bincika Mai amfani!';

  @override
  String addingUser(String username) {
    return 'Ana ƙara $username...';
  }

  @override
  String get defaultUser => 'Mai amfani';

  @override
  String get createAccount => 'Ƙirƙiri Asusun';

  @override
  String get keepPasswordSecureHint =>
      'Kiyaye shi da kyau, ba za a iya canza kalmar sirri daga baya ba';

  @override
  String get pleaseFillInAllFields => 'Tafadhali cika kowane sashe';

  @override
  String get usernameExceedsLimit =>
      'Sunan mai amfani ba zai iya wuce haruffa 20 ba';

  @override
  String get invalidUsernameCharacters =>
      'Sunan mai amfani zai iya ƙunsar haruffa, lambobi, layukan ƙasa, da dashi kawai';

  @override
  String get weakPasswordNotice =>
      'Dole ne kalmar sirri ta kasance haruffa 8+, haɗa da lamba da babban harafi';

  @override
  String get unableToGenerateUniqueUsername =>
      'Ba za a iya samar da sunan mai amfani na musamman ba.';

  @override
  String get accountCreated => 'An Ƙirƙiri Asusun';

  @override
  String yourUsernameIs(String username) {
    return 'Sunan mai amfani na ku shine:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'An riga an ɗauki sunan mai amfani \'$chosen\'.\n\nSunan mai amfani na ku shine:\n\n$assigned\n\nTafadhali tuna shi. Kuna buƙatarsa don shiga.';
  }

  @override
  String get continueText => 'Ci gaba';

  @override
  String failedToGenerateIdentity(String error) {
    return 'An kasa samar da amintacciyar shaida: $error';
  }

  @override
  String get welcomeToCrypt => 'Barka da zuwa CRYPT';

  @override
  String get signupDescription =>
      'Shigar da sunan mai amfani da kalmar sirri don fara mabuɗan ɓonye sirrin ku na aboki-da-aboki (P2P).';

  @override
  String get chooseAUsername => 'Zaɓi sunan mai amfani';

  @override
  String get usernameHelperText =>
      'Kada ku yi amfani da ainihin sunanku. Idan an ɗauki sunan mai amfani, za mu ƙara ƙari na musamman ta atomatik.';

  @override
  String get masterAuthenticationRequired => 'Ana Bukatar Babban Tabbatarwa';

  @override
  String get verify => 'Tabbatar';

  @override
  String get darkThemeMode => 'Yanayin Jigo Mai Duhu';

  @override
  String get secureConversations => 'Tattaunawa Amintattu';

  @override
  String get noActiveConversations =>
      'Ba a sami tattaunawa mai aiki ba. Fara tattaunawa tukunna don amfani da keɓaɓɓen kulle tsaro.';

  @override
  String get logout => 'Fita';

  @override
  String get wipeDeviceAndEscape => 'GOGE NA\'URA & GUDU';

  @override
  String get falsePassword => 'Kalmar Sirri ta Karya';

  @override
  String accessSuspendedTimer(String time) {
    return 'An dakatar da damar shiga don kariya ta tsaro. Sake gwadawa bayan $time.';
  }

  @override
  String get selectSecureLockMethod => 'Zaɓi Hanyar Kulle Amintacciya';

  @override
  String get selectSecureLockDescription =>
      'Shin kuna son kulle wannan ɗakin tattaunawa ta amfani da Shaidar Yatsa ta na\'ura ko daidaitaccen lambar PIN ta Tarakimu 4?';

  @override
  String get fourDigitPin => 'PIN na Tarakimu 4';

  @override
  String get fingerprintUnlock => 'Binciken Yatsa 🔓';

  @override
  String get supportSoloDeveloper => 'Taimaka wa Mai Haɓaka Shirye-shirye Solo';

  @override
  String get maybeLater => 'Wataƙila Daga Baya';

  @override
  String get submitProof => 'Wasilisha Shaidar Tabbatarwa';

  @override
  String get couldNotOpenWallet =>
      'An kasa buɗe walat ta atomatik. Tafadhali kwafi muryar lambar rubutu da ke ƙasa a maimakon haka.';

  @override
  String get proofSubmittedSnackbar =>
      'An wasilisha shaidar! Bita ta hannu tana ɗaukar sa\'o\'i 24-48 (banda karshen mako). Kuna iya ci gaba da amfani da aikace-aikacen kamar yadda kuka saba!';
}
