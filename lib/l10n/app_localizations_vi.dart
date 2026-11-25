// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Điều khoản và Điều kiện';

  @override
  String get settingsTermsAndConditions => 'Điều khoản và Điều kiện';

  @override
  String get termsIntro =>
      'CRYPT là một ứng dụng đang ở giai đoạn đầu, giúp kết nối mọi người trực tiếp để trò chuyện. Bạn chịu trách nhiệm sử dụng ứng dụng phù hợp và bảo vệ thông tin đăng nhập tài khoản của mình.';

  @override
  String get termsConnectivity =>
      'CRYPT sử dụng các dịch vụ trực tuyến để giúp thiết bị tìm thấy nhau và thiết lập kết nối. Tính khả dụng và hoạt động kết nối có thể thay đổi khi ứng dụng phát triển. Vui lòng không phụ thuộc vào CRYPT như phương tiện liên lạc duy nhất.';

  @override
  String get termsAgreement =>
      'Bằng cách tiếp tục, bạn xác nhận đã đọc và đồng ý sử dụng CRYPT theo các điều khoản này.';

  @override
  String get agreeTerms => 'Tôi đồng ý với Điều khoản và Điều kiện';

  @override
  String get agreeAndContinue => 'Đồng ý và tiếp tục';

  @override
  String get beforeYouStart => 'Trước khi bắt đầu';

  @override
  String get connected => 'Đã kết nối';

  @override
  String get connectFirstThenChat => 'Kết nối trước, rồi trò chuyện';

  @override
  String get betaIntro =>
      'CRYPT đang ở phiên bản beta đầu tiên, vì vậy trải nghiệm có thể được cải thiện trong các phiên bản tương lai.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT hoạt động như bộ đàm: cả hai người cần trực tuyến và mở CRYPT cùng lúc để thiết lập kết nối.';

  @override
  String get howToUseCrypt =>
      'Cách sử dụng CRYPT:\n1. Quét mã QR CRYPT của người kia.\n2. Cả hai người cần mở CRYPT và trực tuyến.\n3. Chờ CRYPT thiết lập kết nối P2P.\n4. Chờ trạng thái “Đang kết nối...” biến mất và kết nối được thiết lập.\n5. Khi đã kết nối, bạn có thể bắt đầu trò chuyện.';

  @override
  String get messageStorageExplanation =>
      'Tin nhắn của bạn được thiết kế để truyền trực tiếp giữa các thiết bị đã kết nối. CRYPT không lưu tin nhắn trò chuyện trên máy chủ. Máy chủ hiện hỗ trợ kết nối và báo hiệu, còn lịch sử trò chuyện không được lưu trên máy chủ. Nếu người kia ngoại tuyến, không thể thiết lập kết nối P2P hiện tại.';

  @override
  String get settingsAndSupportExplanation =>
      'Mở Cài đặt để tùy chỉnh trải nghiệm CRYPT. Sắp có thêm các tùy chọn tùy chỉnh.\n\nBạn muốn hỗ trợ CRYPT? Bạn có thể tìm tùy chọn quyên góp trong Cài đặt.';

  @override
  String get saving => 'Đang lưu...';

  @override
  String get continueToCrypt => 'Tiếp tục đến CRYPT';

  @override
  String get showSplashScreen => 'Hiển thị màn hình khởi động';

  @override
  String get retry => 'Thử lại';

  @override
  String get connectionFailed => 'Kết nối thất bại';

  @override
  String get connectionFailedDetails =>
      'Kết nối thất bại. Cả hai thiết bị phải trực tuyến và mở CRYPT để kết nối.';

  @override
  String get gallery => 'Thư viện';

  @override
  String get alignQrCode => 'CĂN CHỈNH MÃ QR';

  @override
  String get scanFromGallery => 'QUÉT TỪ THƯ VIỆN';

  @override
  String get couldNotScanImage => 'Không thể quét hình ảnh.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Không thể chia sẻ mã QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Liên hệ mới: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'Thiếu khóa mã hóa công khai của bạn.';

  @override
  String get contactEncryptionKeyMissing => 'Thiếu khóa mã hóa của liên hệ.';

  @override
  String get localEncryptionKeyMissing => 'Thiếu khóa mã hóa cục bộ.';

  @override
  String get noQrCodeFound => 'Không tìm thấy mã QR trong hình ảnh này.';

  @override
  String get shareQrCode => 'Chia sẻ mã QR';

  @override
  String get welcome => 'Chào mừng';

  @override
  String get login => 'Đăng nhập';

  @override
  String get signup => 'Đăng ký';

  @override
  String get settings => 'Cài đặt';

  @override
  String get chats => 'Trò chuyện';

  @override
  String get typeMessage => 'Nhập tin nhắn...';

  @override
  String get send => 'Gửi';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Đang kết nối...';

  @override
  String get connectingP2p => 'Đang kết nối P2P...';

  @override
  String get p2pConnectionNotReady => 'Kết nối P2P chưa sẵn sàng.';

  @override
  String get searchLanguage => 'Tìm kiếm ngôn ngữ...';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get forceEscapeSignOutTitle => 'BUỘC THOÁT KHẨN CẤP?';

  @override
  String get forceEscapeSignOutContent =>
      'CẢNH BÁO: Hành động này sẽ xóa hoàn toàn mọi dữ liệu khỏi thiết bị này.';

  @override
  String get cancel => 'Hủy';

  @override
  String get wipeDevice => 'XÓA THIẾT BỊ';

  @override
  String get accountDestructionAlertTitle => 'CẢNH BÁO XÓA TÀI KHOẢN';

  @override
  String get accountDestructionWarning =>
      'CẢNH BÁO: Hành động này sẽ xóa tất cả dữ liệu của bạn khỏi thiết bị này. Khi kết nối Internet, lệnh tự hủy từ xa sẽ được kích hoạt. Mọi tin nhắn được gửi từ ID người dùng duy nhất của bạn sẽ bị xóa vĩnh viễn khỏi bộ nhớ của tất cả các thiết bị ngang hàng.';

  @override
  String get accountDestructionCriticalNotice =>
      'NGHIÊM TRỌNG: Nếu nhập sai các số xác minh này, hệ thống sẽ bị khóa. Để mở khóa, bạn phải nhập Mật khẩu tài khoản chính hoặc sử dụng Lối thoát khẩn cấp để ngay lập tức xóa sạch dữ liệu trên thiết bị này.';

  @override
  String verificationSecurityKey(String code) {
    return 'Khóa bảo mật xác minh: $code';
  }

  @override
  String get copyDigitsHint => 'Sao chép 5 chữ số ở trên';

  @override
  String get codeMismatchNotice =>
      'Mã không khớp! Nhập Mật khẩu chính để bỏ qua hoặc hệ thống sẽ bị khóa trong 10 phút:';

  @override
  String get accountPasswordLabel => 'Mật khẩu tài khoản';

  @override
  String get deleteEverythingPermanently => 'XÓA VĨNH VIỄN TẤT CẢ';

  @override
  String get escapeAndPurgeDeviceData =>
      'Thoát khẩn cấp và xóa dữ liệu thiết bị';

  @override
  String get addContact => 'Thêm liên hệ';

  @override
  String get addContactConfirmation => 'Bạn có muốn thêm liên hệ này không?';

  @override
  String get noMessagesYet => 'Chưa có tin nhắn';

  @override
  String get addNewContact => 'Thêm liên hệ mới';

  @override
  String get usernameLabel => 'Tên người dùng';

  @override
  String get nicknameOptionalLabel => 'Biệt danh (Tùy chọn)';

  @override
  String get add => 'Thêm';

  @override
  String get usernameCannotBeEmpty => 'Tên người dùng không được để trống';

  @override
  String contactAlreadyExists(String name) {
    return 'Liên hệ \'$name\' đã có trong danh bạ của bạn.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Không tìm thấy người dùng \'$name\' trong sổ đăng ký mạng. Không thể tạo bí mật chung.';
  }

  @override
  String successfullyAddedContact(String name) {
    return 'Đã thêm $name thành công!';
  }

  @override
  String get contacts => 'Danh bạ';

  @override
  String get noContactsYet => 'Chưa có liên hệ nào';

  @override
  String get securityLockoutActive => 'Khóa bảo mật đang hoạt động';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Quá nhiều lần thử không hợp lệ. Quyền truy cập đã bị đóng băng trong $minutes phút.';
  }

  @override
  String get acknowledge => 'Đã hiểu';

  @override
  String get accessBlocked => 'Truy cập bị chặn';

  @override
  String accessSuspended(int minutes) {
    return '5 lần xác minh không khớp. Quyền truy cập bị đình chỉ trong $minutes phút tiếp theo.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Mở khóa nút bảo mật: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Số lần xác minh còn lại: $count';
  }

  @override
  String get secureKeyPasscode => 'Mật mã khóa bảo mật';

  @override
  String get warningHardwareLockout =>
      'CẢNH BÁO: Lần không khớp tiếp theo sẽ kích hoạt khóa bảo mật phần cứng.';

  @override
  String get abort => 'Hủy bỏ';

  @override
  String get authenticate => 'Xác thực';

  @override
  String get searchPipelinesHint =>
      'Đang tìm kiếm các kênh liên lạc bảo mật đang hoạt động...';

  @override
  String get zeroPipelinesDiscovered => 'Không tìm thấy kênh liên lạc phù hợp.';

  @override
  String get processingDecryption => 'Đang xử lý giải mã...';

  @override
  String get decrypting => 'Đang giải mã...';

  @override
  String get decryptionError => '[Lỗi giải mã]';

  @override
  String get cryptContainerSecure => 'BỘ CHỨA CRYPT AN TOÀN';

  @override
  String get connectAnAccount => 'Kết nối tài khoản';

  @override
  String get username => 'Tên người dùng';

  @override
  String get password => 'Mật khẩu';

  @override
  String get enterMasterSecurityPassword =>
      'Nhập mật khẩu bảo mật chính của bạn';

  @override
  String get pleaseFillAllFields => 'Vui lòng điền đầy đủ tất cả các trường';

  @override
  String get wrongUsernameOrPassword => 'Sai tên người dùng hoặc mật khẩu';

  @override
  String loginError(String error) {
    return 'Lỗi đăng nhập: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Chưa có tài khoản? Đăng ký';

  @override
  String get myIdentity => 'Danh tính của tôi';

  @override
  String get scanToAddMe => 'Quét để thêm tôi';

  @override
  String get shareProfileLink => 'Chia sẻ liên kết hồ sơ';

  @override
  String addMeOnCrypt(String link) {
    return 'Thêm tôi trên CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Quét QR';

  @override
  String get invalidCryptQrFormat => 'Định dạng mã QR CRYPT không hợp lệ.';

  @override
  String get userScanned => 'Đã quét người dùng!';

  @override
  String addingUser(String username) {
    return 'Đang thêm $username...';
  }

  @override
  String get defaultUser => 'Người dùng';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get keepPasswordSecureHint =>
      'Hãy giữ mật khẩu an toàn; mật khẩu không thể thay đổi sau này.';

  @override
  String get pleaseFillInAllFields => 'Vui lòng điền đầy đủ tất cả các trường';

  @override
  String get usernameExceedsLimit =>
      'Tên người dùng không được vượt quá 20 ký tự';

  @override
  String get invalidUsernameCharacters =>
      'Tên người dùng chỉ được chứa chữ cái, số, dấu gạch dưới và dấu gạch ngang';

  @override
  String get weakPasswordNotice =>
      'Mật khẩu phải có ít nhất 8 ký tự, bao gồm một chữ số và một chữ cái viết hoa';

  @override
  String get unableToGenerateUniqueUsername =>
      'Không thể tạo tên người dùng duy nhất.';

  @override
  String get accountCreated => 'Đã tạo tài khoản';

  @override
  String yourUsernameIs(String username) {
    return 'Tên người dùng của bạn:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'Tên người dùng \'$chosen\' đã được sử dụng.\n\nTên người dùng của bạn:\n\n$assigned\n\nVui lòng ghi nhớ tên này. Bạn sẽ cần nó để đăng nhập.';
  }

  @override
  String get continueText => 'Tiếp tục';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Không thể tạo danh tính bảo mật: $error';
  }

  @override
  String get welcomeToCrypt => 'Chào mừng đến với CRYPT';

  @override
  String get signupDescription =>
      'Nhập tên người dùng và mật khẩu để khởi tạo các khóa mã hóa ngang hàng (P2P) của bạn.';

  @override
  String get chooseAUsername => 'Chọn tên người dùng';

  @override
  String get usernameHelperText =>
      'Không sử dụng tên thật của bạn. Nếu tên người dùng đã được sử dụng, chúng tôi sẽ tự động thêm một hậu tố duy nhất.';

  @override
  String get masterAuthenticationRequired => 'Yêu cầu xác thực chính';

  @override
  String get verify => 'Xác minh';

  @override
  String get darkThemeMode => 'Chế độ giao diện tối';

  @override
  String get secureConversations => 'Cuộc trò chuyện bảo mật';

  @override
  String get noActiveConversations =>
      'Không tìm thấy cuộc trò chuyện đang hoạt động. Hãy bắt đầu một cuộc trò chuyện trước để sử dụng các khóa bảo mật tùy chỉnh.';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get wipeDeviceAndEscape => 'XÓA THIẾT BỊ VÀ THOÁT';

  @override
  String get falsePassword => 'Mật khẩu sai';

  @override
  String accessSuspendedTimer(String time) {
    return 'Quyền truy cập bị đình chỉ vì lý do bảo mật. Thử lại sau $time.';
  }

  @override
  String get selectSecureLockMethod => 'Chọn phương thức khóa bảo mật';

  @override
  String get selectSecureLockDescription =>
      'Bạn muốn khóa phòng trò chuyện này bằng sinh trắc học vân tay của thiết bị hay mã PIN 4 chữ số tiêu chuẩn?';

  @override
  String get fourDigitPin => 'PIN 4 chữ số';

  @override
  String get fingerprintUnlock => 'Vân tay 🔓';

  @override
  String get supportSoloDeveloper => 'Hỗ trợ một nhà phát triển độc lập';

  @override
  String get supportIntro =>
      'Chào! 👋 Tôi là nhà phát triển solo đang làm việc chăm chỉ trên CRYPT. Tôi không có ngân sách hoặc tài trợ của công ty. Tôi hoàn toàn tin tưởng vào sự trung thực và đồng cảm của bạn để tiếp tục cải thiện ứng dụng và đảm bảo KHÔNG CÓ QUẢNG CÁO MÃI MÃI.';

  @override
  String get chooseSupportAmount => 'Chọn giá của bạn (Trượt để hỗ trợ):';

  @override
  String get poorGang => 'Tôi là một nhóm nghèo 🥀✌️';

  @override
  String get launchOfferMinimum => 'Ra mắt ưu đãi tối thiểu 🚀';

  @override
  String get buyMeCoffee => 'Mua cho tôi một ly cà phê ☕';

  @override
  String get superSupporter => 'Siêu ủng hộ 🔥';

  @override
  String get feature => 'Tính năng';

  @override
  String get freeTier => 'Bậc miễn phí';

  @override
  String get premium => 'Phần thưởng';

  @override
  String get chatLocks => 'Khóa trò chuyện';

  @override
  String get maxOneRoom => 'Tối đa 1 phòng';

  @override
  String get unlimited => 'Không giới hạn';

  @override
  String get biometrics => 'Sinh trắc học';

  @override
  String get disabled => '🚫 Bị vô hiệu hóa';

  @override
  String supportWithSats(String amount) {
    return 'Hỗ trợ với $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ Ưu đãi thanh toán BOLT12 • Nhấn để sao chép';

  @override
  String get boltOfferCopied => 'Đã sao chép ưu đãi thanh toán BOLT12';

  @override
  String get tapToCopyBoltOffer => 'Nhấn để sao chép ưu đãi thanh toán BOLT12';

  @override
  String get simpleInstructionsToUnlock => '📬 Hướng dẫn đơn giản để mở khóa:';

  @override
  String unlockInstructions(String username) {
    return '1. Thanh toán bằng Ví Phoenix trên Android (tối thiểu 7.500 để mở khóa - luôn được đánh giá cao hơn).\n2. Chụp ảnh màn hình xác nhận giao dịch thành công.\n3. Gửi ảnh chụp màn hình đó qua email tới jounaidnadirmed@gmail.com và cho tôi biết tên người dùng tài khoản duy nhất của bạn: \'$username\' để tôi biết ai đã trả tiền.\n4. Nhập bất kỳ nội dung nào vào ô bên dưới để lưu yêu cầu của bạn trên thiết bị này:';
  }

  @override
  String get supportRequestHint =>
      'Nhập tên hoặc thông tin giao dịch của bạn vào đây...';

  @override
  String get maybeLater => 'Có thể để sau';

  @override
  String get submitProof => 'Gửi bằng chứng';

  @override
  String get couldNotOpenWallet =>
      'Không thể tự động mở ví. Vui lòng sao chép chuỗi mã văn bản bên dưới.';

  @override
  String get proofSubmittedSnackbar =>
      'Đã gửi bằng chứng! Quá trình xem xét thủ công mất 24–48 giờ (không bao gồm cuối tuần). Bạn có thể tiếp tục sử dụng ứng dụng bình thường!';

  @override
  String get loadingChats => 'Đang tải cuộc trò chuyện...';

  @override
  String get noChatsYetTitle => 'Chưa có cuộc trò chuyện nào';

  @override
  String get noChatsYetHint =>
      'Cuộc trò chuyện bắt đầu khi bạn quét mã QR CRYPT của người khác. Mở trang nhận dạng của bạn để chia sẻ thông tin của bạn để họ có thể quét nó.';

  @override
  String get scanQrToStartChat => 'Quét mã QR';

  @override
  String get noChatsMatchSearch =>
      'Không có cuộc trò chuyện nào phù hợp với tìm kiếm của bạn';

  @override
  String get noChatsMatchSearchHint =>
      'Hãy thử một tên khác hoặc xóa tìm kiếm để xem mọi cuộc trò chuyện.';

  @override
  String get requestSentTitle => 'Đã gửi yêu cầu';

  @override
  String requestSentBody(String username) {
    return 'Yêu cầu của bạn đã đi đến $username. Vui lòng đợi trong khi họ chấp nhận nó.';
  }

  @override
  String get requestSentKeepOpen =>
      'Cuộc trò chuyện sẽ mở ra ngay khi họ chấp nhận. Giữ CRYPT mở trên thiết bị này để bạn không bỏ lỡ nó.';

  @override
  String get requestSentGotIt => 'Hiểu rồi';

  @override
  String get scanCouldNotReadCode =>
      'Mã đó không thể đọc được. Quét mã QR CRYPT.';

  @override
  String get scanMissingTheirIdentity =>
      'Mã đó thiếu danh tính của người đó. Quét mã từ trang nhận dạng của họ.';

  @override
  String get scanOwnIdentityMissing =>
      'Khóa mã hóa của riêng bạn bị thiếu. Đăng xuất và đăng nhập lại, sau đó quét lại.';

  @override
  String get noLightningWalletFound =>
      'Không tìm thấy ví Lightning. Cài đặt một cái hoặc sao chép địa chỉ và dán vào ví.';

  @override
  String get settingsSectionAppearance => 'Ngoại hình';

  @override
  String get settingsSectionPrivacy => 'Quyền riêng tư và bảo mật';

  @override
  String get settingsSectionPremium => 'Cao cấp';

  @override
  String get settingsSectionHelp => 'Trợ giúp và pháp lý';

  @override
  String get settingsSectionAdministration => 'Quản trị';

  @override
  String get settingsSectionAccount => 'Tài khoản';

  @override
  String get settingsProtectTitle => 'Bảo vệ cài đặt bằng mật khẩu chính';

  @override
  String get settingsProtectSubtitle => 'Yêu cầu mật khẩu để truy cập cài đặt';

  @override
  String get chatLockSetPinSubtitle =>
      'Nhấn để đặt mã PIN của riêng bạn cho cuộc trò chuyện này';

  @override
  String get premiumTileTitle => 'Nhận Premium trọn đời';

  @override
  String get premiumActiveSubtitle => 'Premium đang bật cho tài khoản của bạn';

  @override
  String get premiumPendingSubtitle =>
      'Đang chờ quản trị viên xem lại ảnh chụp màn hình của bạn';

  @override
  String get premiumHowItWorks => 'Premium hoạt động như thế nào';

  @override
  String get reportProblemTitle => 'Báo cáo sự cố';

  @override
  String get reportProblemSubtitle => 'Lỗi, lạm dụng hoặc thư rác';

  @override
  String get adminAccessTitle => 'Quyền truy cập của quản trị viên';

  @override
  String get adminAccessSubtitle =>
      'Nhập mã quản trị của bạn để mở bảng điều khiển';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method - mã riêng, chỉ cuộc trò chuyện này';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount một lần bằng ví Lightning của bạn, sau đó gửi ảnh chụp màn hình';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Ảnh chụp màn hình của bạn đã được đưa vào. Quản trị viên sẽ kiểm tra nó và tính năng trả phí sẽ bật cho tài khoản của bạn trong vòng $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Trả tiền $amount với $method, hoặc $wallet.\n2. Chụp màn hình xác nhận thanh toán.\n3. Gửi từ Gửi bằng chứng thanh toán.\n4. Premium bật và duy trì suốt đời.\n\nCRYPT được xây dựng bởi một nhà phát triển solo và đây là toàn bộ ưu đãi: thanh toán một lần, không cần đăng ký.';
  }

  @override
  String get reportIntro =>
      'Hãy cho chúng tôi biết chuyện gì đã xảy ra. Nếu bạn đang báo cáo người khác, hãy thêm tên người dùng của họ để chúng tôi có thể xử lý đúng tài khoản.';

  @override
  String get reportSent => 'Đã gửi báo cáo. Cảm ơn.';

  @override
  String get reportSendFailed => 'Không thể gửi báo cáo.';

  @override
  String get reportTypeLabel => 'Loại báo cáo';

  @override
  String get reportCategoryBug => 'Lỗi';

  @override
  String get reportCategoryAbuse => 'Lạm dụng';

  @override
  String get reportCategorySpam => 'Thư rác';

  @override
  String get reportCategoryOther => 'Khác';

  @override
  String get reportUsernameLabel => 'Tên người dùng của họ (tùy chọn)';

  @override
  String get reportUsernameHint => 'ví dụ: ai đó_bạn_muốn_báo cáo';

  @override
  String get reportDetailsLabel => 'Chuyện gì đã xảy ra vậy?';

  @override
  String get reportScreenshotsLabel => 'Ảnh chụp màn hình';

  @override
  String get reportAddScreenshot => 'Thêm ảnh chụp màn hình';

  @override
  String get reportSendButton => 'Gửi báo cáo';

  @override
  String get reportPrivacyNote =>
      'Các báo cáo được xem xét bởi quản trị viên. Ảnh chụp màn hình được lưu trữ riêng tư và chỉ người kiểm duyệt mới hiển thị.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount một lần, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Không có đăng ký và không có gì để gia hạn. Thanh toán bằng $method, gửi ảnh chụp màn hình xác nhận và tính năng trả phí sẽ được bật trong vòng $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT được xây dựng bởi một nhà phát triển solo. Premium là thứ giúp nó không có quảng cáo và được duy trì tích cực.';

  @override
  String get premiumStepPay => 'Thanh toán bằng ví của bạn';

  @override
  String get premiumLightningAddressLabel => 'Địa chỉ sét';

  @override
  String get premiumOpenWallet => 'Mở ví';

  @override
  String get premiumCopyAddress => 'Sao chép địa chỉ';

  @override
  String get premiumWorksWith =>
      'Hoạt động với Phoenix và bất kỳ ví Lightning nào khác.';

  @override
  String get premiumStepScreenshot => 'Gửi ảnh chụp màn hình của bạn';

  @override
  String get premiumScreenshotHint =>
      'Chụp ảnh màn hình xác nhận thanh toán trong ví Lightning của bạn và đính kèm bên dưới.';

  @override
  String get premiumAttachScreenshot => 'Đính kèm ảnh chụp màn hình';

  @override
  String get premiumReplaceScreenshot => 'Thay thế ảnh chụp màn hình';

  @override
  String get premiumStepAmount => 'Xác nhận số tiền';

  @override
  String get premiumAmountLabel => 'Số tiền bạn đã trả (USD)';

  @override
  String get premiumNoteLabel => 'Lưu ý (tùy chọn)';

  @override
  String get premiumSendProof => 'Gửi bằng chứng của tôi';

  @override
  String get premiumAddressCopied => 'Đã sao chép địa chỉ Lightning.';

  @override
  String get premiumAttachConfirmation =>
      'Đính kèm ảnh chụp màn hình xác nhận thanh toán của bạn.';

  @override
  String get premiumSendProofFailed => 'Không thể gửi bằng chứng thanh toán.';

  @override
  String premiumAmountHelper(String amount) {
    return 'tối thiểu $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'Kích hoạt mất $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Đã nhận được bằng chứng. Premium được bật trong vòng $window.';
  }

  @override
  String get premiumTableFeature => 'tính năng';

  @override
  String get premiumTableFree => 'miễn phí';

  @override
  String get premiumTablePremium => 'Cao cấp';

  @override
  String get premiumTableEncrypted => 'Tin nhắn ngang hàng được mã hóa';

  @override
  String get premiumTableMessagesStay =>
      'Tin nhắn vẫn còn trên thiết bị của bạn';

  @override
  String get premiumTableChatLocks =>
      'Trò chuyện bị khóa bằng mã PIN của riêng bạn';

  @override
  String get premiumTableFingerprint => 'Mở khóa bằng vân tay hoặc khuôn mặt';

  @override
  String get premiumTablePrice => 'Giá';

  @override
  String get premiumTableAccess => 'Truy cập';

  @override
  String get premiumTableIncluded => 'Bao gồm';

  @override
  String get premiumTableOneChat => '1 cuộc trò chuyện';

  @override
  String get premiumTableUnlimited => 'Không giới hạn';

  @override
  String get premiumTableNotIncluded => 'Không bao gồm';

  @override
  String get premiumTableFreeValue => 'miễn phí';

  @override
  String get premiumTableWhileFree => 'Mặc dù ứng dụng này miễn phí';

  @override
  String get premiumTableLifetime => 'Trọn đời';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Một khoản thanh toán $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Một lần thanh toán $amount và Premium là của bạn trọn đời. Không có đăng ký và không cần gia hạn.';
  }

  @override
  String get settingsSaveFailed => 'Không thể lưu cài đặt đó. Hãy thử lại.';

  @override
  String get settingsLockFailed =>
      'Không thể khóa cuộc trò chuyện này. Hãy thử lại.';

  @override
  String get settingsUnlockFailed =>
      'Không thể mở khóa cuộc trò chuyện này. Hãy thử lại.';

  @override
  String pinSetTitle(String chat) {
    return 'Đặt mã PIN cho $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Xác nhận mã PIN cho $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Mã PIN này mở ra $chat chỉ một. Mỗi cuộc trò chuyện đều có mã PIN riêng do bạn chọn. Không có mã duy nhất cho ứng dụng.';
  }

  @override
  String get pinMismatch => 'Mã PIN không khớp. Khóa không được kích hoạt.';

  @override
  String get biometricNotSetUp =>
      'Không có tính năng mở khóa bằng vân tay hoặc khuôn mặt nào được thiết lập trên thiết bị này.';

  @override
  String get biometricVerifyFailed =>
      'Không thể xác minh đó là bạn trên thiết bị này.';

  @override
  String get lightningAddressCopied =>
      'Đã sao chép địa chỉ Lightning. Dán nó vào ví để thanh toán.';

  @override
  String get accountSuspended => 'Tài khoản bị đình chỉ';

  @override
  String get premiumLifetimeAccess => 'Quyền truy cập cao cấp trọn đời';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Chi trả $amount từ $method đến địa chỉ Lightning ở trên.';
  }

  @override
  String get premiumActivationStep2 =>
      'Chụp ảnh màn hình xác nhận thanh toán và gửi nó làm bằng chứng thanh toán của bạn.';
}
