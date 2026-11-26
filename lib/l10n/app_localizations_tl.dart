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
  String get termsAndConditions => 'Mga Tuntunin at Kundisyon';

  @override
  String get settingsTermsAndConditions => 'Mga Tuntunin at Kundisyon';

  @override
  String get termsIntro =>
      'Ang CRYPT ay isang maagang aplikasyon para direktang pag-ugnayin ang mga tao para sa pag-uusap. Ikaw ang responsable sa wastong paggamit ng aplikasyon at sa seguridad ng mga kredensyal ng iyong account.';

  @override
  String get termsConnectivity =>
      'Gumagamit ang CRYPT ng mga online na serbisyo upang tulungan ang mga device na makahanap at makapagtatag ng koneksyon. Maaaring magbago ang availability at pag-uugali ng koneksyon habang umuunlad ang aplikasyon. Huwag umasa sa CRYPT bilang tanging paraan ng komunikasyon.';

  @override
  String get termsAgreement =>
      'Sa pagpapatuloy, kinukumpirma mong nabasa at sinasang-ayunan mong gamitin ang CRYPT alinsunod sa mga tuntuning ito.';

  @override
  String get agreeTerms => 'Sumasang-ayon ako sa Mga Tuntunin at Kundisyon';

  @override
  String get agreeAndContinue => 'Sumang-ayon at magpatuloy';

  @override
  String get beforeYouStart => 'Bago Ka Magsimula';

  @override
  String get connected => 'Nakakonekta';

  @override
  String get connectFirstThenChat => 'Kumonekta muna, saka makipag-chat';

  @override
  String get betaIntro =>
      'Ang CRYPT ay isang maagang beta na bersyon, kaya maaaring mapabuti ang karanasan sa mga susunod na bersyon.';

  @override
  String get walkieTalkieExplanation =>
      'Gumagana ang CRYPT na parang walkie-talkie: kailangang online ang dalawang tao at sabay na bukas ang CRYPT upang maitatag ang koneksyon.';

  @override
  String get howToUseCrypt =>
      'Paano gamitin ang CRYPT:\n1. I-scan ang CRYPT QR code ng kausap.\n2. Kailangang bukas at online ang CRYPT sa parehong device.\n3. Maghintay habang itinatatag ng CRYPT ang P2P connection.\n4. Hintaying mawala ang status na “Kumokonekta...” at maitatag ang koneksyon.\n5. Kapag nakakonekta na, maaari ka nang makipag-chat.';

  @override
  String get messageStorageExplanation =>
      'Ang iyong mga mensahe ay idinisenyong dumiretso sa pagitan ng mga nakakonektang device. Hindi iniimbak ng CRYPT ang iyong mga chat message sa aming mga server. Kasalukuyang tumutulong ang server sa koneksyon at signaling, at hindi iniimbak dito ang chat history. Kung offline ang kausap, hindi maitatatag ang kasalukuyang P2P connection.';

  @override
  String get settingsAndSupportExplanation =>
      'Pumunta sa Settings upang i-customize ang iyong karanasan sa CRYPT. May paparating pang mga opsyon sa pag-customize.\n\nGusto mo bang suportahan ang CRYPT? Makikita mo ang opsyon sa donasyon sa Settings.';

  @override
  String get saving => 'Nagse-save...';

  @override
  String get continueToCrypt => 'Magpatuloy sa CRYPT';

  @override
  String get showSplashScreen => 'Ipakita ang splash screen';

  @override
  String get retry => 'Subukan muli';

  @override
  String get connectionFailed => 'Nabigo ang koneksyon';

  @override
  String get connectionFailedDetails =>
      'Nabigo ang koneksyon. Kailangang online ang parehong device at bukas ang CRYPT upang makakonekta.';

  @override
  String get gallery => 'Gallery';

  @override
  String get alignQrCode => 'I-ALIGN ANG QR CODE';

  @override
  String get scanFromGallery => 'I-SCAN MULA SA GALLERY';

  @override
  String get couldNotScanImage => 'Hindi ma-scan ang larawan.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Hindi maibahagi ang QR code: $error';
  }

  @override
  String newContact(String username) {
    return 'Bagong contact: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Nawawala ang iyong pampublikong encryption key.';

  @override
  String get contactEncryptionKeyMissing =>
      'Nawawala ang encryption key ng contact.';

  @override
  String get localEncryptionKeyMissing =>
      'Nawawala ang lokal na encryption key.';

  @override
  String get noQrCodeFound => 'Walang QR code sa larawang ito.';

  @override
  String get shareQrCode => 'Ibahagi ang QR code';

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
      'BABALA: Buburahin ng pagkilos na ito ang lahat ng data sa device. Kapag nakakonekta sa Internet, magpapadala ito ng utos para sa malayuang pagbura. Permanenteng mabubura sa memorya ng mga peer ang bawat mensaheng ipinadala mula sa iyong natatanging User ID.';

  @override
  String get accountDestructionCriticalNotice =>
      'KRITIKAL: Kapag mali ang mga validation number, mala-lock ang system. Ilagay ang iyong password ng account o gamitin ang emergency escape para agad burahin ang data sa device.';

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
  String get accountPasswordLabel => 'Password ng account';

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
  String get usernameLabel => 'User name';

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
  String get supportIntro =>
      'Hoy! 👋 Isa akong solo developer na nagsusumikap sa CRYPT. Wala akong budget o corporate funding. Lubos akong umaasa sa iyong katapatan at empatiya para patuloy na pahusayin ang app at ginagarantiyahan na WALANG MGA AD FOREVER.';

  @override
  String get chooseSupportAmount =>
      'Piliin ang Iyong Presyo (Slide para suportahan):';

  @override
  String get poorGang => 'Kawawang gang ako 🥀✌️';

  @override
  String get launchOfferMinimum => 'Ilunsad ang Minimum na Alok 🚀';

  @override
  String get buyMeCoffee => 'Bilhan Mo Ako ng Kape ☕';

  @override
  String get superSupporter => 'Super tagasuporta 🔥';

  @override
  String get feature => 'Tampok';

  @override
  String get freeTier => 'Libreng Tier';

  @override
  String get premium => 'Premium na tampok';

  @override
  String get chatLocks => 'Mga Lock ng Chat';

  @override
  String get maxOneRoom => 'Max 1 Kwarto';

  @override
  String get unlimited => 'Walang limitasyon';

  @override
  String get biometrics => 'Biometriko';

  @override
  String get disabled => '🚫 Hindi pinagana';

  @override
  String supportWithSats(String amount) {
    return 'Suporta sa $amount sats (Phoenix)';
  }

  @override
  String get boltOffer =>
      '⚡ BOLT12 na alok sa pagbabayad • I-tap para kopyahin';

  @override
  String get boltOfferCopied => 'Nakopya ang alok sa pagbabayad ng BOLT12';

  @override
  String get tapToCopyBoltOffer =>
      'I-tap para kopyahin ang alok sa pagbabayad ng BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Mga Simpleng Tagubilin para I-unlock:';

  @override
  String unlockInstructions(String username) {
    return '1. Magbayad gamit ang Phoenix Wallet sa Android (7,500 minimum para i-unlock — higit pa ang palaging pinahahalagahan).\n2. Kumuha ng screenshot ng iyong matagumpay na screen ng pagkumpirma ng transaksyon.\n3. I-email ang screenshot na iyon sa jounaidnadirmed@gmail.com at sabihin sa akin ang iyong natatanging account username: \'$username\' para malaman ko kung sino ang nagbayad.\n4. I-type ang anumang bagay sa kahon sa ibaba upang i-save ang iyong kahilingan sa device na ito:';
  }

  @override
  String get supportRequestHint =>
      'I-type ang iyong pangalan o impormasyon ng transaksyon dito...';

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

  @override
  String get loadingChats => 'Naglo-load ng mga chat...';

  @override
  String get noChatsYetTitle => 'Wala pang chat';

  @override
  String get noChatsYetHint =>
      'Magsisimula ang isang chat kapag ini-scan mo ang CRYPT QR code ng ibang tao. Buksan ang iyong pahina ng pagkakakilanlan upang ibahagi ang sa iyo upang ma-scan nila ito.';

  @override
  String get scanQrToStartChat => 'Mag-scan ng QR code';

  @override
  String get noChatsMatchSearch =>
      'Walang mga chat na tumutugma sa iyong paghahanap';

  @override
  String get noChatsMatchSearchHint =>
      'Subukan ang ibang pangalan, o i-clear ang paghahanap upang makita ang bawat chat.';

  @override
  String get requestSentTitle => 'Ipinadala ang kahilingan';

  @override
  String requestSentBody(String username) {
    return 'Ang iyong kahilingan ay napunta sa $username. Mangyaring maghintay habang tinatanggap nila ito.';
  }

  @override
  String get requestSentKeepOpen =>
      'Magbubukas ang chat sa sandaling tanggapin nila. Panatilihing bukas ang CRYPT sa device na ito para hindi mo ito makaligtaan.';

  @override
  String get requestSentGotIt => 'Nakuha ko';

  @override
  String get scanCouldNotReadCode =>
      'Hindi mabasa ang code na iyon. Mag-scan ng CRYPT QR code.';

  @override
  String get scanMissingTheirIdentity =>
      'Ang code na iyon ay nawawala ang pagkakakilanlan ng tao. I-scan ang code mula sa kanilang pahina ng pagkakakilanlan.';

  @override
  String get scanOwnIdentityMissing =>
      'Ang iyong sariling encryption key ay nawawala. Mag-sign out at bumalik, pagkatapos ay i-scan muli.';

  @override
  String get noLightningWalletFound =>
      'Walang nakitang Lightning wallet. Mag-install ng isa, o kopyahin ang address at i-paste ito sa isang wallet.';

  @override
  String get settingsSectionAppearance => 'Hitsura';

  @override
  String get settingsSectionPrivacy => 'Pagkapribado at seguridad';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Tulong at legal';

  @override
  String get settingsSectionAdministration => 'Pangangasiwa';

  @override
  String get settingsSectionAccount => 'Account';

  @override
  String get settingsProtectTitle =>
      'Protektahan ang mga setting gamit ang master password';

  @override
  String get settingsProtectSubtitle =>
      'Mangailangan ng password para ma-access ang mga setting';

  @override
  String get chatLockSetPinSubtitle =>
      'I-tap para itakda ang sarili mong PIN para sa chat na ito';

  @override
  String get premiumTileTitle => 'Kumuha ng Lifetime Premium';

  @override
  String get premiumActiveSubtitle =>
      'Naka-on ang premium para sa iyong account';

  @override
  String get premiumPendingSubtitle =>
      'Naghihintay para sa isang admin na suriin ang iyong screenshot';

  @override
  String get premiumHowItWorks => 'Paano gumagana ang premium';

  @override
  String get reportProblemTitle => 'Mag-ulat ng problema';

  @override
  String get reportProblemSubtitle => 'Mga bug, pang-aabuso o spam';

  @override
  String get adminAccessTitle => 'Pag-access ng admin';

  @override
  String get adminAccessSubtitle =>
      'Ilagay ang iyong admin code para buksan ang panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — sariling code, itong chat lang';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount minsan gamit ang iyong Lightning wallet, pagkatapos ay magpadala ng screenshot';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Nasa loob na ang iyong screenshot. Sinusuri ito ng isang admin at nag-on ang premium para sa iyong account sa loob $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Magbayad $amount kasama $method, o $wallet.\n2. I-screenshot ang kumpirmasyon ng pagbabayad.\n3. Ipadala ito mula sa Isumite ang patunay ng pagbabayad.\n4. Naka-on ang premium at nananatili habang buhay.\n\nAng CRYPT ay binuo ng isang solong developer, at ito ang buong alok: isang pagbabayad, walang subscription.';
  }

  @override
  String get reportIntro =>
      'Sabihin sa amin kung ano ang nangyari. Kung nag-uulat ka ng ibang tao, idagdag ang kanilang username para makakilos kami sa tamang account.';

  @override
  String get reportSent => 'Ipinadala ang ulat. salamat po.';

  @override
  String get reportSendFailed => 'Hindi maipadala ang ulat.';

  @override
  String get reportTypeLabel => 'Uri ng ulat';

  @override
  String get reportCategoryBug => 'Bug';

  @override
  String get reportCategoryAbuse => 'Pang-aabuso';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Iba pa';

  @override
  String get reportUsernameLabel => 'Ang kanilang username (opsyonal)';

  @override
  String get reportUsernameHint => 'hal. someone_you_want_reported';

  @override
  String get reportDetailsLabel => 'anong nangyari?';

  @override
  String get reportScreenshotsLabel => 'Mga screenshot';

  @override
  String get reportAddScreenshot => 'Magdagdag ng screenshot';

  @override
  String get reportSendButton => 'Magpadala ng ulat';

  @override
  String get reportPrivacyNote =>
      'Ang mga ulat ay sinusuri ng isang administrator. Ang mga screenshot ay pribado na iniimbak at makikita lamang ng mga moderator.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount minsan, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Walang subscription at walang ire-renew. Magbayad gamit ang $method, magpadala ng screenshot ng kumpirmasyon, at naka-on ang premium sa loob $window.';
  }

  @override
  String get premiumSoloNote =>
      'Ang CRYPT ay binuo ng isang solong developer. Ang Premium ang nagpapanatili nitong walang ad at aktibong pinapanatili.';

  @override
  String get premiumStepPay => 'Magbayad gamit ang iyong wallet';

  @override
  String get premiumLightningAddressLabel => 'Address ng kidlat';

  @override
  String get premiumOpenWallet => 'Buksan ang wallet';

  @override
  String get premiumCopyAddress => 'Kopyahin ang address';

  @override
  String get premiumWorksWith =>
      'Gumagana sa Phoenix at anumang iba pang Lightning wallet.';

  @override
  String get premiumStepScreenshot => 'Ipadala ang iyong screenshot';

  @override
  String get premiumScreenshotHint =>
      'Kumuha ng screenshot ng kumpirmasyon ng pagbabayad sa iyong Lightning wallet at ilakip ito sa ibaba.';

  @override
  String get premiumAttachScreenshot => 'Maglakip ng screenshot';

  @override
  String get premiumReplaceScreenshot => 'Palitan ang screenshot';

  @override
  String get premiumStepAmount => 'Kumpirmahin ang halaga';

  @override
  String get premiumAmountLabel => 'Halaga na iyong binayaran (USD)';

  @override
  String get premiumNoteLabel => 'Tandaan (opsyonal)';

  @override
  String get premiumSendProof => 'Ipadala ang aking patunay';

  @override
  String get premiumAddressCopied => 'Kinopya ang address ng Lightning.';

  @override
  String get premiumAttachConfirmation =>
      'Mag-attach ng screenshot ng iyong kumpirmasyon sa pagbabayad.';

  @override
  String get premiumSendProofFailed =>
      'Hindi maipadala ang patunay ng pagbabayad.';

  @override
  String premiumAmountHelper(String amount) {
    return 'pinakamababa $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Ang pag-activate ay tumatagal $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Natanggap ang patunay. Naka-on ang premium sa loob $window.';
  }

  @override
  String get premiumTableFeature => 'Tampok';

  @override
  String get premiumTableFree => 'Libre';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted =>
      'Naka-encrypt na peer-to-peer na pagmemensahe';

  @override
  String get premiumTableMessagesStay =>
      'Mananatili ang mga mensahe sa iyong mga device';

  @override
  String get premiumTableChatLocks =>
      'Naka-lock ang mga chat gamit ang sarili mong PIN';

  @override
  String get premiumTableFingerprint =>
      'I-unlock gamit ang fingerprint o mukha';

  @override
  String get premiumTablePrice => 'Presyo';

  @override
  String get premiumTableAccess => 'Access';

  @override
  String get premiumTableIncluded => 'Kasama';

  @override
  String get premiumTableOneChat => '1 chat';

  @override
  String get premiumTableUnlimited => 'Walang limitasyon';

  @override
  String get premiumTableNotIncluded => 'Hindi kasama';

  @override
  String get premiumTableFreeValue => 'Libre';

  @override
  String get premiumTableWhileFree => 'Habang ang app ay libre';

  @override
  String get premiumTableLifetime => 'Panghabambuhay';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Isang pagbabayad ng $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Isang pagbabayad ng $amount at ang premium ay sa iyo habang buhay. Walang subscription at walang ire-renew.';
  }

  @override
  String get settingsSaveFailed =>
      'Hindi ma-save ang setting na iyon. Subukan muli.';

  @override
  String get settingsLockFailed =>
      'Hindi ma-lock ang chat na ito. Subukan muli.';

  @override
  String get settingsUnlockFailed =>
      'Hindi ma-unlock ang chat na ito. Subukan muli.';

  @override
  String pinSetTitle(String chat) {
    return 'Magtakda ng PIN para sa $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Kumpirmahin ang PIN para sa $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Magbubukas ang PIN na ito $chat lamang. Ang bawat chat ay may sariling PIN, ikaw ang pumili. Walang iisang code para sa app.';
  }

  @override
  String get pinMismatch =>
      'Hindi tumugma ang mga PIN. Hindi pinagana ang lock.';

  @override
  String get biometricNotSetUp =>
      'Walang fingerprint o face unlock na naka-set up sa device na ito.';

  @override
  String get biometricVerifyFailed =>
      'Hindi ma-verify na ikaw ito sa device na ito.';

  @override
  String get lightningAddressCopied =>
      'Kinopya ang address ng Lightning. Idikit ito sa wallet para magbayad.';

  @override
  String get accountSuspended => 'Nasuspinde ang account';

  @override
  String get premiumLifetimeAccess => 'Panghabambuhay na Premium Access';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Magbayad $amount mula sa $method sa Lightning address sa itaas.';
  }

  @override
  String get premiumActivationStep2 =>
      'Kumuha ng screenshot ng kumpirmasyon sa pagbabayad at ipadala ito bilang iyong patunay ng pagbabayad.';

  @override
  String get pinFourDigits => 'Maglagay ng eksaktong 4 na digit.';

  @override
  String get scanOwnCode =>
      'Iyan ang sarili mong code. I-scan ang CRYPT code ng ibang tao para magsimula ng chat sa kanila.';

  @override
  String get couldNotGenerateQrImage => 'Hindi makabuo ng QR na larawan';

  @override
  String get conversationUpdateFailed =>
      'Nabigo ang pag-update ng pag-uusap. Subukan muli.';

  @override
  String get conversationCreationFailed =>
      'Nabigo ang paggawa ng pag-uusap. Subukan muli.';

  @override
  String get accountSuspendedByAdmin =>
      'Ang account na ito ay sinuspinde ng isang administrator.';
}
