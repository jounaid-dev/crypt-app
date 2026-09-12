// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Termini e condizioni';

  @override
  String get settingsTermsAndConditions => 'Termini e condizioni';

  @override
  String get termsIntro =>
      'CRYPT è un\'applicazione in fase iniziale per connettere le persone direttamente per le conversazioni. Sei responsabile dell\'utilizzo appropriato dell\'applicazione e della sicurezza delle credenziali del tuo account.';

  @override
  String get termsConnectivity =>
      'CRYPT utilizza servizi online per aiutare i dispositivi a scoprire e stabilire connessioni. La disponibilità e il comportamento della connessione possono cambiare con lo sviluppo dell\'applicazione. Per favore non fare affidamento su CRYPT come unico mezzo di comunicazione.';

  @override
  String get termsAgreement =>
      'Continuando, confermi di aver letto e di accettare di utilizzare CRYPT secondo questi termini.';

  @override
  String get agreeTerms => 'Accetto i Termini e Condizioni';

  @override
  String get agreeAndContinue => 'Accetta e continua';

  @override
  String get beforeYouStart => 'Prima di iniziare';

  @override
  String get connected => 'Collegato';

  @override
  String get connectFirstThenChat => 'Prima connettiti, poi chatta';

  @override
  String get betaIntro =>
      'CRYPT è una versione beta iniziale, quindi l\'esperienza potrebbe migliorare nelle versioni future.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT funziona come un walkie-talkie: entrambe le persone devono essere online e avere CRYPT aperto contemporaneamente per stabilire la connessione.';

  @override
  String get howToUseCrypt =>
      'Come usare la CRIPTA:\n1. Scansiona il codice QR CRYPT dell\'altra persona.\n2. Entrambe le persone hanno bisogno che CRYPT sia aperto e online.\n3. Attendere mentre CRYPT stabilisce la connessione P2P.\n4. Attendere che lo stato \"Connessione in corso...\" scompaia e che la connessione venga stabilita.\n5. Una volta connesso, puoi iniziare a chattare.';

  @override
  String get messageStorageExplanation =>
      'I tuoi messaggi sono progettati per viaggiare direttamente tra i dispositivi connessi. CRYPT non memorizza i tuoi messaggi di chat sui nostri server. Il server attualmente aiuta con la connessione e la segnalazione e la cronologia della chat non è archiviata sul server. Se l\'altra persona è offline, non è possibile stabilire la connessione P2P corrente.';

  @override
  String get settingsAndSupportExplanation =>
      'Visita Impostazioni per personalizzare la tua esperienza CRYPT. Presto arriveranno altre opzioni di personalizzazione.\n\nVuoi sostenere CRYPT? Puoi trovare l\'opzione di donazione nelle Impostazioni.';

  @override
  String get saving => 'Risparmio...';

  @override
  String get continueToCrypt => 'Continua alla CRIPTA';

  @override
  String get showSplashScreen => 'Mostra la schermata iniziale';

  @override
  String get retry => 'Riprova';

  @override
  String get connectionFailed => 'Connessione non riuscita';

  @override
  String get connectionFailedDetails =>
      'Connessione non riuscita. Entrambi i dispositivi devono essere online con CRYPT aperto per connettersi.';

  @override
  String get gallery => 'Galleria';

  @override
  String get alignQrCode => 'ALLINEA IL CODICE QR';

  @override
  String get scanFromGallery => 'SCANSIONE DALLA GALLERIA';

  @override
  String get couldNotScanImage => 'Impossibile scansionare l\'immagine.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Impossibile condividere il codice QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Nuovo contatto: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Manca la tua chiave di crittografia pubblica.';

  @override
  String get contactEncryptionKeyMissing =>
      'Manca la chiave di crittografia del contatto.';

  @override
  String get localEncryptionKeyMissing =>
      'Manca la chiave di crittografia locale.';

  @override
  String get noQrCodeFound => 'Nessun codice QR trovato in questa immagine.';

  @override
  String get shareQrCode => 'Condividi il codice QR';

  @override
  String get welcome => 'Benvenuto';

  @override
  String get login => 'Accedi';

  @override
  String get signup => 'Registrati';

  @override
  String get settings => 'Impostazioni';

  @override
  String get chats => 'Chat';

  @override
  String get typeMessage => 'Scrivi un messaggio...';

  @override
  String get send => 'Invia';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Connessione...';

  @override
  String get connectingP2p => 'Connessione al P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P non pronto.';

  @override
  String get searchLanguage => 'Cerca lingua...';

  @override
  String get language => 'Lingua';

  @override
  String get forceEscapeSignOutTitle => 'FORZARE L\'USCITA?';

  @override
  String get forceEscapeSignOutContent =>
      'ATTENZIONE: Tutti i dati del dispositivo verranno cancellati.';

  @override
  String get cancel => 'Annulla';

  @override
  String get wipeDevice => 'CANCELLA DISPOSITIVO';

  @override
  String get accountDestructionAlertTitle => 'ELIMINAZIONE ACCOUNT';

  @override
  String get accountDestructionWarning =>
      'ATTENZIONE: I dati del dispositivo e i messaggi remoti verranno cancellati.';

  @override
  String get accountDestructionCriticalNotice =>
      'CRITICO: I codici errati bloccano il sistema. Usa la password del tuo account o l\'uscita di emergenza.';

  @override
  String verificationSecurityKey(String code) {
    return 'Chiave di sicurezza: $code';
  }

  @override
  String get copyDigitsHint => 'Copia le 5 cifre';

  @override
  String get codeMismatchNotice =>
      'Codice errato. Inserisci la password principale o attendi 10 minuti.';

  @override
  String get accountPasswordLabel => 'Password dell\'account';

  @override
  String get deleteEverythingPermanently => 'CANCELLA TUTTO';

  @override
  String get escapeAndPurgeDeviceData => 'Esci e cancella i dati';

  @override
  String get addContact => 'Aggiungi contatto';

  @override
  String get addContactConfirmation => 'Aggiungere questo contatto?';

  @override
  String get noMessagesYet => 'Ancora nessun messaggio';

  @override
  String get addNewContact => 'Nuovo contatto';

  @override
  String get usernameLabel => 'Nome utente';

  @override
  String get nicknameOptionalLabel => 'Nickname (opzionale)';

  @override
  String get add => 'Aggiungi';

  @override
  String get usernameCannotBeEmpty => 'Nome utente obbligatorio';

  @override
  String contactAlreadyExists(String name) {
    return 'Il contatto \'$name\' esiste già.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Utente \'$name\' non trovato. Segreto condiviso non disponibile.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name aggiunto!';
  }

  @override
  String get contacts => 'Contatti';

  @override
  String get noContactsYet => 'Ancora nessun contatto';

  @override
  String get securityLockoutActive => 'Blocco di sicurezza';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Troppi tentativi. Bloccato per $minutes min.';
  }

  @override
  String get acknowledge => 'Conferma';

  @override
  String get accessBlocked => 'Accesso bloccato';

  @override
  String accessSuspended(int minutes) {
    return '5 verifiche errate. Sospeso per $minutes min.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Sblocca: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Tentativi rimasti: $count';
  }

  @override
  String get secureKeyPasscode => 'Codice di sicurezza';

  @override
  String get warningHardwareLockout =>
      'ATTENZIONE: Il prossimo errore bloccherà la sicurezza.';

  @override
  String get abort => 'Annulla';

  @override
  String get authenticate => 'Autentica';

  @override
  String get searchPipelinesHint => 'Cerca connessioni sicure...';

  @override
  String get zeroPipelinesDiscovered => 'Nessuna connessione trovata.';

  @override
  String get processingDecryption => 'Decrittografia...';

  @override
  String get decrypting => 'Decrittografia...';

  @override
  String get decryptionError => '[Errore di decrittografia]';

  @override
  String get cryptContainerSecure => 'CONTENITORE CRYPT SICURO';

  @override
  String get connectAnAccount => 'Connetti account';

  @override
  String get username => 'Nome utente';

  @override
  String get password => 'Password';

  @override
  String get enterMasterSecurityPassword => 'Inserisci la password principale';

  @override
  String get pleaseFillAllFields => 'Compila tutti i campi';

  @override
  String get wrongUsernameOrPassword => 'Nome utente o password errati';

  @override
  String loginError(String error) {
    return 'Errore di accesso: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Non hai un account? Registrati';

  @override
  String get myIdentity => 'La mia identità';

  @override
  String get scanToAddMe => 'Scansiona per aggiungermi';

  @override
  String get shareProfileLink => 'Condividi profilo';

  @override
  String addMeOnCrypt(String link) {
    return 'Aggiungimi su CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Scansiona QR';

  @override
  String get invalidCryptQrFormat => 'Codice QR CRYPT non valido.';

  @override
  String get userScanned => 'Utente scansionato!';

  @override
  String addingUser(String username) {
    return 'Aggiunta di $username...';
  }

  @override
  String get defaultUser => 'Utente';

  @override
  String get createAccount => 'Crea account';

  @override
  String get keepPasswordSecureHint =>
      'Conservala al sicuro. La password non può essere modificata.';

  @override
  String get pleaseFillInAllFields => 'Compila tutti i campi';

  @override
  String get usernameExceedsLimit => 'Nome utente: massimo 20 caratteri';

  @override
  String get invalidUsernameCharacters => 'Usa solo lettere, numeri, _ o -.';

  @override
  String get weakPasswordNotice =>
      'Usa almeno 8 caratteri, 1 numero e 1 lettera maiuscola.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Impossibile generare un nome utente univoco.';

  @override
  String get accountCreated => 'Account creato';

  @override
  String yourUsernameIs(String username) {
    return 'Il tuo nome utente:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Il nome utente \'$chosen\' è già in uso.\n\nIl tuo nome utente:\n\n$assigned\n\nConservalo per accedere.';
  }

  @override
  String get continueText => 'Continua';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Creazione dell\'identità non riuscita: $error';
  }

  @override
  String get welcomeToCrypt => 'Benvenuto in CRYPT';

  @override
  String get signupDescription =>
      'Crea un nome utente e una password per generare le chiavi P2P.';

  @override
  String get chooseAUsername => 'Scegli un nome utente';

  @override
  String get usernameHelperText =>
      'Non usare il tuo vero nome. Se è già in uso, verrà aggiunto un suffisso.';

  @override
  String get masterAuthenticationRequired => 'Autenticazione principale';

  @override
  String get verify => 'Verifica';

  @override
  String get darkThemeMode => 'Tema scuro';

  @override
  String get secureConversations => 'Conversazioni sicure';

  @override
  String get noActiveConversations =>
      'Nessuna chat attiva. Avviane una per abilitare i blocchi.';

  @override
  String get logout => 'Disconnetti';

  @override
  String get wipeDeviceAndEscape => 'CANCELLA DISPOSITIVO';

  @override
  String get falsePassword => 'Password errata';

  @override
  String accessSuspendedTimer(String time) {
    return 'Accesso sospeso. Riprova tra $time.';
  }

  @override
  String get selectSecureLockMethod => 'Seleziona metodo di blocco';

  @override
  String get selectSecureLockDescription =>
      'Bloccare con impronta digitale o PIN di 4 cifre?';

  @override
  String get fourDigitPin => 'PIN di 4 cifre';

  @override
  String get fingerprintUnlock => 'Impronta digitale 🔓';

  @override
  String get supportSoloDeveloper => 'Sostieni lo sviluppatore';

  @override
  String get supportIntro =>
      'EHI! 👋 Sono uno sviluppatore solista che lavora duramente su CRYPT. Non ho un budget o finanziamenti aziendali. Mi affido interamente alla tua onestà ed empatia per continuare a migliorare l\'app e garantire NESSUNA PUBBLICITÀ PER SEMPRE.';

  @override
  String get chooseSupportAmount =>
      'Scegli il tuo prezzo (scorri per supportare):';

  @override
  String get poorGang => 'Sono una povera banda 🥀✌️';

  @override
  String get launchOfferMinimum => 'Offerta Lancio Minima 🚀';

  @override
  String get buyMeCoffee => 'Offrimi un caffè ☕';

  @override
  String get superSupporter => 'Super Sostenitore 🔥';

  @override
  String get feature => 'Caratteristica';

  @override
  String get freeTier => 'Livello gratuito';

  @override
  String get premium => 'Premio';

  @override
  String get chatLocks => 'Blocchi chat';

  @override
  String get maxOneRoom => 'Massimo 1 camera';

  @override
  String get unlimited => 'Illimitato';

  @override
  String get biometrics => 'Biometria';

  @override
  String get disabled => '🚫Disabili';

  @override
  String supportWithSats(String amount) {
    return 'Supporto con $amount sat (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ Offerta di pagamento BOLT12 • Tocca per copiare';

  @override
  String get boltOfferCopied => 'Offerta di pagamento BOLT12 copiata';

  @override
  String get tapToCopyBoltOffer =>
      'Tocca per copiare l\'offerta di pagamento BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Semplici istruzioni per sbloccare:';

  @override
  String unlockInstructions(String username) {
    return '1. Paga utilizzando Phoenix Wallet su Android (minimo 7.500 per sbloccare, di più è sempre apprezzato).\n2. Fai uno screenshot della schermata di conferma della transazione riuscita.\n3. Invia lo screenshot via e-mail a jounaidnadirmed@gmail.com e dimmi il nome utente univoco del tuo account: \"$username\" così saprò chi ha pagato.\n4. Digita qualsiasi cosa nella casella sottostante per salvare la tua richiesta su questo dispositivo:';
  }

  @override
  String get supportRequestHint =>
      'Inserisci qui il tuo nome o le informazioni sulla transazione...';

  @override
  String get maybeLater => 'Forse più tardi';

  @override
  String get submitProof => 'Invia prova';

  @override
  String get couldNotOpenWallet =>
      'Impossibile aprire il wallet. Copia il codice qui sotto.';

  @override
  String get proofSubmittedSnackbar =>
      'Prova inviata. Revisione manuale: 24–48 ore (fine settimana escluso).';
}
