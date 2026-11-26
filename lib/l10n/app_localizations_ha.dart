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
  String get termsAndConditions => 'Sharuɗɗa & Sharuɗɗa';

  @override
  String get settingsTermsAndConditions => 'Sharuɗɗa & Sharuɗɗa';

  @override
  String get termsIntro =>
      'CRYPT aikace-aikacen farko ne don haɗa mutane kai tsaye don tattaunawa. Kai ne ke da alhakin amfani da aikace-aikacen yadda ya kamata da kuma kiyaye amincin bayanan asusun ku.';

  @override
  String get termsConnectivity =>
      'CRYPT tana amfani da sabis na kan layi don taimakawa na\'urori ganowa da kafa haɗin gwiwa. Kasancewa da halayen haɗin kai na iya canzawa yayin da aikace-aikacen ke haɓaka. Da fatan kar a dogara da CRYPT a matsayin hanyar sadarwar ku kawai.';

  @override
  String get termsAgreement =>
      'Ta ci gaba, kun tabbatar da cewa kun karanta kuma kun yarda kuyi amfani da CRYPT a ƙarƙashin waɗannan sharuɗɗan.';

  @override
  String get agreeTerms => 'Na yarda da Sharuɗɗa & Sharuɗɗa';

  @override
  String get agreeAndContinue => 'Yarda da ci gaba';

  @override
  String get beforeYouStart => 'Kafin Ka Fara';

  @override
  String get connected => 'An haɗa';

  @override
  String get connectFirstThenChat => 'Haɗa farko, sannan hira';

  @override
  String get betaIntro =>
      'CRYPT sigar beta ce ta farko, don haka ƙwarewar na iya haɓakawa a sigar gaba.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT tana aiki kamar walkie-talkie: duka mutane biyu suna buƙatar kasancewa akan layi kuma a buɗe CRYPT a lokaci guda don kafa haɗin.';

  @override
  String get howToUseCrypt =>
      'Yadda ake amfani da CRYPT:\n1. Duba lambar CRYPT QR na wani.\n2. Duk mutanen biyu suna buƙatar CRYPT a buɗe kuma a kan layi.\n3. Jira yayin da CRYPT ke kafa haɗin P2P.\n4. Jira har sai an kafa haɗin.\n5. Da zarar an haɗa, za ku iya fara hira.';

  @override
  String get messageStorageExplanation =>
      'An tsara saƙonninku don tafiya kai tsaye tsakanin na\'urorin da aka haɗa. CRYPT ba ya adana saƙonnin taɗi a kan sabar mu. Sabar a halin yanzu tana taimakawa tare da haɗi da sigina, kuma ba a adana tarihin taɗi akan sabar. Idan ɗayan yana layi, ba za a iya kafa haɗin P2P na yanzu ba.';

  @override
  String get settingsAndSupportExplanation =>
      'Ziyarci Saituna don keɓance ƙwarewar CRYPT ɗin ku. Ƙarin zaɓuɓɓukan gyare-gyare suna zuwa nan ba da jimawa ba.\n\nKuna son tallafawa CRYPT? Kuna iya nemo zaɓin gudummawa a cikin Saituna.';

  @override
  String get saving => 'Ana ajiyewa...';

  @override
  String get continueToCrypt => 'Ci gaba zuwa CRYPT';

  @override
  String get showSplashScreen => 'Nuna allon fantsama';

  @override
  String get retry => 'Sake gwadawa';

  @override
  String get connectionFailed => 'Haɗin ya gaza';

  @override
  String get connectionFailedDetails =>
      'Haɗin ya gaza. Duk na\'urorin dole ne su kasance kan layi tare da buɗe CRYPT don haɗawa.';

  @override
  String get gallery => 'Hoton zane';

  @override
  String get alignQrCode => 'DORA CODE QR';

  @override
  String get scanFromGallery => 'Duba daga kundin hotuna';

  @override
  String get couldNotScanImage => 'An kasa duba hoto.';

  @override
  String couldNotShareQrCode(String error) {
    return 'An kasa raba lambar QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Sabuwar lamba: $username';
  }

  @override
  String get publicEncryptionKeyMissing => 'Maɓallin ɓoyewar jama\'a ya ɓace.';

  @override
  String get contactEncryptionKeyMissing => 'Maɓallin ɓoyayyen lamba ya ɓace.';

  @override
  String get localEncryptionKeyMissing => 'Maɓallin ɓoye na gida ya ɓace.';

  @override
  String get noQrCodeFound => 'Ba a sami lambar QR a wannan hoton ba.';

  @override
  String get shareQrCode => 'Raba lambar QR';

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
  String get supportIntro =>
      'Kai! 👋 Ni mai haɓakawa ne kawai wanda ke aiki tuƙuru akan CRYPT. Ba ni da kasafin kuɗi ko kuɗin kamfani. Na dogara gaba ɗaya ga gaskiyar ku da jin daɗin ku don ci gaba da haɓaka app ɗin kuma in ba da garantin BABU ADS HAR ABADA.';

  @override
  String get chooseSupportAmount =>
      'Zaɓi Farashin ku (Maɗaukaki don tallafawa):';

  @override
  String get poorGang => 'Ni talaka ne 🥀✌️';

  @override
  String get launchOfferMinimum => 'Ƙaddamar da Mafi ƙarancin 🚀';

  @override
  String get buyMeCoffee => 'Sayi Min Kofi ☕';

  @override
  String get superSupporter => 'Babban mai tallafi 🔥';

  @override
  String get feature => 'Siffar';

  @override
  String get freeTier => 'Matakin Kyauta';

  @override
  String get premium => 'Na musamman';

  @override
  String get chatLocks => 'Makullan Taɗi';

  @override
  String get maxOneRoom => 'Max 1 Daki';

  @override
  String get unlimited => 'Babu iyaka';

  @override
  String get biometrics => 'Kwayoyin halitta';

  @override
  String get disabled => '🚫 Nakasa';

  @override
  String supportWithSats(String amount) {
    return 'Tallafa da sats $amount (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ tayin biyan BOLT12 • Matsa don kwafi';

  @override
  String get boltOfferCopied => 'An kwafi tayin biyan kuɗi na BOLT12';

  @override
  String get tapToCopyBoltOffer => 'Matsa don kwafe tayin biyan kuɗi na BOLT12';

  @override
  String get simpleInstructionsToUnlock => '📬 Sauƙaƙan Umarni don Buɗe:';

  @override
  String unlockInstructions(String username) {
    return '1. Biya ta amfani da Phoenix Wallet akan Android (ƙananan 7,500 don buɗewa - ƙarin ana godiya koyaushe).\n2. Ɗauki hoton allo na nasarar tabbatar da ciniki.\n3. Email that screenshot zuwa jounaidnadirmed@gmail.com kuma gaya mani sunan mai amfani na asusunka na musamman: \'$username\' don sanin wanda ya biya.\n4. Rubuta wani abu a cikin akwatin da ke ƙasa don adana buƙatarku akan wannan na\'urar:';
  }

  @override
  String get supportRequestHint => 'Buga sunan ku ko bayanin ciniki a nan...';

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

  @override
  String get loadingChats => 'Ana loda taɗi...';

  @override
  String get noChatsYetTitle => 'Babu hira tukuna';

  @override
  String get noChatsYetHint =>
      'Taɗi yana farawa lokacin da kuka bincika lambar CRYPT QR na wani. Bude shafin shaidar ku don raba naku don su iya duba shi.';

  @override
  String get scanQrToStartChat => 'Duba lambar QR';

  @override
  String get noChatsMatchSearch => 'Babu taɗi da ya dace da bincikenku';

  @override
  String get noChatsMatchSearchHint =>
      'Gwada wani suna daban, ko share binciken don ganin kowace taɗi.';

  @override
  String get requestSentTitle => 'An aika buƙatar';

  @override
  String requestSentBody(String username) {
    return 'Bukatar ku ta tafi $username. Da fatan za a jira yayin da suke karba.';
  }

  @override
  String get requestSentKeepOpen =>
      'Hirar tana buɗewa da zarar sun karɓa. Ci gaba da buɗe CRYPT akan wannan na\'urar don kada ku rasa ta.';

  @override
  String get requestSentGotIt => 'Na samu';

  @override
  String get scanCouldNotReadCode =>
      'Ba a iya karanta wannan lambar ba. Duba lambar CRYPT QR.';

  @override
  String get scanMissingTheirIdentity =>
      'Wannan lambar ta rasa ainihin mutum. Duba lambar daga shafin shaidar su.';

  @override
  String get scanOwnIdentityMissing =>
      'Maɓallin ɓoyewar ku ya ɓace. Fita kuma koma ciki, sannan a sake dubawa.';

  @override
  String get noLightningWalletFound =>
      'Ba a sami walat ɗin Lightning ba. Shigar ɗaya, ko kwafi adireshin kuma liƙa a cikin walat.';

  @override
  String get settingsSectionAppearance => 'Bayyanar';

  @override
  String get settingsSectionPrivacy => 'Keɓantawa da tsaro';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Taimako da doka';

  @override
  String get settingsSectionAdministration => 'Gudanarwa';

  @override
  String get settingsSectionAccount => 'Asusu';

  @override
  String get settingsProtectTitle => 'Kare saituna tare da babban kalmar sirri';

  @override
  String get settingsProtectSubtitle =>
      'Bukatar kalmar sirri don samun damar saituna';

  @override
  String get chatLockSetPinSubtitle =>
      'Matsa don saita PIN naka don wannan taɗi';

  @override
  String get premiumTileTitle => 'Samun Premium Lifetime';

  @override
  String get premiumActiveSubtitle => 'Premium yana kunne don asusun ku';

  @override
  String get premiumPendingSubtitle => 'Jiran admin don duba hoton ka';

  @override
  String get premiumHowItWorks => 'Yadda premium ke aiki';

  @override
  String get reportProblemTitle => 'Bayar da rahoto';

  @override
  String get reportProblemSubtitle => 'Bugs, zagi ko spam';

  @override
  String get adminAccessTitle => 'Shiga Admin';

  @override
  String get adminAccessSubtitle => 'Shigar da lambar gudanarwa don buɗe panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method - lambar kansa, wannan hira kawai';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount sau ɗaya tare da walat ɗin Lightning, sannan aika hoton allo';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Hoton ka yana ciki. Manajan yana duba shi kuma yana kunna premium don asusunka a ciki $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Biya $amount tare da $method, ko $wallet.\n2. Screenshot da tabbacin biyan kuɗi.\n3. Aika shi daga ƙaddamar da shaidar biyan kuɗi.\n4. Premium yana kunna kuma yana ci gaba da rayuwa.\n\nCRYPT mai haɓakawa ne ya gina shi, kuma wannan shine duka tayin: biya ɗaya, babu biyan kuɗi.';
  }

  @override
  String get reportIntro =>
      'Fada mana abinda ya faru. Idan kuna ba da rahoton wani mutum, ƙara sunan mai amfani don mu iya yin aiki akan asusun da ya dace.';

  @override
  String get reportSent => 'An aika rahoton. Na gode.';

  @override
  String get reportSendFailed => 'An kasa aika rahoton.';

  @override
  String get reportTypeLabel => 'Nau\'in rahoto';

  @override
  String get reportCategoryBug => 'Bug';

  @override
  String get reportCategoryAbuse => 'Zagi';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Sauran';

  @override
  String get reportUsernameLabel => 'Sunan mai amfani (na zaɓi)';

  @override
  String get reportUsernameHint => 'misali wani_kuke_rahoto';

  @override
  String get reportDetailsLabel => 'Me ya faru?';

  @override
  String get reportScreenshotsLabel => 'Hotunan hotuna';

  @override
  String get reportAddScreenshot => 'Ƙara hoton allo';

  @override
  String get reportSendButton => 'Aika rahoto';

  @override
  String get reportPrivacyNote =>
      'Ana duba rahotanni daga mai gudanarwa. Ana adana hotunan kariyar kwamfuta a asirce kuma ana iya gani ga masu daidaitawa kawai.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount sau daya, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Babu biyan kuɗi kuma babu abin da za a sabunta. Biya da $method, aika hoton sikirin tabbatarwa, kuma ana kunna kari a ciki $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT mai haɓakawa solo ne ya gina shi. Premium shine abin da ke kiyaye shi kyauta kuma ana kiyaye shi sosai.';

  @override
  String get premiumStepPay => 'Biya da walat ɗin ku';

  @override
  String get premiumLightningAddressLabel => 'Adireshin Lightning';

  @override
  String get premiumOpenWallet => 'Bude walat';

  @override
  String get premiumCopyAddress => 'Kwafi adireshin';

  @override
  String get premiumWorksWith =>
      'Yana aiki tare da Phoenix da kowane walat ɗin Lightning.';

  @override
  String get premiumStepScreenshot => 'Aika hoton allo';

  @override
  String get premiumScreenshotHint =>
      'Ɗauki hoton tabbacin biyan kuɗi a cikin walat ɗin Lightning kuma haɗa shi a ƙasa.';

  @override
  String get premiumAttachScreenshot => 'Haɗa hoton allo';

  @override
  String get premiumReplaceScreenshot => 'Sauya hoton allo';

  @override
  String get premiumStepAmount => 'Tabbatar da adadin';

  @override
  String get premiumAmountLabel => 'Adadin da kuka biya (USD)';

  @override
  String get premiumNoteLabel => 'Bayanan kula (na zaɓi)';

  @override
  String get premiumSendProof => 'Aiko hujjata';

  @override
  String get premiumAddressCopied => 'An kwafi adireshin Lightning.';

  @override
  String get premiumAttachConfirmation =>
      'Haɗa hoton sikirin tabbacin biyan kuɗin ku.';

  @override
  String get premiumSendProofFailed => 'An kasa aika shaidar biyan kuɗi.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Mafi ƙarancin $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Kunnawa yana ɗauka $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'An samu hujja. Ana kunna Premium a ciki $window.';
  }

  @override
  String get premiumTableFeature => 'Siffar';

  @override
  String get premiumTableFree => 'Kyauta';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Rufaffen saƙon tsara-zuwa-tsara';

  @override
  String get premiumTableMessagesStay => 'Saƙonni suna kan na\'urorinku';

  @override
  String get premiumTableChatLocks => 'An kulle taɗi tare da PIN naka';

  @override
  String get premiumTableFingerprint => 'Buɗe da sawun yatsa ko fuska';

  @override
  String get premiumTablePrice => 'Farashin';

  @override
  String get premiumTableAccess => 'Shiga';

  @override
  String get premiumTableIncluded => 'Kunshe';

  @override
  String get premiumTableOneChat => '1 hira';

  @override
  String get premiumTableUnlimited => 'Unlimited';

  @override
  String get premiumTableNotIncluded => 'Ba a haɗa ba';

  @override
  String get premiumTableFreeValue => 'Kyauta';

  @override
  String get premiumTableWhileFree => 'Yayin da app ɗin kyauta ne';

  @override
  String get premiumTableLifetime => 'Rayuwa';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Biyan kuɗi ɗaya na $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Biyan kuɗi ɗaya na $amount kuma premium naku ne na rayuwa. Babu biyan kuɗi kuma babu abin da za a sabunta.';
  }

  @override
  String get settingsSaveFailed => 'An kasa ajiye wannan saitin. Gwada kuma.';

  @override
  String get settingsLockFailed => 'An kasa kulle wannan taɗi. Gwada kuma.';

  @override
  String get settingsUnlockFailed => 'An kasa buɗe wannan taɗi. Gwada kuma.';

  @override
  String pinSetTitle(String chat) {
    return 'Saita PIN don $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Tabbatar da PIN don $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Wannan PIN yana buɗewa $chat kawai. Kowane taɗi yana da PIN nasa, wanda kuka zaɓa. Babu lamba ɗaya don ƙa\'idar.';
  }

  @override
  String get pinMismatch => 'PIN ɗin bai daidaita ba. Ba a kunna kullewa ba.';

  @override
  String get biometricNotSetUp =>
      'Ba a saita hoton yatsa ko buɗe fuska akan wannan na\'urar.';

  @override
  String get biometricVerifyFailed =>
      'An kasa tabbatar da cewa kai ne akan wannan na\'urar.';

  @override
  String get lightningAddressCopied =>
      'An kwafi adireshin Lightning. Manna shi a cikin walat don biya.';

  @override
  String get accountSuspended => 'An dakatar da asusun';

  @override
  String get premiumLifetimeAccess => 'Samun Mahimmanci na Rayuwa';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Biya $amount daga $method zuwa adireshin Lightning a sama.';
  }

  @override
  String get premiumActivationStep2 =>
      'Ɗauki hoton tabbacin biyan kuɗi kuma aika shi a matsayin shaidar biyan kuɗi.';

  @override
  String get pinFourDigits => 'Shigar da lambobi 4 daidai.';

  @override
  String get scanOwnCode =>
      'Wannan shine lambar ku. Duba lambar CRYPT na wani don fara hira da su.';

  @override
  String get couldNotGenerateQrImage => 'An kasa samar da hoton QR';

  @override
  String get conversationUpdateFailed => 'An gaza sabunta taɗi Gwada kuma.';

  @override
  String get conversationCreationFailed =>
      'Ƙirƙirar tattaunawa ta kasa. Gwada kuma.';

  @override
  String get accountSuspendedByAdmin =>
      'Wani mai gudanarwa ya dakatar da wannan asusun.';

  @override
  String get unlockCrypt => 'Buɗe app';

  @override
  String get unlockCryptBody =>
      'Shigar da babban kalmar sirri don ɓata saƙon ku akan wannan na\'urar.';

  @override
  String get unlock => 'Buɗe yanzu';

  @override
  String get attachPhoto => 'Hoto';

  @override
  String get attachFile => 'Fayil';

  @override
  String attachmentTooLarge(int mb) {
    return 'Fayil ɗin ya yi girma da yawa. Iyaka shine $mb MB.';
  }

  @override
  String get attachmentSendFailed => 'Ba za a iya aika abin da aka makala ba.';

  @override
  String get attachmentOpenFailed => 'An kasa buɗe abin da aka makala.';
}
