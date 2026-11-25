// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Conditions générales';

  @override
  String get settingsTermsAndConditions => 'Conditions générales';

  @override
  String get termsIntro =>
      'CRYPT est une application préliminaire permettant de connecter directement des personnes pour des conversations. Vous êtes responsable d’utiliser l’application de manière appropriée et de conserver les informations d’identification de votre compte en sécurité.';

  @override
  String get termsConnectivity =>
      'CRYPT utilise des services en ligne pour aider les appareils à découvrir et à établir des connexions. La disponibilité et le comportement de connexion peuvent changer à mesure que l\'application se développe. Veuillez ne pas compter sur CRYPT comme seul moyen de communication.';

  @override
  String get termsAgreement =>
      'En continuant, vous confirmez que vous avez lu et accepté d\'utiliser CRYPT selon ces conditions.';

  @override
  String get agreeTerms => 'J\'accepte les termes et conditions';

  @override
  String get agreeAndContinue => 'Accepter et continuer';

  @override
  String get beforeYouStart => 'Avant de commencer';

  @override
  String get connected => 'Connecté';

  @override
  String get connectFirstThenChat => 'Connectez-vous d\'abord, puis discutez';

  @override
  String get betaIntro =>
      'CRYPT est une première version bêta, l\'expérience pourrait donc s\'améliorer dans les versions futures.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT fonctionne comme un talkie-walkie : les deux personnes doivent être en ligne et avoir CRYPT ouvert en même temps pour établir la connexion.';

  @override
  String get howToUseCrypt =>
      'Comment utiliser CRYPT :\n1. Scannez le code QR CRYPT de l\'autre personne.\n2. Les deux personnes doivent avoir CRYPT ouvert et être en ligne.\n3. Attendez que CRYPT établisse la connexion P2P.\n4. Attendez que la connexion soit établie.\n5. Vous pouvez alors commencer à discuter.';

  @override
  String get messageStorageExplanation =>
      'Vos messages sont conçus pour voyager directement entre les appareils connectés. CRYPT ne stocke pas vos messages de chat sur nos serveurs. Le serveur facilite actuellement la connexion et la signalisation, et l\'historique des discussions n\'est pas stocké sur le serveur. Si l\'autre personne est hors ligne, la connexion P2P actuelle ne peut pas être établie.';

  @override
  String get settingsAndSupportExplanation =>
      'Visitez Paramètres pour personnaliser votre expérience CRYPT. D\'autres options de personnalisation seront bientôt disponibles.\n\nVous souhaitez soutenir CRYPT ? Vous pouvez trouver l\'option de don dans Paramètres.';

  @override
  String get saving => 'Économie...';

  @override
  String get continueToCrypt => 'Continuer vers CRYPT';

  @override
  String get showSplashScreen => 'Afficher l\'écran de démarrage';

  @override
  String get retry => 'Réessayer';

  @override
  String get connectionFailed => 'La connexion a échoué';

  @override
  String get connectionFailedDetails =>
      'La connexion a échoué. Les deux appareils doivent être en ligne avec CRYPT ouvert pour se connecter.';

  @override
  String get gallery => 'Galerie';

  @override
  String get alignQrCode => 'ALIGNER LE CODE QR';

  @override
  String get scanFromGallery => 'NUMÉRISATION DEPUIS LA GALERIE';

  @override
  String get couldNotScanImage => 'Impossible de numériser l\'image.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Impossible de partager le code QR : $error';
  }

  @override
  String newContact(String username) {
    return 'Nouveau contact : $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Votre clé de cryptage publique est manquante.';

  @override
  String get contactEncryptionKeyMissing =>
      'La clé de cryptage des contacts est manquante.';

  @override
  String get localEncryptionKeyMissing =>
      'La clé de chiffrement locale est manquante.';

  @override
  String get noQrCodeFound => 'Aucun code QR trouvé dans cette image.';

  @override
  String get shareQrCode => 'Partager le code QR';

  @override
  String get welcome => 'Bienvenue';

  @override
  String get login => 'Connexion';

  @override
  String get signup => 'Inscription';

  @override
  String get settings => 'Paramètres';

  @override
  String get chats => 'Discussions';

  @override
  String get typeMessage => 'Écrivez un message...';

  @override
  String get send => 'Envoyer';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Connexion...';

  @override
  String get connectingP2p => 'Connexion au P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P non prêt.';

  @override
  String get searchLanguage => 'Rechercher une langue...';

  @override
  String get language => 'Langue';

  @override
  String get forceEscapeSignOutTitle => 'FORCER LA DÉCONNEXION ?';

  @override
  String get forceEscapeSignOutContent =>
      'ATTENTION : Toutes les données de cet appareil seront effacées.';

  @override
  String get cancel => 'Annuler';

  @override
  String get wipeDevice => 'EFFACER L\'APPAREIL';

  @override
  String get accountDestructionAlertTitle => 'SUPPRESSION DU COMPTE';

  @override
  String get accountDestructionWarning =>
      'ATTENTION : Les données de l\'appareil et les messages à distance seront effacés.';

  @override
  String get accountDestructionCriticalNotice =>
      'CRITIQUE : De mauvais codes verrouilleront le système. Utilisez votre mot de passe de compte ou la sortie d\'urgence.';

  @override
  String verificationSecurityKey(String code) {
    return 'Clé de sécurité : $code';
  }

  @override
  String get copyDigitsHint => 'Copiez les 5 chiffres';

  @override
  String get codeMismatchNotice =>
      'Code incorrect. Entrez votre mot de passe principal ou attendez 10 minutes.';

  @override
  String get accountPasswordLabel => 'Mot de passe du compte';

  @override
  String get deleteEverythingPermanently => 'TOUT SUPPRIMER';

  @override
  String get escapeAndPurgeDeviceData =>
      'Sortie d\'urgence et effacement des données';

  @override
  String get addContact => 'Ajouter un contact';

  @override
  String get addContactConfirmation => 'Ajouter ce contact ?';

  @override
  String get noMessagesYet => 'Aucun message';

  @override
  String get addNewContact => 'Nouveau contact';

  @override
  String get usernameLabel => 'Nom d\'utilisateur';

  @override
  String get nicknameOptionalLabel => 'Pseudonyme (facultatif)';

  @override
  String get add => 'Ajouter';

  @override
  String get usernameCannotBeEmpty => 'Le nom d\'utilisateur est requis';

  @override
  String contactAlreadyExists(String name) {
    return 'Le contact \'$name\' existe déjà.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'L\'utilisateur \'$name\' est introuvable. Secret partagé indisponible.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name a été ajouté !';
  }

  @override
  String get contacts => 'Contacts';

  @override
  String get noContactsYet => 'Aucun contact';

  @override
  String get securityLockoutActive => 'Verrouillage de sécurité';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Trop de tentatives. Verrouillé pendant $minutes min.';
  }

  @override
  String get acknowledge => 'Compris';

  @override
  String get accessBlocked => 'Accès bloqué';

  @override
  String accessSuspended(int minutes) {
    return '5 tentatives incorrectes. Accès suspendu pendant $minutes min.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Déverrouiller : $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Tentatives restantes : $count';
  }

  @override
  String get secureKeyPasscode => 'Code de sécurité';

  @override
  String get warningHardwareLockout =>
      'ATTENTION : La prochaine erreur verrouillera le système.';

  @override
  String get abort => 'Annuler';

  @override
  String get authenticate => 'S\'authentifier';

  @override
  String get searchPipelinesHint => 'Rechercher des connexions sécurisées...';

  @override
  String get zeroPipelinesDiscovered => 'Aucune connexion trouvée.';

  @override
  String get processingDecryption => 'Déchiffrement...';

  @override
  String get decrypting => 'Déchiffrement...';

  @override
  String get decryptionError => '[Erreur de déchiffrement]';

  @override
  String get cryptContainerSecure => 'CONTENEUR CRYPT SÉCURISÉ';

  @override
  String get connectAnAccount => 'Connecter un compte';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get enterMasterSecurityPassword =>
      'Entrez votre mot de passe principal';

  @override
  String get pleaseFillAllFields => 'Veuillez remplir tous les champs';

  @override
  String get wrongUsernameOrPassword =>
      'Nom d\'utilisateur ou mot de passe incorrect';

  @override
  String loginError(String error) {
    return 'Erreur de connexion : $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Pas de compte ? Inscrivez-vous';

  @override
  String get myIdentity => 'Mon identité';

  @override
  String get scanToAddMe => 'Scannez pour m\'ajouter';

  @override
  String get shareProfileLink => 'Partager mon profil';

  @override
  String addMeOnCrypt(String link) {
    return 'Ajoutez-moi sur CRYPT !\n\n$link';
  }

  @override
  String get scanQr => 'Scanner un QR';

  @override
  String get invalidCryptQrFormat => 'Code QR CRYPT invalide.';

  @override
  String get userScanned => 'Utilisateur détecté !';

  @override
  String addingUser(String username) {
    return 'Ajout de $username...';
  }

  @override
  String get defaultUser => 'Utilisateur';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get keepPasswordSecureHint =>
      'Conservez-le en lieu sûr. Le mot de passe ne peut pas être modifié.';

  @override
  String get pleaseFillInAllFields => 'Veuillez remplir tous les champs';

  @override
  String get usernameExceedsLimit => 'Maximum 20 caractères';

  @override
  String get invalidUsernameCharacters =>
      'Utilisez uniquement des lettres, des chiffres, _ ou -.';

  @override
  String get weakPasswordNotice =>
      '8 caractères ou plus, 1 chiffre et 1 majuscule.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Impossible de générer un nom d\'utilisateur unique.';

  @override
  String get accountCreated => 'Compte créé';

  @override
  String yourUsernameIs(String username) {
    return 'Votre nom d\'utilisateur :\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Le nom d\'utilisateur \'$chosen\' est déjà pris.\n\nVotre nom d\'utilisateur :\n\n$assigned\n\nConservez-le pour vous connecter.';
  }

  @override
  String get continueText => 'Continuer';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Échec de la création de l\'identité : $error';
  }

  @override
  String get welcomeToCrypt => 'Bienvenue sur CRYPT';

  @override
  String get signupDescription =>
      'Créez un nom d\'utilisateur et un mot de passe pour générer vos clés P2P.';

  @override
  String get chooseAUsername => 'Choisissez un nom d\'utilisateur';

  @override
  String get usernameHelperText =>
      'N\'utilisez pas votre vrai nom. Un suffixe sera ajouté si le nom est déjà pris.';

  @override
  String get masterAuthenticationRequired => 'Authentification principale';

  @override
  String get verify => 'Vérifier';

  @override
  String get darkThemeMode => 'Mode sombre';

  @override
  String get secureConversations => 'Conversations sécurisées';

  @override
  String get noActiveConversations =>
      'Aucune conversation active. Commencez-en une pour activer les verrous.';

  @override
  String get logout => 'Déconnexion';

  @override
  String get wipeDeviceAndEscape => 'EFFACER L\'APPAREIL';

  @override
  String get falsePassword => 'Mot de passe incorrect';

  @override
  String accessSuspendedTimer(String time) {
    return 'Accès suspendu. Réessayez dans $time.';
  }

  @override
  String get selectSecureLockMethod => 'Choisir la méthode de verrouillage';

  @override
  String get selectSecureLockDescription =>
      'Verrouiller avec l\'empreinte digitale ou un PIN à 4 chiffres ?';

  @override
  String get fourDigitPin => 'PIN à 4 chiffres';

  @override
  String get fingerprintUnlock => 'Empreinte digitale 🔓';

  @override
  String get supportSoloDeveloper => 'Soutenir le développeur';

  @override
  String get supportIntro =>
      'Bonjour ! Je suis un développeur indépendant qui travaille dur sur CRYPT. Je n’ai ni budget ni financement d’entreprise. Je compte sur votre honnêteté et votre empathie pour améliorer l’application et garantir l’absence totale de publicités.';

  @override
  String get chooseSupportAmount => 'Choisissez votre montant de soutien :';

  @override
  String get poorGang => 'Je fais partie des pauvres 🥀✌️';

  @override
  String get launchOfferMinimum => 'Minimum de l’offre de lancement 🚀';

  @override
  String get buyMeCoffee => 'Offrez-moi un café ☕';

  @override
  String get superSupporter => 'Super soutien 🔥';

  @override
  String get feature => 'Fonctionnalité';

  @override
  String get freeTier => 'Niveau gratuit';

  @override
  String get premium => 'Formule premium';

  @override
  String get chatLocks => 'Verrous de discussion';

  @override
  String get maxOneRoom => '1 salon maximum';

  @override
  String get unlimited => 'Illimité';

  @override
  String get biometrics => 'Biométrie';

  @override
  String get disabled => 'Désactivé 🚫';

  @override
  String supportWithSats(String amount) {
    return 'Soutenir avec $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => 'Offre de paiement BOLT12 ⚡ • Appuyez pour copier';

  @override
  String get boltOfferCopied => 'Offre de paiement BOLT12 copiée';

  @override
  String get tapToCopyBoltOffer =>
      'Appuyez pour copier l’offre de paiement BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      'Instructions simples pour déverrouiller 📬 :';

  @override
  String unlockInstructions(String username) {
    return '1. Payez avec Phoenix Wallet sur Android (7 500 minimum pour déverrouiller).\n2. Faites une capture de la confirmation de transaction.\n3. Envoyez-la à jounaidnadirmed@gmail.com avec votre nom d’utilisateur \'$username\'.\n4. Saisissez quelque chose ci-dessous pour enregistrer votre demande sur cet appareil :';
  }

  @override
  String get supportRequestHint =>
      'Saisissez votre nom ou les informations de transaction ici...';

  @override
  String get maybeLater => 'Plus tard';

  @override
  String get submitProof => 'Envoyer la preuve';

  @override
  String get couldNotOpenWallet =>
      'Impossible d\'ouvrir le portefeuille. Copiez le code ci-dessous.';

  @override
  String get proofSubmittedSnackbar =>
      'Preuve envoyée. Vérification manuelle sous 24 à 48 h (hors week-ends). Vous pouvez continuer à utiliser l\'application normalement.';

  @override
  String get loadingChats => 'Loading chats...';

  @override
  String get noChatsYetTitle => 'No chats yet';

  @override
  String get noChatsYetHint =>
      'A chat starts when you scan the other person\'s CRYPT QR code. Open your identity page to share yours so they can scan it.';

  @override
  String get scanQrToStartChat => 'Scan a QR code';

  @override
  String get noChatsMatchSearch => 'No chats match your search';

  @override
  String get noChatsMatchSearchHint =>
      'Try a different name, or clear the search to see every chat.';

  @override
  String get requestSentTitle => 'Request sent';

  @override
  String requestSentBody(String username) {
    return 'Your request went to $username. Please wait while they accept it.';
  }

  @override
  String get requestSentKeepOpen =>
      'The chat opens as soon as they accept. Keep CRYPT open on this device so you do not miss it.';

  @override
  String get requestSentGotIt => 'Got it';

  @override
  String get scanCouldNotReadCode =>
      'That code could not be read. Scan a CRYPT QR code.';

  @override
  String get scanMissingTheirIdentity =>
      'That code is missing the person\'s identity. Scan the code from their identity page.';

  @override
  String get scanOwnIdentityMissing =>
      'Your own encryption key is missing. Sign out and back in, then scan again.';

  @override
  String get noLightningWalletFound =>
      'No Lightning wallet found. Install one, or copy the address and paste it into a wallet.';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionPrivacy => 'Privacy and security';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Help and legal';

  @override
  String get settingsSectionAdministration => 'Administration';

  @override
  String get settingsSectionAccount => 'Account';

  @override
  String get settingsProtectTitle => 'Protect settings with master password';

  @override
  String get settingsProtectSubtitle => 'Require password to access settings';

  @override
  String get chatLockSetPinSubtitle => 'Tap to set your own PIN for this chat';

  @override
  String get premiumTileTitle => 'Get Lifetime Premium';

  @override
  String get premiumActiveSubtitle => 'Premium is on for your account';

  @override
  String get premiumPendingSubtitle =>
      'Waiting for an admin to review your screenshot';

  @override
  String get premiumHowItWorks => 'How premium works';

  @override
  String get reportProblemTitle => 'Report a problem';

  @override
  String get reportProblemSubtitle => 'Bugs, abuse or spam';

  @override
  String get adminAccessTitle => 'Admin access';

  @override
  String get adminAccessSubtitle => 'Enter your admin code to open the panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — own code, this chat only';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount once with your Lightning wallet, then send a screenshot';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Your screenshot is in. An admin checks it and premium turns on for your account within $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Pay $amount with $method, or $wallet.\n2. Screenshot the payment confirmation.\n3. Send it from Submit payment proof.\n4. Premium turns on and stays on for life.\n\nCRYPT is built by a solo developer, and this is the whole offer: one payment, no subscription.';
  }

  @override
  String get reportIntro =>
      'Tell us what happened. If you are reporting another person, add their username so we can act on the right account.';

  @override
  String get reportSent => 'Report sent. Thank you.';

  @override
  String get reportSendFailed => 'Could not send the report.';

  @override
  String get reportTypeLabel => 'Type of report';

  @override
  String get reportCategoryBug => 'Bug';

  @override
  String get reportCategoryAbuse => 'Abuse';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Other';

  @override
  String get reportUsernameLabel => 'Their username (optional)';

  @override
  String get reportUsernameHint => 'e.g. someone_you_want_reported';

  @override
  String get reportDetailsLabel => 'What happened?';

  @override
  String get reportScreenshotsLabel => 'Screenshots';

  @override
  String get reportAddScreenshot => 'Add screenshot';

  @override
  String get reportSendButton => 'Send report';

  @override
  String get reportPrivacyNote =>
      'Reports are reviewed by an administrator. Screenshots are stored privately and are only visible to moderators.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount once, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'No subscription and nothing to renew. Pay with $method, send a screenshot of the confirmation, and premium is switched on within $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT is built by a solo developer. Premium is what keeps it ad-free and actively maintained.';

  @override
  String get premiumStepPay => 'Pay with your wallet';

  @override
  String get premiumLightningAddressLabel => 'Lightning address';

  @override
  String get premiumOpenWallet => 'Open wallet';

  @override
  String get premiumCopyAddress => 'Copy address';

  @override
  String get premiumWorksWith =>
      'Works with Phoenix and any other Lightning wallet.';

  @override
  String get premiumStepScreenshot => 'Send your screenshot';

  @override
  String get premiumScreenshotHint =>
      'Take a screenshot of the payment confirmation in your Lightning wallet and attach it below.';

  @override
  String get premiumAttachScreenshot => 'Attach screenshot';

  @override
  String get premiumReplaceScreenshot => 'Replace screenshot';

  @override
  String get premiumStepAmount => 'Confirm the amount';

  @override
  String get premiumAmountLabel => 'Amount you paid (USD)';

  @override
  String get premiumNoteLabel => 'Note (optional)';

  @override
  String get premiumSendProof => 'Send my proof';

  @override
  String get premiumAddressCopied => 'Lightning address copied.';

  @override
  String get premiumAttachConfirmation =>
      'Attach a screenshot of your payment confirmation.';

  @override
  String get premiumSendProofFailed => 'Could not send the payment proof.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Minimum $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Activation takes $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Proof received. Premium is switched on within $window.';
  }

  @override
  String get premiumTableFeature => 'Feature';

  @override
  String get premiumTableFree => 'Free';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Encrypted peer-to-peer messaging';

  @override
  String get premiumTableMessagesStay => 'Messages stay on your devices';

  @override
  String get premiumTableChatLocks => 'Chats locked with your own PIN';

  @override
  String get premiumTableFingerprint => 'Unlock with fingerprint or face';

  @override
  String get premiumTablePrice => 'Price';

  @override
  String get premiumTableAccess => 'Access';

  @override
  String get premiumTableIncluded => 'Included';

  @override
  String get premiumTableOneChat => '1 chat';

  @override
  String get premiumTableUnlimited => 'Unlimited';

  @override
  String get premiumTableNotIncluded => 'Not included';

  @override
  String get premiumTableFreeValue => 'Free';

  @override
  String get premiumTableWhileFree => 'While the app is free';

  @override
  String get premiumTableLifetime => 'Lifetime';

  @override
  String premiumTableOnePayment(String amount) {
    return 'One payment of $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'One payment of $amount and premium is yours for life. There is no subscription and nothing to renew.';
  }

  @override
  String get settingsSaveFailed => 'Could not save that setting. Try again.';

  @override
  String get settingsLockFailed => 'Could not lock this chat. Try again.';

  @override
  String get settingsUnlockFailed => 'Could not unlock this chat. Try again.';

  @override
  String pinSetTitle(String chat) {
    return 'Set a PIN for $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Confirm the PIN for $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'This PIN opens $chat only. Every chat has its own PIN, chosen by you. There is no single code for the app.';
  }

  @override
  String get pinMismatch => 'The PINs did not match. Lock not enabled.';

  @override
  String get biometricNotSetUp =>
      'No fingerprint or face unlock is set up on this device.';

  @override
  String get biometricVerifyFailed =>
      'Could not verify it is you on this device.';

  @override
  String get lightningAddressCopied =>
      'Lightning address copied. Paste it into a wallet to pay.';

  @override
  String get accountSuspended => 'Account suspended';

  @override
  String get premiumLifetimeAccess => 'Lifetime Premium Access';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Pay $amount from $method to the Lightning address above.';
  }

  @override
  String get premiumActivationStep2 =>
      'Take a screenshot of the payment confirmation and send it in as your proof of payment.';
}
