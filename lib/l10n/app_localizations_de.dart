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
  String get termsAndConditions => 'Allgemeine Geschäftsbedingungen';

  @override
  String get settingsTermsAndConditions => 'Allgemeine Geschäftsbedingungen';

  @override
  String get termsIntro =>
      'CRYPT ist eine Anwendung im Frühstadium, mit der Menschen direkt für Gespräche miteinander verbunden werden können. Sie sind für die ordnungsgemäße Nutzung der Anwendung und die Sicherheit Ihrer Kontodaten verantwortlich.';

  @override
  String get termsConnectivity =>
      'CRYPT nutzt Online-Dienste, um Geräten beim Erkennen und Herstellen von Verbindungen zu helfen. Verfügbarkeit und Verbindungsverhalten können sich mit der Entwicklung der Anwendung ändern. Bitte verlassen Sie sich nicht auf CRYPT als Ihr einziges Kommunikationsmittel.';

  @override
  String get termsAgreement =>
      'Indem Sie fortfahren, bestätigen Sie, dass Sie diese Bedingungen gelesen haben und damit einverstanden sind, CRYPT gemäß diesen Bedingungen zu nutzen.';

  @override
  String get agreeTerms => 'Ich stimme den Allgemeinen Geschäftsbedingungen zu';

  @override
  String get agreeAndContinue => 'Zustimmen und fortfahren';

  @override
  String get beforeYouStart => 'Bevor Sie beginnen';

  @override
  String get connected => 'Verbunden';

  @override
  String get connectFirstThenChat => 'Erst verbinden, dann chatten';

  @override
  String get betaIntro =>
      'CRYPT ist eine frühe Beta-Version, daher kann sich das Erlebnis in zukünftigen Versionen verbessern.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT funktioniert wie ein Walkie-Talkie: Um die Verbindung herzustellen, müssen beide Personen online sein und CRYPT gleichzeitig geöffnet haben.';

  @override
  String get howToUseCrypt =>
      'So verwenden Sie CRYPT:\n1. Scannen Sie den CRYPT-QR-Code der anderen Person.\n2. Beide Personen müssen CRYPT geöffnet und online haben.\n3. Warten Sie, während CRYPT die P2P-Verbindung aufbaut.\n4. Warten Sie, bis der Status „Verbinden...“ verschwindet und die Verbindung hergestellt wird.\n5. Sobald die Verbindung hergestellt ist, können Sie mit dem Chatten beginnen.';

  @override
  String get messageStorageExplanation =>
      'Ihre Nachrichten sind so konzipiert, dass sie direkt zwischen verbundenen Geräten übertragen werden können. CRYPT speichert Ihre Chatnachrichten nicht auf unseren Servern. Der Server hilft derzeit bei der Verbindung und Signalisierung und der Chatverlauf wird nicht auf dem Server gespeichert. Wenn die andere Person offline ist, kann die aktuelle P2P-Verbindung nicht hergestellt werden.';

  @override
  String get settingsAndSupportExplanation =>
      'Besuchen Sie die Einstellungen, um Ihr CRYPT-Erlebnis anzupassen. Weitere Anpassungsoptionen folgen in Kürze.\n\nMöchten Sie CRYPT unterstützen? Die Spendenoption finden Sie in den Einstellungen.';

  @override
  String get saving => 'Sparen...';

  @override
  String get continueToCrypt => 'Weiter zu CRYPT';

  @override
  String get showSplashScreen => 'Begrüßungsbildschirm anzeigen';

  @override
  String get retry => 'Wiederholen';

  @override
  String get connectionFailed => 'Verbindung fehlgeschlagen';

  @override
  String get connectionFailedDetails =>
      'Verbindung fehlgeschlagen. Um eine Verbindung herzustellen, müssen beide Geräte online sein und CRYPT geöffnet sein.';

  @override
  String get gallery => 'Galerie';

  @override
  String get alignQrCode => 'QR-CODE AUSRICHTEN';

  @override
  String get scanFromGallery => 'AUS DER GALERIE SCANNEN';

  @override
  String get couldNotScanImage => 'Das Bild konnte nicht gescannt werden.';

  @override
  String couldNotShareQrCode(String error) {
    return 'QR-Code konnte nicht geteilt werden: $error';
  }

  @override
  String newContact(String username) {
    return 'Neuer Kontakt: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Ihr öffentlicher Verschlüsselungsschlüssel fehlt.';

  @override
  String get contactEncryptionKeyMissing =>
      'Der Kontaktverschlüsselungsschlüssel fehlt.';

  @override
  String get localEncryptionKeyMissing =>
      'Der lokale Verschlüsselungsschlüssel fehlt.';

  @override
  String get noQrCodeFound => 'In diesem Bild wurde kein QR-Code gefunden.';

  @override
  String get shareQrCode => 'Teilen Sie den QR-Code';

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
  String get supportIntro =>
      'Hallo! Ich bin ein einzelner Entwickler und arbeite hart an CRYPT. Ich habe kein Budget und keine Unternehmensfinanzierung. Für die Verbesserung der App und dauerhaft keine Werbung bin ich auf Ihre Ehrlichkeit und Ihr Mitgefühl angewiesen.';

  @override
  String get chooseSupportAmount => 'Wählen Sie Ihren Unterstützungsbetrag:';

  @override
  String get poorGang => 'Ich gehöre zur armen Gruppe 🥀✌️';

  @override
  String get launchOfferMinimum => 'Mindestbetrag des Startangebots 🚀';

  @override
  String get buyMeCoffee => 'Spendieren Sie mir einen Kaffee ☕';

  @override
  String get superSupporter => 'Super-Unterstützer 🔥';

  @override
  String get feature => 'Funktion';

  @override
  String get freeTier => 'Kostenlose Stufe';

  @override
  String get premium => 'Premium-Tarif';

  @override
  String get chatLocks => 'Chat-Sperren';

  @override
  String get maxOneRoom => 'Maximal 1 Raum';

  @override
  String get unlimited => 'Unbegrenzt';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get disabled => 'Deaktiviert 🚫';

  @override
  String supportWithSats(String amount) {
    return 'Mit $amount Sats unterstützen (Phoenix)';
  }

  @override
  String get boltOffer => 'BOLT12-Zahlungsangebot ⚡ • Zum Kopieren tippen';

  @override
  String get boltOfferCopied => 'BOLT12-Zahlungsangebot kopiert';

  @override
  String get tapToCopyBoltOffer =>
      'Tippen, um das BOLT12-Zahlungsangebot zu kopieren';

  @override
  String get simpleInstructionsToUnlock =>
      'Einfache Anleitung zum Entsperren 📬:';

  @override
  String unlockInstructions(String username) {
    return '1. Zahlen Sie mit Phoenix Wallet auf Android (mindestens 7.500 zum Entsperren).\n2. Machen Sie einen Screenshot der erfolgreichen Transaktionsbestätigung.\n3. Senden Sie den Screenshot an jounaidnadirmed@gmail.com und nennen Sie Ihren Benutzernamen \'$username\'.\n4. Geben Sie unten etwas ein, um Ihre Anfrage auf diesem Gerät zu speichern:';
  }

  @override
  String get supportRequestHint =>
      'Geben Sie hier Ihren Namen oder Transaktionsdaten ein...';

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
