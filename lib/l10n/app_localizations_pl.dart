// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Witamy';

  @override
  String get login => 'Zaloguj się';

  @override
  String get signup => 'Zarejestruj się';

  @override
  String get settings => 'Ustawienia';

  @override
  String get chats => 'Czaty';

  @override
  String get typeMessage => 'Napisz wiadomość...';

  @override
  String get send => 'Wyślij';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Łączenie...';

  @override
  String get connectingP2p => 'Łączenie z P2P...';

  @override
  String get p2pConnectionNotReady => 'Połączenie P2P nie jest gotowe.';

  @override
  String get searchLanguage => 'Szukaj języka...';

  @override
  String get language => 'Język';

  @override
  String get forceEscapeSignOutTitle => 'WYMUSIĆ AWARYJNE WYLOGOWANIE?';

  @override
  String get forceEscapeSignOutContent =>
      'OSTRZEŻENIE: Wykonanie tej akcji spowoduje całkowite usunięcie wszystkich danych z tego urządzenia.';

  @override
  String get cancel => 'Anuluj';

  @override
  String get wipeDevice => 'WYCZYŚĆ URZĄDZENIE';

  @override
  String get accountDestructionAlertTitle => 'ALERT DESTRUKCJI KONTA';

  @override
  String get accountDestructionWarning =>
      'OSTRZEŻENIE: Ta akcja usuwa wszystkie Twoje dane z tego urządzenia. Po połączeniu z Internetem spowoduje to uruchomienie zdalnego polecenia samozniszczenia. Każda wiadomość wysłana z Twojego unikalnego identyfikatora użytkownika zostanie trwale wymazana z pamięci wszystkich peerów.';

  @override
  String get accountDestructionCriticalNotice =>
      'KRYTYCZNE: Jeśli błędnie wpiszesz te liczby weryfikacyjne, system zostanie zablokowany. Aby go odblokować, musisz podać swoje główne hasło do konta lub użyć awaryjnego luku ewakuacyjnego, który natychmiast całkowicie czyści dane tego urządzenia.';

  @override
  String verificationSecurityKey(String code) {
    return 'Weryfikacyjny klucz bezpieczeństwa: $code';
  }

  @override
  String get copyDigitsHint => 'Skopiuj 5 powyższych cyfr';

  @override
  String get codeMismatchNotice =>
      'Niezgodność kodu! Wprowadź hasło główne, aby zastąpić blokadę, lub zaakceptuj 10-minutową blokadę.';

  @override
  String get accountPasswordLabel => 'Hasło konta';

  @override
  String get deleteEverythingPermanently => 'USUŃ WSZYSTKO NA STAŁE';

  @override
  String get escapeAndPurgeDeviceData =>
      'Ewakuacja i czyszczenie danych urządzenia';

  @override
  String get addContact => 'Dodaj kontakt';

  @override
  String get addContactConfirmation => 'Czy chcesz dodać ten kontakt?';

  @override
  String get noMessagesYet => 'Brak wiadomości';

  @override
  String get addNewContact => 'Dodaj nowy kontakt';

  @override
  String get usernameLabel => 'Nazwa użytkownika';

  @override
  String get nicknameOptionalLabel => 'Pseudonim (Opcjonalnie)';

  @override
  String get add => 'Dodaj';

  @override
  String get usernameCannotBeEmpty => 'Nazwa użytkownika nie może być pusta';

  @override
  String contactAlreadyExists(String name) {
    return 'Kontakt „$name” znajduje się już w Twojej książce adresowej.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Użytkownik „$name” nie został znaleziony w rejestrze sieciowym. Nie można utworzyć wspólnego sekretu.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Pomyślnie dodano użytkownika $name!';
  }

  @override
  String get contacts => 'Kontakty';

  @override
  String get noContactsYet => 'Brak kontaktów';

  @override
  String get securityLockoutActive => 'Blokada bezpieczeństwa aktywna';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Zbyt wiele nieudanych prób. Zablokowano na $minutes min.';
  }

  @override
  String get acknowledge => 'Potwierdź';

  @override
  String get accessBlocked => 'Dostęp zablokowany';

  @override
  String accessSuspended(int minutes) {
    return '5 błędnych weryfikacji. Dostęp zostaje zawieszony na kolejne $minutes min.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Odblokuj bezpieczny węzeł: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Pozostałe próby weryfikacji: $count.';
  }

  @override
  String get secureKeyPasscode => 'Hasło bezpiecznego klucza';

  @override
  String get warningHardwareLockout =>
      'OSTRZEŻENIE: Kolejna niezgodność systemowa uruchomi sprzętową blokadę bezpieczeństwa.';

  @override
  String get abort => 'Anuluj';

  @override
  String get authenticate => 'Uwierzytelnij';

  @override
  String get searchPipelinesHint => 'Zapytanie o aktywne bezpieczne kanały...';

  @override
  String get zeroPipelinesDiscovered =>
      'Nie wykryto pasujących kanałów komunikacyjnych.';

  @override
  String get processingDecryption => 'Przetwarzanie odszyfrowywania...';

  @override
  String get decrypting => 'Odszyfrowywanie...';

  @override
  String get decryptionError => '[Błąd odszyfrowywania]';

  @override
  String get cryptContainerSecure => 'KONTENER CRYPT BEZPIECZNY';

  @override
  String get connectAnAccount => 'Połącz konto';

  @override
  String get username => 'Nazwa użytkownika';

  @override
  String get password => 'Hasło';

  @override
  String get enterMasterSecurityPassword =>
      'Wprowadź swoje główne hasło bezpieczeństwa';

  @override
  String get pleaseFillAllFields => 'Proszę wypełnić wszystkie pola';

  @override
  String get wrongUsernameOrPassword =>
      'Nieprawidłowa nazwa użytkownika lub hasło';

  @override
  String loginError(String error) {
    return 'Błąd logowania: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Nie masz konta? Zarejestruj się';

  @override
  String get myIdentity => 'Moja tożsamość';

  @override
  String get scanToAddMe => 'Zeskanuj, aby mnie dodać';

  @override
  String get shareProfileLink => 'Udostępnij link do profilu';

  @override
  String addMeOnCrypt(String link) {
    return 'Dodaj mnie w CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Skanuj QR';

  @override
  String get invalidCryptQrFormat => 'Nieprawidłowy format kodu QR CRYPT.';

  @override
  String get userScanned => 'Użytkownik zeskanowany!';

  @override
  String addingUser(String username) {
    return 'Dodawanie $username...';
  }

  @override
  String get defaultUser => 'Użytkownik';

  @override
  String get createAccount => 'Utwórz konto';

  @override
  String get keepPasswordSecureHint =>
      'Zachowaj je w bezpiecznym miejscu. Hasła nie można zmienić.';

  @override
  String get pleaseFillInAllFields => 'Proszę wypełnić wszystkie pola';

  @override
  String get usernameExceedsLimit =>
      'Nazwa użytkownika nie może przekraczać 20 znaków';

  @override
  String get invalidUsernameCharacters =>
      'Nazwa użytkownika może zawierać tylko litery, cyfry, podkreślenia i myślniki';

  @override
  String get weakPasswordNotice =>
      'Hasło musi mieć co najmniej 8 znaków, zawierać cyfrę i wielką literę';

  @override
  String get unableToGenerateUniqueUsername =>
      'Nie można wygenerować unikalnej nazwy użytkownika.';

  @override
  String get accountCreated => 'Konto zostało utworzone';

  @override
  String yourUsernameIs(String username) {
    return 'Twoja nazwa użytkownika to:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Nazwa użytkownika „$chosen” jest już zajęta.\n\nTwoja przypisana nazwa użytkownika to:\n\n$assigned\n\nZapamiętaj ją, będzie potrzebna do logowania.';
  }

  @override
  String get continueText => 'Kontynuuj';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Nie udało się wygenerować bezpiecznej tożsamości: $error';
  }

  @override
  String get welcomeToCrypt => 'Witamy w CRYPT';

  @override
  String get signupDescription =>
      'Wprowadź nazwę użytkownika i hasło, aby zainicjować klucze szyfrowania peer-to-peer (P2P).';

  @override
  String get chooseAUsername => 'Wybierz nazwę użytkownika';

  @override
  String get usernameHelperText =>
      'Nie używaj swojego prawdziwego nazwiska. Jeśli nazwa użytkownika jest zajęta, automatycznie dodamy unikalny sufiks.';

  @override
  String get masterAuthenticationRequired => 'Wymagane uwierzytelnienie główne';

  @override
  String get verify => 'Weryfikuj';

  @override
  String get darkThemeMode => 'Tryb ciemnego motywu';

  @override
  String get secureConversations => 'Bezpieczne rozmowy';

  @override
  String get noActiveConversations =>
      'Nie znaleziono aktywnych rozmów. Rozpocznij najpierw rozmowę, aby zastosować niestandardowe blokady bezpieczeństwa.';

  @override
  String get logout => 'Wyloguj się';

  @override
  String get wipeDeviceAndEscape => 'WYCZYŚĆ URZĄDZENIE';

  @override
  String get falsePassword => 'Nieprawidłowe hasło';

  @override
  String accessSuspendedTimer(String time) {
    return 'Dostęp zawieszony ze względów bezpieczeństwa. Spróbuj ponownie za $time.';
  }

  @override
  String get selectSecureLockMethod => 'Wybierz metodę bezpiecznej blokady';

  @override
  String get selectSecureLockDescription =>
      'Czy chcesz zablokować ten pokój rozmów za pomocą biometrii odcisku palca urządzenia czy standardowego 4-cyfrowego kodu PIN?';

  @override
  String get fourDigitPin => '4-cyfrowy PIN';

  @override
  String get fingerprintUnlock => 'Odcisk palca 🔓';

  @override
  String get supportSoloDeveloper => 'Wesprzyj niezależnego programistę';

  @override
  String get maybeLater => 'Może później';

  @override
  String get submitProof => 'Prześlij dowód';

  @override
  String get couldNotOpenWallet =>
      'Nie można automatycznie otworzyć portfela. Skopiuj poniższy kod tekstowy.';

  @override
  String get proofSubmittedSnackbar =>
      'Dowód został przesłany! Weryfikacja ręczna trwa 24-48 godzin (z wyłączeniem weekendów). Możesz dalej normalnie korzystać z aplikacji!';
}
