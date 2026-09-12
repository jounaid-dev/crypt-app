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
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get settingsTermsAndConditions => 'Terms & Conditions';

  @override
  String get termsIntro =>
      'CRYPT is an early-stage application for connecting people directly for conversations. You are responsible for using the application appropriately and for keeping your account credentials secure.';

  @override
  String get termsConnectivity =>
      'CRYPT uses online services to help devices discover and establish connections. Availability and connection behavior may change as the application develops. Please do not rely on CRYPT as your only means of communication.';

  @override
  String get termsAgreement =>
      'By continuing, you confirm that you have read and agree to use CRYPT under these terms.';

  @override
  String get agreeTerms => 'I agree to the Terms & Conditions';

  @override
  String get agreeAndContinue => 'Agree and continue';

  @override
  String get beforeYouStart => 'Before You Start';

  @override
  String get connected => 'Connected';

  @override
  String get connectFirstThenChat => 'Connect first, then chat';

  @override
  String get betaIntro =>
      'CRYPT is an early beta version, so the experience may improve in future versions.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT works like a walkie-talkie: both people need to be online and have CRYPT open at the same time to establish the connection.';

  @override
  String get howToUseCrypt =>
      'How to use CRYPT:\n1. Scan the other person\'s CRYPT QR code.\n2. Both people need CRYPT open and online.\n3. Wait while CRYPT establishes the P2P connection.\n4. Wait for the “Connecting...” state to disappear and the connection to be established.\n5. Once connected, you can start chatting.';

  @override
  String get messageStorageExplanation =>
      'Your messages are designed to travel directly between connected devices. CRYPT does not store your chat messages on our servers. The server currently helps with connection and signaling, and chat history is not stored on the server. If the other person is offline, the current P2P connection cannot be established.';

  @override
  String get settingsAndSupportExplanation =>
      'Visit Settings to customise your CRYPT experience. More customisation options are coming soon.\n\nWant to support CRYPT? You can find the donation option in Settings.';

  @override
  String get saving => 'Saving...';

  @override
  String get continueToCrypt => 'Continue to CRYPT';

  @override
  String get showSplashScreen => 'Show splash screen';

  @override
  String get retry => 'Retry';

  @override
  String get connectionFailed => 'Connection failed';

  @override
  String get connectionFailedDetails =>
      'Connection failed. Both devices must be online with CRYPT open to connect.';

  @override
  String get gallery => 'Gallery';

  @override
  String get alignQrCode => 'ALIGN QR CODE';

  @override
  String get scanFromGallery => 'SCAN FROM GALLERY';

  @override
  String get couldNotScanImage => 'Could not scan image.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Could not share QR code: $error';
  }

  @override
  String newContact(String username) {
    return 'New contact: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Your public encryption key is missing.';

  @override
  String get contactEncryptionKeyMissing =>
      'Contact encryption key is missing.';

  @override
  String get localEncryptionKeyMissing => 'Local encryption key is missing.';

  @override
  String get noQrCodeFound => 'No QR code found in this image.';

  @override
  String get shareQrCode => 'Share QR Code';

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
  String get supportIntro =>
      'Hey! 👋 I am a solo developer working hard on CRYPT. I do not have a budget or corporate funding. I rely entirely on your honesty and empathy to keep improving the app and guarantee NO ADS FOREVER.';

  @override
  String get chooseSupportAmount => 'Choose Your Price (Slide to support):';

  @override
  String get poorGang => 'I\'m poor gang 🥀✌️';

  @override
  String get launchOfferMinimum => 'Launch Offer Minimum 🚀';

  @override
  String get buyMeCoffee => 'Buy Me a Coffee ☕';

  @override
  String get superSupporter => 'Super Supporter 🔥';

  @override
  String get feature => 'Feature';

  @override
  String get freeTier => 'Free Tier';

  @override
  String get premium => 'Premium';

  @override
  String get chatLocks => 'Chat Locks';

  @override
  String get maxOneRoom => 'Max 1 Room';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get biometrics => 'Biometrics';

  @override
  String get disabled => '🚫 Disabled';

  @override
  String supportWithSats(String amount) {
    return 'Support with $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ BOLT12 payment offer • Tap to copy';

  @override
  String get boltOfferCopied => 'BOLT12 payment offer copied';

  @override
  String get tapToCopyBoltOffer => 'Tap to copy BOLT12 payment offer';

  @override
  String get simpleInstructionsToUnlock => '📬 Simple Instructions to Unlock:';

  @override
  String unlockInstructions(String username) {
    return '1. Pay using Phoenix Wallet on Android (7,500 minimum to unlock — more is always appreciated).\n2. Take a screenshot of your successful transaction confirmation screen.\n3. Email that screenshot to jounaidnadirmed@gmail.com and tell me your unique account username: \'$username\' so I know who paid.\n4. Type anything in the box below to save your request on this device:';
  }

  @override
  String get supportRequestHint => 'Type your name or transaction info here...';

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
