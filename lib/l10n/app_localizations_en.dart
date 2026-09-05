// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Log In';

  @override
  String get signup => 'Sign Up';

  @override
  String get settings => 'Settings';

  @override
  String get chats => 'Chats';

  @override
  String get typeMessage => 'Type a message...';

  @override
  String get send => 'Send';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Connecting...';

  @override
  String get connectingP2p => 'Connecting to P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P not ready.';

  @override
  String get searchLanguage => 'Search language...';

  @override
  String get language => 'Language';

  @override
  String get forceEscapeSignOutTitle => 'FORCE SIGN OUT?';

  @override
  String get forceEscapeSignOutContent =>
      'WARNING: All device data will be erased.';

  @override
  String get cancel => 'Cancel';

  @override
  String get wipeDevice => 'WIPE DEVICE';

  @override
  String get accountDestructionAlertTitle => 'ACCOUNT DELETION';

  @override
  String get accountDestructionWarning =>
      'WARNING: Device data and remote messages will be erased.';

  @override
  String get accountDestructionCriticalNotice =>
      'CRITICAL: Wrong codes lock the system. Use your Account Password or Emergency Escape.';

  @override
  String verificationSecurityKey(String code) {
    return 'Security Key: $code';
  }

  @override
  String get copyDigitsHint => 'Copy the 5 digits';

  @override
  String get codeMismatchNotice =>
      'Code mismatch. Enter your Master Password or wait 10 minutes.';

  @override
  String get accountPasswordLabel => 'Account Password';

  @override
  String get deleteEverythingPermanently => 'DELETE EVERYTHING';

  @override
  String get escapeAndPurgeDeviceData => 'Escape & Erase Data';

  @override
  String get addContact => 'Add Contact';

  @override
  String get addContactConfirmation => 'Add this contact?';

  @override
  String get noMessagesYet => 'No messages yet';

  @override
  String get addNewContact => 'New Contact';

  @override
  String get usernameLabel => 'Username';

  @override
  String get nicknameOptionalLabel => 'Nickname (Optional)';

  @override
  String get add => 'Add';

  @override
  String get usernameCannotBeEmpty => 'Username required';

  @override
  String contactAlreadyExists(String name) {
    return 'Contact \'$name\' already exists.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'User \'$name\' not found. Shared secret unavailable.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Added $name!';
  }

  @override
  String get contacts => 'Contacts';

  @override
  String get noContactsYet => 'No contacts yet';

  @override
  String get securityLockoutActive => 'Security Lockout';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Too many attempts. Locked for $minutes min.';
  }

  @override
  String get acknowledge => 'Acknowledge';

  @override
  String get accessBlocked => 'Access Blocked';

  @override
  String accessSuspended(int minutes) {
    return '5 failed matches. Suspended for $minutes min.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Unlock: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Attempts left: $count';
  }

  @override
  String get secureKeyPasscode => 'Security Passcode';

  @override
  String get warningHardwareLockout => 'WARNING: Next failure locks security.';

  @override
  String get abort => 'Abort';

  @override
  String get authenticate => 'Authenticate';

  @override
  String get searchPipelinesHint => 'Search secure connections...';

  @override
  String get zeroPipelinesDiscovered => 'No connections found.';

  @override
  String get processingDecryption => 'Decrypting...';

  @override
  String get decrypting => 'Decrypting...';

  @override
  String get decryptionError => '[Decryption Error]';

  @override
  String get cryptContainerSecure => 'CRYPT CONTAINER SECURE';

  @override
  String get connectAnAccount => 'Connect Account';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get enterMasterSecurityPassword => 'Enter your Master Password';

  @override
  String get pleaseFillAllFields => 'Fill all fields';

  @override
  String get wrongUsernameOrPassword => 'Wrong username or password';

  @override
  String loginError(String error) {
    return 'Login error: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'No account? Sign up';

  @override
  String get myIdentity => 'My Identity';

  @override
  String get scanToAddMe => 'Scan to add me';

  @override
  String get shareProfileLink => 'Share Profile';

  @override
  String addMeOnCrypt(String link) {
    return 'Add me on CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Scan QR';

  @override
  String get invalidCryptQrFormat => 'Invalid CRYPT QR code.';

  @override
  String get userScanned => 'User Scanned!';

  @override
  String addingUser(String username) {
    return 'Adding $username...';
  }

  @override
  String get defaultUser => 'User';

  @override
  String get createAccount => 'Create Account';

  @override
  String get keepPasswordSecureHint =>
      'Keep it safe. Password cannot be changed.';

  @override
  String get pleaseFillInAllFields => 'Fill all fields';

  @override
  String get usernameExceedsLimit => 'Username max: 20 characters';

  @override
  String get invalidUsernameCharacters => 'Use letters, numbers, _ or - only.';

  @override
  String get weakPasswordNotice => 'Use 8+ chars, 1 number, 1 uppercase.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Could not generate a unique username.';

  @override
  String get accountCreated => 'Account Created';

  @override
  String yourUsernameIs(String username) {
    return 'Your username:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Username \'$chosen\' is taken.\n\nYour username:\n\n$assigned\n\nKeep it for login.';
  }

  @override
  String get continueText => 'Continue';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Identity creation failed: $error';
  }

  @override
  String get welcomeToCrypt => 'Welcome to CRYPT';

  @override
  String get signupDescription =>
      'Create a username and password to generate P2P keys.';

  @override
  String get chooseAUsername => 'Choose a username';

  @override
  String get usernameHelperText =>
      'Don\'t use your real name. A suffix is added if taken.';

  @override
  String get masterAuthenticationRequired => 'Master Authentication';

  @override
  String get verify => 'Verify';

  @override
  String get darkThemeMode => 'Dark Theme';

  @override
  String get secureConversations => 'Secure Conversations';

  @override
  String get noActiveConversations =>
      'No active chats. Start one to enable locks.';

  @override
  String get logout => 'Logout';

  @override
  String get wipeDeviceAndEscape => 'WIPE DEVICE';

  @override
  String get falsePassword => 'Wrong Password';

  @override
  String accessSuspendedTimer(String time) {
    return 'Access suspended. Try again in $time.';
  }

  @override
  String get selectSecureLockMethod => 'Select Lock Method';

  @override
  String get selectSecureLockDescription =>
      'Lock with Fingerprint or 4-Digit PIN?';

  @override
  String get fourDigitPin => '4-Digit PIN';

  @override
  String get fingerprintUnlock => 'Fingerprint 🔓';

  @override
  String get supportSoloDeveloper => 'Support Developer';

  @override
  String get maybeLater => 'Maybe Later';

  @override
  String get submitProof => 'Submit Proof';

  @override
  String get couldNotOpenWallet =>
      'Wallet couldn\'t open. Copy the code below.';

  @override
  String get proofSubmittedSnackbar =>
      'Proof submitted. Manual review: 24–48 hours (weekends excluded).';
}
