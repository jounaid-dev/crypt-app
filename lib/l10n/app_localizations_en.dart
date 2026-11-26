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

  @override
  String get loadingChats => 'Loading chats...';

  @override
  String get noChatsYetTitle => 'No chats yet';

  @override
  String get noChatsYetHint =>
      'A chat starts when you scan the other person\'s CRYPT QR code. Open your identity page to share yours so they can scan it.';

  @override
  String get scanQrToStartChat => 'Scan a QR code';

  @override
  String get noChatsMatchSearch => 'No chats match your search';

  @override
  String get noChatsMatchSearchHint =>
      'Try a different name, or clear the search to see every chat.';

  @override
  String get requestSentTitle => 'Request sent';

  @override
  String requestSentBody(String username) {
    return 'Your request went to $username. Please wait while they accept it.';
  }

  @override
  String get requestSentKeepOpen =>
      'The chat opens as soon as they accept. Keep CRYPT open on this device so you do not miss it.';

  @override
  String get requestSentGotIt => 'Got it';

  @override
  String get scanCouldNotReadCode =>
      'That code could not be read. Scan a CRYPT QR code.';

  @override
  String get scanMissingTheirIdentity =>
      'That code is missing the person\'s identity. Scan the code from their identity page.';

  @override
  String get scanOwnIdentityMissing =>
      'Your own encryption key is missing. Sign out and back in, then scan again.';

  @override
  String get noLightningWalletFound =>
      'No Lightning wallet found. Install one, or copy the address and paste it into a wallet.';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionPrivacy => 'Privacy and security';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Help and legal';

  @override
  String get settingsSectionAdministration => 'Administration';

  @override
  String get settingsSectionAccount => 'Account';

  @override
  String get settingsProtectTitle => 'Protect settings with master password';

  @override
  String get settingsProtectSubtitle => 'Require password to access settings';

  @override
  String get chatLockSetPinSubtitle => 'Tap to set your own PIN for this chat';

  @override
  String get premiumTileTitle => 'Get Lifetime Premium';

  @override
  String get premiumActiveSubtitle => 'Premium is on for your account';

  @override
  String get premiumPendingSubtitle =>
      'Waiting for an admin to review your screenshot';

  @override
  String get premiumHowItWorks => 'How premium works';

  @override
  String get reportProblemTitle => 'Report a problem';

  @override
  String get reportProblemSubtitle => 'Bugs, abuse or spam';

  @override
  String get adminAccessTitle => 'Admin access';

  @override
  String get adminAccessSubtitle => 'Enter your admin code to open the panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — own code, this chat only';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount once with your Lightning wallet, then send a screenshot';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Your screenshot is in. An admin checks it and premium turns on for your account within $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Pay $amount with $method, or $wallet.\n2. Screenshot the payment confirmation.\n3. Send it from Submit payment proof.\n4. Premium turns on and stays on for life.\n\nCRYPT is built by a solo developer, and this is the whole offer: one payment, no subscription.';
  }

  @override
  String get reportIntro =>
      'Tell us what happened. If you are reporting another person, add their username so we can act on the right account.';

  @override
  String get reportSent => 'Report sent. Thank you.';

  @override
  String get reportSendFailed => 'Could not send the report.';

  @override
  String get reportTypeLabel => 'Type of report';

  @override
  String get reportCategoryBug => 'Bug';

  @override
  String get reportCategoryAbuse => 'Abuse';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Other';

  @override
  String get reportUsernameLabel => 'Their username (optional)';

  @override
  String get reportUsernameHint => 'e.g. someone_you_want_reported';

  @override
  String get reportDetailsLabel => 'What happened?';

  @override
  String get reportScreenshotsLabel => 'Screenshots';

  @override
  String get reportAddScreenshot => 'Add screenshot';

  @override
  String get reportSendButton => 'Send report';

  @override
  String get reportPrivacyNote =>
      'Reports are reviewed by an administrator. Screenshots are stored privately and are only visible to moderators.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount once, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'No subscription and nothing to renew. Pay with $method, send a screenshot of the confirmation, and premium is switched on within $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT is built by a solo developer. Premium is what keeps it ad-free and actively maintained.';

  @override
  String get premiumStepPay => 'Pay with your wallet';

  @override
  String get premiumLightningAddressLabel => 'Lightning address';

  @override
  String get premiumOpenWallet => 'Open wallet';

  @override
  String get premiumCopyAddress => 'Copy address';

  @override
  String get premiumWorksWith =>
      'Works with Phoenix and any other Lightning wallet.';

  @override
  String get premiumStepScreenshot => 'Send your screenshot';

  @override
  String get premiumScreenshotHint =>
      'Take a screenshot of the payment confirmation in your Lightning wallet and attach it below.';

  @override
  String get premiumAttachScreenshot => 'Attach screenshot';

  @override
  String get premiumReplaceScreenshot => 'Replace screenshot';

  @override
  String get premiumStepAmount => 'Confirm the amount';

  @override
  String get premiumAmountLabel => 'Amount you paid (USD)';

  @override
  String get premiumNoteLabel => 'Note (optional)';

  @override
  String get premiumSendProof => 'Send my proof';

  @override
  String get premiumAddressCopied => 'Lightning address copied.';

  @override
  String get premiumAttachConfirmation =>
      'Attach a screenshot of your payment confirmation.';

  @override
  String get premiumSendProofFailed => 'Could not send the payment proof.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Minimum $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Activation takes $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Proof received. Premium is switched on within $window.';
  }

  @override
  String get premiumTableFeature => 'Feature';

  @override
  String get premiumTableFree => 'Free';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Encrypted peer-to-peer messaging';

  @override
  String get premiumTableMessagesStay => 'Messages stay on your devices';

  @override
  String get premiumTableChatLocks => 'Chats locked with your own PIN';

  @override
  String get premiumTableFingerprint => 'Unlock with fingerprint or face';

  @override
  String get premiumTablePrice => 'Price';

  @override
  String get premiumTableAccess => 'Access';

  @override
  String get premiumTableIncluded => 'Included';

  @override
  String get premiumTableOneChat => '1 chat';

  @override
  String get premiumTableUnlimited => 'Unlimited';

  @override
  String get premiumTableNotIncluded => 'Not included';

  @override
  String get premiumTableFreeValue => 'Free';

  @override
  String get premiumTableWhileFree => 'While the app is free';

  @override
  String get premiumTableLifetime => 'Lifetime';

  @override
  String premiumTableOnePayment(String amount) {
    return 'One payment of $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'One payment of $amount and premium is yours for life. There is no subscription and nothing to renew.';
  }

  @override
  String get settingsSaveFailed => 'Could not save that setting. Try again.';

  @override
  String get settingsLockFailed => 'Could not lock this chat. Try again.';

  @override
  String get settingsUnlockFailed => 'Could not unlock this chat. Try again.';

  @override
  String pinSetTitle(String chat) {
    return 'Set a PIN for $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Confirm the PIN for $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'This PIN opens $chat only. Every chat has its own PIN, chosen by you. There is no single code for the app.';
  }

  @override
  String get pinMismatch => 'The PINs did not match. Lock not enabled.';

  @override
  String get biometricNotSetUp =>
      'No fingerprint or face unlock is set up on this device.';

  @override
  String get biometricVerifyFailed =>
      'Could not verify it is you on this device.';

  @override
  String get lightningAddressCopied =>
      'Lightning address copied. Paste it into a wallet to pay.';

  @override
  String get accountSuspended => 'Account suspended';

  @override
  String get premiumLifetimeAccess => 'Lifetime Premium Access';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Pay $amount from $method to the Lightning address above.';
  }

  @override
  String get premiumActivationStep2 =>
      'Take a screenshot of the payment confirmation and send it in as your proof of payment.';

  @override
  String get pinFourDigits => 'Enter exactly 4 digits.';

  @override
  String get scanOwnCode =>
      'That is your own code. Scan someone else\'s CRYPT code to start a chat with them.';

  @override
  String get couldNotGenerateQrImage => 'Could not generate QR image';

  @override
  String get conversationUpdateFailed =>
      'Conversation update failed. Try again.';

  @override
  String get conversationCreationFailed =>
      'Conversation creation failed. Try again.';

  @override
  String get accountSuspendedByAdmin =>
      'This account has been suspended by an administrator.';
}
