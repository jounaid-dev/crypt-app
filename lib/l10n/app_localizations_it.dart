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
