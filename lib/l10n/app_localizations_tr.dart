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
  String get termsAndConditions => 'Şartlar ve Koşullar';

  @override
  String get settingsTermsAndConditions => 'Şartlar ve Koşullar';

  @override
  String get termsIntro =>
      'CRYPT, insanları doğrudan sohbet etmek üzere birbirine bağlayan erken aşamadaki bir uygulamadır. Uygulamayı uygun şekilde kullanmaktan ve hesap bilgilerinizin güvenliğini sağlamaktan siz sorumlusunuz.';

  @override
  String get termsConnectivity =>
      'CRYPT, cihazların birbirini bulmasına ve bağlantı kurmasına yardımcı olmak için çevrimiçi hizmetleri kullanır. Uygulama geliştikçe kullanılabilirlik ve bağlantı davranışı değişebilir. Lütfen iletişim için tek aracınız olarak CRYPT\'e güvenmeyin.';

  @override
  String get termsAgreement =>
      'Devam ederek bu şartları okuduğunuzu ve CRYPT\'i bu şartlara uygun şekilde kullanmayı kabul ettiğinizi onaylarsınız.';

  @override
  String get agreeTerms => 'Şartlar ve Koşulları kabul ediyorum';

  @override
  String get agreeAndContinue => 'Kabul et ve devam et';

  @override
  String get beforeYouStart => 'Başlamadan Önce';

  @override
  String get connected => 'Bağlandı';

  @override
  String get connectFirstThenChat => 'Önce bağlanın, sonra sohbet edin';

  @override
  String get betaIntro =>
      'CRYPT erken beta sürümündedir; bu nedenle deneyim gelecekteki sürümlerde geliştirilebilir.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT telsiz gibi çalışır: bağlantı kurmak için iki kişinin de çevrimiçi olması ve CRYPT\'i aynı anda açık tutması gerekir.';

  @override
  String get howToUseCrypt =>
      'CRYPT nasıl kullanılır:\n1. Diğer kişinin CRYPT QR kodunu tarayın.\n2. Her iki kişinin de CRYPT\'i açık ve çevrimiçi olmalıdır.\n3. CRYPT P2P bağlantısını kurarken bekleyin.\n4. “Bağlanıyor...” durumunun kaybolmasını ve bağlantının kurulmasını bekleyin.\n5. Bağlandıktan sonra sohbete başlayabilirsiniz.';

  @override
  String get messageStorageExplanation =>
      'Mesajlarınız bağlı cihazlar arasında doğrudan gönderilmek üzere tasarlanmıştır. CRYPT sohbet mesajlarınızı sunucularımızda saklamaz. Sunucu şu anda bağlantı ve sinyalleşmeye yardımcı olur; sohbet geçmişi sunucuda tutulmaz. Diğer kişi çevrimdışıysa mevcut P2P bağlantısı kurulamaz.';

  @override
  String get settingsAndSupportExplanation =>
      'CRYPT deneyiminizi özelleştirmek için Ayarlar\'ı ziyaret edin. Yakında daha fazla özelleştirme seçeneği sunulacaktır.\n\nCRYPT\'i desteklemek ister misiniz? Bağış seçeneğini Ayarlar\'da bulabilirsiniz.';

  @override
  String get saving => 'Kaydediliyor...';

  @override
  String get continueToCrypt => 'CRYPT\'e devam et';

  @override
  String get showSplashScreen => 'Açılış ekranını göster';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get connectionFailed => 'Bağlantı başarısız';

  @override
  String get connectionFailedDetails =>
      'Bağlantı başarısız. Bağlanmak için her iki cihaz da çevrimiçi olmalı ve CRYPT açık olmalıdır.';

  @override
  String get gallery => 'Galeri';

  @override
  String get alignQrCode => 'QR KODUNU HİZALA';

  @override
  String get scanFromGallery => 'GALERİDEN TARA';

  @override
  String get couldNotScanImage => 'Görüntü taranamadı.';

  @override
  String couldNotShareQrCode(String error) {
    return 'QR kodu paylaşılamadı: $error';
  }

  @override
  String newContact(String username) {
    return 'Yeni kişi: $username';
  }

  @override
  String get publicEncryptionKeyMissing => 'Genel şifreleme anahtarınız eksik.';

  @override
  String get contactEncryptionKeyMissing => 'Kişinin şifreleme anahtarı eksik.';

  @override
  String get localEncryptionKeyMissing => 'Yerel şifreleme anahtarı eksik.';

  @override
  String get noQrCodeFound => 'Bu görüntüde QR kodu bulunamadı.';

  @override
  String get shareQrCode => 'QR Kodunu Paylaş';

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
  String get supportIntro =>
      'Hey! 👋 Ben CRYPT üzerinde yoğun şekilde çalışan solo bir geliştiriciyim. Bütçem ya da kurumsal finansmanım yok. Uygulamayı geliştirmeye devam etmek ve SONSUZA KADAR REKLAM YOK olacağını garanti etmek için tamamen dürüstlüğünüze ve empatinize güveniyorum.';

  @override
  String get chooseSupportAmount => 'Fiyatınızı Seçin (Destek için kaydırın):';

  @override
  String get poorGang => 'Ben fakir çeteyim 🥀✌️';

  @override
  String get launchOfferMinimum => 'Minimum Teklifi Başlat 🚀';

  @override
  String get buyMeCoffee => 'Bana Bir Kahve Al ☕';

  @override
  String get superSupporter => 'Süper Destekçi 🔥';

  @override
  String get feature => 'Özellik';

  @override
  String get freeTier => 'Ücretsiz Katman';

  @override
  String get premium => 'prim';

  @override
  String get chatLocks => 'Sohbet Kilitleri';

  @override
  String get maxOneRoom => 'Maksimum 1 Oda';

  @override
  String get unlimited => 'Sınırsız';

  @override
  String get biometrics => 'Biyometri';

  @override
  String get disabled => '🚫 Engelli';

  @override
  String supportWithSats(String amount) {
    return '$amount satoshi (Phoenix) desteği';
  }

  @override
  String get boltOffer => '⚡ BOLT12 ödeme teklifi • Kopyalamak için dokunun';

  @override
  String get boltOfferCopied => 'BOLT12 ödeme teklifi kopyalandı';

  @override
  String get tapToCopyBoltOffer =>
      'BOLT12 ödeme teklifini kopyalamak için dokunun';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Kilidini Açmak İçin Basit Talimatlar:';

  @override
  String unlockInstructions(String username) {
    return '1. Android\'de Phoenix Cüzdanını kullanarak ödeme yapın (kilidi açmak için minimum 7.500; daha fazlası her zaman memnuniyetle karşılanır).\n2. Başarılı işlem onay ekranınızın ekran görüntüsünü alın.\n3. Bu ekran görüntüsünü jounaidnadirmed@gmail.com adresine e-postayla gönderin ve bana benzersiz hesap kullanıcı adınızı söyleyin: \'$username\', böylece kimin ödediğini bileyim.\n4. İsteğinizi bu cihaza kaydetmek için aşağıdaki kutuya herhangi bir şey yazın:';
  }

  @override
  String get supportRequestHint =>
      'Adınızı veya işlem bilgilerinizi buraya yazın...';

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

  @override
  String get loadingChats => 'Sohbetler yükleniyor...';

  @override
  String get noChatsYetTitle => 'Henüz sohbet yok';

  @override
  String get noChatsYetHint =>
      'Diğer kişinin CRYPT QR kodunu taradığınızda sohbet başlar. Tarayabilmeleri için kimlik sayfanızı açarak sizinkini paylaşın.';

  @override
  String get scanQrToStartChat => 'QR kodunu tarayın';

  @override
  String get noChatsMatchSearch => 'Aramanızla eşleşen sohbet yok';

  @override
  String get noChatsMatchSearchHint =>
      'Farklı bir ad deneyin veya her sohbeti görmek için aramayı temizleyin.';

  @override
  String get requestSentTitle => 'İstek gönderildi';

  @override
  String requestSentBody(String username) {
    return 'Talebiniz şu adrese gitti: $username. Lütfen kabul etmelerini bekleyin.';
  }

  @override
  String get requestSentKeepOpen =>
      'Kabul ettikleri anda sohbet açılır. Kaçırmamak için bu cihazda CRYPT\'i açık tutun.';

  @override
  String get requestSentGotIt => 'Anladım';

  @override
  String get scanCouldNotReadCode =>
      'Bu kod okunamadı. Bir CRYPT QR kodunu tarayın.';

  @override
  String get scanMissingTheirIdentity =>
      'Bu kodda kişinin kimliği eksik. Kodu kimlik sayfasından tarayın.';

  @override
  String get scanOwnIdentityMissing =>
      'Kendi şifreleme anahtarınız eksik. Oturumu kapatıp tekrar açın ve tekrar tarayın.';

  @override
  String get noLightningWalletFound =>
      'Lightning cüzdanı bulunamadı. Bir tane yükleyin veya adresi kopyalayıp bir cüzdana yapıştırın.';

  @override
  String get settingsSectionAppearance => 'Görünüm';

  @override
  String get settingsSectionPrivacy => 'Gizlilik ve güvenlik';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Yardım ve yasal';

  @override
  String get settingsSectionAdministration => 'Yönetim';

  @override
  String get settingsSectionAccount => 'Hesap';

  @override
  String get settingsProtectTitle => 'Ayarları ana parolayla koruyun';

  @override
  String get settingsProtectSubtitle => 'Ayarlara erişmek için şifre iste';

  @override
  String get chatLockSetPinSubtitle =>
      'Bu sohbet için kendi PIN\'inizi ayarlamak üzere dokunun';

  @override
  String get premiumTileTitle => 'Ömür Boyu Premium\'u Alın';

  @override
  String get premiumActiveSubtitle => 'Hesabınızda premium açık';

  @override
  String get premiumPendingSubtitle =>
      'Bir yöneticinin ekran görüntünüzü incelemesi bekleniyor';

  @override
  String get premiumHowItWorks => 'Premium nasıl çalışır?';

  @override
  String get reportProblemTitle => 'Sorun bildir';

  @override
  String get reportProblemSubtitle => 'Hatalar, kötüye kullanım veya spam';

  @override
  String get adminAccessTitle => 'Yönetici erişimi';

  @override
  String get adminAccessSubtitle => 'Paneli açmak için yönetici kodunuzu girin';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — kendi kodunuz, yalnızca bu sohbet';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount Lightning cüzdanınızla bir kez kullanın, ardından bir ekran görüntüsü gönderin';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Ekran görüntünüz geldi. Bir yönetici bunu kontrol eder ve hesabınız için premium özelliği açılır. $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Ödeme $amount ile $method, veya $wallet.\n2. Ödeme onayının ekran görüntüsünü alın.\n3. Ödeme kanıtını gönder\'den gönderin.\n4. Premium açılır ve ömür boyu açık kalır.\n\nCRYPT, tek bir geliştirici tarafından oluşturulmuştur ve tüm teklif budur: tek ödeme, abonelik yok.';
  }

  @override
  String get reportIntro =>
      'Bize ne olduğunu anlat. Başka bir kişiyi şikayet ediyorsanız doğru hesapla harekete geçebilmemiz için kullanıcı adını ekleyin.';

  @override
  String get reportSent => 'Rapor gönderildi. Teşekkür ederim.';

  @override
  String get reportSendFailed => 'Rapor gönderilemedi.';

  @override
  String get reportTypeLabel => 'Rapor türü';

  @override
  String get reportCategoryBug => 'Hata';

  @override
  String get reportCategoryAbuse => 'Kötüye kullanım';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Diğer';

  @override
  String get reportUsernameLabel => 'Kullanıcı adı (isteğe bağlı)';

  @override
  String get reportUsernameHint => 'örneğin birisi_you_want_reported';

  @override
  String get reportDetailsLabel => 'Ne oldu?';

  @override
  String get reportScreenshotsLabel => 'Ekran görüntüleri';

  @override
  String get reportAddScreenshot => 'Ekran görüntüsü ekle';

  @override
  String get reportSendButton => 'Raporu gönder';

  @override
  String get reportPrivacyNote =>
      'Raporlar bir yönetici tarafından incelenir. Ekran görüntüleri özel olarak saklanır ve yalnızca moderatörler tarafından görülebilir.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount bir kere, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Abonelik yok ve yenilenecek bir şey yok. Şununla öde: $method, onayın ekran görüntüsünü gönderdiğinizde premium açılır $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT, yalnız bir geliştirici tarafından oluşturulmuştur. Premium, onu reklamsız ve aktif bir şekilde muhafaza eden şeydir.';

  @override
  String get premiumStepPay => 'Cüzdanınızla ödeme yapın';

  @override
  String get premiumLightningAddressLabel => 'Yıldırım adresi';

  @override
  String get premiumOpenWallet => 'Cüzdanı aç';

  @override
  String get premiumCopyAddress => 'Adresi kopyala';

  @override
  String get premiumWorksWith =>
      'Phoenix ve diğer Lightning cüzdanlarıyla çalışır.';

  @override
  String get premiumStepScreenshot => 'Ekran görüntüsünü gönder';

  @override
  String get premiumScreenshotHint =>
      'Lightning cüzdanınızdaki ödeme onayının ekran görüntüsünü alın ve aşağıya ekleyin.';

  @override
  String get premiumAttachScreenshot => 'Ekran görüntüsü ekle';

  @override
  String get premiumReplaceScreenshot => 'Ekran görüntüsünü değiştir';

  @override
  String get premiumStepAmount => 'Tutarı onaylayın';

  @override
  String get premiumAmountLabel => 'Ödediğiniz tutar (USD)';

  @override
  String get premiumNoteLabel => 'Not (isteğe bağlı)';

  @override
  String get premiumSendProof => 'Kanıtımı gönder';

  @override
  String get premiumAddressCopied => 'Lightning adresi kopyalandı.';

  @override
  String get premiumAttachConfirmation =>
      'Ödeme onayınızın ekran görüntüsünü ekleyin.';

  @override
  String get premiumSendProofFailed => 'Ödeme kanıtı gönderilemedi.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Asgari $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Etkinleştirme sürer $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Kanıt alındı. Premium şu süre içinde açıldı: $window.';
  }

  @override
  String get premiumTableFeature => 'Özellik';

  @override
  String get premiumTableFree => 'Ücretsiz';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Eşler arası şifreli mesajlaşma';

  @override
  String get premiumTableMessagesStay => 'Mesajlar cihazlarınızda kalır';

  @override
  String get premiumTableChatLocks => 'Kendi PIN\'inizle kilitlenen sohbetler';

  @override
  String get premiumTableFingerprint => 'Parmak izi veya yüz ile kilidi açın';

  @override
  String get premiumTablePrice => 'Fiyat';

  @override
  String get premiumTableAccess => 'Erişim';

  @override
  String get premiumTableIncluded => 'Dahil';

  @override
  String get premiumTableOneChat => '1 sohbet';

  @override
  String get premiumTableUnlimited => 'Sınırsız';

  @override
  String get premiumTableNotIncluded => 'Dahil değil';

  @override
  String get premiumTableFreeValue => 'Ücretsiz';

  @override
  String get premiumTableWhileFree => 'Uygulama ücretsiz olsa da';

  @override
  String get premiumTableLifetime => 'Ömür boyu';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Bir ödeme $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Bir ödeme $amount ve premium ömür boyu sizindir. Abonelik yok ve yenilenecek bir şey yok.';
  }

  @override
  String get settingsSaveFailed => 'Bu ayar kaydedilemedi. Tekrar deneyin.';

  @override
  String get settingsLockFailed => 'Bu sohbet kilitlenemedi. Tekrar deneyin.';

  @override
  String get settingsUnlockFailed =>
      'Bu sohbetin kilidi açılamadı. Tekrar deneyin.';

  @override
  String pinSetTitle(String chat) {
    return 'Şunun için bir PIN belirleyin: $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'PIN\'i onaylayın $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Bu PIN açılır $chat sadece. Her sohbetin sizin tarafınızdan seçilen kendi PIN\'i vardır. Uygulamanın tek bir kodu yok.';
  }

  @override
  String get pinMismatch => 'PIN\'ler eşleşmedi. Kilit etkin değil.';

  @override
  String get biometricNotSetUp =>
      'Bu cihazda parmak izi veya yüz tanıma kilidi ayarlanmadı.';

  @override
  String get biometricVerifyFailed =>
      'Bu cihazdaki kişinin siz olduğunuz doğrulanamadı.';

  @override
  String get lightningAddressCopied =>
      'Lightning adresi kopyalandı. Ödemek için cüzdanınıza yapıştırın.';

  @override
  String get accountSuspended => 'Hesap askıya alındı';

  @override
  String get premiumLifetimeAccess => 'Ömür Boyu Premium Erişim';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Ödemek $amount itibaren $method Yukarıdaki Lightning adresine.';
  }

  @override
  String get premiumActivationStep2 =>
      'Ödeme onayının ekran görüntüsünü alın ve ödeme kanıtı olarak gönderin.';

  @override
  String get pinFourDigits => 'Tam olarak 4 hane girin.';

  @override
  String get scanOwnCode =>
      'Bu sizin kendi kodunuzdur. Başka biriyle sohbet başlatmak için başka birinin CRYPT kodunu tarayın.';

  @override
  String get couldNotGenerateQrImage => 'QR görüntüsü oluşturulamadı';

  @override
  String get conversationUpdateFailed =>
      'Konuşma güncellemesi başarısız oldu. Tekrar deneyin.';

  @override
  String get conversationCreationFailed =>
      'Konuşma oluşturma başarısız oldu. Tekrar deneyin.';

  @override
  String get accountSuspendedByAdmin =>
      'Bu hesap bir yönetici tarafından askıya alındı.';

  @override
  String get unlockCrypt => 'Uygulamanın kilidini aç';

  @override
  String get unlockCryptBody =>
      'Bu cihazdaki mesajlarınızın şifresini çözmek için ana şifrenizi girin.';

  @override
  String get unlock => 'Şimdi kilidini aç';

  @override
  String get attachPhoto => 'Fotoğraf';

  @override
  String get attachFile => 'Dosya';

  @override
  String attachmentTooLarge(int mb) {
    return 'Bu dosya çok büyük. Sınır $mb MB\'tır.';
  }

  @override
  String get attachmentSendFailed => 'Bu ek gönderilemedi.';

  @override
  String get attachmentOpenFailed => 'Bu ek açılamadı.';
}
