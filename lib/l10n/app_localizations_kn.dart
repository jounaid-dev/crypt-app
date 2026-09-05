// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'ಸ್ವಾಗತ';

  @override
  String get login => 'ಲಾಗ್ ಇನ್';

  @override
  String get signup => 'ಸೈನ್ ಅಪ್';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get chats => 'ಚಾಟ್‌ಗಳು';

  @override
  String get typeMessage => 'ಸಂದೇಶವನ್ನು ಟೈಪ್ ಮಾಡಿ...';

  @override
  String get send => 'ಕಳುಹಿಸಿ';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get connectingP2p => 'P2P ಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get p2pConnectionNotReady => 'P2P ಸಿದ್ಧವಾಗಿಲ್ಲ.';

  @override
  String get searchLanguage => 'ಭಾಷೆಯನ್ನು ಹುಡುಕಿ...';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get forceEscapeSignOutTitle => 'ಬಲವಂತವಾಗಿ ಸೈನ್ ಔಟ್ ಮಾಡಬೇಕೆ?';

  @override
  String get forceEscapeSignOutContent =>
      'ಎಚ್ಚರಿಕೆ: ಎಲ್ಲಾ ಸಾಧನದ ಡೇಟಾವನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get wipeDevice => 'ಸಾಧನವನ್ನು ಅಳಿಸಿ';

  @override
  String get accountDestructionAlertTitle => 'ಖಾತೆ ಅಳಿಸುವಿಕೆ';

  @override
  String get accountDestructionWarning =>
      'ಎಚ್ಚರಿಕೆ: ಸಾಧನದ ಡೇಟಾ ಮತ್ತು ದೂರಸ್ಥ ಸಂದೇಶಗಳನ್ನು ಅಳಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get accountDestructionCriticalNotice =>
      'ನಿರ್ಣಾಯಕ: ತಪ್ಪಾದ ಕೋಡ್‌ಗಳು ಸಿಸ್ಟಮ್ ಅನ್ನು ಲಾಕ್ ಮಾಡುತ್ತವೆ. ನಿಮ್ಮ ಖಾತೆಯ ಪಾಸ್‌ವರ್ಡ್ ಅಥವಾ ತುರ್ತು ನಿರ್ಗಮನವನ್ನು ಬಳಸಿ.';

  @override
  String verificationSecurityKey(String code) {
    return 'ಭದ್ರತಾ ಕೀ: $code';
  }

  @override
  String get copyDigitsHint => '5 ಅಂಕೆಗಳನ್ನು ಕಾಪಿ ಮಾಡಿ';

  @override
  String get codeMismatchNotice =>
      'ಕೋಡ್ ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ. ನಿಮ್ಮ ಮಾಸ್ಟರ್ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ ಅಥವಾ 10 ನಿಮಿಷ ಕಾಯಿರಿ.';

  @override
  String get accountPasswordLabel => 'ಖಾತೆಯ ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get deleteEverythingPermanently => 'ಎಲ್ಲವನ್ನೂ ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ';

  @override
  String get escapeAndPurgeDeviceData => 'ನಿರ್ಗಮಿಸಿ ಮತ್ತು ಡೇಟಾವನ್ನು ಅಳಿಸಿ';

  @override
  String get addContact => 'ಸಂಪರ್ಕವನ್ನು ಸೇರಿಸಿ';

  @override
  String get addContactConfirmation => 'ಈ ಸಂಪರ್ಕವನ್ನು ಸೇರಿಸಬೇಕೆ?';

  @override
  String get noMessagesYet => 'ಇನ್ನೂ ಯಾವುದೇ ಸಂದೇಶಗಳಿಲ್ಲ';

  @override
  String get addNewContact => 'ಹೊಸ ಸಂಪರ್ಕ';

  @override
  String get usernameLabel => 'ಬಳಕೆದಾರ ಹೆಸರು';

  @override
  String get nicknameOptionalLabel => 'ಅಡ್ಡಹೆಸರು (ಐಚ್ಛಿಕ)';

  @override
  String get add => 'ಸೇರಿಸಿ';

  @override
  String get usernameCannotBeEmpty => 'ಬಳಕೆದಾರ ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String contactAlreadyExists(String name) {
    return 'ಸಂಪರ್ಕ \'$name\' ಈಗಾಗಲೇ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'ಬಳಕೆದಾರ \'$name\' ಕಂಡುಬಂದಿಲ್ಲ. ಹಂಚಿಕೆಯ ರಹಸ್ಯ ಲಭ್ಯವಿಲ್ಲ.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name ಅನ್ನು ಸೇರಿಸಲಾಗಿದೆ!';
  }

  @override
  String get contacts => 'ಸಂಪರ್ಕಗಳು';

  @override
  String get noContactsYet => 'ಇನ್ನೂ ಯಾವುದೇ ಸಂಪರ್ಕಗಳಿಲ್ಲ';

  @override
  String get securityLockoutActive => 'ಭದ್ರತಾ ಲಾಕ್‌ಔಟ್';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'ತುಂಬಾ ಹೆಚ್ಚು ಪ್ರಯತ್ನಗಳು. $minutes ನಿಮಿಷಗಳ ಕಾಲ ಲಾಕ್ ಮಾಡಲಾಗಿದೆ.';
  }

  @override
  String get acknowledge => 'ದೃಢೀಕರಿಸಿ';

  @override
  String get accessBlocked => 'ಪ್ರವೇಶವನ್ನು ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String accessSuspended(int minutes) {
    return '5 ಬಾರಿ ತಪ್ಪಾಗಿ ಹೊಂದಿಕೆಯಾಗಿದೆ. $minutes ನಿಮಿಷಗಳ ಕಾಲ ಪ್ರವೇಶವನ್ನು ಸ್ಥಗಿತಗೊಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String get ok => 'ಸರಿ';

  @override
  String unlockSecureNode(String username) {
    return 'ಅನ್‌ಲಾಕ್ ಮಾಡಿ: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'ಉಳಿದಿರುವ ಪ್ರಯತ್ನಗಳು: $count';
  }

  @override
  String get secureKeyPasscode => 'ಭದ್ರತಾ ಪಾಸ್‌ಕೋಡ್';

  @override
  String get warningHardwareLockout =>
      'ಎಚ್ಚರಿಕೆ: ಮುಂದಿನ ವೈಫಲ್ಯವು ಭದ್ರತೆಯನ್ನು ಲಾಕ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get abort => 'ರದ್ದುಮಾಡಿ';

  @override
  String get authenticate => 'ದೃಢೀಕರಿಸಿ';

  @override
  String get searchPipelinesHint => 'ಸುರಕ್ಷಿತ ಸಂಪರ್ಕಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get zeroPipelinesDiscovered => 'ಯಾವುದೇ ಸಂಪರ್ಕಗಳು ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get processingDecryption => 'ಡೀಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get decrypting => 'ಡೀಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get decryptionError => '[ಡೀಕ್ರಿಪ್ಶನ್ ದೋಷ]';

  @override
  String get cryptContainerSecure => 'CRYPT ಕಂಟೇನರ್ ಸುರಕ್ಷಿತವಾಗಿದೆ';

  @override
  String get connectAnAccount => 'ಖಾತೆಯನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get username => 'ಬಳಕೆದಾರ ಹೆಸರು';

  @override
  String get password => 'ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get enterMasterSecurityPassword => 'ನಿಮ್ಮ ಮಾಸ್ಟರ್ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ';

  @override
  String get pleaseFillAllFields => 'ಎಲ್ಲಾ ಕ್ಷೇತ್ರಗಳನ್ನು ಭರ್ತಿ ಮಾಡಿ';

  @override
  String get wrongUsernameOrPassword => 'ತಪ್ಪಾದ ಬಳಕೆದಾರ ಹೆಸರು ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್';

  @override
  String loginError(String error) {
    return 'ಲಾಗಿನ್ ದೋಷ: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'ಖಾತೆ ಇಲ್ಲವೇ? ಸೈನ್ ಅಪ್ ಮಾಡಿ';

  @override
  String get myIdentity => 'ನನ್ನ ಗುರುತು';

  @override
  String get scanToAddMe => 'ನನ್ನನ್ನು ಸೇರಿಸಲು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get shareProfileLink => 'ಪ್ರೊಫೈಲ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String addMeOnCrypt(String link) {
    return 'ನನ್ನನ್ನು CRYPT ನಲ್ಲಿ ಸೇರಿಸಿ!\n\n$link';
  }

  @override
  String get scanQr => 'QR ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get invalidCryptQrFormat => 'ಅಮಾನ್ಯ CRYPT QR ಕೋಡ್.';

  @override
  String get userScanned => 'ಬಳಕೆದಾರರನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಲಾಗಿದೆ!';

  @override
  String addingUser(String username) {
    return '$username ಅನ್ನು ಸೇರಿಸಲಾಗುತ್ತಿದೆ...';
  }

  @override
  String get defaultUser => 'ಬಳಕೆದಾರ';

  @override
  String get createAccount => 'ಖಾತೆಯನ್ನು ರಚಿಸಿ';

  @override
  String get keepPasswordSecureHint =>
      'ಅದನ್ನು ಸುರಕ್ಷಿತವಾಗಿಡಿ. ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಬದಲಾಯಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get pleaseFillInAllFields => 'ಎಲ್ಲಾ ಕ್ಷೇತ್ರಗಳನ್ನು ಭರ್ತಿ ಮಾಡಿ';

  @override
  String get usernameExceedsLimit => 'ಬಳಕೆದಾರ ಹೆಸರು: ಗರಿಷ್ಠ 20 ಅಕ್ಷರಗಳು';

  @override
  String get invalidUsernameCharacters =>
      'ಅಕ್ಷರಗಳು, ಸಂಖ್ಯೆಗಳು, _ ಅಥವಾ - ಮಾತ್ರ ಬಳಸಿ.';

  @override
  String get weakPasswordNotice =>
      '8+ ಅಕ್ಷರಗಳು, 1 ಸಂಖ್ಯೆ ಮತ್ತು 1 ದೊಡ್ಡ ಅಕ್ಷರವನ್ನು ಬಳಸಿ.';

  @override
  String get unableToGenerateUniqueUsername =>
      'ಅನನ್ಯ ಬಳಕೆದಾರ ಹೆಸರನ್ನು ರಚಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get accountCreated => 'ಖಾತೆ ರಚಿಸಲಾಗಿದೆ';

  @override
  String yourUsernameIs(String username) {
    return 'ನಿಮ್ಮ ಬಳಕೆದಾರ ಹೆಸರು:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'ಬಳಕೆದಾರ ಹೆಸರು \'$chosen\' ಈಗಾಗಲೇ ಬಳಕೆಯಲ್ಲಿದೆ.\n\nನಿಮ್ಮ ಬಳಕೆದಾರ ಹೆಸರು:\n\n$assigned\n\nಲಾಗಿನ್ ಮಾಡಲು ಇದನ್ನು ಉಳಿಸಿಕೊಳ್ಳಿ.';
  }

  @override
  String get continueText => 'ಮುಂದುವರಿಸಿ';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ಗುರುತನ್ನು ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT ಗೆ ಸ್ವಾಗತ';

  @override
  String get signupDescription =>
      'P2P ಕೀಗಳನ್ನು ರಚಿಸಲು ಬಳಕೆದಾರ ಹೆಸರು ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ರಚಿಸಿ.';

  @override
  String get chooseAUsername => 'ಬಳಕೆದಾರ ಹೆಸರನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get usernameHelperText =>
      'ನಿಮ್ಮ ನಿಜವಾದ ಹೆಸರನ್ನು ಬಳಸಬೇಡಿ. ಈಗಾಗಲೇ ಬಳಕೆಯಲ್ಲಿದ್ದರೆ ಒಂದು ಪ್ರತ್ಯಯವನ್ನು ಸೇರಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get masterAuthenticationRequired => 'ಮಾಸ್ಟರ್ ದೃಢೀಕರಣ';

  @override
  String get verify => 'ಪರಿಶೀಲಿಸಿ';

  @override
  String get darkThemeMode => 'ಡಾರ್ಕ್ ಥೀಮ್';

  @override
  String get secureConversations => 'ಸುರಕ್ಷಿತ ಸಂಭಾಷಣೆಗಳು';

  @override
  String get noActiveConversations =>
      'ಯಾವುದೇ ಸಕ್ರಿಯ ಚಾಟ್‌ಗಳಿಲ್ಲ. ಲಾಕ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲು ಒಂದನ್ನು ಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get logout => 'ಲಾಗ್ ಔಟ್';

  @override
  String get wipeDeviceAndEscape => 'ಸಾಧನವನ್ನು ಅಳಿಸಿ';

  @override
  String get falsePassword => 'ತಪ್ಪಾದ ಪಾಸ್‌ವರ್ಡ್';

  @override
  String accessSuspendedTimer(String time) {
    return 'ಪ್ರವೇಶವನ್ನು ಸ್ಥಗಿತಗೊಳಿಸಲಾಗಿದೆ. $time ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';
  }

  @override
  String get selectSecureLockMethod => 'ಲಾಕ್ ವಿಧಾನವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get selectSecureLockDescription =>
      'ಫಿಂಗರ್‌ಪ್ರಿಂಟ್ ಅಥವಾ 4-ಅಂಕಿಯ PIN ನಿಂದ ಲಾಕ್ ಮಾಡಬೇಕೆ?';

  @override
  String get fourDigitPin => '4-ಅಂಕಿಯ PIN';

  @override
  String get fingerprintUnlock => 'ಫಿಂಗರ್‌ಪ್ರಿಂಟ್ 🔓';

  @override
  String get supportSoloDeveloper => 'ಡೆವಲಪರ್ ಅನ್ನು ಬೆಂಬಲಿಸಿ';

  @override
  String get maybeLater => 'ಬಹುಶಃ ನಂತರ';

  @override
  String get submitProof => 'ಪುರಾವೆಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get couldNotOpenWallet =>
      'ವಾಲೆಟ್ ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಕೆಳಗಿನ ಕೋಡ್ ಅನ್ನು ಕಾಪಿ ಮಾಡಿ.';

  @override
  String get proofSubmittedSnackbar =>
      'ಪುರಾವೆ ಸಲ್ಲಿಸಲಾಗಿದೆ. ಹಸ್ತಚಾಲಿತ ಪರಿಶೀಲನೆ: 24–48 ಗಂಟೆಗಳು (ವಾರಾಂತ್ಯಗಳನ್ನು ಹೊರತುಪಡಿಸಿ).';
}
