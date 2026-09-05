// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tagalog (`tl`).
class AppLocalizationsTl extends AppLocalizations {
  AppLocalizationsTl([String locale = 'tl']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Maligayang Pagdating';

  @override
  String get login => 'Mag-log In';

  @override
  String get signup => 'Mag-sign Up';

  @override
  String get settings => 'Mga Setting';

  @override
  String get chats => 'Mga Chat';

  @override
  String get typeMessage => 'Mag-type ng mensahe...';

  @override
  String get send => 'Ipadala';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Kumokonekta...';

  @override
  String get connectingP2p => 'Kumokonekta sa P2P...';

  @override
  String get p2pConnectionNotReady => 'Hindi pa handa ang P2P.';

  @override
  String get searchLanguage => 'Maghanap ng wika...';

  @override
  String get language => 'Wika';

  @override
  String get forceEscapeSignOutTitle => 'IPWERSA ANG EMERGENCY SIGN OUT?';

  @override
  String get forceEscapeSignOutContent =>
      'BABALA: Ang paggawa nito ay permanenteng magbubura ng lahat ng data sa aparatong ito.';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get wipeDevice => 'BURAHIN ANG APARATO';

  @override
  String get accountDestructionAlertTitle => 'ALERTO NG PAGKAWASAK NG ACCOUNT';

  @override
  String get accountDestructionWarning =>
      'BABALA: Ang aksyong ito ay magbubura ng lahat ng iyong data sa aparatong ito. Kapag nakakonekta sa Internet, magpapadala ito ng remote self-destruct command. Ang bawat mensaheng ipinadala mula sa iyong natatanging User ID ay permanenteng mabubura sa memorya ng lahat ng peer.';

  @override
  String get accountDestructionCriticalNotice =>
      'KRITIKAL: Kung maling mai-type ang mga validation number na ito, magla-lock ang system. Upang i-unlock ito, kailangan mong ilagay ang iyong master Account Password, o gamitin ang Emergency Escape hatch na agarang maglilinis sa imbakan ng data ng aparatong ito.';

  @override
  String verificationSecurityKey(String code) {
    return 'Verification Security Key: $code';
  }

  @override
  String get copyDigitsHint => 'Kopyahin ang 5 digit sa itaas';

  @override
  String get codeMismatchNotice =>
      'Hindi Nagtutugma ang Code! Ilagay ang Master Password para i-override o harapin ang 10-Minutong Lock:';

  @override
  String get accountPasswordLabel => 'Password ng Account';

  @override
  String get deleteEverythingPermanently => 'PERMANENTENG BURAHIN ANG LAHAT';

  @override
  String get escapeAndPurgeDeviceData =>
      'Escape at Linisin ang Data ng Aparato';

  @override
  String get addContact => 'Magdagdag ng Contact';

  @override
  String get addContactConfirmation =>
      'Gusto mo bang idagdag ang contact na ito?';

  @override
  String get noMessagesYet => 'Wala pang mga mensahe';

  @override
  String get addNewContact => 'Magdagdag ng Bagong Contact';

  @override
  String get usernameLabel => 'Username';

  @override
  String get nicknameOptionalLabel => 'Palayaw (Opsyonal)';

  @override
  String get add => 'Idagdag';

  @override
  String get usernameCannotBeEmpty => 'Hindi pwedeng walang laman ang username';

  @override
  String contactAlreadyExists(String name) {
    return 'Ang contact na \'$name\' ay nasa iyong address book na.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Hindi mahanap ang user na \'$name\' sa network registry. Hindi makalikha ng shared secret.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Matagumpay na naidagdag si $name!';
  }

  @override
  String get contacts => 'Mga Contact';

  @override
  String get noContactsYet => 'Wala pang mga contact';

  @override
  String get securityLockoutActive => 'Aktibo ang Security Lockout';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Masyadong maraming maling subok. Naka-freeze ng $minutes minuto.';
  }

  @override
  String get acknowledge => 'I-acknowledge';

  @override
  String get accessBlocked => 'Harang ang Akseso';

  @override
  String accessSuspended(int minutes) {
    return '5 maling verification match. Suspendido ang akseso para sa susunod na $minutes minuto.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'I-unlock ang Secure Node: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Natitirang verification attempts: $count na pagsubok.';
  }

  @override
  String get secureKeyPasscode => 'Secure Key Passcode';

  @override
  String get warningHardwareLockout =>
      'BABALA: Ang susunod na maling pagtutugma ay mag-a-activate ng hardware security lockout mitigation.';

  @override
  String get abort => 'I-abort';

  @override
  String get authenticate => 'Mag-authenticate';

  @override
  String get searchPipelinesHint =>
      'Sinusuri ang mga aktibong secure pipeline...';

  @override
  String get zeroPipelinesDiscovered =>
      'Walang natagpuang katugmang communication pipeline.';

  @override
  String get processingDecryption => 'Pinoproseso ang decryption...';

  @override
  String get decrypting => 'Nagde-decrypt...';

  @override
  String get decryptionError => '[Mali sa Decryption]';

