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
