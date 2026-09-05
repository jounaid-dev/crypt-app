// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'સ્વાગત છે';

  @override
  String get login => 'લોગ ઇન';

  @override
  String get signup => 'સાઇન અપ';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get chats => 'ચેટ્સ';

  @override
  String get typeMessage => 'સંદેશ લખો...';

  @override
  String get send => 'મોકલો';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'કનેક્ટ થઈ રહ્યું છે...';

  @override
  String get connectingP2p => 'P2P સાથે કનેક્ટ થઈ રહ્યું છે...';

  @override
  String get p2pConnectionNotReady => 'P2P તૈયાર નથી.';

  @override
  String get searchLanguage => 'ભાષા શોધો...';

  @override
  String get language => 'ભાષા';

  @override
  String get forceEscapeSignOutTitle => 'ઇમરજન્સી લોગ આઉટ કરવું છે?';

  @override
  String get forceEscapeSignOutContent =>
      'ચેતવણી: આ ઉપકરણનો તમામ ડેટા ભૂંસી નાખવામાં આવશે.';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get wipeDevice => 'ઉપકરણ ભૂંસી નાખો';

  @override
  String get accountDestructionAlertTitle => 'એકાઉન્ટ કાઢી નાખવું';

  @override
  String get accountDestructionWarning =>
      'ચેતવણી: ઉપકરણનો ડેટા અને રિમોટ સંદેશાઓ ભૂંસી નાખવામાં આવશે.';

  @override
  String get accountDestructionCriticalNotice =>
      'મહત્વપૂર્ણ: ખોટા કોડ સિસ્ટમને લૉક કરી દેશે. તમારો એકાઉન્ટ પાસવર્ડ અથવા ઇમરજન્સી એસ્કેપનો ઉપયોગ કરો.';

  @override
  String verificationSecurityKey(String code) {
    return 'સુરક્ષા કી: $code';
  }

  @override
  String get copyDigitsHint => 'ઉપરના 5 અંકો કૉપી કરો';

  @override
  String get codeMismatchNotice =>
      'કોડ ખોટો છે. તમારો માસ્ટર પાસવર્ડ દાખલ કરો અથવા 10 મિનિટ રાહ જુઓ.';

  @override
  String get accountPasswordLabel => 'એકાઉન્ટ પાસવર્ડ';

  @override
  String get deleteEverythingPermanently => 'બધું કાયમ માટે કાઢી નાખો';

  @override
  String get escapeAndPurgeDeviceData => 'એસ્કેપ કરો અને ડેટા ભૂંસી નાખો';

  @override
  String get addContact => 'સંપર્ક ઉમેરો';

  @override
  String get addContactConfirmation => 'આ સંપર્ક ઉમેરવો છે?';

  @override
  String get noMessagesYet => 'હજી કોઈ સંદેશ નથી';

  @override
  String get addNewContact => 'નવો સંપર્ક';

  @override
  String get usernameLabel => 'યુઝરનેમ';

  @override
  String get nicknameOptionalLabel => 'ઉપનામ (વૈકલ્પિક)';

  @override
  String get add => 'ઉમેરો';

  @override
  String get usernameCannotBeEmpty => 'યુઝરનેમ જરૂરી છે';

  @override
  String contactAlreadyExists(String name) {
    return 'સંપર્ક \'$name\' પહેલેથી જ અસ્તિત્વમાં છે.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'યુઝર \'$name\' મળ્યો નથી. શેર કરેલી સિક્રેટ કી ઉપલબ્ધ નથી.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name સફળતાપૂર્વક ઉમેરવામાં આવ્યો!';
  }

  @override
  String get contacts => 'સંપર્કો';

  @override
  String get noContactsYet => 'હજી કોઈ સંપર્ક નથી';

  @override
  String get securityLockoutActive => 'સુરક્ષા લૉક';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'ઘણા બધા પ્રયાસો. $minutes મિનિટ માટે લૉક.';
  }

  @override
  String get acknowledge => 'સમજાયું';

  @override
  String get accessBlocked => 'ઍક્સેસ બ્લૉક કરવામાં આવ્યો';

  @override
  String accessSuspended(int minutes) {
    return '5 ખોટા પ્રયાસો. $minutes મિનિટ માટે ઍક્સેસ સ્થગિત.';
  }

  @override
  String get ok => 'બરાબર';

  @override
  String unlockSecureNode(String username) {
    return 'અનલૉક કરો: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'બાકી પ્રયાસો: $count';
  }

  @override
  String get secureKeyPasscode => 'સુરક્ષા પાસકોડ';

  @override
  String get warningHardwareLockout =>
      'ચેતવણી: આગામી નિષ્ફળ પ્રયાસ સુરક્ષા લૉક સક્રિય કરશે.';

  @override
  String get abort => 'રદ કરો';

  @override
  String get authenticate => 'પ્રમાણિત કરો';

  @override
  String get searchPipelinesHint => 'સુરક્ષિત કનેક્શનો શોધો...';

  @override
  String get zeroPipelinesDiscovered => 'કોઈ કનેક્શન મળ્યું નથી.';

  @override
  String get processingDecryption => 'ડિક્રિપ્ટ થઈ રહ્યું છે...';

  @override
  String get decrypting => 'ડિક્રિપ્ટ થઈ રહ્યું છે...';

  @override
  String get decryptionError => '[ડિક્રિપ્શન ભૂલ]';

  @override
  String get cryptContainerSecure => 'CRYPT સુરક્ષિત છે';

  @override
  String get connectAnAccount => 'એકાઉન્ટ કનેક્ટ કરો';

  @override
  String get username => 'યુઝરનેમ';

  @override
  String get password => 'પાસવર્ડ';

  @override
  String get enterMasterSecurityPassword => 'તમારો માસ્ટર પાસવર્ડ દાખલ કરો';

  @override
  String get pleaseFillAllFields => 'કૃપા કરીને બધા ફીલ્ડ ભરો';

  @override
  String get wrongUsernameOrPassword => 'ખોટો યુઝરનેમ અથવા પાસવર્ડ';

  @override
  String loginError(String error) {
    return 'લૉગિન ભૂલ: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'એકાઉન્ટ નથી? સાઇન અપ કરો';

  @override
  String get myIdentity => 'મારી ઓળખ';

  @override
  String get scanToAddMe => 'મને ઉમેરવા માટે સ્કેન કરો';

  @override
  String get shareProfileLink => 'પ્રોફાઇલ શેર કરો';

  @override
  String addMeOnCrypt(String link) {
    return 'મને CRYPT પર ઉમેરો!\n\n$link';
  }

  @override
  String get scanQr => 'QR સ્કેન કરો';

  @override
  String get invalidCryptQrFormat => 'અમાન્ય CRYPT QR કોડ.';

  @override
  String get userScanned => 'યુઝર સ્કેન થયો!';

  @override
  String addingUser(String username) {
    return '$username ઉમેરવામાં આવી રહ્યો છે...';
  }

  @override
  String get defaultUser => 'યુઝર';

  @override
  String get createAccount => 'એકાઉન્ટ બનાવો';

  @override
  String get keepPasswordSecureHint =>
      'તેને સુરક્ષિત રાખો. પાસવર્ડ બદલી શકાશે નહીં.';

  @override
  String get pleaseFillInAllFields => 'કૃપા કરીને બધા ફીલ્ડ ભરો';

  @override
  String get usernameExceedsLimit =>
      'યુઝરનેમ વધુમાં વધુ 20 અક્ષરોનું હોઈ શકે છે';

  @override
  String get invalidUsernameCharacters =>
      'ફક્ત અક્ષરો, સંખ્યાઓ, _ અથવા - નો ઉપયોગ કરો.';

  @override
  String get weakPasswordNotice =>
      '8+ અક્ષરો, 1 સંખ્યા અને 1 મોટો અક્ષર વાપરો.';

  @override
  String get unableToGenerateUniqueUsername =>
      'અનન્ય યુઝરનેમ બનાવી શકાયું નથી.';

  @override
  String get accountCreated => 'એકાઉન્ટ બનાવાયું';

  @override
  String yourUsernameIs(String username) {
    return 'તમારું યુઝરનેમ:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'યુઝરનેમ \'$chosen\' પહેલેથી જ લેવામાં આવ્યું છે.\n\nતમારું યુઝરનેમ:\n\n$assigned\n\nલૉગિન માટે તેને સાચવી રાખો.';
  }

  @override
  String get continueText => 'ચાલુ રાખો';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ઓળખ બનાવવામાં નિષ્ફળતા: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT માં આપનું સ્વાગત છે';

  @override
  String get signupDescription =>
      'P2P કી બનાવવા માટે યુઝરનેમ અને પાસવર્ડ બનાવો.';

  @override
  String get chooseAUsername => 'યુઝરનેમ પસંદ કરો';

  @override
  String get usernameHelperText =>
      'તમારું સાચું નામ વાપરશો નહીં. નામ પહેલેથી લેવામાં આવ્યું હોય તો suffix ઉમેરવામાં આવશે.';

  @override
  String get masterAuthenticationRequired => 'માસ્ટર ઓથેન્ટિકેશન';

  @override
  String get verify => 'ચકાસો';

  @override
  String get darkThemeMode => 'ડાર્ક થીમ';

  @override
  String get secureConversations => 'સુરક્ષિત વાતચીત';

  @override
  String get noActiveConversations =>
      'કોઈ સક્રિય ચેટ નથી. લૉક સક્રિય કરવા માટે એક ચેટ શરૂ કરો.';

  @override
  String get logout => 'લૉગ આઉટ';

  @override
  String get wipeDeviceAndEscape => 'ઉપકરણ ભૂંસી નાખો';

  @override
  String get falsePassword => 'ખોટો પાસવર્ડ';

  @override
  String accessSuspendedTimer(String time) {
    return 'ઍક્સેસ સ્થગિત છે. $time પછી ફરી પ્રયાસ કરો.';
  }

  @override
  String get selectSecureLockMethod => 'લૉક પદ્ધતિ પસંદ કરો';

  @override
  String get selectSecureLockDescription =>
      'ફિંગરપ્રિન્ટ અથવા 4-અંકના PINથી લૉક કરવું છે?';

  @override
  String get fourDigitPin => '4-અંકનો PIN';

  @override
  String get fingerprintUnlock => 'ફિંગરપ્રિન્ટ 🔓';

  @override
  String get supportSoloDeveloper => 'ડેવલપરને સપોર્ટ કરો';

  @override
  String get maybeLater => 'કદાચ પછી';

  @override
  String get submitProof => 'પુરાવો સબમિટ કરો';

  @override
  String get couldNotOpenWallet =>
      'વૉલેટ ખોલી શકાયું નથી. નીચેનો કોડ કૉપી કરો.';

  @override
  String get proofSubmittedSnackbar =>
      'પુરાવો સબમિટ થયો. મેન્યુઅલ સમીક્ષા માટે 24–48 કલાક લાગી શકે છે (સપ્તાહાંત સિવાય). તમે એપનો સામાન્ય રીતે ઉપયોગ ચાલુ રાખી શકો છો.';
}
