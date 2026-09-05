// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'স্বাগতম';

  @override
  String get login => 'লগ ইন';

  @override
  String get signup => 'সাইন আপ';

  @override
  String get settings => 'সেটিংস';

  @override
  String get chats => 'চ্যাট';

  @override
  String get typeMessage => 'বার্তা লিখুন...';

  @override
  String get send => 'পাঠান';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'সংযোগ হচ্ছে...';

  @override
  String get connectingP2p => 'P2P সংযোগ হচ্ছে...';

  @override
  String get p2pConnectionNotReady => 'P2P প্রস্তুত নয়।';

  @override
  String get searchLanguage => 'ভাষা খুঁজুন...';

  @override
  String get language => 'ভাষা';

  @override
  String get forceEscapeSignOutTitle => 'জরুরি লগ আউট?';

  @override
  String get forceEscapeSignOutContent =>
      'সতর্কতা: ডিভাইসের সব ডেটা মুছে যাবে।';

  @override
  String get cancel => 'বাতিল';

  @override
  String get wipeDevice => 'ডিভাইস মুছুন';

  @override
  String get accountDestructionAlertTitle => 'অ্যাকাউন্ট মুছে ফেলা';

  @override
  String get accountDestructionWarning =>
      'সতর্কতা: ডিভাইসের সব ডেটা মুছে যাবে। ইন্টারনেটে যুক্ত হলে রিমোট ডিলিট চালু হবে এবং আপনার বার্তাগুলো সব পিয়ারের মেমরি থেকে মুছে যাবে।';

  @override
  String get accountDestructionCriticalNotice =>
      'গুরুত্বপূর্ণ: ভুল কোডে সিস্টেম লক হবে। আনলক করতে মাস্টার পাসওয়ার্ড বা জরুরি এস্কেপ ব্যবহার করুন।';

  @override
  String verificationSecurityKey(String code) {
    return 'সিকিউরিটি কী: $code';
  }

  @override
  String get copyDigitsHint => 'উপরের ৫ সংখ্যা কপি করুন';

  @override
  String get codeMismatchNotice =>
      'কোড মেলেনি। মাস্টার পাসওয়ার্ড দিন, নইলে ১০ মিনিট লক হবে।';

  @override
  String get accountPasswordLabel => 'অ্যাকাউন্ট পাসওয়ার্ড';

  @override
  String get deleteEverythingPermanently => 'সবকিছু স্থায়ীভাবে মুছুন';

  @override
  String get escapeAndPurgeDeviceData => 'এস্কেপ ও ডিভাইস ডেটা মুছুন';

  @override
  String get addContact => 'যোগাযোগ যোগ করুন';

  @override
  String get addContactConfirmation => 'এই যোগাযোগ যোগ করবেন?';

  @override
  String get noMessagesYet => 'এখনও কোনো বার্তা নেই';

  @override
  String get addNewContact => 'নতুন যোগাযোগ যোগ করুন';

  @override
  String get usernameLabel => 'ইউজারনেম';

  @override
  String get nicknameOptionalLabel => 'ডাকনাম (ঐচ্ছিক)';

  @override
  String get add => 'যোগ করুন';

  @override
  String get usernameCannotBeEmpty => 'ইউজারনেম আবশ্যক';

  @override
  String contactAlreadyExists(String name) {
    return '\'$name\' ইতিমধ্যে যোগাযোগে আছে.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '\'$name\' পাওয়া যায়নি। শেয়ার্ড সিক্রেট তৈরি করা যায়নি।';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name সফলভাবে যোগ হয়েছে!';
  }

  @override
  String get contacts => 'যোগাযোগ';

  @override
  String get noContactsYet => 'এখনও কোনো যোগাযোগ নেই';

  @override
  String get securityLockoutActive => 'সিকিউরিটি লক সক্রিয়';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'অনেক ভুল চেষ্টা। $minutes মিনিট লক।';
  }

  @override
  String get acknowledge => 'বুঝেছি';

  @override
  String get accessBlocked => 'অ্যাক্সেস বন্ধ';

  @override
  String accessSuspended(int minutes) {
    return '৫টি ভুল যাচাই। $minutes মিনিট অ্যাক্সেস বন্ধ।';
  }

  @override
  String get ok => 'ঠিক আছে';

  @override
  String unlockSecureNode(String username) {
    return 'সিকিউর নোড আনলক: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'বাকি যাচাই চেষ্টা: $count';
  }

  @override
  String get secureKeyPasscode => 'সিকিউরিটি কোড';

  @override
  String get warningHardwareLockout =>
      'সতর্কতা: পরের ভুলে ডিভাইস সিকিউরিটি লক হবে।';

  @override
  String get abort => 'বাতিল';

  @override
  String get authenticate => 'প্রমাণীকরণ';

  @override
  String get searchPipelinesHint => 'সিকিউর কানেকশন খোঁজা হচ্ছে...';

  @override
  String get zeroPipelinesDiscovered => 'কোনো মিলযুক্ত কানেকশন নেই।';

  @override
  String get processingDecryption => 'ডিক্রিপ্ট করা হচ্ছে...';

  @override
  String get decrypting => 'ডিক্রিপ্ট হচ্ছে...';

  @override
  String get decryptionError => '[ডিক্রিপশন ত্রুটি]';

  @override
  String get cryptContainerSecure => 'CRYPT সুরক্ষিত';

  @override
  String get connectAnAccount => 'অ্যাকাউন্ট যুক্ত করুন';

  @override
  String get username => 'ইউজারনেম';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get enterMasterSecurityPassword => 'মাস্টার পাসওয়ার্ড দিন';

  @override
  String get pleaseFillAllFields => 'সব ঘর পূরণ করুন';

  @override
  String get wrongUsernameOrPassword => 'ইউজারনেম বা পাসওয়ার্ড ভুল';

  @override
  String loginError(String error) {
    return 'লগইন ত্রুটি: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'অ্যাকাউন্ট নেই? সাইন আপ করুন';

  @override
  String get myIdentity => 'আমার পরিচয়';

  @override
  String get scanToAddMe => 'যোগ করতে স্ক্যান করুন';

  @override
  String get shareProfileLink => 'প্রোফাইল লিংক শেয়ার';

  @override
  String addMeOnCrypt(String link) {
    return 'CRYPT-এ আমাকে যোগ করুন!\n\n$link';
  }

  @override
  String get scanQr => 'QR স্ক্যান';

  @override
  String get invalidCryptQrFormat => 'ভুল CRYPT QR কোড।';

  @override
  String get userScanned => 'ইউজার স্ক্যান হয়েছে!';

  @override
  String addingUser(String username) {
    return '$username যোগ হচ্ছে...';
  }

  @override
  String get defaultUser => 'ইউজার';

  @override
  String get createAccount => 'অ্যাকাউন্ট তৈরি';

  @override
  String get keepPasswordSecureHint =>
      'নিরাপদে রাখুন। পাসওয়ার্ড বদলানো যাবে না।';

  @override
  String get pleaseFillInAllFields => 'সব ঘর পূরণ করুন';

  @override
  String get usernameExceedsLimit => 'ইউজারনেম সর্বোচ্চ ২০ অক্ষর।';

  @override
  String get invalidUsernameCharacters =>
      'শুধু অক্ষর, সংখ্যা, _ বা - ব্যবহার করুন।';

  @override
  String get weakPasswordNotice => '৮+ অক্ষর, ১ সংখ্যা ও ১ বড় অক্ষর।';

  @override
  String get unableToGenerateUniqueUsername =>
      'ইউনিক ইউজারনেম তৈরি করা যায়নি।';

  @override
  String get accountCreated => 'অ্যাকাউন্ট তৈরি হয়েছে';

  @override
  String yourUsernameIs(String username) {
    return 'আপনার ইউজারনেম:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '\'$chosen\' নেওয়া হয়েছে।\n\nআপনার ইউজারনেম:\n\n$assigned\n\nলগইনে এটি ব্যবহার করুন।';
  }

  @override
  String get continueText => 'চালিয়ে যান';

  @override
  String failedToGenerateIdentity(String error) {
    return 'পরিচয় তৈরি ব্যর্থ: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT-এ স্বাগতম';

  @override
  String get signupDescription =>
      'ইউজারনেম ও পাসওয়ার্ড দিয়ে P2P এনক্রিপশন কী তৈরি করুন।';

  @override
  String get chooseAUsername => 'ইউজারনেম বাছুন';

  @override
  String get usernameHelperText =>
      'আসল নাম ব্যবহার করবেন না। নাম নেওয়া থাকলে স্বয়ংক্রিয়ভাবে suffix যোগ হবে।';

  @override
  String get masterAuthenticationRequired => 'মাস্টার প্রমাণীকরণ প্রয়োজন';

  @override
  String get verify => 'যাচাই';

  @override
  String get darkThemeMode => 'ডার্ক থিম';

  @override
  String get secureConversations => 'সুরক্ষিত চ্যাট';

  @override
  String get noActiveConversations =>
      'কোনো সক্রিয় চ্যাট নেই। লক চালু করতে একটি চ্যাট শুরু করুন।';

  @override
  String get logout => 'লগ আউট';

  @override
  String get wipeDeviceAndEscape => 'ডিভাইস মুছুন ও বের হন';

  @override
  String get falsePassword => 'ভুল পাসওয়ার্ড';

  @override
  String accessSuspendedTimer(String time) {
    return 'নিরাপত্তার জন্য অ্যাক্সেস বন্ধ। $time পরে চেষ্টা করুন।';
  }

  @override
  String get selectSecureLockMethod => 'লক পদ্ধতি বাছুন';

  @override
  String get selectSecureLockDescription =>
      'ফিঙ্গারপ্রিন্ট বা ৪-ডিজিট PIN দিয়ে চ্যাট লক করবেন?';

  @override
  String get fourDigitPin => '৪-ডিজিট PIN';

  @override
  String get fingerprintUnlock => 'ফিঙ্গারপ্রিন্ট 🔓';

  @override
  String get supportSoloDeveloper => 'ডেভেলপারকে সহায়তা';

  @override
  String get maybeLater => 'পরে';

  @override
  String get submitProof => 'প্রমাণ জমা দিন';

  @override
  String get couldNotOpenWallet => 'ওয়ালেট খোলা যায়নি। নিচের কোডটি কপি করুন।';

  @override
  String get proofSubmittedSnackbar =>
      'প্রমাণ জমা হয়েছে! ম্যানুয়াল পর্যালোচনায় ২৪–৪৮ ঘণ্টা লাগবে (সাপ্তাহিক ছুটি বাদে)। আপনি অ্যাপ স্বাভাবিকভাবে ব্যবহার করতে পারেন।';
}
