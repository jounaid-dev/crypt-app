import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_ha.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('gu'),
    Locale('ha'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('nl'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'CRYPT'**
  String get appName;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeMessage;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @p2p.
  ///
  /// In en, this message translates to:
  /// **'P2P'**
  String get p2p;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get connecting;

  /// No description provided for @connectingP2p.
  ///
  /// In en, this message translates to:
  /// **'Connecting to P2P...'**
  String get connectingP2p;

  /// No description provided for @p2pConnectionNotReady.
  ///
  /// In en, this message translates to:
  /// **'P2P not ready.'**
  String get p2pConnectionNotReady;

  /// No description provided for @searchLanguage.
  ///
  /// In en, this message translates to:
  /// **'Search language...'**
  String get searchLanguage;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @forceEscapeSignOutTitle.
  ///
  /// In en, this message translates to:
  /// **'FORCE SIGN OUT?'**
  String get forceEscapeSignOutTitle;

  /// No description provided for @forceEscapeSignOutContent.
  ///
  /// In en, this message translates to:
  /// **'WARNING: All device data will be erased.'**
  String get forceEscapeSignOutContent;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @wipeDevice.
  ///
  /// In en, this message translates to:
  /// **'WIPE DEVICE'**
  String get wipeDevice;

  /// No description provided for @accountDestructionAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT DELETION'**
  String get accountDestructionAlertTitle;

  /// No description provided for @accountDestructionWarning.
  ///
  /// In en, this message translates to:
  /// **'WARNING: Device data and remote messages will be erased.'**
  String get accountDestructionWarning;

  /// No description provided for @accountDestructionCriticalNotice.
  ///
  /// In en, this message translates to:
  /// **'CRITICAL: Wrong codes lock the system. Use your Account Password or Emergency Escape.'**
  String get accountDestructionCriticalNotice;

  /// No description provided for @verificationSecurityKey.
  ///
  /// In en, this message translates to:
  /// **'Security Key: {code}'**
  String verificationSecurityKey(String code);

  /// No description provided for @copyDigitsHint.
  ///
  /// In en, this message translates to:
  /// **'Copy the 5 digits'**
  String get copyDigitsHint;

  /// No description provided for @codeMismatchNotice.
  ///
  /// In en, this message translates to:
  /// **'Code mismatch. Enter your Master Password or wait 10 minutes.'**
  String get codeMismatchNotice;

  /// No description provided for @accountPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Account Password'**
  String get accountPasswordLabel;

  /// No description provided for @deleteEverythingPermanently.
  ///
  /// In en, this message translates to:
  /// **'DELETE EVERYTHING'**
  String get deleteEverythingPermanently;

  /// No description provided for @escapeAndPurgeDeviceData.
  ///
  /// In en, this message translates to:
  /// **'Escape & Erase Data'**
  String get escapeAndPurgeDeviceData;

  /// No description provided for @addContact.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addContact;

  /// No description provided for @addContactConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Add this contact?'**
  String get addContactConfirmation;

  /// No description provided for @noMessagesYet.
  ///
  /// In en, this message translates to:
  /// **'No messages yet'**
  String get noMessagesYet;

  /// No description provided for @addNewContact.
  ///
  /// In en, this message translates to:
  /// **'New Contact'**
  String get addNewContact;

  /// No description provided for @usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// No description provided for @nicknameOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Nickname (Optional)'**
  String get nicknameOptionalLabel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @usernameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Username required'**
  String get usernameCannotBeEmpty;

  /// No description provided for @contactAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Contact \'{name}\' already exists.'**
  String contactAlreadyExists(String name);

  /// No description provided for @userNotFoundOnRegistry.
  ///
  /// In en, this message translates to:
  /// **'User \'{name}\' not found. Shared secret unavailable.'**
  String userNotFoundOnRegistry(String name);

  /// No description provided for @successfullyAddedContact.
  ///
  /// In en, this message translates to:
  /// **'Added {name}!'**
  String successfullyAddedContact(String name);

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @noContactsYet.
  ///
  /// In en, this message translates to:
  /// **'No contacts yet'**
  String get noContactsYet;

  /// No description provided for @securityLockoutActive.
  ///
  /// In en, this message translates to:
  /// **'Security Lockout'**
  String get securityLockoutActive;

  /// No description provided for @tooManyAttemptsFrozen.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Locked for {minutes} min.'**
  String tooManyAttemptsFrozen(int minutes);

  /// No description provided for @acknowledge.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge'**
  String get acknowledge;

  /// No description provided for @accessBlocked.
  ///
  /// In en, this message translates to:
  /// **'Access Blocked'**
  String get accessBlocked;

  /// No description provided for @accessSuspended.
  ///
  /// In en, this message translates to:
  /// **'5 failed matches. Suspended for {minutes} min.'**
  String accessSuspended(int minutes);

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @unlockSecureNode.
  ///
  /// In en, this message translates to:
  /// **'Unlock: {username}'**
  String unlockSecureNode(String username);

  /// No description provided for @verificationMetricsRemaining.
  ///
  /// In en, this message translates to:
  /// **'Attempts left: {count}'**
  String verificationMetricsRemaining(int count);

  /// No description provided for @secureKeyPasscode.
  ///
  /// In en, this message translates to:
  /// **'Security Passcode'**
  String get secureKeyPasscode;

  /// No description provided for @warningHardwareLockout.
  ///
  /// In en, this message translates to:
  /// **'WARNING: Next failure locks security.'**
  String get warningHardwareLockout;

  /// No description provided for @abort.
  ///
  /// In en, this message translates to:
  /// **'Abort'**
  String get abort;

  /// No description provided for @authenticate.
  ///
  /// In en, this message translates to:
  /// **'Authenticate'**
  String get authenticate;

  /// No description provided for @searchPipelinesHint.
  ///
  /// In en, this message translates to:
  /// **'Search secure connections...'**
  String get searchPipelinesHint;

  /// No description provided for @zeroPipelinesDiscovered.
  ///
  /// In en, this message translates to:
  /// **'No connections found.'**
  String get zeroPipelinesDiscovered;

  /// No description provided for @processingDecryption.
  ///
  /// In en, this message translates to:
  /// **'Decrypting...'**
  String get processingDecryption;

  /// No description provided for @decrypting.
  ///
  /// In en, this message translates to:
  /// **'Decrypting...'**
  String get decrypting;

  /// No description provided for @decryptionError.
  ///
  /// In en, this message translates to:
  /// **'[Decryption Error]'**
  String get decryptionError;

  /// No description provided for @cryptContainerSecure.
  ///
  /// In en, this message translates to:
  /// **'CRYPT CONTAINER SECURE'**
  String get cryptContainerSecure;

  /// No description provided for @connectAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Connect Account'**
  String get connectAnAccount;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterMasterSecurityPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your Master Password'**
  String get enterMasterSecurityPassword;

  /// No description provided for @pleaseFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Fill all fields'**
  String get pleaseFillAllFields;

  /// No description provided for @wrongUsernameOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong username or password'**
  String get wrongUsernameOrPassword;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login error: {error}'**
  String loginError(String error);

  /// No description provided for @dontHaveAnAccountSignUp.
  ///
  /// In en, this message translates to:
  /// **'No account? Sign up'**
  String get dontHaveAnAccountSignUp;

  /// No description provided for @myIdentity.
  ///
  /// In en, this message translates to:
  /// **'My Identity'**
  String get myIdentity;

  /// No description provided for @scanToAddMe.
  ///
  /// In en, this message translates to:
  /// **'Scan to add me'**
  String get scanToAddMe;

  /// No description provided for @shareProfileLink.
  ///
  /// In en, this message translates to:
  /// **'Share Profile'**
  String get shareProfileLink;

  /// No description provided for @addMeOnCrypt.
  ///
  /// In en, this message translates to:
  /// **'Add me on CRYPT!\n\n{link}'**
  String addMeOnCrypt(String link);

  /// No description provided for @scanQr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR'**
  String get scanQr;

  /// No description provided for @invalidCryptQrFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid CRYPT QR code.'**
  String get invalidCryptQrFormat;

  /// No description provided for @userScanned.
  ///
  /// In en, this message translates to:
  /// **'User Scanned!'**
  String get userScanned;

  /// No description provided for @addingUser.
  ///
  /// In en, this message translates to:
  /// **'Adding {username}...'**
  String addingUser(String username);

  /// No description provided for @defaultUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get defaultUser;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @keepPasswordSecureHint.
  ///
  /// In en, this message translates to:
  /// **'Keep it safe. Password cannot be changed.'**
  String get keepPasswordSecureHint;

  /// No description provided for @pleaseFillInAllFields.
  ///
  /// In en, this message translates to:
  /// **'Fill all fields'**
  String get pleaseFillInAllFields;

  /// No description provided for @usernameExceedsLimit.
  ///
  /// In en, this message translates to:
  /// **'Username max: 20 characters'**
  String get usernameExceedsLimit;

  /// No description provided for @invalidUsernameCharacters.
  ///
  /// In en, this message translates to:
  /// **'Use letters, numbers, _ or - only.'**
  String get invalidUsernameCharacters;

  /// No description provided for @weakPasswordNotice.
  ///
  /// In en, this message translates to:
  /// **'Use 8+ chars, 1 number, 1 uppercase.'**
  String get weakPasswordNotice;

  /// No description provided for @unableToGenerateUniqueUsername.
  ///
  /// In en, this message translates to:
  /// **'Could not generate a unique username.'**
  String get unableToGenerateUniqueUsername;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account Created'**
  String get accountCreated;

  /// No description provided for @yourUsernameIs.
  ///
  /// In en, this message translates to:
  /// **'Your username:\n\n{username}'**
  String yourUsernameIs(String username);

  /// No description provided for @usernameTakenAssignedTag.
  ///
  /// In en, this message translates to:
  /// **'Username \'{chosen}\' is taken.\n\nYour username:\n\n{assigned}\n\nKeep it for login.'**
  String usernameTakenAssignedTag(String chosen, String assigned);

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @failedToGenerateIdentity.
  ///
  /// In en, this message translates to:
  /// **'Identity creation failed: {error}'**
  String failedToGenerateIdentity(String error);

  /// No description provided for @welcomeToCrypt.
  ///
  /// In en, this message translates to:
  /// **'Welcome to CRYPT'**
  String get welcomeToCrypt;

  /// No description provided for @signupDescription.
  ///
  /// In en, this message translates to:
  /// **'Create a username and password to generate P2P keys.'**
  String get signupDescription;

  /// No description provided for @chooseAUsername.
  ///
  /// In en, this message translates to:
  /// **'Choose a username'**
  String get chooseAUsername;

  /// No description provided for @usernameHelperText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t use your real name. A suffix is added if taken.'**
  String get usernameHelperText;

  /// No description provided for @masterAuthenticationRequired.
  ///
  /// In en, this message translates to:
  /// **'Master Authentication'**
  String get masterAuthenticationRequired;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @darkThemeMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkThemeMode;

  /// No description provided for @secureConversations.
  ///
  /// In en, this message translates to:
  /// **'Secure Conversations'**
  String get secureConversations;

  /// No description provided for @noActiveConversations.
  ///
  /// In en, this message translates to:
  /// **'No active chats. Start one to enable locks.'**
  String get noActiveConversations;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @wipeDeviceAndEscape.
  ///
  /// In en, this message translates to:
  /// **'WIPE DEVICE'**
  String get wipeDeviceAndEscape;

  /// No description provided for @falsePassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong Password'**
  String get falsePassword;

  /// No description provided for @accessSuspendedTimer.
  ///
  /// In en, this message translates to:
  /// **'Access suspended. Try again in {time}.'**
  String accessSuspendedTimer(String time);

  /// No description provided for @selectSecureLockMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Lock Method'**
  String get selectSecureLockMethod;

  /// No description provided for @selectSecureLockDescription.
  ///
  /// In en, this message translates to:
  /// **'Lock with Fingerprint or 4-Digit PIN?'**
  String get selectSecureLockDescription;

  /// No description provided for @fourDigitPin.
  ///
  /// In en, this message translates to:
  /// **'4-Digit PIN'**
  String get fourDigitPin;

  /// No description provided for @fingerprintUnlock.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint 🔓'**
  String get fingerprintUnlock;

  /// No description provided for @supportSoloDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Support Developer'**
  String get supportSoloDeveloper;

  /// No description provided for @maybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get maybeLater;

  /// No description provided for @submitProof.
  ///
  /// In en, this message translates to:
  /// **'Submit Proof'**
  String get submitProof;

  /// No description provided for @couldNotOpenWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet couldn\'t open. Copy the code below.'**
  String get couldNotOpenWallet;

  /// No description provided for @proofSubmittedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Proof submitted. Manual review: 24–48 hours (weekends excluded).'**
  String get proofSubmittedSnackbar;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fa',
    'fr',
    'gu',
    'ha',
    'hi',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ml',
    'mr',
    'nl',
    'or',
    'pa',
    'pl',
    'pt',
    'ru',
    'sw',
    'ta',
    'te',
    'th',
    'tl',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'ha':
      return AppLocalizationsHa();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'nl':
      return AppLocalizationsNl();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tl':
      return AppLocalizationsTl();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
