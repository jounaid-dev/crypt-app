// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Vigezo &amp; Masharti';

  @override
  String get settingsTermsAndConditions => 'Vigezo &amp; Masharti';

  @override
  String get termsIntro =>
      'CRYPT ni programu ya hatua za mwanzo kwa ajili ya kuunganisha watu moja kwa moja kwa ajili ya mazungumzo. Una jukumu la kutumia programu ipasavyo na kuweka vitambulisho vya akaunti yako salama.';

  @override
  String get termsConnectivity =>
      'CRYPT hutumia huduma za mtandaoni kusaidia vifaa kugundua na kuanzisha muunganisho. Upatikanaji na mwenendo wa muunganisho unaweza kubadilika kadiri programu inavyoendelea. Tafadhali usitegemee CRYPT kama njia yako pekee ya mawasiliano.';

  @override
  String get termsAgreement =>
      'Kwa kuendelea, unathibitisha kwamba umesoma na unakubali kutumia fumbo chini YA masharti haya.';

  @override
  String get agreeTerms => 'Ninakubali vigezo na masharti';

  @override
  String get agreeAndContinue => 'Kubali na uendelee';

  @override
  String get beforeYouStart => 'Vidokezo kabla ya kuanza ';

  @override
  String get connected => 'Imeunganishwa';

  @override
  String get connectFirstThenChat => 'Unganisha kwanza, kisha gumzo';

  @override
  String get betaIntro =>
      'CRYPT ni toleo la awali la beta, kwa hivyo tukio linaweza kuboreshwa katika matoleo ya baadaye.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT inafanya kazi kama walkie-talkie: watu wote wawili wanahitaji kuwa mtandaoni na kuwa na CRYPT wazi wakati huo huo ili kuanzisha muunganisho.';

  @override
  String get howToUseCrypt =>
      'Jinsi ya kutumia FUMBO:\n1. Changanua msimbo wa siri wa QR WA mtu mwingine.\n2. Watu wote wawili wanahitaji FUMBO wazi na mtandaoni.\n3. Subiri wakati FUMBO linaanzisha muunganisho wa P2P.\n4. Subiri hali ya \"Kuunganisha...\" ipotee na muunganisho uanzishwe.\n5. Mara baada ya kuunganishwa, unaweza kuanza kuzungumza.';

  @override
  String get messageStorageExplanation =>
      'Ujumbe wako umeundwa kusafiri moja kwa moja kati ya vifaa vilivyounganishwa. CRYPT haihifadhi ujumbe wako wa gumzo kwenye seva zetu. Seva kwa sasa husaidia na muunganisho na ishara, na historia ya gumzo haijahifadhiwa kwenye seva. Ikiwa mtu mwingine yuko nje ya mtandao, muunganisho wa sasa wa P2P hauwezi kuanzishwa.';

  @override
  String get settingsAndSupportExplanation =>
      'Tembelea Mipangilio ili kufanya tukio lako la KISIRI liwe mahususi. Machaguo zaidi ya marekebisho yanakuja hivi karibuni.\n\nUngependa kuunga mkono USIMBUAJI? Unaweza kupata chaguo la mchango katika Mipangilio.';

  @override
  String get saving => 'Akiba';

  @override
  String get continueToCrypt => 'Endelea kupiga KELELE';

  @override
  String get showSplashScreen => 'Onyesha skrini ya kupeperusha';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get connectionFailed => 'Muunganisho umeshindwa';

  @override
  String get connectionFailedDetails =>
      'Muunganisho umeshindikana. Vifaa vyote viwili lazima viwe mtandaoni na FUMBO limefunguliwa ili kuunganishwa.';

  @override
  String get gallery => 'Kihifadhi';

  @override
  String get alignQrCode => 'PANGILIA MSIMBO WA QR';

  @override
  String get scanFromGallery => 'CHANGANUA KUTOKA KWENYE NYUMBA YA SANAA';

  @override
  String get couldNotScanImage => 'Haikuweza kuchanganua picha.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Haikuweza kushiriki msimbo wa QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Anwani mpya: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Ufunguo wako wa usimbaji fiche wa umma haupo.';

  @override
  String get contactEncryptionKeyMissing =>
      'Ufunguo wa usimbaji fiche wa mawasiliano haupo.';

  @override
  String get localEncryptionKeyMissing =>
      'Ufunguo wa usimbaji fiche wa eneo husika haupo.';

  @override
  String get noQrCodeFound =>
      'Hakuna msimbo wa QR unaopatikana kwenye picha hii.';

  @override
  String get shareQrCode => 'Shiriki Msimbo wa QR';

  @override
  String get welcome => 'Karibu';

  @override
  String get login => 'Ingia';

  @override
  String get signup => 'Jisajili';

  @override
  String get settings => 'Mipangilio';

  @override
  String get chats => 'Mazungumzo';

  @override
  String get typeMessage => 'Andika ujumbe...';

  @override
  String get send => 'Tuma';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Inaunganisha...';

  @override
  String get connectingP2p => 'Inaunganisha kwenye P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P haiko tayari.';

  @override
  String get searchLanguage => 'Tafuta lugha...';

  @override
  String get language => 'Lugha';

  @override
  String get forceEscapeSignOutTitle => 'LAZIMISHA KUJIONDOA KWA DHARURA?';

  @override
  String get forceEscapeSignOutContent =>
      'ONYO: Kitendo hiki kitafuta kabisa data zote kutoka kwenye kifaa hiki.';

  @override
  String get cancel => 'Ghairi';

  @override
  String get wipeDevice => 'FUTA KIFAA';

  @override
  String get accountDestructionAlertTitle => 'TAHADHARI YA KUFUTA AKAUNTI';

  @override
  String get accountDestructionWarning =>
      'ONYO: Kitendo hiki kitafuta data zako zote kutoka kwenye kifaa hiki. Baada ya kuunganishwa kwenye Intaneti, amri ya mbali ya kujiharibu itaamilishwa. Ujumbe wote uliotumwa kutoka kwa kitambulisho chako cha kipekee cha mtumiaji utafutwa kabisa kutoka kwenye kumbukumbu za vifaa vyote vya mawasiliano.';

  @override
  String get accountDestructionCriticalNotice =>
      'MUHIMU SANA: Ukiingiza nambari hizi za uthibitishaji kimakosa, mfumo utafunga kifaa. Ili kukifungua, lazima uweke Nenosiri Kuu la Akaunti au utumie njia ya dharura ya kutoroka, ambayo itafuta kabisa data kwenye kifaa hiki mara moja.';

  @override
  String verificationSecurityKey(String code) {
    return 'Ufunguo wa Usalama wa Uthibitishaji: $code';
  }

  @override
  String get copyDigitsHint => 'Nakili tarakimu 5 zilizo hapo juu';

  @override
  String get codeMismatchNotice =>
      'Msimbo haulingani. Weka Nenosiri Kuu ili kupita ulinzi au subiri dakika 10.';

  @override
  String get accountPasswordLabel => 'Nenosiri la Akaunti';

  @override
  String get deleteEverythingPermanently => 'FUTA KILA KITU KABISA';

  @override
  String get escapeAndPurgeDeviceData => 'Toka na ufute data ya kifaa';

  @override
  String get addContact => 'Ongeza anwani';

  @override
  String get addContactConfirmation => 'Ongeza anwani hii?';

  @override
  String get noMessagesYet => 'Bado hakuna ujumbe';

  @override
  String get addNewContact => 'Ongeza anwani mpya';

  @override
  String get usernameLabel => 'Jina la mtumiaji';

  @override
  String get nicknameOptionalLabel => 'Jina la utani (si lazima)';

  @override
  String get add => 'Ongeza';

  @override
  String get usernameCannotBeEmpty => 'Jina la mtumiaji haliwezi kuwa tupu';

  @override
  String contactAlreadyExists(String name) {
    return 'Anwani «$name» tayari ipo kwenye kitabu chako cha anwani.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Mtumiaji «$name» hakupatikana kwenye sajili ya mtandao. Haiwezekani kuunda siri ya pamoja.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Anwani $name imeongezwa kwa mafanikio!';
  }

  @override
  String get contacts => 'Anwani';

  @override
  String get noContactsYet => 'Bado hakuna anwani';

  @override
  String get securityLockoutActive => 'Kufungiwa kwa usalama kumewashwa';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Majaribio mengi yasiyo sahihi. Ufikiaji umefungwa kwa dakika $minutes.';
  }

  @override
  String get acknowledge => 'Nimeelewa';

  @override
  String get accessBlocked => 'Ufikiaji umezuiwa';

  @override
  String accessSuspended(int minutes) {
    return 'Majaribio 5 ya uthibitishaji hayakufaulu. Ufikiaji umesimamishwa kwa dakika $minutes zijazo.';
  }

  @override
  String get ok => 'Sawa';

  @override
  String unlockSecureNode(String username) {
    return 'Fungua nodi salama: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Majaribio ya uthibitishaji yaliyosalia: $count';
  }

  @override
  String get secureKeyPasscode => 'Msimbo wa ufunguo wa usalama';

  @override
  String get warningHardwareLockout =>
      'ONYO: Hitilafu nyingine itasababisha mfumo wa usalama kufunga kifaa.';

  @override
  String get abort => 'Ghairi';

  @override
  String get authenticate => 'Thibitisha';

  @override
  String get searchPipelinesHint =>
      'Inatafuta miunganisho salama inayotumika...';

  @override
  String get zeroPipelinesDiscovered =>
      'Hakuna miunganisho inayolingana iliyopatikana.';

  @override
  String get processingDecryption => 'Inasimbua...';

  @override
  String get decrypting => 'Inasimbua...';

  @override
  String get decryptionError => '[Hitilafu ya usimbuaji]';

  @override
  String get cryptContainerSecure => 'KONTEINA YA CRYPT IMELINDWA';

  @override
  String get connectAnAccount => 'Unganisha akaunti';

  @override
  String get username => 'Jina la mtumiaji';

  @override
  String get password => 'Nenosiri';

  @override
  String get enterMasterSecurityPassword => 'Weka Nenosiri Kuu la Usalama';

  @override
  String get pleaseFillAllFields => 'Tafadhali jaza sehemu zote';

  @override
  String get wrongUsernameOrPassword =>
      'Jina la mtumiaji au nenosiri si sahihi';

  @override
  String loginError(String error) {
    return 'Hitilafu ya kuingia: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Huna akaunti? Jisajili';

  @override
  String get myIdentity => 'Utambulisho wangu';

  @override
  String get scanToAddMe => 'Changanua ili kuniongeza';

  @override
  String get shareProfileLink => 'Shiriki kiungo cha wasifu';

  @override
  String addMeOnCrypt(String link) {
    return 'Niongeze kwenye CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Changanua QR';

  @override
  String get invalidCryptQrFormat =>
      'Muundo wa msimbo wa QR wa CRYPT si sahihi.';

  @override
  String get userScanned => 'Mtumiaji amechanganuliwa!';

  @override
  String addingUser(String username) {
    return 'Inaongeza $username...';
  }

  @override
  String get defaultUser => 'Mtumiaji';

  @override
  String get createAccount => 'Unda akaunti';

  @override
  String get keepPasswordSecureHint =>
      'Hifadhi nenosiri lako mahali salama. Huwezi kulibadilisha.';

  @override
  String get pleaseFillInAllFields => 'Tafadhali jaza sehemu zote';

  @override
  String get usernameExceedsLimit =>
      'Jina la mtumiaji haliwezi kuwa na zaidi ya herufi 20';

  @override
  String get invalidUsernameCharacters =>
      'Jina la mtumiaji linaweza kuwa na herufi, nambari, alama ya chini (_) na vistari (-) pekee';

  @override
  String get weakPasswordNotice =>
      'Nenosiri lazima liwe na angalau herufi 8, liwe na nambari na herufi kubwa';

  @override
  String get unableToGenerateUniqueUsername =>
      'Imeshindwa kuunda jina la mtumiaji la kipekee.';

  @override
  String get accountCreated => 'Akaunti imeundwa';

  @override
  String yourUsernameIs(String username) {
    return 'Jina lako la mtumiaji ni:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Jina la mtumiaji «$chosen» tayari limechukuliwa.\n\nJina lako la mtumiaji ni:\n\n$assigned\n\nLikumbuke. Utalihitaji ili kuingia.';
  }

  @override
  String get continueText => 'Endelea';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Imeshindwa kuunda utambulisho salama: $error';
  }

  @override
  String get welcomeToCrypt => 'Karibu kwenye CRYPT';

  @override
  String get signupDescription =>
      'Unda jina la mtumiaji na nenosiri ili kuzalisha funguo zako za usimbaji fiche wa P2P.';

  @override
  String get chooseAUsername => 'Chagua jina la mtumiaji';

  @override
  String get usernameHelperText =>
      'Usitumie jina lako halisi. Ikiwa jina la mtumiaji tayari limechukuliwa, tutaongeza kiambishi tamati cha kipekee kiotomatiki.';

  @override
  String get masterAuthenticationRequired => 'Uthibitishaji mkuu unahitajika';

  @override
  String get verify => 'Thibitisha';

  @override
  String get darkThemeMode => 'Mandhari meusi';

  @override
  String get secureConversations => 'Mazungumzo salama';

  @override
  String get noActiveConversations =>
      'Hakuna mazungumzo yanayotumika. Anzisha mazungumzo ili kuwezesha kufuli za usalama.';

  @override
  String get logout => 'Ondoka';

  @override
  String get wipeDeviceAndEscape => 'FUTA KIFAA NA TOKA';

  @override
  String get falsePassword => 'Nenosiri lisilo sahihi';

  @override
  String accessSuspendedTimer(String time) {
    return 'Ufikiaji umesimamishwa kwa sababu za usalama. Jaribu tena baada ya $time.';
  }

  @override
  String get selectSecureLockMethod => 'Chagua njia ya kufuli salama';

  @override
  String get selectSecureLockDescription =>
      'Je, ungependa kufunga mazungumzo haya kwa kutumia alama ya kidole ya kifaa au PIN ya kawaida ya tarakimu 4?';

  @override
  String get fourDigitPin => 'PIN ya tarakimu 4';

  @override
  String get fingerprintUnlock => 'Alama ya kidole 🔓';

  @override
  String get supportSoloDeveloper => 'Msaidie msanidi programu huru';

  @override
  String get supportIntro =>
      'Habari! 👋 Mimi ni msanidi wa solo ninafanya kazi kwa bidii kwenye CRYPT. Sina bajeti au ufadhili wa shirika. Ninategemea kabisa uaminifu wako na huruma yako ili kuendelea kuboresha programu na kukuhakikishia HAKUNA MATANGAZO MILELE.';

  @override
  String get chooseSupportAmount => 'Chagua Bei Yako (Slaidi ili kuauni):';

  @override
  String get poorGang => 'Mimi ni genge masikini 🥀✌️';

  @override
  String get launchOfferMinimum => 'Zindua Kima cha Chini cha Ofa 🚀';

  @override
  String get buyMeCoffee => 'Ninunulie Kahawa ☕';

  @override
  String get superSupporter => 'Msaidizi Mkuu 🔥';

  @override
  String get feature => 'Kipengele';

  @override
  String get freeTier => 'Kiwango cha Bure';

  @override
  String get premium => 'Ya kipekee';

  @override
  String get chatLocks => 'Kufuli za Gumzo';

  @override
  String get maxOneRoom => 'Upeo wa Chumba 1';

  @override
  String get unlimited => 'Bila kikomo';

  @override
  String get biometrics => 'Biometriska';

  @override
  String get disabled => '🚫 Walemavu';

  @override
  String supportWithSats(String amount) {
    return 'Usaidizi wa sati $amount (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ Ofa ya malipo ya BOLT12 • Gusa ili unakili';

  @override
  String get boltOfferCopied => 'Ofa ya malipo ya BOLT12 imenakiliwa';

  @override
  String get tapToCopyBoltOffer => 'Gusa ili unakili toleo la malipo la BOLT12';

  @override
  String get simpleInstructionsToUnlock => '📬 Maagizo Rahisi ya Kufungua:';

  @override
  String unlockInstructions(String username) {
    return '1. Lipa kwa kutumia Phoenix Wallet kwenye Android (7,500 kima cha chini zaidi ili ufungue — mengi zaidi yanathaminiwa kila wakati).\n2. Piga picha ya skrini ya skrini iliyofanikiwa ya uthibitishaji wa muamala.\n3. Tuma barua pepe hiyo picha ya skrini kwa jounaidnadirmed@gmail.com na uniambie jina lako la mtumiaji la kipekee la akaunti: \'$username\' ili nijue ni nani aliyelipa.\n4. Andika chochote katika kisanduku kilicho hapa chini ili kuhifadhi ombi lako kwenye kifaa hiki:';
  }

  @override
  String get supportRequestHint =>
      'Andika jina lako au maelezo ya muamala hapa...';

  @override
  String get maybeLater => 'Labda baadaye';

  @override
  String get submitProof => 'Wasilisha uthibitisho';

  @override
  String get couldNotOpenWallet =>
      'Imeshindwa kufungua pochi kiotomatiki. Nakili msimbo wa maandishi hapa chini.';

  @override
  String get proofSubmittedSnackbar =>
      'Uthibitisho umetumwa. Ukaguzi wa mwongozo huchukua saa 24–48 (bila kujumuisha wikendi). Unaweza kuendelea kutumia programu kama kawaida.';
}
