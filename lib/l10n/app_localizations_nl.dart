// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Algemene voorwaarden';

  @override
  String get settingsTermsAndConditions => 'Algemene voorwaarden';

  @override
  String get termsIntro =>
      'CRYPT is een toepassing in een vroeg stadium om mensen rechtstreeks met elkaar in contact te brengen voor gesprekken. U bent verantwoordelijk voor het juiste gebruik van de applicatie en voor het veilig houden van uw accountgegevens.';

  @override
  String get termsConnectivity =>
      'CRYPT maakt gebruik van onlinediensten om apparaten te helpen verbindingen te ontdekken en tot stand te brengen. Beschikbaarheid en verbindingsgedrag kunnen veranderen naarmate de applicatie zich ontwikkelt. Vertrouw alstublieft niet op CRYPT als uw enige communicatiemiddel.';

  @override
  String get termsAgreement =>
      'Door verder te gaan, bevestigt u dat u CRYPT onder deze voorwaarden heeft gelezen en ermee akkoord gaat deze te gebruiken.';

  @override
  String get agreeTerms => 'Ik ga akkoord met de Algemene Voorwaarden';

  @override
  String get agreeAndContinue => 'Akkoord en doorgaan';

  @override
  String get beforeYouStart => 'Voordat u begint';

  @override
  String get connected => 'Aangesloten';

  @override
  String get connectFirstThenChat => 'Maak eerst verbinding en chat dan';

  @override
  String get betaIntro =>
      'CRYPT is een vroege bètaversie, dus de ervaring kan in toekomstige versies verbeteren.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT werkt als een walkietalkie: beide mensen moeten tegelijkertijd online zijn en CRYPT open hebben om de verbinding tot stand te brengen.';

  @override
  String get howToUseCrypt =>
      'CRYPT gebruiken:\n1. Scan de CRYPT QR-code van de andere persoon.\n2. Beide mensen hebben CRYPT open en online nodig.\n3. Wacht terwijl CRYPT de P2P-verbinding tot stand brengt.\n4. Wacht tot de status \'Verbinden...\' verdwijnt en de verbinding tot stand is gebracht.\n5. Eenmaal verbonden, kunt u beginnen met chatten.';

  @override
  String get messageStorageExplanation =>
      'Uw berichten zijn ontworpen om rechtstreeks tussen verbonden apparaten te reizen. CRYPT bewaart uw chatberichten niet op onze servers. De server helpt momenteel bij de verbinding en signalering, en de chatgeschiedenis wordt niet op de server opgeslagen. Als de andere persoon offline is, kan de huidige P2P-verbinding niet tot stand worden gebracht.';

  @override
  String get settingsAndSupportExplanation =>
      'Ga naar Instellingen om uw CRYPT-ervaring aan te passen. Er komen binnenkort meer aanpassingsmogelijkheden.\n\nCRYPT steunen? Je vindt de donatieoptie in Instellingen.';

  @override
  String get saving => 'Besparing...';

  @override
  String get continueToCrypt => 'Ga verder naar CRYPT';

  @override
  String get showSplashScreen => 'Laat het splash-scherm zien';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get connectionFailed => 'Verbinding mislukt';

  @override
  String get connectionFailedDetails =>
      'Verbinding mislukt. Beide apparaten moeten online zijn en CRYPT open om verbinding te kunnen maken.';

  @override
  String get gallery => 'Galerij';

  @override
  String get alignQrCode => 'LIJN QR-CODE UIT';

  @override
  String get scanFromGallery => 'SCANNEN UIT GALERIJ';

  @override
  String get couldNotScanImage => 'Kan afbeelding niet scannen.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Kan QR-code niet delen: $error';
  }

  @override
  String newContact(String username) {
    return 'Nieuw contact: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Uw openbare coderingssleutel ontbreekt.';

  @override
  String get contactEncryptionKeyMissing =>
      'De contactversleutelingssleutel ontbreekt.';

  @override
  String get localEncryptionKeyMissing => 'Lokale coderingssleutel ontbreekt.';

  @override
  String get noQrCodeFound => 'Er is geen QR-code gevonden in deze afbeelding.';

  @override
  String get shareQrCode => 'Deel QR-code';

  @override
  String get welcome => 'Welkom';

  @override
  String get login => 'Inloggen';

  @override
  String get signup => 'Registreren';

  @override
  String get settings => 'Instellingen';

  @override
  String get chats => 'Chats';

  @override
  String get typeMessage => 'Typ een bericht...';

  @override
  String get send => 'Verzenden';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Verbinden...';

  @override
  String get connectingP2p => 'Verbinden met P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P niet gereed.';

  @override
  String get searchLanguage => 'Taal zoeken...';

  @override
  String get language => 'Taal';

  @override
  String get forceEscapeSignOutTitle => 'NOOD-AFMELDING FORCEREN?';

  @override
  String get forceEscapeSignOutContent =>
      'WAARSCHUWING: Alle apparaatgegevens worden gewist.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get wipeDevice => 'APPARAAT WISSEN';

  @override
  String get accountDestructionAlertTitle => 'ACCOUNTVERWIJDERING';

  @override
  String get accountDestructionWarning =>
      'WAARSCHUWING: Apparaatgegevens en berichten op afstand worden gewist.';

  @override
  String get accountDestructionCriticalNotice =>
      'CRUCIAAL: Verkeerde codes vergrendelen het systeem. Gebruik uw Accountwachtwoord of Nooduitgang.';

  @override
  String verificationSecurityKey(String code) {
    return 'Beveiligingssleutel: $code';
  }

  @override
  String get copyDigitsHint => 'Kopieer de 5 cijfers';

  @override
  String get codeMismatchNotice =>
      'Code komt niet overeen. Voer uw Masterwachtwoord in of wacht 10 minuten.';

  @override
  String get accountPasswordLabel => 'Accountwachtwoord';

  @override
  String get deleteEverythingPermanently => 'ALLES VERWIJDEREN';

  @override
  String get escapeAndPurgeDeviceData => 'Ontsnappen & Gegevens Wissen';

  @override
  String get addContact => 'Contact toevoegen';

  @override
  String get addContactConfirmation => 'Dit contact toevoegen?';

  @override
  String get noMessagesYet => 'Nog geen berichten';

  @override
  String get addNewContact => 'Nieuw contact';

  @override
  String get usernameLabel => 'Gebruikersnaam';

  @override
  String get nicknameOptionalLabel => 'Bijnaam (optioneel)';

  @override
  String get add => 'Toevoegen';

  @override
  String get usernameCannotBeEmpty => 'Gebruikersnaam vereist';

  @override
  String contactAlreadyExists(String name) {
    return 'Contact \'$name\' bestaat al.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Gebruiker \'$name\' niet gevonden. Gedeeld geheim niet beschikbaar.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name toegevoegd!';
  }

  @override
  String get contacts => 'Contacten';

  @override
  String get noContactsYet => 'Nog geen contacten';

  @override
  String get securityLockoutActive => 'Beveiligingsvergrendeling';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Te veel pogingen. Vergrendeld voor $minutes min.';
  }

  @override
  String get acknowledge => 'Bevestigen';

  @override
  String get accessBlocked => 'Toegang geblokkeerd';

  @override
  String accessSuspended(int minutes) {
    return '5 mislukte pogingen. Opgeschort voor $minutes min.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Ontgrendelen: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Pogingen over: $count';
  }

  @override
  String get secureKeyPasscode => 'Beveiligingscode';

  @override
  String get warningHardwareLockout =>
      'WAARSCHUWING: Volgende fout vergrendelt de beveiliging.';

  @override
  String get abort => 'Afbreken';

  @override
  String get authenticate => 'Verifiëren';

  @override
  String get searchPipelinesHint => 'Beveiligde verbindingen zoeken...';

  @override
  String get zeroPipelinesDiscovered => 'Geen verbindingen gevonden.';

  @override
  String get processingDecryption => 'Ontsleutelen...';

  @override
  String get decrypting => 'Ontsleutelen...';

  @override
  String get decryptionError => '[Ontsleutelfout]';

  @override
  String get cryptContainerSecure => 'CRYPT-CONTAINER BEVEILIGD';

  @override
  String get connectAnAccount => 'Account koppelen';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get enterMasterSecurityPassword => 'Voer uw Masterwachtwoord in';

  @override
  String get pleaseFillAllFields => 'Vul alle velden in';

  @override
  String get wrongUsernameOrPassword => 'Onjuiste gebruikersnaam of wachtwoord';

  @override
  String loginError(String error) {
    return 'Inlogfout: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Geen account? Registreren';

  @override
  String get myIdentity => 'Mijn identiteit';

  @override
  String get scanToAddMe => 'Scan om mij toe te voegen';

  @override
  String get shareProfileLink => 'Profiel delen';

  @override
  String addMeOnCrypt(String link) {
    return 'Voeg mij toe op CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'QR scannen';

  @override
  String get invalidCryptQrFormat => 'Ongeldige CRYPT QR-code.';

  @override
  String get userScanned => 'Gebruiker gescand!';

  @override
  String addingUser(String username) {
    return '$username toevoegen...';
  }

  @override
  String get defaultUser => 'Gebruiker';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get keepPasswordSecureHint =>
      'Bewaar het veilig. Wachtwoord kan niet worden gewijzigd.';

  @override
  String get pleaseFillInAllFields => 'Vul alle velden in';

  @override
  String get usernameExceedsLimit => 'Gebruikersnaam max. 20 tekens';

  @override
  String get invalidUsernameCharacters =>
      'Gebruik alleen letters, cijfers, _ of -.';

  @override
  String get weakPasswordNotice =>
      'Gebruik 8+ tekens, 1 cijfer en 1 hoofdletter.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Kan geen unieke gebruikersnaam genereren.';

  @override
  String get accountCreated => 'Account aangemaakt';

  @override
  String yourUsernameIs(String username) {
    return 'Uw gebruikersnaam:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Gebruikersnaam \'$chosen\' is bezet.\n\nUw gebruikersnaam:\n\n$assigned\n\nBewaar deze voor het inloggen.';
  }

  @override
  String get continueText => 'Doorgaan';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Aanmaken van identiteit mislukt: $error';
  }

  @override
  String get welcomeToCrypt => 'Welkom bij CRYPT';

  @override
  String get signupDescription =>
      'Maak een gebruikersnaam en wachtwoord aan om P2P-sleutels te genereren.';

  @override
  String get chooseAUsername => 'Kies een gebruikersnaam';

  @override
  String get usernameHelperText =>
      'Gebruik niet uw echte naam. Als deze bezet is, wordt een achtervoegsel toegevoegd.';

  @override
  String get masterAuthenticationRequired => 'Master-authenticatie';

  @override
  String get verify => 'Verifiëren';

  @override
  String get darkThemeMode => 'Donker thema';

  @override
  String get secureConversations => 'Beveiligde gesprekken';

  @override
  String get noActiveConversations =>
      'Geen actieve chats. Start er een om vergrendelingen in te schakelen.';

  @override
  String get logout => 'Uitloggen';

  @override
  String get wipeDeviceAndEscape => 'APPARAAT WISSEN';

  @override
  String get falsePassword => 'Verkeerd wachtwoord';

  @override
  String accessSuspendedTimer(String time) {
    return 'Toegang opgeschort. Probeer het opnieuw over $time.';
  }

  @override
  String get selectSecureLockMethod => 'Selecteer vergrendelingsmethode';

  @override
  String get selectSecureLockDescription =>
      'Vergrendelen met vingerafdruk of 4-cijferige pincode?';

  @override
  String get fourDigitPin => '4-cijferige pincode';

  @override
  String get fingerprintUnlock => 'Vingerafdruk 🔓';

  @override
  String get supportSoloDeveloper => 'Ondersteun ontwikkelaar';

  @override
  String get supportIntro =>
      'Hoi! 👋 Ik ben een solo-ontwikkelaar die hard aan CRYPT werkt. Ik heb geen budget of bedrijfsfinanciering. Ik vertrouw volledig op uw eerlijkheid en empathie om de app te blijven verbeteren en om ALTIJD GEEN ADVERTENTIES te garanderen.';

  @override
  String get chooseSupportAmount =>
      'Kies uw prijs (schuif naar ondersteuning):';

  @override
  String get poorGang => 'Ik ben een arme bende 🥀✌️';

  @override
  String get launchOfferMinimum => 'Lanceringsaanbieding minimaal 🚀';

  @override
  String get buyMeCoffee => 'Koop een koffie voor mij ☕';

  @override
  String get superSupporter => 'Superondersteuner 🔥';

  @override
  String get feature => 'Functie';

  @override
  String get freeTier => 'Gratis niveau';

  @override
  String get premium => 'Premie';

  @override
  String get chatLocks => 'Chatsloten';

  @override
  String get maxOneRoom => 'Maximaal 1 kamer';

  @override
  String get unlimited => 'Onbeperkt';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get disabled => '🚫 Uitgeschakeld';

  @override
  String supportWithSats(String amount) {
    return 'Ondersteuning met $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ BOLT12-betalingsaanbod • Tik om te kopiëren';

  @override
  String get boltOfferCopied => 'BOLT12-betalingsaanbod gekopieerd';

  @override
  String get tapToCopyBoltOffer =>
      'Tik om het BOLT12-betalingsaanbod te kopiëren';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Eenvoudige instructies om te ontgrendelen:';

  @override
  String unlockInstructions(String username) {
    return '1. Betaal met Phoenix Wallet op Android (minimaal 7.500 om te ontgrendelen – meer wordt altijd op prijs gesteld).\n2. Maak een screenshot van uw succesvolle transactiebevestigingsscherm.\n3. E-mail die schermafbeelding naar jounaidnadirmed@gmail.com en vertel mij uw unieke accountgebruikersnaam: \'$username\', zodat ik weet wie heeft betaald.\n4. Typ iets in het onderstaande vak om uw verzoek op dit apparaat op te slaan:';
  }

  @override
  String get supportRequestHint => 'Typ hier uw naam of transactiegegevens...';

  @override
  String get maybeLater => 'Misschien later';

  @override
  String get submitProof => 'Bewijs indienen';

  @override
  String get couldNotOpenWallet =>
      'Wallet kon niet worden geopend. Kopieer de onderstaande code.';

  @override
  String get proofSubmittedSnackbar =>
      'Bewijs ingediend. Handmatige beoordeling: 24–48 uur (weekenden uitgesloten).';
}
