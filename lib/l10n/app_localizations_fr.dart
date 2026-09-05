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
  String get maybeLater => 'Plus tard';

  @override
  String get submitProof => 'Envoyer la preuve';

  @override
  String get couldNotOpenWallet =>
      'Impossible d\'ouvrir le portefeuille. Copiez le code ci-dessous.';

  @override
  String get proofSubmittedSnackbar =>
      'Preuve envoyée. Vérification manuelle sous 24 à 48 h (hors week-ends). Vous pouvez continuer à utiliser l\'application normalement.';
}
