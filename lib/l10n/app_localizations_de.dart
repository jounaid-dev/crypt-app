// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Willkommen';

  @override
  String get login => 'Anmelden';

  @override
  String get signup => 'Registrieren';

  @override
  String get settings => 'Einstellungen';

  @override
  String get chats => 'Chats';

  @override
  String get typeMessage => 'Nachricht...';

  @override
  String get send => 'Senden';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Verbindung wird hergestellt...';

  @override
  String get connectingP2p => 'P2P-Verbindung wird hergestellt...';

  @override
  String get p2pConnectionNotReady => 'P2P nicht bereit.';

  @override
  String get searchLanguage => 'Sprache suchen...';

  @override
  String get language => 'Sprache';

  @override
  String get forceEscapeSignOutTitle => 'NOTFALL-ABMELDUNG?';

  @override
  String get forceEscapeSignOutContent =>
      'WARNUNG: Alle Gerätedaten werden gelöscht.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get wipeDevice => 'GERÄT LÖSCHEN';

  @override
  String get accountDestructionAlertTitle => 'KONTO LÖSCHEN';

  @override
  String get accountDestructionWarning =>
      'WARNUNG: Gerätedaten und Nachrichten werden gelöscht.';

  @override
  String get accountDestructionCriticalNotice =>
      'KRITISCH: Falsche Codes sperren das System. Verwenden Sie Ihr Kontopasswort oder die Notfallfunktion.';

  @override
  String verificationSecurityKey(String code) {
    return 'Sicherheitsschlüssel: $code';
  }

  @override
  String get copyDigitsHint => 'Kopieren Sie die 5 Ziffern oben';

  @override
  String get codeMismatchNotice =>
      'Code stimmt nicht überein. Geben Sie Ihr Master-Passwort ein oder warten Sie 10 Minuten.';

  @override
  String get accountPasswordLabel => 'Kontopasswort';

  @override
  String get deleteEverythingPermanently => 'ALLES LÖSCHEN';

  @override
  String get escapeAndPurgeDeviceData => 'Notfallfunktion & Daten löschen';

  @override
  String get addContact => 'Kontakt hinzufügen';

  @override
  String get addContactConfirmation => 'Diesen Kontakt hinzufügen?';

  @override
  String get noMessagesYet => 'Noch keine Nachrichten';

  @override
  String get addNewContact => 'Neuer Kontakt';

  @override
  String get usernameLabel => 'Benutzername';

  @override
  String get nicknameOptionalLabel => 'Spitzname (optional)';

  @override
  String get add => 'Hinzufügen';

  @override
  String get usernameCannotBeEmpty => 'Benutzername erforderlich';

  @override
  String contactAlreadyExists(String name) {
    return 'Kontakt \'$name\' ist bereits vorhanden.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Benutzer \'$name\' nicht gefunden. Gemeinsames Geheimnis nicht verfügbar.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name hinzugefügt!';
  }

  @override
  String get contacts => 'Kontakte';

  @override
  String get noContactsYet => 'Noch keine Kontakte';

  @override
  String get securityLockoutActive => 'Sicherheitssperre';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Zu viele Versuche. Für $minutes Min. gesperrt.';
  }

  @override
  String get acknowledge => 'Bestätigen';

  @override
  String get accessBlocked => 'Zugriff gesperrt';

  @override
  String accessSuspended(int minutes) {
    return '5 fehlgeschlagene Versuche. Für $minutes Min. gesperrt.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Entsperren: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Verbleibende Versuche: $count';
  }

  @override
  String get secureKeyPasscode => 'Sicherheitscode';

  @override
  String get warningHardwareLockout =>
      'WARNUNG: Der nächste Fehler sperrt das Sicherheitssystem.';

  @override
  String get abort => 'Abbrechen';

  @override
  String get authenticate => 'Authentifizieren';

  @override
  String get searchPipelinesHint => 'Sichere Verbindungen suchen...';

  @override
  String get zeroPipelinesDiscovered => 'Keine Verbindungen gefunden.';

  @override
  String get processingDecryption => 'Entschlüsselung...';

  @override
  String get decrypting => 'Entschlüsseln...';

  @override
  String get decryptionError => '[Entschlüsselungsfehler]';

  @override
  String get cryptContainerSecure => 'CRYPT SICHER';

  @override
  String get connectAnAccount => 'Konto verbinden';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get enterMasterSecurityPassword => 'Geben Sie Ihr Master-Passwort ein';

  @override
  String get pleaseFillAllFields => 'Bitte alle Felder ausfüllen';

  @override
  String get wrongUsernameOrPassword => 'Benutzername oder Passwort falsch';

  @override
  String loginError(String error) {
    return 'Anmeldefehler: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Noch kein Konto? Registrieren';

  @override
  String get myIdentity => 'Meine Identität';

  @override
  String get scanToAddMe => 'Scannen, um mich hinzuzufügen';

  @override
  String get shareProfileLink => 'Profil teilen';

  @override
  String addMeOnCrypt(String link) {
    return 'Fügen Sie mich auf CRYPT hinzu!\n\n$link';
  }

  @override
  String get scanQr => 'QR scannen';

  @override
  String get invalidCryptQrFormat => 'Ungültiger CRYPT-QR-Code.';

  @override
  String get userScanned => 'Benutzer gescannt!';

  @override
  String addingUser(String username) {
    return '$username wird hinzugefügt...';
  }

  @override
  String get defaultUser => 'Benutzer';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get keepPasswordSecureHint =>
      'Sicher aufbewahren. Das Passwort kann nicht geändert werden.';

  @override
  String get pleaseFillInAllFields => 'Bitte alle Felder ausfüllen';

  @override
  String get usernameExceedsLimit => 'Maximal 20 Zeichen';

  @override
  String get invalidUsernameCharacters =>
      'Nur Buchstaben, Zahlen, _ oder - verwenden.';

  @override
  String get weakPasswordNotice => '8+ Zeichen, 1 Zahl und 1 Großbuchstabe.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Es konnte kein eindeutiger Benutzername erstellt werden.';

  @override
  String get accountCreated => 'Konto erstellt';

  @override
  String yourUsernameIs(String username) {
    return 'Ihr Benutzername:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Der Benutzername \'$chosen\' ist bereits vergeben.\n\nIhr Benutzername:\n\n$assigned\n\nBewahren Sie ihn für die Anmeldung auf.';
  }

  @override
  String get continueText => 'Weiter';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Identität konnte nicht erstellt werden: $error';
  }

  @override
  String get welcomeToCrypt => 'Willkommen bei CRYPT';

  @override
  String get signupDescription =>
      'Erstellen Sie einen Benutzernamen und ein Passwort, um P2P-Schlüssel zu generieren.';

  @override
  String get chooseAUsername => 'Benutzernamen wählen';

  @override
  String get usernameHelperText =>
      'Verwenden Sie nicht Ihren echten Namen. Bei einer bereits vergebenen Adresse wird ein Suffix hinzugefügt.';

  @override
  String get masterAuthenticationRequired =>
      'Master-Authentifizierung erforderlich';

  @override
  String get verify => 'Verifizieren';

  @override
  String get darkThemeMode => 'Dunkles Design';

  @override
  String get secureConversations => 'Sichere Chats';

  @override
  String get noActiveConversations =>
      'Keine aktiven Chats. Starten Sie einen Chat, um Sperren zu aktivieren.';

  @override
  String get logout => 'Abmelden';

  @override
  String get wipeDeviceAndEscape => 'GERÄT LÖSCHEN';

  @override
  String get falsePassword => 'Falsches Passwort';

  @override
  String accessSuspendedTimer(String time) {
    return 'Zugriff gesperrt. Versuchen Sie es in $time erneut.';
  }

  @override
  String get selectSecureLockMethod => 'Sperrmethode auswählen';

  @override
  String get selectSecureLockDescription =>
      'Mit Fingerabdruck oder 4-stelliger PIN sperren?';

  @override
  String get fourDigitPin => '4-stellige PIN';

  @override
  String get fingerprintUnlock => 'Fingerabdruck 🔓';

  @override
  String get supportSoloDeveloper => 'Entwickler unterstützen';

  @override
  String get maybeLater => 'Vielleicht später';

  @override
  String get submitProof => 'Nachweis senden';

  @override
  String get couldNotOpenWallet =>
      'Wallet konnte nicht geöffnet werden. Kopieren Sie stattdessen den Code unten.';

  @override
  String get proofSubmittedSnackbar =>
      'Nachweis übermittelt. Manuelle Prüfung: 24–48 Stunden (Wochenenden ausgenommen).';
}