  @override
  String get cryptContainerSecure => 'SECURE ANG CRYPT CONTAINER';

  @override
  String get connectAnAccount => 'Ikonekta ang Isang Account';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get enterMasterSecurityPassword =>
      'Ilagay ang iyong master security password';

  @override
  String get pleaseFillAllFields => 'Mangyaring punan ang lahat ng field';

  @override
  String get wrongUsernameOrPassword => 'Maling username o password';

  @override
  String loginError(String error) {
    return 'Mali sa pag-login: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Walang account? Mag-sign up';

  @override
  String get myIdentity => 'Aking Pagkakakilanlan';

  @override
  String get scanToAddMe => 'I-scan para idagdag ako';

  @override
  String get shareProfileLink => 'Ibahagi ang Link ng Profile';

  @override
  String addMeOnCrypt(String link) {
    return 'Idagdag ako sa CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'I-scan ang QR';

  @override
  String get invalidCryptQrFormat => 'Inbalidong format ng CRYPT QR Code.';

  @override
  String get userScanned => 'Na-scan ang User!';

  @override
  String addingUser(String username) {
    return 'Idinaragdag si $username...';
  }

  @override
  String get defaultUser => 'User';

  @override
  String get createAccount => 'Gumawa ng Account';

  @override
  String get keepPasswordSecureHint =>
      'Panatilihin itong ligtas, hindi na mapapalitan ang password';

  @override
  String get pleaseFillInAllFields => 'Mangyaring punan ang lahat ng field';

  @override
  String get usernameExceedsLimit =>
      'Ang username ay hindi pwedeng lumampas sa 20 karakter';

  @override
  String get invalidUsernameCharacters =>
      'Ang username ay maaari lamang maglaman ng mga titik, numero, underscore, at gitling';

  @override
  String get weakPasswordNotice =>
      'Ang password ay dapat may 8+ karakter, may kasamang numero at malaking titik';

  @override
  String get unableToGenerateUniqueUsername =>
      'Hindi makabuo ng natatanging username.';

  @override
  String get accountCreated => 'Nalikha na ang Account';

  @override
  String yourUsernameIs(String username) {
    return 'Ang iyong username ay:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Ang username na \'$chosen\' ay nakuha na.\n\nAng iyong username ay:\n\n$assigned\n\nMangyaring tandaan ito. Kakailanganin mo ito para mag-log in.';
  }

  @override
  String get continueText => 'Magpatuloy';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Bigo sa pagbuo ng secure identity: $error';
  }

  @override
  String get welcomeToCrypt => 'Maligayang Pagdating sa CRYPT';

  @override
  String get signupDescription =>
      'Ilagay ang username at password para i-initialize ang iyong peer-to-peer (P2P) encryption keys.';

  @override
  String get chooseAUsername => 'Pumili ng username';

  @override
  String get usernameHelperText =>
      'Huwag gamitin ang tunay mong pangalan. Kung kuha na ang username, awtomatiko kaming magdaragdag ng natatanging suffix.';

  @override
  String get masterAuthenticationRequired =>
      'Kinakailangan ng Master Authentication';

  @override
  String get verify => 'I-verify';

  @override
  String get darkThemeMode => 'Dark Theme Mode';

  @override
  String get secureConversations => 'Mga Ligtas na Pag-uusap';

  @override
  String get noActiveConversations =>
      'Walang nahanap na aktibong pag-uusap. Magsimula muna ng pag-uusap para magamit ang mga custom security lock.';

  @override
  String get logout => 'Mag-logout';

  @override
  String get wipeDeviceAndEscape => 'BURAHIN ANG APARATO & TUMAKAS';

  @override
  String get falsePassword => 'Maling Password';

  @override
  String accessSuspendedTimer(String time) {
    return 'Ang akseso ay suspendido para sa proteksyong panseguridad. Subukan ulit sa loob ng $time.';
  }

  @override
  String get selectSecureLockMethod => 'Pumili ng Secure Lock Method';

  @override
  String get selectSecureLockDescription =>
      'Gusto mo bang i-lock ang silid ng pag-uusap na ito gamit ang Fingerprint Biometrics ng aparato o ang karaniwang 4-Digit PIN code?';

  @override
  String get fourDigitPin => '4-Digit PIN';

  @override
  String get fingerprintUnlock => 'Fingerprint 🔓';

  @override
  String get supportSoloDeveloper => 'Suportahan ang isang Solo Developer';

  @override
  String get maybeLater => 'Mamaya na lang';

  @override
  String get submitProof => 'Isumite ang Katibayan';

  @override
  String get couldNotOpenWallet =>
      'Hindi awtomatikong mabuksan ang wallet. Pakikopya na lang ng text code string sa ibaba.';

  @override
  String get proofSubmittedSnackbar =>
      'Naibigay na ang katibayan! Ang manual na pagsusuri ay tumatagal ng 24-48 oras (hindi kasama ang katapusan ng linggo). Maaari mo pa ring gamitin ang app nang normal!';
}
