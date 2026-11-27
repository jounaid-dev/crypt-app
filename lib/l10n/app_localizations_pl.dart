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
  String get termsAndConditions => 'Warunki';

  @override
  String get settingsTermsAndConditions => 'Warunki';

  @override
  String get termsIntro =>
      'CRYPT to aplikacja na wczesnym etapie do bezpośredniego łączenia ludzi w celu prowadzenia rozmów. Ponosisz odpowiedzialność za prawidłowe korzystanie z aplikacji i za bezpieczeństwo danych logowania do konta.';

  @override
  String get termsConnectivity =>
      'CRYPT korzysta z usług online, aby pomóc urządzeniom w odkrywaniu i nawiązywaniu połączeń. Dostępność i zachowanie połączeń mogą ulec zmianie w miarę rozwoju aplikacji. Proszę nie polegać na KRYPCIE jako jedynym środku komunikacji.';

  @override
  String get termsAgreement =>
      'Kontynuując, potwierdzasz, że przeczytałeś i zgadzasz się na korzystanie z KRYPT zgodnie z niniejszymi warunkami.';

  @override
  String get agreeTerms => 'Akceptuję zasady i warunki';

  @override
  String get agreeAndContinue => 'Wyraź zgodę i kontynuuj';

  @override
  String get beforeYouStart => 'Zanim zaczniesz';

  @override
  String get connected => 'Połączono';

  @override
  String get connectFirstThenChat =>
      'Najpierw połącz się, a następnie porozmawiaj';

  @override
  String get betaIntro =>
      'CRYPT to wczesna wersja beta, więc korzystanie z niej może się poprawić w przyszłych wersjach.';

  @override
  String get walkieTalkieExplanation =>
      'KRYPTA działa jak krótkofalówka: obie osoby muszą być online i mieć KRYPTĘ otwartą w tym samym czasie, aby nawiązać połączenie.';

  @override
  String get howToUseCrypt =>
      'Jak korzystać z KRYPT:\n1. Zeskanuj kod QR KRYPT drugiej osoby.\n2. Obie osoby potrzebują KRYPTY otwartej i online.\n3. Poczekaj, aż KRYPTA nawiąże połączenie P2P.\n4. Poczekaj, aż stan „Łączenie...” zniknie i połączenie zostanie nawiązane.\n5. Po nawiązaniu połączenia możesz rozpocząć rozmowę.';

  @override
  String get messageStorageExplanation =>
      'Wiadomości są przeznaczone do przesyłania bezpośrednio między podłączonymi urządzeniami. CRYPT nie przechowuje Twoich wiadomości na czacie na naszych serwerach. Serwer obecnie pomaga w połączeniu i sygnalizacji, a historia czatu nie jest przechowywana na serwerze. Jeśli druga osoba jest offline, nie można nawiązać bieżącego połączenia P2P.';

  @override
  String get settingsAndSupportExplanation =>
      'Przejdź do ustawień, aby dostosować KRYPTĘ. Wkrótce pojawi się więcej opcji dostosowywania.\n\nChcesz obsługiwać KRYPTĘ? Opcję darowizny znajdziesz w Ustawieniach.';

  @override
  String get saving => 'Zapisywanie...';

  @override
  String get continueToCrypt => 'Przejdź do KRYPTY';

  @override
  String get showSplashScreen => 'Pokazuj ekran tytułowy.';

  @override
  String get retry => 'Jeszcze raz';

  @override
  String get connectionFailed => 'Połączenie nie powiodło się';

  @override
  String get connectionFailedDetails =>
      'Połączenie nie powiodło się. Oba urządzenia muszą być online z otwartą KRYPTĄ, aby się połączyć.';

  @override
  String get gallery => 'Galeria';

  @override
  String get alignQrCode => 'WYRÓWNAJ KOD QR';

  @override
  String get scanFromGallery => 'SKANUJ Z GALERII';

  @override
  String get couldNotScanImage => 'Nie można zeskanować obrazu.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Nie można udostępnić kodu QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Nowy kontakt: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Brak publicznego klucza szyfrowania.';

  @override
  String get contactEncryptionKeyMissing => 'Brak klucza szyfrowania kontaktu.';

  @override
  String get localEncryptionKeyMissing => 'Brak lokalnego klucza szyfrowania.';

  @override
  String get noQrCodeFound => 'Nie znaleziono kodu QR na tym obrazie.';

  @override
  String get shareQrCode => 'Udostępnij kod QR';

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
  String get supportIntro =>
      'Hej! 👋 Jestem samotnym programistą ciężko pracującym nad CRYPT. Nie mam budżetu ani środków finansowych firmy. Polegam całkowicie na Twojej uczciwości i empatii, aby stale ulepszać aplikację i gwarantować BEZ REKLAM NA ZAWSZE.';

  @override
  String get chooseSupportAmount => 'Wybierz swoją cenę (przesuń do wsparcia):';

  @override
  String get poorGang => 'Jestem biedną bandą 🥀✌️';

  @override
  String get launchOfferMinimum => 'Uruchom ofertę minimalną 🚀';

  @override
  String get buyMeCoffee => 'Kup mi kawę ☕';

  @override
  String get superSupporter => 'Super Support 🔥';

  @override
  String get feature => 'Funkcja';

  @override
  String get freeTier => 'Poziom bezpłatny';

  @override
  String get premium => 'Premia';

  @override
  String get chatLocks => 'Blokady czatu';

  @override
  String get maxOneRoom => 'Maks. 1 pokój';

  @override
  String get unlimited => 'Nieograniczony';

  @override
  String get biometrics => 'Biometria';

  @override
  String get disabled => '🚫 Niepełnosprawni';

  @override
  String supportWithSats(String amount) {
    return 'Wesprzyj kwotą $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ Oferta płatności BOLT12 • Kliknij, aby skopiować';

  @override
  String get boltOfferCopied => 'Oferta płatności BOLT12 została skopiowana';

  @override
  String get tapToCopyBoltOffer =>
      'Kliknij, aby skopiować ofertę płatności BOLT12';

  @override
  String get simpleInstructionsToUnlock => '📬 Proste instrukcje odblokowania:';

  @override
  String unlockInstructions(String username) {
    return '1. Płać za pomocą portfela Phoenix na Androidzie (minimum 7500 do odblokowania — zawsze mile widziane więcej).\n2. Zrób zrzut ekranu ekranu potwierdzenia udanej transakcji.\n3. Wyślij ten zrzut ekranu e-mailem na adres jounaidnadirmed@gmail.com i podaj unikalną nazwę użytkownika swojego konta: „$username”, abym wiedział, kto zapłacił.\n4. Wpisz cokolwiek w polu poniżej, aby zapisać żądanie na tym urządzeniu:';
  }

  @override
  String get supportRequestHint =>
      'Wpisz tutaj swoje imię i nazwisko lub informacje o transakcji...';

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

  @override
  String get loadingChats => 'Ładowanie czatów...';

  @override
  String get noChatsYetTitle => 'Nie ma jeszcze żadnych czatów';

  @override
  String get noChatsYetHint =>
      'Czat rozpoczyna się po zeskanowaniu kodu QR CRYPT drugiej osoby. Otwórz stronę swojej tożsamości i udostępnij ją, aby mogli ją zeskanować.';

  @override
  String get scanQrToStartChat => 'Zeskanuj kod QR';

  @override
  String get noChatsMatchSearch =>
      'Żadne czaty nie pasują do Twojego wyszukiwania';

  @override
  String get noChatsMatchSearchHint =>
      'Wypróbuj inną nazwę lub wyczyść wyszukiwanie, aby zobaczyć każdy czat.';

  @override
  String get requestSentTitle => 'Zapytanie wysłane';

  @override
  String requestSentBody(String username) {
    return 'Twoja prośba trafiła do $username. Proszę poczekać, aż to zaakceptują.';
  }

  @override
  String get requestSentKeepOpen =>
      'Czat zostanie otwarty, gdy tylko zaakceptują. Miej CRYPT otwarty na tym urządzeniu, aby go nie przegapić.';

  @override
  String get requestSentGotIt => 'Rozumiem';

  @override
  String get scanCouldNotReadCode =>
      'Nie udało się odczytać tego kodu. Zeskanuj kod QR CRYPT.';

  @override
  String get scanMissingTheirIdentity =>
      'W tym kodzie brakuje tożsamości danej osoby. Zeskanuj kod ze strony tożsamości.';

  @override
  String get scanOwnIdentityMissing =>
      'Brakuje Twojego własnego klucza szyfrowania. Wyloguj się i zaloguj ponownie, a następnie zeskanuj ponownie.';

  @override
  String get noLightningWalletFound =>
      'Nie znaleziono portfela Lightning. Zainstaluj jeden lub skopiuj adres i wklej go do portfela.';

  @override
  String get settingsSectionAppearance => 'Wygląd';

  @override
  String get settingsSectionPrivacy => 'Prywatność i bezpieczeństwo';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Pomoc i legalność';

  @override
  String get settingsSectionAdministration => 'Administracja';

  @override
  String get settingsSectionAccount => 'Konto';

  @override
  String get settingsProtectTitle => 'Chroń ustawienia hasłem głównym';

  @override
  String get settingsProtectSubtitle =>
      'Wymagaj hasła, aby uzyskać dostęp do ustawień';

  @override
  String get chatLockSetPinSubtitle =>
      'Kliknij, aby ustawić własny PIN dla tego czatu';

  @override
  String get premiumTileTitle => 'Zdobądź dożywotnią Premium';

  @override
  String get premiumActiveSubtitle => 'Premium jest włączone na Twoim koncie';

  @override
  String get premiumPendingSubtitle =>
      'Czekam, aż administrator sprawdzi Twój zrzut ekranu';

  @override
  String get premiumHowItWorks => 'Jak działa Premium';

  @override
  String get reportProblemTitle => 'Zgłoś problem';

  @override
  String get reportProblemSubtitle => 'Błędy, nadużycia lub spam';

  @override
  String get adminAccessTitle => 'Dostęp administracyjny';

  @override
  String get adminAccessSubtitle =>
      'Wpisz swój kod administratora, aby otworzyć panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — własny kod, tylko ten czat';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount raz za pomocą portfela Lightning, a następnie wyślij zrzut ekranu';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Twój zrzut ekranu jest już dostępny. Administrator sprawdza go i włącza premium dla Twojego konta $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Zapłać $amount z $method, Lub $wallet.\n2. Zrzut ekranu potwierdzenia płatności.\n3. Wyślij go z poziomu Prześlij dowód wpłaty.\n4. Premium włącza się i pozostaje włączony przez całe życie.\n\nCRYPT jest budowany przez indywidualnego programistę i to jest cała oferta: jedna płatność, brak subskrypcji.';
  }

  @override
  String get reportIntro =>
      'Powiedz nam, co się stało. Jeśli zgłaszasz inną osobę, dodaj jej nazwę użytkownika, abyśmy mogli działać na właściwym koncie.';

  @override
  String get reportSent => 'Raport wysłany. Dziękuję.';

  @override
  String get reportSendFailed => 'Nie udało się wysłać raportu.';

  @override
  String get reportTypeLabel => 'Typ raportu';

  @override
  String get reportCategoryBug => 'Błąd';

  @override
  String get reportCategoryAbuse => 'Nadużycie';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Inne';

  @override
  String get reportUsernameLabel => 'Nazwa użytkownika (opcjonalnie)';

  @override
  String get reportUsernameHint => 'np. ktoś_ty_chcesz_zgłoszony';

  @override
  String get reportDetailsLabel => 'Co się stało?';

  @override
  String get reportScreenshotsLabel => 'Zrzuty ekranu';

  @override
  String get reportAddScreenshot => 'Dodaj zrzut ekranu';

  @override
  String get reportSendButton => 'Wyślij raport';

  @override
  String get reportPrivacyNote =>
      'Raporty są przeglądane przez administratora. Zrzuty ekranu są przechowywane prywatnie i są widoczne tylko dla moderatorów.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount raz, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Brak subskrypcji i brak możliwości przedłużenia. Zapłać za pomocą $method, wyślij zrzut ekranu potwierdzenia, a premium zostanie włączone $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT został zbudowany przez pojedynczego programistę. Premium sprawia, że ​​jest ona wolna od reklam i aktywnie utrzymywana.';

  @override
  String get premiumStepPay => 'Płać portfelem';

  @override
  String get premiumLightningAddressLabel => 'Błyskawiczny adres';

  @override
  String get premiumOpenWallet => 'Otwórz portfel';

  @override
  String get premiumCopyAddress => 'Skopiuj adres';

  @override
  String get premiumWorksWith =>
      'Współpracuje z Phoenix i każdym innym portfelem Lightning.';

  @override
  String get premiumStepScreenshot => 'Wyślij zrzut ekranu';

  @override
  String get premiumScreenshotHint =>
      'Zrób zrzut ekranu potwierdzenia płatności w portfelu Lightning i załącz go poniżej.';

  @override
  String get premiumAttachScreenshot => 'Dołącz zrzut ekranu';

  @override
  String get premiumReplaceScreenshot => 'Zamień zrzut ekranu';

  @override
  String get premiumStepAmount => 'Potwierdź kwotę';

  @override
  String get premiumAmountLabel => 'Kwota, którą zapłaciłeś (USD)';

  @override
  String get premiumNoteLabel => 'Uwaga (opcjonalnie)';

  @override
  String get premiumSendProof => 'Wyślij mój dowód';

  @override
  String get premiumAddressCopied => 'Skopiowano adres Lightning.';

  @override
  String get premiumAttachConfirmation =>
      'Załącz zrzut ekranu potwierdzenia płatności.';

  @override
  String get premiumSendProofFailed => 'Nie udało się wysłać dowodu wpłaty.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Minimum $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Aktywacja trwa $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Dowód otrzymany. Premium jest włączone w ramach $window.';
  }

  @override
  String get premiumTableFeature => 'Funkcja';

  @override
  String get premiumTableFree => 'Bezpłatny';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Szyfrowane wiadomości peer-to-peer';

  @override
  String get premiumTableMessagesStay =>
      'Wiadomości pozostają na Twoich urządzeniach';

  @override
  String get premiumTableChatLocks => 'Czaty blokowane własnym kodem PIN';

  @override
  String get premiumTableFingerprint => 'Odblokuj odciskiem palca lub twarzą';

  @override
  String get premiumTablePrice => 'Cena';

  @override
  String get premiumTableAccess => 'Dostęp';

  @override
  String get premiumTableIncluded => 'Uwzględnione';

  @override
  String get premiumTableOneChat => '1 czat';

  @override
  String get premiumTableUnlimited => 'Nieograniczony';

  @override
  String get premiumTableNotIncluded => 'Nieuwzględnione';

  @override
  String get premiumTableFreeValue => 'Bezpłatny';

  @override
  String get premiumTableWhileFree => 'Chociaż aplikacja jest bezpłatna';

  @override
  String get premiumTableLifetime => 'Całe życie';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Jedna płatność w wysokości $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Jedna płatność w wysokości $amount a Premium jest Twoja na całe życie. Nie ma subskrypcji ani możliwości przedłużenia.';
  }

  @override
  String get settingsSaveFailed =>
      'Nie można zapisać tego ustawienia. Spróbuj ponownie.';

  @override
  String get settingsLockFailed =>
      'Nie można zablokować tego czatu. Spróbuj ponownie.';

  @override
  String get settingsUnlockFailed =>
      'Nie można odblokować tego czatu. Spróbuj ponownie.';

  @override
  String pinSetTitle(String chat) {
    return 'Ustaw PIN dla $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Potwierdź PIN dla $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Ten kod PIN zostanie otwarty $chat tylko. Każdy czat ma swój własny, wybrany przez Ciebie PIN. Aplikacja nie ma jednego kodu.';
  }

  @override
  String get pinMismatch =>
      'PIN-y się nie zgadzały. Blokada nie jest włączona.';

  @override
  String get biometricNotSetUp =>
      'Na tym urządzeniu nie skonfigurowano odblokowywania za pomocą odcisku palca ani twarzy.';

  @override
  String get biometricVerifyFailed =>
      'Nie udało się zweryfikować, czy to Ty na tym urządzeniu.';

  @override
  String get lightningAddressCopied =>
      'Skopiowano adres Lightning. Wklej go do portfela, aby zapłacić.';

  @override
  String get accountSuspended => 'Konto zawieszone';

  @override
  String get premiumLifetimeAccess => 'Dożywotni dostęp premium';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Płacić $amount z $method na powyższy adres Lightning.';
  }

  @override
  String get premiumActivationStep2 =>
      'Zrób zrzut ekranu potwierdzenia płatności i wyślij go jako dowód płatności.';

  @override
  String get pinFourDigits => 'Wpisz dokładnie 4 cyfry.';

  @override
  String get scanOwnCode =>
      'To jest twój własny kod. Zeskanuj kod CRYPT innej osoby, aby rozpocząć z nią czat.';

  @override
  String get couldNotGenerateQrImage => 'Nie można wygenerować obrazu QR';

  @override
  String get conversationUpdateFailed =>
      'Aktualizacja rozmowy nie powiodła się. Spróbuj ponownie.';

  @override
  String get conversationCreationFailed =>
      'Utworzenie rozmowy nie powiodło się. Spróbuj ponownie.';

  @override
  String get accountSuspendedByAdmin =>
      'To konto zostało zawieszone przez administratora.';

  @override
  String get conversationRequestFailedTitle => 'Nie można się połączyć';

  @override
  String get conversationRequestFailedOwnUsernameMissing =>
      'Twoje konto nie ma nazwy użytkownika. Wyloguj się i zaloguj ponownie, a potem spróbuj jeszcze raz.';

  @override
  String get conversationRequestFailedOwnIdentityMissing =>
      'Brakuje Twojego własnego klucza szyfrowania. Wyloguj się i zaloguj ponownie, a potem spróbuj jeszcze raz.';

  @override
  String get conversationRequestFailedIdMismatch =>
      'Ten kod nie pasuje do tego połączenia. Zeskanuj ponownie kod ze strony tożsamości drugiej osoby.';

  @override
  String get conversationRequestFailedSignaling =>
      'Nie udało się połączyć z serwerem, aby przyjąć tę prośbę. Sprawdź połączenie i spróbuj jeszcze raz.';
}
