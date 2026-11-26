// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'ข้อกำหนดและเงื่อนไข';

  @override
  String get settingsTermsAndConditions => 'ข้อกำหนดและเงื่อนไข';

  @override
  String get termsIntro =>
      'CRYPT เป็นแอปพลิเคชันระยะเริ่มต้นสำหรับเชื่อมต่อผู้คนโดยตรงเพื่อการสนทนา คุณมีหน้าที่รับผิดชอบต่อการใช้งานแอปอย่างเหมาะสมและการรักษาข้อมูลบัญชีของคุณให้ปลอดภัย';

  @override
  String get termsConnectivity =>
      'CRYPT ใช้บริการออนไลน์เพื่อช่วยให้อุปกรณ์ค้นหาและสร้างการเชื่อมต่อ ความพร้อมใช้งานและพฤติกรรมการเชื่อมต่ออาจเปลี่ยนแปลงไปเมื่อแอปพัฒนา โปรดอย่าพึ่งพา CRYPT เป็นช่องทางการสื่อสารเพียงช่องทางเดียว';

  @override
  String get termsAgreement =>
      'เมื่อดำเนินการต่อ คุณยืนยันว่าได้อ่านและยอมรับการใช้งาน CRYPT ภายใต้ข้อกำหนดเหล่านี้';

  @override
  String get agreeTerms => 'ฉันยอมรับข้อกำหนดและเงื่อนไข';

  @override
  String get agreeAndContinue => 'ยอมรับและดำเนินการต่อ';

  @override
  String get beforeYouStart => 'ก่อนเริ่มต้น';

  @override
  String get connected => 'เชื่อมต่อแล้ว';

  @override
  String get connectFirstThenChat => 'เชื่อมต่อก่อน แล้วจึงแชท';

  @override
  String get betaIntro =>
      'CRYPT เป็นรุ่นเบต้าเริ่มต้น ประสบการณ์การใช้งานจึงอาจได้รับการปรับปรุงในรุ่นต่อ ๆ ไป';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT ทำงานคล้ายวิทยุสื่อสาร: ทั้งสองคนต้องออนไลน์และเปิด CRYPT พร้อมกันเพื่อสร้างการเชื่อมต่อ';

  @override
  String get howToUseCrypt =>
      'วิธีใช้ CRYPT:\n1. สแกนรหัส QR ของ CRYPT ของอีกฝ่าย\n2. ทั้งสองคนต้องเปิด CRYPT และออนไลน์\n3. รอให้ CRYPT สร้างการเชื่อมต่อ P2P\n4. รอให้สถานะ “กำลังเชื่อมต่อ...” หายไปและการเชื่อมต่อเสร็จสมบูรณ์\n5. เมื่อเชื่อมต่อแล้ว คุณสามารถเริ่มแชทได้';

  @override
  String get messageStorageExplanation =>
      'ข้อความของคุณออกแบบให้ส่งโดยตรงระหว่างอุปกรณ์ที่เชื่อมต่อ CRYPT ไม่จัดเก็บข้อความแชทของคุณบนเซิร์ฟเวอร์ เซิร์ฟเวอร์ช่วยเรื่องการเชื่อมต่อและการส่งสัญญาณในขณะนี้ และไม่ได้จัดเก็บประวัติแชท หากอีกฝ่ายออฟไลน์ จะไม่สามารถสร้างการเชื่อมต่อ P2P ปัจจุบันได้';

  @override
  String get settingsAndSupportExplanation =>
      'ไปที่การตั้งค่าเพื่อปรับแต่งประสบการณ์ CRYPT ของคุณ จะมีตัวเลือกการปรับแต่งเพิ่มเติมในเร็ว ๆ นี้\n\nต้องการสนับสนุน CRYPT หรือไม่ คุณสามารถพบตัวเลือกบริจาคได้ในการตั้งค่า';

  @override
  String get saving => 'กำลังบันทึก...';

  @override
  String get continueToCrypt => 'ไปต่อที่ CRYPT';

  @override
  String get showSplashScreen => 'แสดงหน้าจอเริ่มต้น';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get connectionFailed => 'การเชื่อมต่อล้มเหลว';

  @override
  String get connectionFailedDetails =>
      'การเชื่อมต่อล้มเหลว อุปกรณ์ทั้งสองต้องออนไลน์และเปิด CRYPT เพื่อเชื่อมต่อ';

  @override
  String get gallery => 'แกลเลอรี';

  @override
  String get alignQrCode => 'จัดแนวรหัส QR';

  @override
  String get scanFromGallery => 'สแกนจากแกลเลอรี';

  @override
  String get couldNotScanImage => 'ไม่สามารถสแกนรูปภาพได้';

  @override
  String couldNotShareQrCode(String error) {
    return 'ไม่สามารถแชร์รหัส QR ได้: $error';
  }

  @override
  String newContact(String username) {
    return 'ผู้ติดต่อใหม่: $username';
  }

  @override
  String get publicEncryptionKeyMissing => 'ไม่พบคีย์เข้ารหัสสาธารณะของคุณ';

  @override
  String get contactEncryptionKeyMissing => 'ไม่พบคีย์เข้ารหัสของผู้ติดต่อ';

  @override
  String get localEncryptionKeyMissing => 'ไม่พบคีย์เข้ารหัสภายในเครื่อง';

  @override
  String get noQrCodeFound => 'ไม่พบรหัส QR ในรูปภาพนี้';

  @override
  String get shareQrCode => 'แชร์รหัส QR';

  @override
  String get welcome => 'ยินดีต้อนรับ';

  @override
  String get login => 'เข้าสู่ระบบ';

  @override
  String get signup => 'ลงทะเบียน';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get chats => 'แชท';

  @override
  String get typeMessage => 'พิมพ์ข้อความ...';

  @override
  String get send => 'ส่ง';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'กำลังเชื่อมต่อ...';

  @override
  String get connectingP2p => 'กำลังเชื่อมต่อกับ P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P ยังไม่พร้อม';

  @override
  String get searchLanguage => 'ค้นหาภาษา...';

  @override
  String get language => 'ภาษา';

  @override
  String get forceEscapeSignOutTitle => 'บังคับออกจากระบบฉุกเฉิน?';

  @override
  String get forceEscapeSignOutContent =>
      'คำเตือน: การดำเนินการนี้จะลบข้อมูลทั้งหมดออกจากอุปกรณ์นี้โดยสิ้นเชิง';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get wipeDevice => 'ล้างข้อมูลอุปกรณ์';

  @override
  String get accountDestructionAlertTitle => 'คำเตือนการลบบัญชี';

  @override
  String get accountDestructionWarning =>
      'คำเตือน: การดำเนินการนี้จะลบข้อมูลทั้งหมดของคุณออกจากอุปกรณ์นี้ เมื่อเชื่อมต่ออินเทอร์เน็ต ระบบจะเปิดใช้งานคำสั่งทำลายตัวเองจากระยะไกล ข้อความทุกข้อความที่ส่งจาก ID ผู้ใช้เฉพาะของคุณจะถูกลบออกจากหน่วยความจำของเพียร์ทั้งหมดอย่างถาวร';

  @override
  String get accountDestructionCriticalNotice =>
      'คำเตือนสำคัญ: หากคุณป้อนตัวเลขยืนยันเหล่านี้ไม่ถูกต้อง ระบบจะถูกล็อก หากต้องการปลดล็อก คุณต้องป้อนรหัสผ่านบัญชีหลักของคุณ หรือใช้ตัวเลือกฉุกเฉินเพื่อออก ซึ่งจะล้างข้อมูลทั้งหมดบนอุปกรณ์นี้ทันที';

  @override
  String verificationSecurityKey(String code) {
    return 'คีย์ความปลอดภัยสำหรับการยืนยัน: $code';
  }

  @override
  String get copyDigitsHint => 'คัดลอกตัวเลข 5 หลักด้านบน';

  @override
  String get codeMismatchNotice =>
      'รหัสไม่ตรงกัน ป้อนรหัสผ่านหลักเพื่อข้ามการล็อก หรือรอ 10 นาที';

  @override
  String get accountPasswordLabel => 'รหัสผ่านบัญชี';

  @override
  String get deleteEverythingPermanently => 'ลบทุกอย่างอย่างถาวร';

  @override
  String get escapeAndPurgeDeviceData => 'ออกและล้างข้อมูลอุปกรณ์';

  @override
  String get addContact => 'เพิ่มผู้ติดต่อ';

  @override
  String get addContactConfirmation => 'เพิ่มผู้ติดต่อนี้หรือไม่?';

  @override
  String get noMessagesYet => 'ยังไม่มีข้อความ';

  @override
  String get addNewContact => 'เพิ่มผู้ติดต่อใหม่';

  @override
  String get usernameLabel => 'ชื่อผู้ใช้';

  @override
  String get nicknameOptionalLabel => 'ชื่อเล่น (ไม่บังคับ)';

  @override
  String get add => 'เพิ่ม';

  @override
  String get usernameCannotBeEmpty => 'ชื่อผู้ใช้ต้องไม่เว้นว่าง';

  @override
  String contactAlreadyExists(String name) {
    return 'ผู้ติดต่อ «$name» มีอยู่ในสมุดที่อยู่ของคุณแล้ว';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'ไม่พบผู้ใช้ «$name» ในทะเบียนเครือข่าย ไม่สามารถสร้างความลับที่ใช้ร่วมกันได้';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'เพิ่มผู้ติดต่อ $name สำเร็จแล้ว!';
  }

  @override
  String get contacts => 'ผู้ติดต่อ';

  @override
  String get noContactsYet => 'ยังไม่มีผู้ติดต่อ';

  @override
  String get securityLockoutActive => 'การล็อกความปลอดภัยกำลังทำงาน';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'มีการพยายามไม่ถูกต้องมากเกินไป การเข้าถึงถูกบล็อกเป็นเวลา $minutes นาที';
  }

  @override
  String get acknowledge => 'รับทราบ';

  @override
  String get accessBlocked => 'การเข้าถึงถูกบล็อก';

  @override
  String accessSuspended(int minutes) {
    return 'การตรวจสอบไม่ถูกต้อง 5 ครั้ง การเข้าถึงถูกระงับเป็นเวลา $minutes นาทีถัดไป';
  }

  @override
  String get ok => 'ตกลง';

  @override
  String unlockSecureNode(String username) {
    return 'ปลดล็อกโหนดที่ปลอดภัย: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'จำนวนครั้งที่เหลือสำหรับการยืนยัน: $count';
  }

  @override
  String get secureKeyPasscode => 'รหัสผ่านสำหรับคีย์ความปลอดภัย';

  @override
  String get warningHardwareLockout =>
      'คำเตือน: ความไม่ตรงกันครั้งถัดไปจะทำให้ระบบรักษาความปลอดภัยถูกล็อก';

  @override
  String get abort => 'ยกเลิก';

  @override
  String get authenticate => 'ยืนยันตัวตน';

  @override
  String get searchPipelinesHint =>
      'กำลังค้นหาการเชื่อมต่อที่ปลอดภัยที่ใช้งานอยู่...';

  @override
  String get zeroPipelinesDiscovered => 'ไม่พบการเชื่อมต่อที่ตรงกัน';

  @override
  String get processingDecryption => 'กำลังถอดรหัส...';

  @override
  String get decrypting => 'กำลังถอดรหัส...';

  @override
  String get decryptionError => '[ข้อผิดพลาดในการถอดรหัส]';

  @override
  String get cryptContainerSecure => 'คอนเทนเนอร์ CRYPT ปลอดภัย';

  @override
  String get connectAnAccount => 'เชื่อมต่อบัญชี';

  @override
  String get username => 'ชื่อผู้ใช้';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get enterMasterSecurityPassword => 'ป้อนรหัสผ่านความปลอดภัยหลักของคุณ';

  @override
  String get pleaseFillAllFields => 'กรุณากรอกข้อมูลให้ครบทุกช่อง';

  @override
  String get wrongUsernameOrPassword => 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';

  @override
  String loginError(String error) {
    return 'เกิดข้อผิดพลาดในการเข้าสู่ระบบ: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'ยังไม่มีบัญชี? ลงทะเบียน';

  @override
  String get myIdentity => 'ตัวตนของฉัน';

  @override
  String get scanToAddMe => 'สแกนเพื่อเพิ่มฉัน';

  @override
  String get shareProfileLink => 'แชร์ลิงก์โปรไฟล์';

  @override
  String addMeOnCrypt(String link) {
    return 'เพิ่มฉันใน CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'สแกน QR';

  @override
  String get invalidCryptQrFormat => 'รูปแบบ QR ของ CRYPT ไม่ถูกต้อง';

  @override
  String get userScanned => 'สแกนผู้ใช้แล้ว!';

  @override
  String addingUser(String username) {
    return 'กำลังเพิ่ม $username...';
  }

  @override
  String get defaultUser => 'ผู้ใช้';

  @override
  String get createAccount => 'สร้างบัญชี';

  @override
  String get keepPasswordSecureHint =>
      'เก็บรหัสผ่านไว้ในที่ปลอดภัย รหัสผ่านไม่สามารถเปลี่ยนได้';

  @override
  String get pleaseFillInAllFields => 'กรุณากรอกข้อมูลให้ครบทุกช่อง';

  @override
  String get usernameExceedsLimit =>
      'ชื่อผู้ใช้ต้องมีความยาวไม่เกิน 20 ตัวอักษร';

  @override
  String get invalidUsernameCharacters =>
      'ชื่อผู้ใช้สามารถประกอบด้วยตัวอักษร ตัวเลข เครื่องหมายขีดล่าง และยัติภังค์เท่านั้น';

  @override
  String get weakPasswordNotice =>
      'รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร รวมถึงตัวเลขและตัวอักษรพิมพ์ใหญ่';

  @override
  String get unableToGenerateUniqueUsername =>
      'ไม่สามารถสร้างชื่อผู้ใช้ที่ไม่ซ้ำกันได้';

  @override
  String get accountCreated => 'สร้างบัญชีแล้ว';

  @override
  String yourUsernameIs(String username) {
    return 'ชื่อผู้ใช้ของคุณคือ:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'ชื่อผู้ใช้ «$chosen» ถูกใช้งานแล้ว\n\nชื่อผู้ใช้ของคุณคือ:\n\n$assigned\n\nโปรดจำชื่อนี้ไว้ คุณจะต้องใช้สำหรับเข้าสู่ระบบ';
  }

  @override
  String get continueText => 'ดำเนินการต่อ';

  @override
  String failedToGenerateIdentity(String error) {
    return 'ไม่สามารถสร้างตัวตนที่ปลอดภัยได้: $error';
  }

  @override
  String get welcomeToCrypt => 'ยินดีต้อนรับสู่ CRYPT';

  @override
  String get signupDescription =>
      'ป้อนชื่อผู้ใช้และรหัสผ่านเพื่อสร้างคีย์การเข้ารหัสแบบ P2P ของคุณ';

  @override
  String get chooseAUsername => 'เลือกชื่อผู้ใช้';

  @override
  String get usernameHelperText =>
      'อย่าใช้ชื่อจริงของคุณ หากชื่อผู้ใช้ถูกใช้งานแล้ว เราจะเพิ่มส่วนต่อท้ายที่ไม่ซ้ำกันให้โดยอัตโนมัติ';

  @override
  String get masterAuthenticationRequired => 'จำเป็นต้องมีการยืนยันตัวตนหลัก';

  @override
  String get verify => 'ตรวจสอบ';

  @override
  String get darkThemeMode => 'ธีมมืด';

  @override
  String get secureConversations => 'การสนทนาที่ปลอดภัย';

  @override
  String get noActiveConversations =>
      'ไม่พบการสนทนาที่ใช้งานอยู่ เริ่มการสนทนาเพื่อเปิดใช้งานการล็อกความปลอดภัย';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get wipeDeviceAndEscape => 'ล้างข้อมูลอุปกรณ์และออก';

  @override
  String get falsePassword => 'รหัสผ่านไม่ถูกต้อง';

  @override
  String accessSuspendedTimer(String time) {
    return 'การเข้าถึงถูกระงับเพื่อความปลอดภัย ลองอีกครั้งใน $time';
  }

  @override
  String get selectSecureLockMethod => 'เลือกวิธีการล็อกที่ปลอดภัย';

  @override
  String get selectSecureLockDescription =>
      'คุณต้องการล็อกการสนทนานี้ด้วยไบโอเมตริกลายนิ้วมือของอุปกรณ์ หรือใช้ PIN มาตรฐาน 4 หลัก?';

  @override
  String get fourDigitPin => 'PIN 4 หลัก';

  @override
  String get fingerprintUnlock => 'ลายนิ้วมือ 🔓';

  @override
  String get supportSoloDeveloper => 'สนับสนุนนักพัฒนาอิสระ';

  @override
  String get supportIntro =>
      'เฮ้! 😏 ฉันเป็นนักพัฒนาเดี่ยวที่ทำงานอย่างหนักกับ CRYPT ฉันไม่มีงบประมาณหรือเงินทุนของบริษัท ฉันพึ่งพาความซื่อสัตย์และความเห็นอกเห็นใจของคุณอย่างเต็มที่เพื่อพัฒนาแอปต่อไปและรับประกันว่าไม่มีโฆษณาตลอดไป';

  @override
  String get chooseSupportAmount => 'เลือกราคาของคุณ (เลื่อนเพื่อรองรับ):';

  @override
  String get poorGang => 'แก๊งค์จน 🥀✌️';

  @override
  String get launchOfferMinimum => 'เปิดตัวข้อเสนอขั้นต่ำ 🚀';

  @override
  String get buyMeCoffee => 'ซื้อกาแฟให้ฉัน ☕';

  @override
  String get superSupporter => 'สุดยอดผู้สนับสนุน 🔥';

  @override
  String get feature => 'คุณสมบัติ';

  @override
  String get freeTier => 'ฟรีเทียร์';

  @override
  String get premium => 'พรีเมี่ยม';

  @override
  String get chatLocks => 'ล็อคแชท';

  @override
  String get maxOneRoom => 'สูงสุด 1 ห้อง';

  @override
  String get unlimited => 'ไม่จำกัด';

  @override
  String get biometrics => 'ไบโอเมตริกซ์';

  @override
  String get disabled => '🚫 ปิดการใช้งาน';

  @override
  String supportWithSats(String amount) {
    return 'สนับสนุนด้วย $amount sats (ฟีนิกซ์)';
  }

  @override
  String get boltOffer => '⚡ ข้อเสนอการชำระเงิน BOLT12 • แตะเพื่อคัดลอก';

  @override
  String get boltOfferCopied => 'คัดลอกข้อเสนอการชำระเงิน BOLT12 แล้ว';

  @override
  String get tapToCopyBoltOffer => 'แตะเพื่อคัดลอกข้อเสนอการชำระเงิน BOLT12';

  @override
  String get simpleInstructionsToUnlock => '📬 คำแนะนำง่ายๆ ในการปลดล็อค:';

  @override
  String unlockInstructions(String username) {
    return '1. ชำระเงินโดยใช้ Phoenix Wallet บน Android (ขั้นต่ำ 7,500 เพื่อปลดล็อค — หากมากกว่านั้นจะยินดีเสมอ)\n2. จับภาพหน้าจอยืนยันการทำธุรกรรมของคุณสำเร็จ\n3. ส่งอีเมลภาพหน้าจอไปที่ jounaidnadirmed@gmail.com และแจ้งชื่อผู้ใช้บัญชีเฉพาะของคุณ: \'$username\' เพื่อให้ฉันรู้ว่าใครเป็นผู้ชำระเงิน\n4. พิมพ์อะไรก็ได้ลงในช่องด้านล่างเพื่อบันทึกคำขอของคุณบนอุปกรณ์นี้:';
  }

  @override
  String get supportRequestHint =>
      'พิมพ์ชื่อหรือข้อมูลการทำธุรกรรมของคุณที่นี่...';

  @override
  String get maybeLater => 'ไว้ทีหลัง';

  @override
  String get submitProof => 'ส่งหลักฐาน';

  @override
  String get couldNotOpenWallet =>
      'ไม่สามารถเปิดกระเป๋าเงินโดยอัตโนมัติได้ กรุณาคัดลอกรหัสข้อความด้านล่างแทน';

  @override
  String get proofSubmittedSnackbar =>
      'ส่งหลักฐานแล้ว! การตรวจสอบด้วยตนเองใช้เวลา 24–48 ชั่วโมง (ไม่รวมวันหยุดสุดสัปดาห์) คุณสามารถใช้งานแอปต่อได้ตามปกติ';

  @override
  String get loadingChats => 'กำลังโหลดแชท...';

  @override
  String get noChatsYetTitle => 'ยังไม่มีการแชท';

  @override
  String get noChatsYetHint =>
      'การแชทเริ่มต้นเมื่อคุณสแกนโค้ด CRYPT QR ของบุคคลอื่น เปิดหน้าข้อมูลประจำตัวของคุณเพื่อแบ่งปันข้อมูลของคุณเพื่อให้พวกเขาสามารถสแกนได้';

  @override
  String get scanQrToStartChat => 'สแกนรหัส QR';

  @override
  String get noChatsMatchSearch => 'ไม่มีการแชทที่ตรงกับการค้นหาของคุณ';

  @override
  String get noChatsMatchSearchHint =>
      'ลองใช้ชื่ออื่นหรือล้างการค้นหาเพื่อดูทุกแชท';

  @override
  String get requestSentTitle => 'ส่งคำขอแล้ว';

  @override
  String requestSentBody(String username) {
    return 'คำขอของคุณไปที่$username. กรุณารอในขณะที่พวกเขายอมรับมัน';
  }

  @override
  String get requestSentKeepOpen =>
      'แชทจะเปิดขึ้นทันทีที่พวกเขายอมรับ เปิด CRYPT บนอุปกรณ์นี้ไว้เพื่อให้คุณไม่พลาด';

  @override
  String get requestSentGotIt => 'เข้าใจแล้ว';

  @override
  String get scanCouldNotReadCode =>
      'รหัสนั้นไม่สามารถอ่านได้ สแกนรหัส QR CRYPT';

  @override
  String get scanMissingTheirIdentity =>
      'รหัสนั้นไม่มีตัวตนของบุคคลนั้น สแกนรหัสจากหน้าข้อมูลระบุตัวตน';

  @override
  String get scanOwnIdentityMissing =>
      'คีย์เข้ารหัสของคุณหายไป ออกจากระบบและกลับเข้ามาใหม่ จากนั้นสแกนอีกครั้ง';

  @override
  String get noLightningWalletFound =>
      'ไม่พบกระเป๋าเงิน Lightning ติดตั้งหนึ่งรายการหรือคัดลอกที่อยู่และวางลงในกระเป๋าเงิน';

  @override
  String get settingsSectionAppearance => 'ลักษณะที่ปรากฏ';

  @override
  String get settingsSectionPrivacy => 'ความเป็นส่วนตัวและความปลอดภัย';

  @override
  String get settingsSectionPremium => 'พรีเมี่ยม';

  @override
  String get settingsSectionHelp => 'ช่วยเหลือและถูกกฎหมาย';

  @override
  String get settingsSectionAdministration => 'การบริหาร';

  @override
  String get settingsSectionAccount => 'บัญชี';

  @override
  String get settingsProtectTitle => 'ป้องกันการตั้งค่าด้วยรหัสผ่านหลัก';

  @override
  String get settingsProtectSubtitle => 'ต้องใช้รหัสผ่านเพื่อเข้าถึงการตั้งค่า';

  @override
  String get chatLockSetPinSubtitle =>
      'แตะเพื่อตั้งค่า PIN ของคุณเองสำหรับการแชทนี้';

  @override
  String get premiumTileTitle => 'รับพรีเมี่ยมตลอดชีพ';

  @override
  String get premiumActiveSubtitle => 'พรีเมี่ยมเปิดอยู่สำหรับบัญชีของคุณ';

  @override
  String get premiumPendingSubtitle =>
      'กำลังรอผู้ดูแลระบบตรวจสอบภาพหน้าจอของคุณ';

  @override
  String get premiumHowItWorks => 'พรีเมี่ยมทำงานอย่างไร';

  @override
  String get reportProblemTitle => 'รายงานปัญหา';

  @override
  String get reportProblemSubtitle => 'จุดบกพร่อง การละเมิด หรือสแปม';

  @override
  String get adminAccessTitle => 'การเข้าถึงของผู้ดูแลระบบ';

  @override
  String get adminAccessSubtitle =>
      'ป้อนรหัสผู้ดูแลระบบของคุณเพื่อเปิดแผงควบคุม';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method— รหัสของตัวเองเฉพาะแชทนี้เท่านั้น';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amountหนึ่งครั้งด้วยกระเป๋าเงิน Lightning ของคุณ จากนั้นส่งภาพหน้าจอ';
  }

  @override
  String premiumPendingBody(String window) {
    return 'ภาพหน้าจอของคุณอยู่ในแล้ว ผู้ดูแลระบบจะตรวจสอบและเปิดใช้งานระดับพรีเมียมสำหรับบัญชีของคุณภายใน$window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. ชำระเงิน$amountกับ$method, หรือ$wallet.\n2. แคปหน้าจอยืนยันการชำระเงิน\n3. ส่งจากส่งหลักฐานการชำระเงิน\n4. เปิดใช้งานระดับพรีเมียมและคงอยู่ตลอดไป\n\nCRYPT สร้างขึ้นโดยนักพัฒนาเดี่ยว และนี่คือข้อเสนอทั้งหมด: ชำระเงินเพียงครั้งเดียว ไม่มีการสมัครสมาชิก';
  }

  @override
  String get reportIntro =>
      'บอกเราว่าเกิดอะไรขึ้น หากคุณกำลังรายงานบุคคลอื่น ให้เพิ่มชื่อผู้ใช้ของพวกเขาเพื่อให้เราสามารถดำเนินการกับบัญชีที่ถูกต้องได้';

  @override
  String get reportSent => 'ส่งรายงานแล้ว ขอบคุณ';

  @override
  String get reportSendFailed => 'ไม่สามารถส่งรายงานได้';

  @override
  String get reportTypeLabel => 'ประเภทของรายงาน';

  @override
  String get reportCategoryBug => 'แมลง';

  @override
  String get reportCategoryAbuse => 'การละเมิด';

  @override
  String get reportCategorySpam => 'สแปม';

  @override
  String get reportCategoryOther => 'อื่นๆ';

  @override
  String get reportUsernameLabel => 'ชื่อผู้ใช้ของพวกเขา (ไม่บังคับ)';

  @override
  String get reportUsernameHint => 'เช่น someone_you_want_reported';

  @override
  String get reportDetailsLabel => 'เกิดอะไรขึ้น?';

  @override
  String get reportScreenshotsLabel => 'ภาพหน้าจอ';

  @override
  String get reportAddScreenshot => 'เพิ่มภาพหน้าจอ';

  @override
  String get reportSendButton => 'ส่งรายงาน';

  @override
  String get reportPrivacyNote =>
      'รายงานได้รับการตรวจสอบโดยผู้ดูแลระบบ ภาพหน้าจอจะถูกจัดเก็บแบบส่วนตัวและมีเพียงผู้ดูแลเท่านั้นที่มองเห็นได้';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amountครั้งหนึ่ง,$lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'ไม่มีการสมัครสมาชิกและไม่มีอะไรจะต่ออายุ ชำระเงินด้วย$methodให้ส่งภาพหน้าจอยืนยันและเปิดใช้งานของพรีเมียมภายใน$window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT สร้างโดยนักพัฒนาเดี่ยว พรีเมียมคือสิ่งที่ทำให้ไม่มีโฆษณาและได้รับการดูแลอย่างต่อเนื่อง';

  @override
  String get premiumStepPay => 'ชำระเงินด้วยกระเป๋าเงินของคุณ';

  @override
  String get premiumLightningAddressLabel => 'ที่อยู่สายฟ้า';

  @override
  String get premiumOpenWallet => 'เปิดกระเป๋าเงิน';

  @override
  String get premiumCopyAddress => 'คัดลอกที่อยู่';

  @override
  String get premiumWorksWith =>
      'ใช้งานได้กับ Phoenix และกระเป๋าเงิน Lightning อื่นๆ';

  @override
  String get premiumStepScreenshot => 'ส่งภาพหน้าจอของคุณ';

  @override
  String get premiumScreenshotHint =>
      'ถ่ายภาพหน้าจอการยืนยันการชำระเงินในกระเป๋าเงิน Lightning ของคุณแล้วแนบมาด้านล่าง';

  @override
  String get premiumAttachScreenshot => 'แนบภาพหน้าจอ';

  @override
  String get premiumReplaceScreenshot => 'แทนที่ภาพหน้าจอ';

  @override
  String get premiumStepAmount => 'ยืนยันจำนวนเงิน';

  @override
  String get premiumAmountLabel => 'จำนวนเงินที่คุณจ่าย (USD)';

  @override
  String get premiumNoteLabel => 'หมายเหตุ (ไม่บังคับ)';

  @override
  String get premiumSendProof => 'ส่งหลักฐานของฉัน';

  @override
  String get premiumAddressCopied => 'คัดลอกที่อยู่ Lightning แล้ว';

  @override
  String get premiumAttachConfirmation => 'แนบภาพหน้าจอยืนยันการชำระเงินของคุณ';

  @override
  String get premiumSendProofFailed => 'ไม่สามารถส่งหลักฐานการชำระเงินได้';

  @override
  String premiumAmountHelper(String amount) {
    return 'ขั้นต่ำ$amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'ใช้เวลาในการเปิดใช้งาน$window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'ได้รับหลักฐานแล้ว พรีเมี่ยมเปิดอยู่ภายใน$window.';
  }

  @override
  String get premiumTableFeature => 'คุณสมบัติ';

  @override
  String get premiumTableFree => 'ฟรี';

  @override
  String get premiumTablePremium => 'พรีเมี่ยม';

  @override
  String get premiumTableEncrypted =>
      'การส่งข้อความแบบเพียร์ทูเพียร์ที่เข้ารหัส';

  @override
  String get premiumTableMessagesStay => 'ข้อความจะคงอยู่ในอุปกรณ์ของคุณ';

  @override
  String get premiumTableChatLocks => 'แชทถูกล็อคด้วย PIN ของคุณเอง';

  @override
  String get premiumTableFingerprint => 'ปลดล็อคด้วยลายนิ้วมือหรือใบหน้า';

  @override
  String get premiumTablePrice => 'ราคา';

  @override
  String get premiumTableAccess => 'การเข้าถึง';

  @override
  String get premiumTableIncluded => 'รวมอยู่ด้วย';

  @override
  String get premiumTableOneChat => '1 แชท';

  @override
  String get premiumTableUnlimited => 'ไม่จำกัด';

  @override
  String get premiumTableNotIncluded => 'ไม่รวม';

  @override
  String get premiumTableFreeValue => 'ฟรี';

  @override
  String get premiumTableWhileFree => 'ในขณะที่แอปฟรี';

  @override
  String get premiumTableLifetime => 'ตลอดชีวิต';

  @override
  String premiumTableOnePayment(String amount) {
    return 'การชำระเงินครั้งเดียวของ$amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'การชำระเงินครั้งเดียวของ$amountและพรีเมี่ยมเป็นของคุณตลอดชีวิต ไม่มีการสมัครสมาชิกและไม่มีอะไรจะต่ออายุ';
  }

  @override
  String get settingsSaveFailed =>
      'ไม่สามารถบันทึกการตั้งค่านั้นได้ ลองอีกครั้ง';

  @override
  String get settingsLockFailed => 'ไม่สามารถล็อคการแชทนี้ได้ ลองอีกครั้ง';

  @override
  String get settingsUnlockFailed => 'ไม่สามารถปลดล็อคการแชทนี้ได้ ลองอีกครั้ง';

  @override
  String pinSetTitle(String chat) {
    return 'ตั้ง PIN สำหรับ$chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'ยืนยัน PIN สำหรับ$chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'PIN นี้จะเปิดขึ้น$chatเท่านั้น. ทุกแชทจะมี PIN ของตัวเอง ซึ่งคุณเลือกเอง ไม่มีรหัสเดียวสำหรับแอป';
  }

  @override
  String get pinMismatch => 'PIN ไม่ตรงกัน ไม่ได้เปิดใช้งานการล็อค';

  @override
  String get biometricNotSetUp =>
      'ไม่มีการตั้งค่าลายนิ้วมือหรือการปลดล็อกด้วยใบหน้าบนอุปกรณ์นี้';

  @override
  String get biometricVerifyFailed =>
      'ไม่สามารถยืนยันได้ว่าเป็นคุณบนอุปกรณ์นี้';

  @override
  String get lightningAddressCopied =>
      'คัดลอกที่อยู่ Lightning แล้ว วางลงในกระเป๋าสตางค์เพื่อชำระเงิน';

  @override
  String get accountSuspended => 'บัญชีถูกระงับ';

  @override
  String get premiumLifetimeAccess => 'การเข้าถึงระดับพรีเมียมตลอดชีพ';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'จ่าย$amountจาก$methodไปยังที่อยู่ Lightning ด้านบน';
  }

  @override
  String get premiumActivationStep2 =>
      'ถ่ายภาพหน้าจอยืนยันการชำระเงินแล้วส่งเป็นหลักฐานการชำระเงิน';

  @override
  String get pinFourDigits => 'ป้อนตัวเลข 4 หลักให้ตรงกัน';

  @override
  String get scanOwnCode =>
      'นั่นคือรหัสของคุณเอง สแกนรหัส CRYPT ของผู้อื่นเพื่อเริ่มแชทกับพวกเขา';

  @override
  String get couldNotGenerateQrImage => 'ไม่สามารถสร้างอิมเมจ QR ได้';

  @override
  String get conversationUpdateFailed => 'การอัปเดตการสนทนาล้มเหลว ลองอีกครั้ง';

  @override
  String get conversationCreationFailed =>
      'การสร้างการสนทนาล้มเหลว ลองอีกครั้ง';

  @override
  String get accountSuspendedByAdmin => 'บัญชีนี้ถูกระงับโดยผู้ดูแลระบบ';

  @override
  String get unlockCrypt => 'ปลดล็อคแอพ';

  @override
  String get unlockCryptBody =>
      'ป้อนรหัสผ่านหลักของคุณเพื่อถอดรหัสข้อความของคุณบนอุปกรณ์นี้';

  @override
  String get unlock => 'ปลดล็อคตอนนี้';

  @override
  String get attachPhoto => 'รูปถ่าย';

  @override
  String get attachFile => 'ไฟล์';

  @override
  String attachmentTooLarge(int mb) {
    return 'ไฟล์นั้นใหญ่เกินไป ขีดจำกัดคือ $mb MB';
  }

  @override
  String get attachmentSendFailed => 'ไม่สามารถส่งไฟล์แนบนั้นได้';
}
