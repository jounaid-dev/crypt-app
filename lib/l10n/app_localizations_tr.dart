// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Hoş Geldiniz';

  @override
  String get login => 'Giriş Yap';

  @override
  String get signup => 'Kaydol';

  @override
  String get settings => 'Ayarlar';

  @override
  String get chats => 'Sohbetler';

  @override
  String get typeMessage => 'Bir mesaj yazın...';

  @override
  String get send => 'Gönder';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Bağlanıyor...';

  @override
  String get connectingP2p => 'P2P\'ye bağlanıyor...';

  @override
  String get p2pConnectionNotReady => 'P2P bağlantısı hazır değil.';

  @override
  String get searchLanguage => 'Dil ara...';

  @override
  String get language => 'Dil';

  @override
  String get forceEscapeSignOutTitle => 'Zorunlu acil çıkış yapılsın mı?';

  @override
  String get forceEscapeSignOutContent =>
      'Uyarı: Bu işlem, cihazdaki tüm verileri silecektir.';

  @override
  String get cancel => 'İptal';

  @override
  String get wipeDevice => 'Cihazı Sil';

  @override
  String get accountDestructionAlertTitle => 'Hesap Silme';

  @override
  String get accountDestructionWarning =>
      'Uyarı: Cihazdaki veriler ve uzak mesajlar silinecektir.';

  @override
  String get accountDestructionCriticalNotice =>
      'Kritik: Yanlış kodlar sistemi kilitler. Hesap parolanızı kullanın veya acil çıkışı gerçekleştirin.';

  @override
  String verificationSecurityKey(String code) {
    return 'Güvenlik Anahtarı: $code';
  }

  @override
  String get copyDigitsHint => 'Yukarıdaki 5 haneyi kopyalayın';

  @override
  String get codeMismatchNotice =>
      'Kod eşleşmedi. Ana parolayı girin veya 10 dakika bekleyin.';

  @override
  String get accountPasswordLabel => 'Hesap Parolası';

  @override
  String get deleteEverythingPermanently => 'Her Şeyi Kalıcı Olarak Sil';

  @override
  String get escapeAndPurgeDeviceData => 'Çıkış Yap ve Verileri Sil';

  @override
  String get addContact => 'Kişi Ekle';

  @override
  String get addContactConfirmation => 'Bu kişiyi eklemek istiyor musunuz?';

  @override
  String get noMessagesYet => 'Henüz mesaj yok';

  @override
  String get addNewContact => 'Yeni Kişi';

  @override
  String get usernameLabel => 'Kullanıcı adı';

  @override
  String get nicknameOptionalLabel => 'Takma ad (İsteğe bağlı)';

  @override
  String get add => 'Ekle';

  @override
  String get usernameCannotBeEmpty => 'Kullanıcı adı gerekli';

  @override
  String contactAlreadyExists(String name) {
    return '\'$name\' kişisi zaten mevcut.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '\'$name\' kullanıcısı bulunamadı. Paylaşılan gizli anahtar kullanılamıyor.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name eklendi!';
  }

  @override
  String get contacts => 'Kişiler';

  @override
  String get noContactsYet => 'Henüz kişi yok';

  @override
  String get securityLockoutActive => 'Güvenlik Kilidi';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Çok fazla deneme. $minutes dakika boyunca kilitlendi.';
  }

  @override
  String get acknowledge => 'Anladım';

  @override
  String get accessBlocked => 'Erişim Engellendi';

  @override
  String accessSuspended(int minutes) {
    return '5 başarısız deneme. Erişim $minutes dakika süreyle askıya alındı.';
  }

  @override
  String get ok => 'Tamam';

  @override
  String unlockSecureNode(String username) {
    return 'Kilidi Aç: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Kalan denemeler: $count';
  }

  @override
  String get secureKeyPasscode => 'Güvenlik Kodu';

  @override
  String get warningHardwareLockout =>
      'Uyarı: Bir sonraki başarısız deneme güvenlik kilidini etkinleştirecektir.';

  @override
  String get abort => 'İptal';

  @override
  String get authenticate => 'Kimlik Doğrula';

  @override
  String get searchPipelinesHint => 'Güvenli bağlantılar aranıyor...';

  @override
  String get zeroPipelinesDiscovered => 'Bağlantı bulunamadı.';

  @override
  String get processingDecryption => 'Şifre çözülüyor...';

  @override
  String get decrypting => 'Şifre çözülüyor...';

  @override
  String get decryptionError => '[Şifre Çözme Hatası]';

  @override
  String get cryptContainerSecure => 'CRYPT Kasası Güvenli';

  @override
  String get connectAnAccount => 'Hesap Bağla';

  @override
  String get username => 'Kullanıcı adı';

  @override
  String get password => 'Parola';

  @override
  String get enterMasterSecurityPassword => 'Ana parolanızı girin';

  @override
  String get pleaseFillAllFields => 'Tüm alanları doldurun';

  @override
  String get wrongUsernameOrPassword => 'Kullanıcı adı veya parola yanlış';

  @override
  String loginError(String error) {
    return 'Giriş hatası: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Hesabınız yok mu? Kaydolun';

  @override
  String get myIdentity => 'Kimliğim';

  @override
  String get scanToAddMe => 'Beni eklemek için tarayın';

  @override
  String get shareProfileLink => 'Profili Paylaş';

  @override
  String addMeOnCrypt(String link) {
    return 'Beni CRYPT\'a ekleyin!\n\n$link';
  }

  @override
  String get scanQr => 'QR Tara';

  @override
  String get invalidCryptQrFormat => 'Geçersiz CRYPT QR kodu.';

  @override
  String get userScanned => 'Kullanıcı tarandı!';

  @override
  String addingUser(String username) {
    return '$username ekleniyor...';
  }

  @override
  String get defaultUser => 'Kullanıcı';

  @override
  String get createAccount => 'Hesap Oluştur';

  @override
  String get keepPasswordSecureHint =>
      'Güvenli bir yerde saklayın. Parola değiştirilemez.';

  @override
  String get pleaseFillInAllFields => 'Tüm alanları doldurun';

  @override
  String get usernameExceedsLimit =>
      'Kullanıcı adı en fazla 20 karakter olabilir';

  @override
  String get invalidUsernameCharacters =>
      'Yalnızca harf, rakam, _ ve - kullanın.';

  @override
  String get weakPasswordNotice =>
      'En az 8 karakter, bir rakam ve bir büyük harf kullanın.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Benzersiz kullanıcı adı oluşturulamadı.';

  @override
  String get accountCreated => 'Hesap Oluşturuldu';

  @override
  String yourUsernameIs(String username) {
    return 'Kullanıcı adınız:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '\'$chosen\' kullanıcı adı zaten kullanılıyor.\n\nKullanıcı adınız:\n\n$assigned\n\nGiriş yapmak için bunu saklayın.';
  }

  @override
  String get continueText => 'Devam Et';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Kimlik oluşturulamadı: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT\'a Hoş Geldiniz';

  @override
  String get signupDescription =>
      'P2P şifreleme anahtarlarınızı oluşturmak için bir kullanıcı adı ve parola belirleyin.';

  @override
  String get chooseAUsername => 'Bir kullanıcı adı seçin';

  @override
  String get usernameHelperText =>
      'Gerçek adınızı kullanmayın. Kullanıcı adı alınmışsa otomatik olarak bir son ek eklenir.';

  @override
  String get masterAuthenticationRequired => 'Ana Kimlik Doğrulaması';

  @override
  String get verify => 'Doğrula';

  @override
  String get darkThemeMode => 'Karanlık Mod';

  @override
  String get secureConversations => 'Güvenli Sohbetler';

  @override
  String get noActiveConversations =>
      'Aktif sohbet yok. Kilitleri etkinleştirmek için bir sohbet başlatın.';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get wipeDeviceAndEscape => 'Cihazı Sil';

  @override
  String get falsePassword => 'Yanlış Parola';

  @override
  String accessSuspendedTimer(String time) {
    return 'Erişim askıya alındı. $time sonra tekrar deneyin.';
  }

  @override
  String get selectSecureLockMethod => 'Kilit Yöntemini Seç';

  @override
  String get selectSecureLockDescription =>
      'Parmak izi veya 4 haneli PIN ile kilitlemek ister misiniz?';

  @override
  String get fourDigitPin => '4 Haneli PIN';

  @override
  String get fingerprintUnlock => 'Parmak İzi 🔓';

  @override
  String get supportSoloDeveloper => 'Geliştiriciyi Destekle';

  @override
  String get maybeLater => 'Belki Daha Sonra';

  @override
  String get submitProof => 'Kanıt Gönder';

  @override
  String get couldNotOpenWallet =>
      'Cüzdan açılamadı. Aşağıdaki kodu kopyalayın.';

  @override
  String get proofSubmittedSnackbar =>
      'Kanıt gönderildi. Manuel inceleme 24–48 saat sürer (hafta sonları hariç).';
}
