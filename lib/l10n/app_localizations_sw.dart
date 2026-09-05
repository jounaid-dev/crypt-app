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
