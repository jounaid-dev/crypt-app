// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'ସ୍ୱାଗତ';

  @override
  String get login => 'ଲଗ୍ ଇନ୍';

  @override
  String get signup => 'ସାଇନ୍ ଅପ୍';

  @override
  String get settings => 'ସେଟିଙ୍ଗସ୍';

  @override
  String get chats => 'ଚାଟ୍';

  @override
  String get typeMessage => 'ସନ୍ଦେଶ ଟାଇପ୍ କରନ୍ତୁ...';

  @override
  String get send => 'ପଠାନ୍ତୁ';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'ସଂଯୋଗ ହେଉଛି...';

  @override
  String get connectingP2p => 'P2P ସହିତ ସଂଯୋଗ ହେଉଛି...';

  @override
  String get p2pConnectionNotReady => 'P2P ପ୍ରସ୍ତୁତ ନୁହେଁ।';

  @override
  String get searchLanguage => 'ଭାଷା ଖୋଜନ୍ତୁ...';

  @override
  String get language => 'ଭାଷା';

  @override
  String get forceEscapeSignOutTitle =>
      'ଜରୁରୀକାଳୀନ ଲଗ୍ ଆଉଟ୍ ବାଧ୍ୟତାମୂଳକ କରିବେ କି?';

  @override
  String get forceEscapeSignOutContent =>
      'ଚେତାବନୀ: ଏହା କରିବା ଦ୍ୱାରା ଏହି ଡିଭାଇସରୁ ସମସ୍ତ ଡାଟା ସମ୍ପୂର୍ଣ୍ଣ ରୂପେ ଲିଭିଯିବ।';

  @override
  String get cancel => 'ବାତିଲ୍';

  @override
  String get wipeDevice => 'ଡିଭାଇସ୍ ୱାଇପ୍ କରନ୍ତୁ';

  @override
  String get accountDestructionAlertTitle => 'ଆକାଉଣ୍ଟ୍ ବିନାଶ ଚେତାବନୀ';

  @override
  String get accountDestructionWarning =>
      'ଚେତାବନୀ: ଏହି ପଦକ୍ଷେପ ଏହି ଡିଭାଇସରୁ ଆପଣଙ୍କର ସମସ୍ତ ଡାଟା ଲିଭାଇଦିଏ। ଇଣ୍ଟରନେଟ୍ ସହିତ ସଂଯୁକ୍ତ ହେବା ପରେ, ଏହା ଏକ ରିମୋଟ୍ ସେଲ୍ଫ-ଡିଷ୍ଟ୍ରକ୍ଟ କମାଣ୍ଡ୍‌କୁ ସକ୍ରିୟ କରିବ। ଆପଣଙ୍କର ଅନନ୍ୟ ୟୁଜର୍ ଆଇଡିରୁ ପଠାଯାଇଥିବା ପ୍ରତ୍ୟେକ ସନ୍ଦେଶ ସମସ୍ତ ପିଅର୍ ମେମୋରୀରୁ ସ୍ଥାୟୀ ଭାବରେ ଲିଭିଯିବ।';

  @override
  String get accountDestructionCriticalNotice =>
      'ଗୁରୁତର: ଯଦି ଆପଣ ଏହି ଯାଞ୍ଚ ସଂଖ୍ୟାଗୁଡ଼ିକୁ ଭୁଲ୍ ଟାଇପ୍ କରନ୍ତି, ତେବେ ସିଷ୍ଟମ୍ ଲକ୍ ହୋଇଯିବ। ଏହାକୁ ଅନଲକ୍ କରିବା ପାଇଁ, ଆପଣଙ୍କୁ ଆପଣଙ୍କର ମାଷ୍ଟର ଆକାଉଣ୍ଟ୍ ପାସୱାର୍ଡ ଦେବାକୁ ପଡ଼ିବ, କିମ୍ବା ଜରୁରୀକାଳୀନ ଏସ୍କେପ୍ ହ୍ୟାଚ୍ ବ୍ୟବହାର କରିବାକୁ ପଡ଼ିବ ଯାହା ତତ୍କାଳ ଏହି ଡିଭାଇସର ସମସ୍ତ ଡାଟା ଭଣ୍ଡାରକୁ ସମ୍ପୂର୍ଣ୍ଣ ସଫା କରିଦିଏ।';

  @override
  String verificationSecurityKey(String code) {
    return 'ଯାଞ୍ଚ ସୁରକ୍ଷା କି: $code';
  }

  @override
  String get copyDigitsHint => 'ଉପରୋକ୍ତ 5ଟି ଅଙ୍କ କପି କରନ୍ତୁ';

  @override
  String get codeMismatchNotice =>
      'କୋଡ୍ ମେଳ ହେଉନାହିଁ! ଓଭରରାଇଡ୍ କରିବା ପାଇଁ ମାଷ୍ଟର ପାସୱାର୍ଡ ପ୍ରବେଶ କରନ୍ତୁ କିମ୍ବା 10 ମିନିଟ୍‌ର ଲକ୍‌ର ସମ୍ମୁଖୀନ ହୁଅନ୍ତୁ:';

  @override
  String get accountPasswordLabel => 'ଆକାଉଣ୍ଟ୍ ପାସୱାର୍ଡ';

  @override
  String get deleteEverythingPermanently => 'ସବୁକିଛି ସ୍ଥାୟୀ ଭାବରେ ଲିଭାନ୍ତୁ';

  @override
  String get escapeAndPurgeDeviceData =>
      'ଏସ୍କେପ୍ କରନ୍ତୁ ଏବଂ ଡିଭାଇସ୍ ଡାଟା ସଫା କରନ୍ତୁ';

  @override
  String get addContact => 'ସମ୍ପର୍କ ଯୋଡନ୍ତୁ';

  @override
  String get addContactConfirmation =>
      'ଆପଣ ଏହି ସମ୍ପର୍କକୁ ଯୋଡିବାକୁ ଚାହାଁନ୍ତି କି?';

  @override
  String get noMessagesYet => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ସନ୍ଦେଶ ନାହିଁ';

  @override
  String get addNewContact => 'ନୂତନ ସମ୍ପର୍କ ଯୋଡନ୍ତୁ';

  @override
  String get usernameLabel => 'ୟୁଜର୍ ନେମ୍';

  @override
  String get nicknameOptionalLabel => 'ଡାକନାମ (ବୈକଳ୍ପିକ)';

  @override
  String get add => 'ଯୋଡନ୍ତୁ';

  @override
  String get usernameCannotBeEmpty => 'ୟୁଜର୍ ନେମ୍ ଖାଲି ରହିପାରିବ ନାହିଁ';

  @override
  String contactAlreadyExists(String name) {
    return 'ସମ୍ପର୍କ \'$name\' ଆପଣଙ୍କ ଆଡ୍ରେସ୍ ବୁକ୍‌ରେ ଆଗରୁ ଅଛି।';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'ନେଟୱର୍କ ରେଜିଷ୍ଟ୍ରିରେ \'$name\' ଉପଭୋକ୍ତା ମିଳିଲେ ନାହିଁ। ଏକ ଅଂଶୀଦାର ଗୁପ୍ତ କି ତିଆରି କରାଯାଇପାରିବ ନାହିଁ।';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name ସଫଳତାର ସହ ଯୋଡାଗଲା!';
  }

  @override
  String get contacts => 'ସମ୍ପର୍କଗୁଡ଼ିକ';

  @override
  String get noContactsYet => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ସମ୍ପର୍କ ନାହିଁ';

  @override
  String get securityLockoutActive => 'ସୁରକ୍ଷା ଲକଡାଉନ୍ ସକ୍ରିୟ ଅଛି';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'ଅନେକ ଅବୈଧ ପ୍ରୟାସ। $minutes ମିନିଟ୍ ପାଇଁ ଫ୍ରିଜ୍ କରାଯାଇଛି।';
  }

  @override
  String get acknowledge => 'ସ୍ୱୀକାର କରନ୍ତୁ';

  @override
  String get accessBlocked => 'ପ୍ରବେଶ ଅବରୋଧିତ';

  @override
  String accessSuspended(int minutes) {
    return '5ଟି ଭୁଲ୍ ଯାଞ୍ଚ ମେଳ। ଆଗାମୀ $minutes ମିନିଟ୍ ପାଇଁ ପ୍ରବେଶ ସ୍ଥଗିତ ରଖାଯାଇଛି।';
  }

  @override
  String get ok => 'ଠିକ୍ ଅଛି';

  @override
  String unlockSecureNode(String username) {
    return 'ସୁରକ୍ଷିତ ନୋଡ୍ ଅନଲକ୍ କରନ୍ତୁ: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'ବାକି ଥିବା ଯାଞ୍ଚ ପ୍ରୟାସ: $count ପ୍ରୟାସ।';
  }

  @override
  String get secureKeyPasscode => 'ସୁରକ୍ଷିତ କି ପାସକୋଡ୍';

  @override
  String get warningHardwareLockout =>
      'ଚେତାବନୀ: ପରବର୍ତ୍ତୀ ସିଷ୍ଟମ୍ ଅସଙ୍ଗତି ହାର୍ଡୱେର୍ ସୁରକ୍ଷା ଲକଡାଉନ୍ ପ୍ରଶମନକୁ ସକ୍ରିୟ କରିବ।';

  @override
  String get abort => 'ରଦ୍ଦ କରନ୍ତୁ';

  @override
  String get authenticate => 'ପ୍ରମାଣିତ କରନ୍ତୁ';

  @override
  String get searchPipelinesHint =>
      'ସକ୍ରିୟ ସୁରକ୍ଷିତ ପାଇପଲାଇନଗୁଡିକର ଅନୁସନ୍ଧାନ କରନ୍ତୁ...';

  @override
  String get zeroPipelinesDiscovered =>
      'ଶୂନ୍ୟ ମେଳ ହେଉଥିବା ଯୋଗାଯୋଗ ପାଇପଲାଇନ ମିଳିଲା।';

  @override
  String get processingDecryption => 'ଡିକ୍ରିପ୍ସନ୍ ପ୍ରକ୍ରିୟା ଚାଲିଛି...';

  @override
  String get decrypting => 'ଡିକ୍ରିପ୍ଟ ହେଉଛି...';

  @override
  String get decryptionError => '[ଡିକ୍ରିପ୍ସନ୍ ତ୍ରୁଟି]';

  @override
  String get cryptContainerSecure => 'CRYPT କଣ୍ଟେନର୍ ସୁରକ୍ଷିତ ଅଛି';

  @override
  String get connectAnAccount => 'ଏକ ଆକାଉଣ୍ଟ୍ ସଂଯୋଗ କରନ୍ତୁ';

  @override
  String get username => 'ୟୁଜର୍ ନେମ୍';

  @override
  String get password => 'ପାସୱାର୍ଡ';

  @override
  String get enterMasterSecurityPassword =>
      'ଆପଣଙ୍କର ମାଷ୍ଟର ସୁରକ୍ଷା ପାସୱାର୍ଡ ପ୍ରବେଶ କରନ୍ତୁ';

  @override
  String get pleaseFillAllFields => 'ଦୟାକରି ସମସ୍ତ ଫିଲ୍ଡ ପୂରଣ କରନ୍ତୁ';

  @override
  String get wrongUsernameOrPassword => 'ଭୁଲ୍ ୟୁଜର୍ ନେମ୍ କିମ୍ବା ପାସୱାର୍ଡ';

  @override
  String loginError(String error) {
    return 'ଲଗ୍ ଇନ୍ ତ୍ରୁଟି: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'ଆକାଉଣ୍ଟ୍ ନାହିଁ କି? ସାଇନ୍ ଅପ୍ କରନ୍ତୁ';

  @override
  String get myIdentity => 'ମୋର ପରିଚୟ';

  @override
  String get scanToAddMe => 'ମୋତେ ଯୋଡିବା ପାଇଁ ସ୍କାନ୍ କରନ୍ତୁ';

  @override
  String get shareProfileLink => 'ପ୍ରୋଫାଇଲ୍ ଲିଙ୍କ୍ ସେୟାର୍ କରନ୍ତୁ';

  @override
  String addMeOnCrypt(String link) {
    return 'ମୋତେ CRYPT ରେ ଯୋଡନ୍ତୁ!\n\n$link';
  }

  @override
  String get scanQr => 'QR ସ୍କାନ୍ କରନ୍ତୁ';

  @override
  String get invalidCryptQrFormat => 'ଅବୈଧ CRYPT QR କୋଡ୍ ଫର୍ମାଟ୍।';

  @override
  String get userScanned => 'ଉପଭୋକ୍ତା ସ୍କାନ୍ ହୋଇଛନ୍ତି!';

  @override
  String addingUser(String username) {
    return '$username ଯୋଡା ହେଉଛି...';
  }

  @override
  String get defaultUser => 'ଉପଭୋକ୍ତା';

  @override
  String get createAccount => 'ଆକାଉଣ୍ଟ୍ ତିଆରି କରନ୍ତୁ';

  @override
  String get keepPasswordSecureHint =>
      'ଏହାକୁ ସୁରକ୍ଷିତ ରଖନ୍ତୁ, ପାସୱାର୍ଡ ପରେ ବଦଳାଯାଇପାରିବ ନାହିଁ';

  @override
  String get pleaseFillInAllFields => 'ଦୟାକରି ସମସ୍ତ ଫିଲ୍ଡରେ ସୂଚନା ପୂରଣ କରନ୍ତୁ';

  @override
  String get usernameExceedsLimit => 'ୟୁଜର୍ ନେମ୍ 20ଟି ଅକ୍ଷରରୁ ଅଧିକ ହେବ ନାହିଁ';

  @override
  String get invalidUsernameCharacters =>
      'ୟୁଜର୍ ନେମ୍‌ରେ କେବଳ ଅକ୍ଷର, ସଂଖ୍ୟା, ଅଣ୍ଡରସ୍କୋର ଏବଂ ହାଇଫେନ୍ ରହିପାରିବ';

  @override
  String get weakPasswordNotice =>
      'ପାସୱାର୍ଡ ଅତିକମରେ 8ଟି ଅକ୍ଷର ହେବା ଉଚିତ, ଯେଉଁଥିରେ ଏକ ସଂଖ୍ୟା ଏବଂ ଏକ ବଡ଼ ଅକ୍ଷର (uppercase) ରହିବା ଆବଶ୍ୟକ';

  @override
  String get unableToGenerateUniqueUsername =>
      'ଏକ ଅନନ୍ୟ ୟୁଜର୍ ନେମ୍ ସୃଷ୍ଟି କରିବାରେ ଅସମର୍ଥ।';

  @override
  String get accountCreated => 'ଆକାଉଣ୍ଟ୍ ସୃଷ୍ଟି ହୋଇଛି';

  @override
  String yourUsernameIs(String username) {
    return 'ଆପଣଙ୍କର ୟୁଜର୍ ନେମ୍ ହେଉଛି:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'ୟୁଜର୍ ନେମ୍ \'$chosen\' ଆଗରୁ ନିଆଯାଇଛି।\n\nଆପଣଙ୍କର ନିର୍ଦ୍ଧାରିତ ୟୁଜର୍ ନେମ୍ ହେଉଛି:\n\n$assigned\n\nଦୟାକରି ଏହାକୁ ମନେରଖନ୍ତୁ। ଲଗ୍ ଇନ୍ କରିବା ପାଇଁ ଏହା ଆପଣଙ୍କର ଆବଶ୍ୟକ ହେବ.';
  }

  @override
  String get continueText => 'ଆଗକୁ ବଢନ୍ତୁ';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ସୁରକ୍ଷିତ ପରିଚୟ ସୃଷ୍ଟି କରିବାରେ ବିଫଳ: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT କୁ ସ୍ୱାଗତ';

  @override
  String get signupDescription =>
      'ଆପଣଙ୍କର ପିଅର୍-ଟୁ-ପିଅର୍ ଏନକ୍ରିପ୍ସନ୍ କି ଗୁଡିକୁ ଆରମ୍ଭ କରିବା ପାଇଁ ଏକ ୟୁଜର୍ ନେମ୍ ଏବଂ ପାସୱାର୍ଡ ପ୍ରବେଶ କରନ୍ତୁ।';

  @override
  String get chooseAUsername => 'ଏକ ୟୁଜର୍ ନେମ୍ ଚୟନ କରନ୍ତୁ';

  @override
  String get usernameHelperText =>
      'ଆପଣଙ୍କର ପ୍ରକୃତ ନାମ ବ୍ୟବହାର କରନ୍ତୁ ନାହିଁ। ଯଦି ୟୁଜର୍ ନେମ୍ ଆଗରୁ ନିଆଯାଇଥାଏ, ତେବେ ଆମେ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଏକ ଅନନ୍ୟ ପ୍ରତ୍ୟୟ ଯୋଡିବୁ।';

  @override
  String get masterAuthenticationRequired => 'ମାଷ୍ଟର ପ୍ରମାଣୀକରଣ ଆବଶ୍ୟକ';

  @override
  String get verify => 'ଯାଞ୍ଚ କରନ୍ତୁ';

  @override
  String get darkThemeMode => 'ଡାର୍କ ଥିମ୍ ମୋଡ୍';

  @override
  String get secureConversations => 'ସୁରକ୍ଷିତ କଥାବାର୍ତ୍ତା';

  @override
  String get noActiveConversations =>
      'କୌଣସି ସକ୍ରିୟ କଥାବାର୍ତ୍ତା ମିଳିଲା ନାହିଁ। କଷ୍ଟମ୍ ସୁରକ୍ଷା ଲକ୍ ପ୍ରୟୋଗ କରିବା ପାଇଁ ପ୍ରଥମେ ଏକ କଥାବାର୍ତ୍ତା ଆରମ୍ଭ କରନ୍ତୁ।';

  @override
  String get logout => 'ଲଗ୍ ଆଉଟ୍';

  @override
  String get wipeDeviceAndEscape => 'ଡିଭାଇସ୍ ୱାଇପ୍ କରନ୍ତୁ ଏବଂ ଏସ୍କେପ୍ କରନ୍ତୁ';

  @override
  String get falsePassword => 'ଭୁଲ୍ ପାସୱାର୍ଡ';

  @override
  String accessSuspendedTimer(String time) {
    return 'ସୁରକ୍ଷା ପାଇଁ ପ୍ରବେଶ ସ୍ଥଗିତ ରଖାଯାଇଛି। $time ରେ ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ.';
  }

  @override
  String get selectSecureLockMethod => 'ସୁରକ୍ଷିତ ଲକ୍ ପଦ୍ଧତି ଚୟନ କରନ୍ତୁ';

  @override
  String get selectSecureLockDescription =>
      'ଆପଣ ଏହି କଥାବାର୍ତ୍ତା କୋଠରୀକୁ ଡିଭାଇସ୍ ଫିଙ୍ଗରପ୍ରିଣ୍ଟ ବାୟୋମେଟ୍ରିକ୍ସ କିମ୍ବା ମାନକ 4-ଅଙ୍କ ବିଶିଷ୍ଟ ପିନ୍ କୋଡ୍ ବ୍ୟବହାର କରି ଲକ୍ କରିବାକୁ ଚାହାଁନ୍ତି କି?';

  @override
  String get fourDigitPin => '4-ଅଙ୍କ ବିଶିଷ୍ଟ ପିନ୍';

  @override
  String get fingerprintUnlock => 'ଫିଙ୍ଗରପ୍ରିଣ୍ଟ 🔓';

  @override
  String get supportSoloDeveloper => 'ଏକ ସୋଲୋ ଡେଭଲପର୍‌କୁ ସମର୍ଥନ କରନ୍ତୁ';

  @override
  String get maybeLater => 'ପରେ ହୋଇପାରେ';

  @override
  String get submitProof => 'ପ୍ରମାଣ ସବମିଟ୍ କରନ୍ତୁ';

  @override
  String get couldNotOpenWallet =>
      'ୱାଲେଟ୍ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଖୋଲିପାରିଲା ନାହିଁ। ଦୟାକରି ଏହା ବଦଳରେ ତଳେ ଥିବା ଟେକ୍ସଟ୍ କୋଡ୍ ଷ୍ଟ୍ରିଙ୍ଗ୍ କପି କରନ୍ତୁ।';

  @override
  String get proofSubmittedSnackbar =>
      'ପ୍ରମାଣ ସବମିଟ୍ ହୋଇଛି! ମାନୁଆଲ୍ ସମୀକ୍ଷା ପାଇଁ 24-48 ଘଣ୍ଟା ସମୟ ଲାଗେ (ସପ୍ତାହାନ୍ତ ବ୍ୟତୀତ)। ଆପଣ ସାଧାରଣ ଭାବରେ ଆପ୍ ବ୍ୟବହାର କରିବା ଜାରି ରଖିପାରିବେ!';
}
