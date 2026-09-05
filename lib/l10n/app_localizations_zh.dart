// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => '欢迎';

  @override
  String get login => '登录';

  @override
  String get signup => '注册';

  @override
  String get settings => '设置';

  @override
  String get chats => '聊天';

  @override
  String get typeMessage => '输入消息...';

  @override
  String get send => '发送';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => '正在连接...';

  @override
  String get connectingP2p => '正在连接到 P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P 尚未就绪。';

  @override
  String get searchLanguage => '搜索语言...';

  @override
  String get language => '语言';

  @override
  String get forceEscapeSignOutTitle => '强制紧急退出？';

  @override
  String get forceEscapeSignOutContent => '警告：此操作将完全清除本设备上的所有数据。';

  @override
  String get cancel => '取消';

  @override
  String get wipeDevice => '擦除设备';

  @override
  String get accountDestructionAlertTitle => '账户销毁警报';

  @override
  String get accountDestructionWarning =>
      '警告：此操作将删除您在本设备上的所有数据。连接互联网后，将触发远程自毁命令。使用您唯一用户 ID 发送的每条消息都将从所有对等设备的内存中永久删除。';

  @override
  String get accountDestructionCriticalNotice =>
      '严重警告：如果错误输入这些验证数字，系统将被锁定。要解锁，您必须输入主账户密码，或使用紧急退出功能立即彻底清除本设备的数据存储。';

  @override
  String verificationSecurityKey(String code) {
    return '验证安全密钥：$code';
  }

  @override
  String get copyDigitsHint => '复制上方的 5 位数字';

  @override
  String get codeMismatchNotice => '验证码不匹配！请输入主密码以解除锁定，否则系统将锁定 10 分钟：';

  @override
  String get accountPasswordLabel => '账户密码';

  @override
  String get deleteEverythingPermanently => '永久删除所有内容';

  @override
  String get escapeAndPurgeDeviceData => '紧急退出并清除设备数据';

  @override
  String get addContact => '添加联系人';

  @override
  String get addContactConfirmation => '确定要添加此联系人吗？';

  @override
  String get noMessagesYet => '暂无消息';

  @override
  String get addNewContact => '添加新联系人';

  @override
  String get usernameLabel => '用户名';

  @override
  String get nicknameOptionalLabel => '昵称（可选）';

  @override
  String get add => '添加';

  @override
  String get usernameCannotBeEmpty => '用户名不能为空';

  @override
  String contactAlreadyExists(String name) {
    return '联系人“$name”已存在于您的通讯录中。';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '在网络注册表中找不到用户“$name”。无法建立共享密钥。';
  }

  @override
  String successfullyAddedContact(String name) {
    return '已成功添加 $name！';
  }

  @override
  String get contacts => '联系人';

  @override
  String get noContactsYet => '暂无联系人';

  @override
  String get securityLockoutActive => '安全锁定已启用';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return '无效尝试次数过多。已锁定 $minutes 分钟。';
  }

  @override
  String get acknowledge => '确认';

  @override
  String get accessBlocked => '访问被阻止';

  @override
  String accessSuspended(int minutes) {
    return '验证失败 5 次。访问已暂停 $minutes 分钟。';
  }

  @override
  String get ok => '确定';

  @override
  String unlockSecureNode(String username) {
    return '解锁安全节点：$username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return '剩余验证尝试次数：$count 次。';
  }

  @override
  String get secureKeyPasscode => '安全密钥密码';

  @override
  String get warningHardwareLockout => '警告：下一次系统验证不匹配将触发硬件安全锁定。';

  @override
  String get abort => '中止';

  @override
  String get authenticate => '身份验证';

  @override
  String get searchPipelinesHint => '正在查询活动的安全通信通道...';

  @override
  String get zeroPipelinesDiscovered => '未找到匹配的通信通道。';

  @override
  String get processingDecryption => '正在处理解密...';

  @override
  String get decrypting => '正在解密...';

  @override
  String get decryptionError => '[解密错误]';

  @override
  String get cryptContainerSecure => 'CRYPT 容器安全';

  @override
  String get connectAnAccount => '连接账户';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get enterMasterSecurityPassword => '输入您的主安全密码';

  @override
  String get pleaseFillAllFields => '请填写所有字段';

  @override
  String get wrongUsernameOrPassword => '用户名或密码错误';

  @override
  String loginError(String error) {
    return '登录错误：$error';
  }

  @override
  String get dontHaveAnAccountSignUp => '还没有账户？注册';

  @override
  String get myIdentity => '我的身份';

  @override
  String get scanToAddMe => '扫描以添加我';

  @override
  String get shareProfileLink => '分享个人资料链接';

  @override
  String addMeOnCrypt(String link) {
    return '在 CRYPT 上添加我！\n\n$link';
  }

  @override
  String get scanQr => '扫描二维码';

  @override
  String get invalidCryptQrFormat => '无效的 CRYPT 二维码格式。';

  @override
  String get userScanned => '用户已扫描！';

  @override
  String addingUser(String username) {
    return '正在添加 $username...';
  }

  @override
  String get defaultUser => '用户';

  @override
  String get createAccount => '创建账户';

  @override
  String get keepPasswordSecureHint => '请妥善保管。密码创建后无法更改。';

  @override
  String get pleaseFillInAllFields => '请填写所有字段';

  @override
  String get usernameExceedsLimit => '用户名不能超过 20 个字符';

  @override
  String get invalidUsernameCharacters => '用户名只能包含字母、数字、下划线和连字符';

  @override
  String get weakPasswordNotice => '密码必须至少包含 8 个字符，并包含一个数字和一个大写字母';

  @override
  String get unableToGenerateUniqueUsername => '无法生成唯一用户名。';

  @override
  String get accountCreated => '账户已创建';

  @override
  String yourUsernameIs(String username) {
    return '您的用户名是：\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '用户名“$chosen”已被占用。\n\n您的用户名是：\n\n$assigned\n\n请记住此用户名。登录时需要使用它。';
  }

  @override
  String get continueText => '继续';

  @override
  String failedToGenerateIdentity(String error) {
    return '无法创建安全身份：$error';
  }

  @override
  String get welcomeToCrypt => '欢迎来到 CRYPT';

  @override
  String get signupDescription => '输入用户名和密码，以初始化您的点对点（P2P）加密密钥。';

  @override
  String get chooseAUsername => '选择用户名';

  @override
  String get usernameHelperText => '请勿使用真实姓名。如果用户名已被占用，我们会自动添加唯一后缀。';

  @override
  String get masterAuthenticationRequired => '需要主身份验证';

  @override
  String get verify => '验证';

  @override
  String get darkThemeMode => '深色主题模式';

  @override
  String get secureConversations => '安全对话';

  @override
  String get noActiveConversations => '未找到活动对话。请先开始一段对话，以启用自定义安全锁。';

  @override
  String get logout => '退出登录';

  @override
  String get wipeDeviceAndEscape => '擦除设备并紧急退出';

  @override
  String get falsePassword => '错误密码';

  @override
  String accessSuspendedTimer(String time) {
    return '出于安全保护，访问已被暂停。请在 $time 后重试。';
  }

  @override
  String get selectSecureLockMethod => '选择安全锁定方式';

  @override
  String get selectSecureLockDescription =>
      '您希望使用设备指纹生物识别，还是标准的 4 位 PIN 码来锁定此聊天？';

  @override
  String get fourDigitPin => '4 位 PIN 码';

  @override
  String get fingerprintUnlock => '指纹解锁 🔓';

  @override
  String get supportSoloDeveloper => '支持独立开发者';

  @override
  String get maybeLater => '稍后再说';

  @override
  String get submitProof => '提交证明';

  @override
  String get couldNotOpenWallet => '无法自动打开钱包。请复制下方的文本代码。';

  @override
  String get proofSubmittedSnackbar =>
      '证明已提交！人工审核需要 24–48 小时（周末除外）。您可以继续正常使用应用！';
}
