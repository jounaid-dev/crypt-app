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
  String get maybeLater => 'ไว้ทีหลัง';

  @override
  String get submitProof => 'ส่งหลักฐาน';

  @override
  String get couldNotOpenWallet =>
      'ไม่สามารถเปิดกระเป๋าเงินโดยอัตโนมัติได้ กรุณาคัดลอกรหัสข้อความด้านล่างแทน';

  @override
  String get proofSubmittedSnackbar =>
      'ส่งหลักฐานแล้ว! การตรวจสอบด้วยตนเองใช้เวลา 24–48 ชั่วโมง (ไม่รวมวันหยุดสุดสัปดาห์) คุณสามารถใช้งานแอปต่อได้ตามปกติ';
}
