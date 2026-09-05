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
  String get maybeLater => 'Mungkin nanti';

  @override
  String get submitProof => 'Kirim bukti';

  @override
  String get couldNotOpenWallet =>
      'Dompet tidak dapat dibuka otomatis. Salin kode teks di bawah sebagai gantinya.';

  @override
  String get proofSubmittedSnackbar =>
      'Bukti terkirim! Peninjauan manual memerlukan 24–48 jam, tidak termasuk akhir pekan. Anda tetap dapat menggunakan aplikasi seperti biasa.';
}
