// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Syarat & Ketentuan';

  @override
  String get settingsTermsAndConditions => 'Syarat & Ketentuan';

  @override
  String get termsIntro =>
      'CRYPT adalah aplikasi tahap awal untuk menghubungkan orang secara langsung untuk melakukan percakapan. Anda bertanggung jawab untuk menggunakan aplikasi dengan benar dan menjaga keamanan kredensial akun Anda.';

  @override
  String get termsConnectivity =>
      'CRYPT menggunakan layanan online untuk membantu perangkat menemukan dan membuat koneksi. Ketersediaan dan perilaku koneksi dapat berubah seiring berkembangnya aplikasi. Harap jangan mengandalkan CRYPT sebagai satu-satunya alat komunikasi Anda.';

  @override
  String get termsAgreement =>
      'Dengan melanjutkan, Anda mengonfirmasi bahwa Anda telah membaca dan setuju untuk menggunakan CRYPT berdasarkan ketentuan ini.';

  @override
  String get agreeTerms => 'Saya menyetujui Syarat & Ketentuan';

  @override
  String get agreeAndContinue => 'Setuju dan lanjutkan';

  @override
  String get beforeYouStart => 'Sebelum Anda Mulai';

  @override
  String get connected => 'Terhubung';

  @override
  String get connectFirstThenChat => 'Hubungkan dulu, lalu ngobrol';

  @override
  String get betaIntro =>
      'CRYPT adalah versi beta awal, sehingga pengalamannya mungkin meningkat di versi mendatang.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT bekerja seperti walkie-talkie: kedua orang harus online dan membuka CRYPT pada saat yang sama untuk membuat koneksi.';

  @override
  String get howToUseCrypt =>
      'Cara menggunakan CRYPT:\n1. Pindai kode QR CRYPT orang lain.\n2. Kedua orang tersebut membutuhkan CRYPT secara terbuka dan online.\n3. Tunggu sementara CRYPT membuat koneksi P2P.\n4. Tunggu hingga status \"Menghubungkan...\" menghilang dan koneksi terjalin.\n5. Setelah terhubung, Anda dapat mulai mengobrol.';

  @override
  String get messageStorageExplanation =>
      'Pesan Anda dirancang untuk dikirim langsung antar perangkat yang terhubung. CRYPT tidak menyimpan pesan obrolan Anda di server kami. Server saat ini membantu koneksi dan sinyal, dan riwayat obrolan tidak disimpan di server. Jika orang lain sedang offline, koneksi P2P saat ini tidak dapat dibuat.';

  @override
  String get settingsAndSupportExplanation =>
      'Kunjungi Pengaturan untuk menyesuaikan pengalaman CRYPT Anda. Opsi penyesuaian lainnya akan segera hadir.\n\nIngin mendukung CRYPT? Anda dapat menemukan opsi donasi di Pengaturan.';

  @override
  String get saving => 'Penghematan...';

  @override
  String get continueToCrypt => 'Lanjutkan ke CRYPT';

  @override
  String get showSplashScreen => 'Tampilkan layar splash';

  @override
  String get retry => 'Mencoba kembali';

  @override
  String get connectionFailed => 'Koneksi gagal';

  @override
  String get connectionFailedDetails =>
      'Koneksi gagal. Kedua perangkat harus online dengan CRYPT terbuka untuk terhubung.';

  @override
  String get gallery => 'Galeri';

  @override
  String get alignQrCode => 'SESUAIKAN KODE QR';

  @override
  String get scanFromGallery => 'PINDAI DARI GALERI';

  @override
  String get couldNotScanImage => 'Tidak dapat memindai gambar.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Tidak dapat membagikan kode QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Kontak baru: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Kunci enkripsi publik Anda tidak ada.';

  @override
  String get contactEncryptionKeyMissing => 'Kunci enkripsi kontak tidak ada.';

  @override
  String get localEncryptionKeyMissing => 'Kunci enkripsi lokal tidak ada.';

  @override
  String get noQrCodeFound =>
      'Tidak ada kode QR yang ditemukan pada gambar ini.';

  @override
  String get shareQrCode => 'Bagikan Kode QR';

  @override
  String get welcome => 'Selamat Datang';

  @override
  String get login => 'Masuk';

  @override
  String get signup => 'Daftar';

  @override
  String get settings => 'Pengaturan';

  @override
  String get chats => 'Obrolan';

  @override
  String get typeMessage => 'Ketik pesan...';

  @override
  String get send => 'Kirim';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Menghubungkan...';

  @override
  String get connectingP2p => 'Menghubungkan ke P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P belum siap.';

  @override
  String get searchLanguage => 'Cari bahasa...';

  @override
  String get language => 'Bahasa';

  @override
  String get forceEscapeSignOutTitle => 'KELUAR DARURAT?';

  @override
  String get forceEscapeSignOutContent =>
      'PERINGATAN: Semua data di perangkat ini akan dihapus.';

  @override
  String get cancel => 'Batal';

  @override
  String get wipeDevice => 'HAPUS PERANGKAT';

  @override
  String get accountDestructionAlertTitle => 'PERINGATAN PENGHAPUSAN AKUN';

  @override
  String get accountDestructionWarning =>
      'PERINGATAN: Semua data di perangkat dan pesan jarak jauh akan dihapus.';

  @override
  String get accountDestructionCriticalNotice =>
      'PENTING: Kode yang salah akan mengunci sistem. Gunakan kata sandi master atau keluar darurat.';

  @override
  String verificationSecurityKey(String code) {
    return 'Kunci keamanan verifikasi: $code';
  }

  @override
  String get copyDigitsHint => 'Salin 5 angka di atas';

  @override
  String get codeMismatchNotice =>
      'Kode salah. Masukkan kata sandi master untuk mengabaikan, atau tunggu 10 menit.';

  @override
  String get accountPasswordLabel => 'Kata sandi akun';

  @override
  String get deleteEverythingPermanently => 'HAPUS SEMUANYA PERMANEN';

  @override
  String get escapeAndPurgeDeviceData => 'Keluar dan hapus data perangkat';

  @override
  String get addContact => 'Tambah kontak';

  @override
  String get addContactConfirmation => 'Tambah kontak ini?';

  @override
  String get noMessagesYet => 'Belum ada pesan';

  @override
  String get addNewContact => 'Kontak baru';

  @override
  String get usernameLabel => 'Nama pengguna';

  @override
  String get nicknameOptionalLabel => 'Nama panggilan (opsional)';

  @override
  String get add => 'Tambah';

  @override
  String get usernameCannotBeEmpty => 'Nama pengguna wajib diisi';

  @override
  String contactAlreadyExists(String name) {
    return '\'$name\' sudah ada.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '\'$name\' tidak ditemukan. Rahasia bersama tidak dapat dibuat.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name berhasil ditambahkan!';
  }

  @override
  String get contacts => 'Kontak';

  @override
  String get noContactsYet => 'Belum ada kontak';

  @override
  String get securityLockoutActive => 'Kunci keamanan aktif';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Terlalu banyak percobaan tidak valid. Dikunci selama $minutes menit.';
  }

  @override
  String get acknowledge => 'Mengerti';

  @override
  String get accessBlocked => 'Akses diblokir';

  @override
  String accessSuspended(int minutes) {
    return '5 percobaan verifikasi salah. Akses ditangguhkan selama $minutes menit.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Buka kunci node aman: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Sisa percobaan verifikasi: $count.';
  }

  @override
  String get secureKeyPasscode => 'Kode keamanan';

  @override
  String get warningHardwareLockout =>
      'PERINGATAN: Kesalahan sistem berikutnya akan memicu penguncian keamanan perangkat keras.';

  @override
  String get abort => 'Batal';

  @override
  String get authenticate => 'Autentikasi';

  @override
  String get searchPipelinesHint => 'Cari koneksi aman yang aktif...';

  @override
  String get zeroPipelinesDiscovered =>
      'Tidak ada koneksi yang cocok ditemukan.';

  @override
  String get processingDecryption => 'Memproses dekripsi...';

  @override
  String get decrypting => 'Mendekripsi...';

  @override
  String get decryptionError => '[Kesalahan dekripsi]';

  @override
  String get cryptContainerSecure => 'WADAH CRYPT AMAN';

  @override
  String get connectAnAccount => 'Hubungkan akun';

  @override
  String get username => 'Nama pengguna';

  @override
  String get password => 'Kata sandi';

  @override
  String get enterMasterSecurityPassword =>
      'Masukkan kata sandi keamanan master';

  @override
  String get pleaseFillAllFields => 'Silakan isi semua kolom';

  @override
  String get wrongUsernameOrPassword => 'Nama pengguna atau kata sandi salah';

  @override
  String loginError(String error) {
    return 'Kesalahan masuk: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Belum punya akun? Daftar';

  @override
  String get myIdentity => 'Identitas saya';

  @override
  String get scanToAddMe => 'Pindai untuk menambahkan saya';

  @override
  String get shareProfileLink => 'Bagikan tautan profil';

  @override
  String addMeOnCrypt(String link) {
    return 'Tambahkan saya di CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Pindai QR';

  @override
  String get invalidCryptQrFormat => 'Format QR CRYPT tidak valid.';

  @override
  String get userScanned => 'Pengguna dipindai!';

  @override
  String addingUser(String username) {
    return 'Menambahkan $username...';
  }

  @override
  String get defaultUser => 'Pengguna';

  @override
  String get createAccount => 'Buat akun';

  @override
  String get keepPasswordSecureHint =>
      'Simpan dengan aman. Kata sandi tidak dapat diubah.';

  @override
  String get pleaseFillInAllFields => 'Silakan isi semua kolom';

  @override
  String get usernameExceedsLimit =>
      'Nama pengguna tidak boleh lebih dari 20 karakter';

  @override
  String get invalidUsernameCharacters =>
      'Nama pengguna hanya boleh berisi huruf, angka, _ atau -.';

  @override
  String get weakPasswordNotice =>
      'Kata sandi harus memiliki 8+ karakter, 1 angka, dan 1 huruf besar.';

  @override
  String get unableToGenerateUniqueUsername =>
      'Nama pengguna unik tidak dapat dibuat.';

  @override
  String get accountCreated => 'Akun dibuat';

  @override
  String yourUsernameIs(String username) {
    return 'Nama pengguna Anda:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '\'$chosen\' sudah digunakan.\n\nNama pengguna Anda:\n\n$assigned\n\nIngat nama ini. Anda membutuhkannya untuk login.';
  }

  @override
  String get continueText => 'Lanjutkan';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Gagal membuat identitas aman: $error';
  }

  @override
  String get welcomeToCrypt => 'Selamat datang di CRYPT';

  @override
  String get signupDescription =>
      'Masukkan nama pengguna dan kata sandi untuk membuat kunci enkripsi P2P.';

  @override
  String get chooseAUsername => 'Pilih nama pengguna';

  @override
  String get usernameHelperText =>
      'Jangan gunakan nama asli. Jika nama sudah digunakan, kami akan menambahkan sufiks unik.';

  @override
  String get masterAuthenticationRequired => 'Autentikasi master diperlukan';

  @override
  String get verify => 'Verifikasi';

  @override
  String get darkThemeMode => 'Mode gelap';

  @override
  String get secureConversations => 'Percakapan aman';

  @override
  String get noActiveConversations =>
      'Tidak ada percakapan aktif. Mulai percakapan untuk menggunakan kunci keamanan khusus.';

  @override
  String get logout => 'Keluar';

  @override
  String get wipeDeviceAndEscape => 'HAPUS PERANGKAT & KELUAR';

  @override
  String get falsePassword => 'Kata sandi palsu';

  @override
  String accessSuspendedTimer(String time) {
    return 'Akses ditangguhkan demi keamanan. Coba lagi dalam $time.';
  }

  @override
  String get selectSecureLockMethod => 'Pilih metode kunci';

  @override
  String get selectSecureLockDescription =>
      'Kunci ruang percakapan dengan sidik jari perangkat atau PIN 4 digit?';

  @override
  String get fourDigitPin => 'PIN 4 digit';

  @override
  String get fingerprintUnlock => 'Sidik jari 🔓';

  @override
  String get supportSoloDeveloper => 'Dukung pengembang solo';

  @override
  String get supportIntro =>
      'Hai! 👋 Saya seorang pengembang tunggal yang bekerja keras di CRYPT. Saya tidak memiliki anggaran atau pendanaan perusahaan. Saya sepenuhnya mengandalkan kejujuran dan empati Anda untuk terus meningkatkan aplikasi dan menjamin TANPA IKLAN SELAMANYA.';

  @override
  String get chooseSupportAmount => 'Pilih Harga Anda (Geser untuk mendukung):';

  @override
  String get poorGang => 'Aku miskin geng 🥀✌️';

  @override
  String get launchOfferMinimum => 'Luncurkan Penawaran Minimum 🚀';

  @override
  String get buyMeCoffee => 'Belikan Aku Kopi ☕';

  @override
  String get superSupporter => 'Pendukung Super 🔥';

  @override
  String get feature => 'Fitur';

  @override
  String get freeTier => 'Tingkat Gratis';

  @override
  String get premium => 'Premi';

  @override
  String get chatLocks => 'Kunci Obrolan';

  @override
  String get maxOneRoom => 'Maks 1 Kamar';

  @override
  String get unlimited => 'Tak terbatas';

  @override
  String get biometrics => 'Biometrik';

  @override
  String get disabled => 'dengan disabilitas';

  @override
  String supportWithSats(String amount) {
    return 'Dukungan dengan $amount sats (Phoenix)';
  }

  @override
  String get boltOffer =>
      '⚡ Penawaran pembayaran BOLT12 • Ketuk untuk menyalin';

  @override
  String get boltOfferCopied => 'Penawaran pembayaran BOLT12 disalin';

  @override
  String get tapToCopyBoltOffer =>
      'Ketuk untuk menyalin penawaran pembayaran BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Petunjuk Sederhana untuk Membuka Kunci:';

  @override
  String unlockInstructions(String username) {
    return '1. Bayar menggunakan Phoenix Wallet di Android (minimum 7.500 untuk membuka kunci — lebih banyak selalu dihargai).\n2. Ambil screenshot layar konfirmasi transaksi Anda yang berhasil.\n3. Kirimkan tangkapan layar tersebut melalui email ke jounaidnadirmed@gmail.com dan beri tahu saya nama pengguna unik akun Anda: \'$username\' agar saya tahu siapa yang membayar.\n4. Ketik apa saja pada kotak di bawah ini untuk menyimpan permintaan Anda di perangkat ini:';
  }

  @override
  String get supportRequestHint =>
      'Ketik nama atau info transaksi Anda di sini...';

  @override
  String get maybeLater => 'Mungkin nanti';

  @override
  String get submitProof => 'Kirim bukti';

  @override
  String get couldNotOpenWallet =>
      'Dompet tidak dapat dibuka otomatis. Salin kode teks di bawah sebagai gantinya.';

  @override
  String get proofSubmittedSnackbar =>
      'Bukti terkirim! Peninjauan manual memerlukan 24–48 jam, tidak termasuk akhir pekan. Anda tetap dapat menggunakan aplikasi seperti biasa.';

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
