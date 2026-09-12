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
  String get termsAndConditions => '条款与条件';

  @override
  String get settingsTermsAndConditions => '条款与条件';

  @override
  String get termsIntro =>
      'CRYPT 是一款处于早期阶段、用于让人们直接进行交流的应用。您需要对正确使用应用并保护账户凭据负责。';

  @override
  String get termsConnectivity =>
      'CRYPT 使用在线服务帮助设备发现彼此并建立连接。随着应用的发展，可用性和连接行为可能会改变。请不要将 CRYPT 作为唯一的通信方式。';

  @override
  String get termsAgreement => '继续操作即表示您确认已阅读并同意在这些条款下使用 CRYPT。';

  @override
  String get agreeTerms => '我同意条款与条件';

  @override
  String get agreeAndContinue => '同意并继续';

  @override
  String get beforeYouStart => '开始之前';

  @override
  String get connected => '已连接';

  @override
  String get connectFirstThenChat => '先连接，再聊天';

  @override
  String get betaIntro => 'CRYPT 是早期测试版，因此未来版本可能会改善使用体验。';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT 的工作方式类似对讲机：双方都需要在线并同时打开 CRYPT 才能建立连接。';

  @override
  String get howToUseCrypt =>
      '如何使用 CRYPT：\n1. 扫描对方的 CRYPT 二维码。\n2. 双方都需要打开 CRYPT 并保持在线。\n3. 等待 CRYPT 建立 P2P 连接。\n4. 等待“正在连接...”状态消失并建立连接。\n5. 连接后即可开始聊天。';

  @override
  String get messageStorageExplanation =>
      '您的消息设计为在已连接的设备之间直接传输。CRYPT 不会将聊天消息存储在我们的服务器上。服务器目前帮助处理连接和信令，聊天记录不会存储在服务器上。如果对方离线，则无法建立当前的 P2P 连接。';

  @override
  String get settingsAndSupportExplanation =>
      '访问设置以自定义 CRYPT 体验。更多自定义选项即将推出。\n\n想支持 CRYPT？您可以在设置中找到捐赠选项。';

  @override
  String get saving => '正在保存...';

  @override
  String get continueToCrypt => '继续使用 CRYPT';

  @override
  String get showSplashScreen => '显示启动画面';

  @override
  String get retry => '重试';

  @override
  String get connectionFailed => '连接失败';

  @override
  String get connectionFailedDetails => '连接失败。两台设备都必须在线并打开 CRYPT 才能连接。';

  @override
  String get gallery => '图库';

  @override
  String get alignQrCode => '对齐二维码';

  @override
  String get scanFromGallery => '从图库扫描';

  @override
  String get couldNotScanImage => '无法扫描图像。';

  @override
  String couldNotShareQrCode(String error) {
    return '无法分享二维码：$error';
  }

  @override
  String newContact(String username) {
    return '新联系人：$username';
  }

  @override
  String get publicEncryptionKeyMissing => '缺少您的公共加密密钥。';

  @override
  String get contactEncryptionKeyMissing => '缺少联系人的加密密钥。';

  @override
  String get localEncryptionKeyMissing => '缺少本地加密密钥。';

  @override
  String get noQrCodeFound => '在此图像中未找到二维码。';

  @override
  String get shareQrCode => '分享二维码';

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
  String get supportIntro =>
      '嘿！ 👋 我是一名致力于 CRYPT 的独立开发者。我没有预算或公司资金。我完全依靠您的诚实和同理心来不断改进应用程序并保证永远没有广告。';

  @override
  String get chooseSupportAmount => '选择您的价格（滑动至支持）：';

  @override
  String get poorGang => '我是穷小子🥀✌️';

  @override
  String get launchOfferMinimum => '推出最低优惠🚀';

  @override
  String get buyMeCoffee => '请我喝杯咖啡☕';

  @override
  String get superSupporter => '超级支持者🔥';

  @override
  String get feature => '特征';

  @override
  String get freeTier => '免费套餐';

  @override
  String get premium => '优质的';

  @override
  String get chatLocks => '聊天锁';

  @override
  String get maxOneRoom => '最多 1 间客房';

  @override
  String get unlimited => '无限';

  @override
  String get biometrics => '生物识别技术';

  @override
  String get disabled => '🚫 残疾人';

  @override
  String supportWithSats(String amount) {
    return '支持 $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ BOLT12 付款优惠• 点击复制';

  @override
  String get boltOfferCopied => '已复制 BOLT12 付款报价';

  @override
  String get tapToCopyBoltOffer => '点击复制 BOLT12 付款报价';

  @override
  String get simpleInstructionsToUnlock => '📬简单的解锁说明：';

  @override
  String unlockInstructions(String username) {
    return '1. 使用 Android 上的 Phoenix Wallet 进行支付（至少解锁 7,500 个 - 更多总是感激）。\n2. 截取您成功交易确认屏幕的屏幕截图。\n3. 通过电子邮件将该屏幕截图发送至 jounaidnadirmed@gmail.com 并告诉我您的唯一帐户用户名：“$username”，以便我知道谁付款。\n4. 在下面的框中输入任何内容以将您的请求保存到该设备上：';
  }

  @override
  String get supportRequestHint => '在此输入您的姓名或交易信息...';

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
