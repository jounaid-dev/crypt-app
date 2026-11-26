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

  @override
  String get loadingChats => 'Caricamento chat...';

  @override
  String get noChatsYetTitle => 'Nessuna chat ancora';

  @override
  String get noChatsYetHint =>
      'Una chat inizia quando esegui la scansione del codice QR CRYPT dell\'altra persona. Apri la pagina della tua identità per condividere la tua in modo che possano scansionarla.';

  @override
  String get scanQrToStartChat => 'Scansiona un codice QR';

  @override
  String get noChatsMatchSearch => 'Nessuna chat corrisponde alla tua ricerca';

  @override
  String get noChatsMatchSearchHint =>
      'Prova un nome diverso o cancella la ricerca per vedere tutte le chat.';

  @override
  String get requestSentTitle => 'Richiesta inviata';

  @override
  String requestSentBody(String username) {
    return 'La tua richiesta è andata a $username. Per favore attendi mentre lo accettano.';
  }

  @override
  String get requestSentKeepOpen =>
      'La chat si apre non appena accettano. Mantieni CRYPT aperto su questo dispositivo in modo da non perderlo.';

  @override
  String get requestSentGotIt => 'Capito';

  @override
  String get scanCouldNotReadCode =>
      'Impossibile leggere quel codice. Scansiona un codice QR CRYPT.';

  @override
  String get scanMissingTheirIdentity =>
      'A quel codice manca l\'identità della persona. Scansiona il codice dalla loro pagina di identità.';

  @override
  String get scanOwnIdentityMissing =>
      'Manca la tua chiave di crittografia. Esci e rientra, quindi esegui nuovamente la scansione.';

  @override
  String get noLightningWalletFound =>
      'Nessun portafoglio Lightning trovato. Installane uno o copia l\'indirizzo e incollalo in un portafoglio.';

  @override
  String get settingsSectionAppearance => 'Aspetto';

  @override
  String get settingsSectionPrivacy => 'Privacy e sicurezza';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Aiuto e legale';

  @override
  String get settingsSectionAdministration => 'Amministrazione';

  @override
  String get settingsSectionAccount => 'Conto';

  @override
  String get settingsProtectTitle =>
      'Proteggi le impostazioni con la password principale';

  @override
  String get settingsProtectSubtitle =>
      'Richiedi la password per accedere alle impostazioni';

  @override
  String get chatLockSetPinSubtitle =>
      'Tocca per impostare il tuo PIN per questa chat';

  @override
  String get premiumTileTitle => 'Ottieni Premium a vita';

  @override
  String get premiumActiveSubtitle => 'Premium è attivo per il tuo account';

  @override
  String get premiumPendingSubtitle =>
      'In attesa che un amministratore esamini il tuo screenshot';

  @override
  String get premiumHowItWorks => 'Come funziona il Premium';

  @override
  String get reportProblemTitle => 'Segnala un problema';

  @override
  String get reportProblemSubtitle => 'Bug, abusi o spam';

  @override
  String get adminAccessTitle => 'Accesso amministratore';

  @override
  String get adminAccessSubtitle =>
      'Inserisci il tuo codice amministratore per aprire il pannello';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — codice proprio, solo in questa chat';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount una volta con il tuo portafoglio Lightning, quindi invia uno screenshot';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Il tuo screenshot è dentro. Un amministratore lo controlla e premium si attiva per il tuo account all\'interno $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Paga $amount con $method, O $wallet.\n2. Screenshot della conferma del pagamento.\n3. Invialo da Invia prova di pagamento.\n4. Premium si attiva e rimane attivo per tutta la vita.\n\nCRYPT è realizzato da uno sviluppatore solista e questa è l\'intera offerta: un pagamento, nessun abbonamento.';
  }

  @override
  String get reportIntro =>
      'Raccontaci cosa è successo. Se stai segnalando un\'altra persona, aggiungi il suo nome utente in modo che possiamo agire sull\'account giusto.';

  @override
  String get reportSent => 'Rapporto inviato. Grazie.';

  @override
  String get reportSendFailed => 'Impossibile inviare il rapporto.';

  @override
  String get reportTypeLabel => 'Tipo di rapporto';

  @override
  String get reportCategoryBug => 'Insetto';

  @override
  String get reportCategoryAbuse => 'Abuso';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Altro';

  @override
  String get reportUsernameLabel => 'Il loro nome utente (facoltativo)';

  @override
  String get reportUsernameHint => 'ad es. qualcuno_che_vuoi_segnalare';

  @override
  String get reportDetailsLabel => 'Cosa è successo?';

  @override
  String get reportScreenshotsLabel => 'Schermate';

  @override
  String get reportAddScreenshot => 'Aggiungi schermata';

  @override
  String get reportSendButton => 'Invia rapporto';

  @override
  String get reportPrivacyNote =>
      'I report vengono esaminati da un amministratore. Gli screenshot vengono archiviati privatamente e sono visibili solo ai moderatori.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount una volta, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Nessun abbonamento e niente da rinnovare. Paga con $method, invia uno screenshot della conferma e premium verrà attivato all\'interno $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT è costruito da uno sviluppatore solista. Premium è ciò che lo mantiene privo di pubblicità e mantenuto attivamente.';

  @override
  String get premiumStepPay => 'Paga con il tuo portafoglio';

  @override
  String get premiumLightningAddressLabel => 'Indirizzo Lightning';

  @override
  String get premiumOpenWallet => 'Apri portafoglio';

  @override
  String get premiumCopyAddress => 'Copia indirizzo';

  @override
  String get premiumWorksWith =>
      'Funziona con Phoenix e qualsiasi altro portafoglio Lightning.';

  @override
  String get premiumStepScreenshot => 'Invia il tuo screenshot';

  @override
  String get premiumScreenshotHint =>
      'Fai uno screenshot della conferma del pagamento nel tuo portafoglio Lightning e allegalo qui sotto.';

  @override
  String get premiumAttachScreenshot => 'Allega schermata';

  @override
  String get premiumReplaceScreenshot => 'Sostituisci schermata';

  @override
  String get premiumStepAmount => 'Conferma l\'importo';

  @override
  String get premiumAmountLabel => 'Importo pagato (USD)';

  @override
  String get premiumNoteLabel => 'Nota (facoltativa)';

  @override
  String get premiumSendProof => 'Invia la mia prova';

  @override
  String get premiumAddressCopied => 'Indirizzo Lightning copiato.';

  @override
  String get premiumAttachConfirmation =>
      'Allega uno screenshot della conferma del pagamento.';

  @override
  String get premiumSendProofFailed =>
      'Impossibile inviare la prova di pagamento.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Minimo $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'L\'attivazione richiede $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Prova ricevuta. Premium è attivato entro $window.';
  }

  @override
  String get premiumTableFeature => 'Caratteristica';

  @override
  String get premiumTableFree => 'Gratuito';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted =>
      'Messaggistica peer-to-peer crittografata';

  @override
  String get premiumTableMessagesStay =>
      'I messaggi rimangono sui tuoi dispositivi';

  @override
  String get premiumTableChatLocks => 'Chat bloccate con il tuo PIN';

  @override
  String get premiumTableFingerprint =>
      'Sblocca con l\'impronta digitale o il viso';

  @override
  String get premiumTablePrice => 'Prezzo';

  @override
  String get premiumTableAccess => 'Accesso';

  @override
  String get premiumTableIncluded => 'Incluso';

  @override
  String get premiumTableOneChat => '1 chiacchierata';

  @override
  String get premiumTableUnlimited => 'Illimitato';

  @override
  String get premiumTableNotIncluded => 'Non incluso';

  @override
  String get premiumTableFreeValue => 'Gratuito';

  @override
  String get premiumTableWhileFree => 'Mentre l\'app è gratuita';

  @override
  String get premiumTableLifetime => 'A vita';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Un pagamento di $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Un pagamento di $amount e Premium è tuo per tutta la vita. Nessun abbonamento, niente da rinnovare.';
  }

  @override
  String get settingsSaveFailed =>
      'Impossibile salvare l\'impostazione. Riprova.';

  @override
  String get settingsLockFailed => 'Impossibile bloccare questa chat. Riprova.';

  @override
  String get settingsUnlockFailed =>
      'Impossibile sbloccare questa chat. Riprova.';

  @override
  String pinSetTitle(String chat) {
    return 'Imposta un PIN per $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Conferma il PIN per $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Questo PIN si apre $chat soltanto. Ogni chat ha il proprio PIN, scelto da te. Non esiste un codice unico per l\'app.';
  }

  @override
  String get pinMismatch => 'I PIN non corrispondevano. Blocco non abilitato.';

  @override
  String get biometricNotSetUp =>
      'Su questo dispositivo non è configurato lo sblocco con l\'impronta digitale o con il volto.';

  @override
  String get biometricVerifyFailed =>
      'Impossibile verificare la tua identità su questo dispositivo.';

  @override
  String get lightningAddressCopied =>
      'Indirizzo Lightning copiato. Incollalo in un portafoglio per pagare.';

  @override
  String get accountSuspended => 'Conto sospeso';

  @override
  String get premiumLifetimeAccess => 'Accesso Premium a vita';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Paga $amount da $method all\'indirizzo Lightning riportato sopra.';
  }

  @override
  String get premiumActivationStep2 =>
      'Fai uno screenshot della conferma di pagamento e invialo come prova di pagamento.';

  @override
  String get pinFourDigits => 'Inserisci esattamente 4 cifre.';

  @override
  String get scanOwnCode =>
      'Questo è il tuo codice. Scansiona il codice CRYPT di qualcun altro per avviare una chat con loro.';

  @override
  String get couldNotGenerateQrImage => 'Impossibile generare l\'immagine QR';

  @override
  String get conversationUpdateFailed =>
      'Aggiornamento della conversazione non riuscito. Riprova.';

  @override
  String get conversationCreationFailed =>
      'Creazione della conversazione non riuscita. Riprova.';

  @override
  String get accountSuspendedByAdmin =>
      'Questo account è stato sospeso da un amministratore.';

  @override
  String get unlockCrypt => 'Sblocca l\'app';

  @override
  String get unlockCryptBody =>
      'Inserisci la tua password principale per decriptare i tuoi messaggi su questo dispositivo.';

  @override
  String get unlock => 'Sblocca ora';

  @override
  String get attachPhoto => 'Foto';

  @override
  String get attachFile => 'File';

  @override
  String attachmentTooLarge(int mb) {
    return 'Quel file è troppo grande. Il limite è $mb MB.';
  }

  @override
  String get attachmentSendFailed => 'Impossibile inviare l\'allegato.';
}
