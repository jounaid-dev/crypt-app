// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => '이용약관';

  @override
  String get settingsTermsAndConditions => '이용약관';

  @override
  String get termsIntro =>
      'CRYPT는 대화를 위해 사람들을 직접 연결하는 초기 단계 애플리케이션입니다. 귀하는 애플리케이션을 적절하게 사용하고 귀하의 계정 자격 증명을 안전하게 유지할 책임이 있습니다.';

  @override
  String get termsConnectivity =>
      'CRYPT는 온라인 서비스를 사용하여 장치가 연결을 검색하고 설정하도록 돕습니다. 애플리케이션이 개발됨에 따라 가용성 및 연결 동작이 변경될 수 있습니다. 유일한 의사소통 수단으로 CRYPT에 의존하지 마십시오.';

  @override
  String get termsAgreement => '계속 진행하면 귀하는 본 약관에 따라 CRYPT를 읽고 동의함을 확인하게 됩니다.';

  @override
  String get agreeTerms => '이용약관에 동의합니다.';

  @override
  String get agreeAndContinue => '동의하고 계속하세요';

  @override
  String get beforeYouStart => '시작하기 전에';

  @override
  String get connected => '연결됨';

  @override
  String get connectFirstThenChat => '먼저 연결한 다음 채팅하세요.';

  @override
  String get betaIntro => 'CRYPT는 초기 베타 버전이므로 향후 버전에서는 경험이 향상될 수 있습니다.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT는 무전기처럼 작동합니다. 연결을 설정하려면 두 사람 모두 온라인 상태여야 하며 동시에 CRYPT를 열어야 합니다.';

  @override
  String get howToUseCrypt =>
      'CRYPT 사용 방법:\n1. 상대방의 CRYPT QR 코드를 스캔하세요.\n2. 두 사람 모두 CRYPT가 열려 있고 온라인 상태여야 합니다.\n3. CRYPT가 P2P 연결을 설정하는 동안 기다립니다.\n4. \"연결 중...\" 상태가 사라지고 연결이 설정될 때까지 기다립니다.\n5. 연결되면 채팅을 시작할 수 있습니다.';

  @override
  String get messageStorageExplanation =>
      '귀하의 메시지는 연결된 장치 간에 직접 전달되도록 설계되었습니다. CRYPT는 귀하의 채팅 메시지를 당사 서버에 저장하지 않습니다. 현재 서버는 연결 및 신호 전달을 돕고 있으며, 채팅 기록은 서버에 저장되지 않습니다. 상대방이 오프라인이면 현재 P2P 연결을 설정할 수 없습니다.';

  @override
  String get settingsAndSupportExplanation =>
      'CRYPT 환경을 맞춤 설정하려면 설정을 방문하세요. 더 많은 사용자 정의 옵션이 곧 제공될 예정입니다.\n\nCRYPT를 지원하고 싶으신가요? 설정에서 기부 옵션을 찾을 수 있습니다.';

  @override
  String get saving => '절약...';

  @override
  String get continueToCrypt => 'CRYPT로 계속';

  @override
  String get showSplashScreen => '스플래시 화면 표시';

  @override
  String get retry => '다시 해 보다';

  @override
  String get connectionFailed => '연결 실패';

  @override
  String get connectionFailedDetails =>
      '연결에 실패했습니다. 연결하려면 두 장치 모두 CRYPT가 열린 상태로 온라인 상태여야 합니다.';

  @override
  String get gallery => '갱도';

  @override
  String get alignQrCode => 'QR 코드 정렬';

  @override
  String get scanFromGallery => '갤러리에서 스캔';

  @override
  String get couldNotScanImage => '이미지를 스캔할 수 없습니다.';

  @override
  String couldNotShareQrCode(String error) {
    return 'QR 코드를 공유할 수 없습니다: $error';
  }

  @override
  String newContact(String username) {
    return '새 연락처: $username';
  }

  @override
  String get publicEncryptionKeyMissing => '공개 암호화 키가 누락되었습니다.';

  @override
  String get contactEncryptionKeyMissing => '연락처 암호화 키가 누락되었습니다.';

  @override
  String get localEncryptionKeyMissing => '로컬 암호화 키가 누락되었습니다.';

  @override
  String get noQrCodeFound => '이 이미지에는 QR 코드가 없습니다.';

  @override
  String get shareQrCode => 'QR 코드 공유';

  @override
  String get welcome => '환영합니다';

  @override
  String get login => '로그인';

  @override
  String get signup => '회원가입';

  @override
  String get settings => '설정';

  @override
  String get chats => '채팅';

  @override
  String get typeMessage => '메시지를 입력하세요...';

  @override
  String get send => '전송';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => '연결 중...';

  @override
  String get connectingP2p => 'P2P에 연결 중...';

  @override
  String get p2pConnectionNotReady => 'P2P가 준비되지 않았습니다.';

  @override
  String get searchLanguage => '언어 검색...';

  @override
  String get language => '언어';

  @override
  String get forceEscapeSignOutTitle => '강제 로그아웃하시겠습니까?';

  @override
  String get forceEscapeSignOutContent => '경고: 모든 기기 데이터가 삭제됩니다.';

  @override
  String get cancel => '취소';

  @override
  String get wipeDevice => '기기 초기화';

  @override
  String get accountDestructionAlertTitle => '계정 삭제';

  @override
  String get accountDestructionWarning => '경고: 기기 데이터와 원격 메시지가 삭제됩니다.';

  @override
  String get accountDestructionCriticalNotice =>
      '치명적: 잘못된 코드를 입력하면 시스템이 잠깁니다. 계정 비밀번호 또는 비상 탈출을 사용하세요.';

  @override
  String verificationSecurityKey(String code) {
    return '보안 키: $code';
  }

  @override
  String get copyDigitsHint => '5자리 숫자를 복사하세요';

  @override
  String get codeMismatchNotice => '코드가 일치하지 않습니다. 마스터 비밀번호를 입력하거나 10분간 기다리세요.';

  @override
  String get accountPasswordLabel => '계정 비밀번호';

  @override
  String get deleteEverythingPermanently => '모든 항목 삭제';

  @override
  String get escapeAndPurgeDeviceData => '탈출 및 데이터 삭제';

  @override
  String get addContact => '연락처 추가';

  @override
  String get addContactConfirmation => '이 연락처를 추가하시겠습니까?';

  @override
  String get noMessagesYet => '아직 메시지가 없습니다';

  @override
  String get addNewContact => '새 연락처';

  @override
  String get usernameLabel => '사용자 이름';

  @override
  String get nicknameOptionalLabel => '닉네임 (선택 사항)';

  @override
  String get add => '추가';

  @override
  String get usernameCannotBeEmpty => '사용자 이름은 필수입니다';

  @override
  String contactAlreadyExists(String name) {
    return '\'$name\' 연락처가 이미 존재합니다.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return '사용자 \'$name\'을(를) 찾을 수 없습니다. 공유 비밀을 사용할 수 없습니다.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name 추가 완료!';
  }

  @override
  String get contacts => '연락처';

  @override
  String get noContactsYet => '아직 연락처가 없습니다';

  @override
  String get securityLockoutActive => '보안 잠금';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return '시도 횟수가 너무 많습니다. $minutes분 동안 잠깁니다.';
  }

  @override
  String get acknowledge => '확인';

  @override
  String get accessBlocked => '접근 차단됨';

  @override
  String accessSuspended(int minutes) {
    return '5회 인증 실패. $minutes분 동안 접근이 일시 중지됩니다.';
  }

  @override
  String get ok => '확인';

  @override
  String unlockSecureNode(String username) {
    return '잠금 해제: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return '남은 시도 횟수: $count';
  }

  @override
  String get secureKeyPasscode => '보안 비밀번호';

  @override
  String get warningHardwareLockout => '경고: 다음 실패 시 보안이 잠깁니다.';

  @override
  String get abort => '중단';

  @override
  String get authenticate => '인증';

  @override
  String get searchPipelinesHint => '보안 연결 검색...';

  @override
  String get zeroPipelinesDiscovered => '연결을 찾을 수 없습니다.';

  @override
  String get processingDecryption => '복호화 중...';

  @override
  String get decrypting => '복호화 중...';

  @override
  String get decryptionError => '[복호화 오류]';

  @override
  String get cryptContainerSecure => 'CRYPT 컨테이너 보안 상태';

  @override
  String get connectAnAccount => '계정 연결';

  @override
  String get username => '사용자 이름';

  @override
  String get password => '비밀번호';

  @override
  String get enterMasterSecurityPassword => '마스터 비밀번호를 입력하세요';

  @override
  String get pleaseFillAllFields => '모든 필드를 입력하세요';

  @override
  String get wrongUsernameOrPassword => '사용자 이름 또는 비밀번호가 잘못되었습니다';

  @override
  String loginError(String error) {
    return '로그인 오류: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => '계정이 없으신가요? 회원가입';

  @override
  String get myIdentity => '내 신원';

  @override
  String get scanToAddMe => '스캔하여 나를 추가';

  @override
  String get shareProfileLink => '프로필 공유';

  @override
  String addMeOnCrypt(String link) {
    return 'CRYPT에서 나를 추가하세요!\n\n$link';
  }

  @override
  String get scanQr => 'QR 스캔';

  @override
  String get invalidCryptQrFormat => '유효하지 않은 CRYPT QR 코드입니다.';

  @override
  String get userScanned => '사용자가 스캔되었습니다!';

  @override
  String addingUser(String username) {
    return '$username 추가 중...';
  }

  @override
  String get defaultUser => '사용자';

  @override
  String get createAccount => '계정 생성';

  @override
  String get keepPasswordSecureHint => '안전하게 보관하세요. 비밀번호는 변경할 수 없습니다.';

  @override
  String get pleaseFillInAllFields => '모든 필드를 입력하세요';

  @override
  String get usernameExceedsLimit => '사용자 이름: 최대 20자';

  @override
  String get invalidUsernameCharacters => '영문자, 숫자, _ 또는 -만 사용하세요.';

  @override
  String get weakPasswordNotice => '8자 이상, 숫자 1개, 대문자 1개를 사용하세요.';

  @override
  String get unableToGenerateUniqueUsername => '고유한 사용자 이름을 생성할 수 없습니다.';

  @override
  String get accountCreated => '계정 생성 완료';

  @override
  String yourUsernameIs(String username) {
    return '사용자 이름:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return '사용자 이름 \'$chosen\'은(는) 이미 사용 중입니다.\n\n사용자 이름:\n\n$assigned\n\n로그인할 때 필요하므로 기억해 두세요.';
  }

  @override
  String get continueText => '계속';

  @override
  String failedToGenerateIdentity(String error) {
    return '신원 생성 실패: $error';
  }

  @override
  String get welcomeToCrypt => 'CRYPT에 오신 것을 환영합니다';

  @override
  String get signupDescription => '사용자 이름과 비밀번호를 생성하여 P2P 키를 만드세요.';

  @override
  String get chooseAUsername => '사용자 이름 선택';

  @override
  String get usernameHelperText => '실명을 사용하지 마세요. 이미 사용 중이면 접미사가 추가됩니다.';

  @override
  String get masterAuthenticationRequired => '마스터 인증';

  @override
  String get verify => '확인';

  @override
  String get darkThemeMode => '다크 테마';

  @override
  String get secureConversations => '보안 대화';

  @override
  String get noActiveConversations => '활성 채팅이 없습니다. 잠금을 활성화하려면 채팅을 시작하세요.';

  @override
  String get logout => '로그아웃';

  @override
  String get wipeDeviceAndEscape => '기기 초기화';

  @override
  String get falsePassword => '잘못된 비밀번호';

  @override
  String accessSuspendedTimer(String time) {
    return '접근이 일시 중지되었습니다. $time 후 다시 시도하세요.';
  }

  @override
  String get selectSecureLockMethod => '잠금 방식 선택';

  @override
  String get selectSecureLockDescription => '지문 또는 4자리 PIN으로 잠그시겠습니까?';

  @override
  String get fourDigitPin => '4자리 PIN';

  @override
  String get fingerprintUnlock => '지문 🔓';

  @override
  String get supportSoloDeveloper => '개발자 후원';

  @override
  String get supportIntro =>
      '여기요! 👋 저는 CRYPT를 열심히 개발하고 있는 1인 개발자입니다. 예산이나 기업 자금이 없습니다. 저는 앱을 지속적으로 개선하고 광고가 영원히 발생하지 않도록 보장하기 위해 전적으로 귀하의 정직성과 공감에 의지합니다.';

  @override
  String get chooseSupportAmount => '가격을 선택하세요(지원하려면 슬라이드하세요):';

  @override
  String get poorGang => '나는 가난한 갱 🥀✌️';

  @override
  String get launchOfferMinimum => '최소 제안 출시 🚀';

  @override
  String get buyMeCoffee => '커피 사주세요 찻잔';

  @override
  String get superSupporter => '슈퍼 서포터 🔥';

  @override
  String get feature => '특징';

  @override
  String get freeTier => '프리 티어';

  @override
  String get premium => '프리미엄';

  @override
  String get chatLocks => '채팅 잠금';

  @override
  String get maxOneRoom => '최대 1개 객실';

  @override
  String get unlimited => '제한 없는';

  @override
  String get biometrics => '생체 인식';

  @override
  String get disabled => '🚫 장애인';

  @override
  String supportWithSats(String amount) {
    return '$amount sats로 지원(Phoenix)';
  }

  @override
  String get boltOffer => '⚡ BOLT12 결제 제안 • 탭하여 복사';

  @override
  String get boltOfferCopied => 'BOLT12 결제 제안이 복사되었습니다.';

  @override
  String get tapToCopyBoltOffer => 'BOLT12 결제 제안을 복사하려면 탭하세요.';

  @override
  String get simpleInstructionsToUnlock => '📬 간단한 잠금 해제 지침:';

  @override
  String unlockInstructions(String username) {
    return '1. Android에서 Phoenix Wallet을 사용하여 결제하세요(잠금 해제하려면 최소 7,500개 — 더 많은 금액을 지불하시면 언제든지 감사하겠습니다).\n2. 성공적인 거래 확인 화면의 스크린샷을 찍으세요.\n3. 해당 스크린샷을 jounaidnadirmed@gmail.com으로 이메일로 보내고 귀하의 고유 계정 사용자 이름: \'$username\'을 알려주시면 누가 지불했는지 알 수 있습니다.\n4. 이 장치에 요청을 저장하려면 아래 상자에 아무 내용이나 입력하세요.';
  }

  @override
  String get supportRequestHint => '여기에 이름이나 거래 정보를 입력하세요...';

  @override
  String get maybeLater => '나중에';

  @override
  String get submitProof => '증빙 제출';

  @override
  String get couldNotOpenWallet => '지갑을 열 수 없습니다. 아래 코드를 복사하세요.';

  @override
  String get proofSubmittedSnackbar => '증빙이 제출되었습니다. 수동 검토: 24~48시간 (주말 제외).';

  @override
  String get loadingChats => '채팅 로드 중...';

  @override
  String get noChatsYetTitle => '아직 채팅이 없습니다.';

  @override
  String get noChatsYetHint =>
      '상대방의 CRYPT QR 코드를 스캔하면 채팅이 시작됩니다. 귀하의 신원 페이지를 열어서 그들이 스캔할 수 있도록 공유하세요.';

  @override
  String get scanQrToStartChat => 'QR 코드 스캔';

  @override
  String get noChatsMatchSearch => '검색어와 일치하는 채팅이 없습니다.';

  @override
  String get noChatsMatchSearchHint => '모든 채팅을 보려면 다른 이름을 사용하거나 검색을 삭제하세요.';

  @override
  String get requestSentTitle => '요청이 전송되었습니다.';

  @override
  String requestSentBody(String username) {
    return '귀하의 요청은 다음 주소로 이동되었습니다:$username. 승인하는 동안 잠시 기다려 주세요.';
  }

  @override
  String get requestSentKeepOpen =>
      '수락하는 즉시 채팅이 열립니다. 놓치지 않도록 이 장치에서 CRYPT를 열어두세요.';

  @override
  String get requestSentGotIt => '알았어요';

  @override
  String get scanCouldNotReadCode => '해당 코드를 읽을 수 없습니다. CRYPT QR 코드를 스캔하세요.';

  @override
  String get scanMissingTheirIdentity =>
      '해당 코드에는 사람의 신원이 누락되어 있습니다. ID 페이지에서 코드를 스캔하세요.';

  @override
  String get scanOwnIdentityMissing =>
      '귀하의 암호화 키가 누락되었습니다. 로그아웃했다가 다시 로그인한 후 다시 스캔하세요.';

  @override
  String get noLightningWalletFound =>
      '라이트닝 지갑을 찾을 수 없습니다. 하나 설치하거나 주소를 복사하여 지갑에 붙여넣으세요.';

  @override
  String get settingsSectionAppearance => '외관';

  @override
  String get settingsSectionPrivacy => '개인 정보 보호 및 보안';

  @override
  String get settingsSectionPremium => '프리미엄';

  @override
  String get settingsSectionHelp => '도움말 및 법률';

  @override
  String get settingsSectionAdministration => '행정';

  @override
  String get settingsSectionAccount => '계정';

  @override
  String get settingsProtectTitle => '마스터 비밀번호로 설정 보호';

  @override
  String get settingsProtectSubtitle => '설정에 액세스하려면 비밀번호가 필요합니다';

  @override
  String get chatLockSetPinSubtitle => '이 채팅에 나만의 PIN을 설정하려면 탭하세요.';

  @override
  String get premiumTileTitle => '평생 프리미엄을 받으세요';

  @override
  String get premiumActiveSubtitle => '귀하의 계정에 프리미엄이 켜져 있습니다';

  @override
  String get premiumPendingSubtitle => '관리자가 스크린샷을 검토하기를 기다리는 중';

  @override
  String get premiumHowItWorks => '프리미엄 작동 방식';

  @override
  String get reportProblemTitle => '문제 신고';

  @override
  String get reportProblemSubtitle => '버그, 남용 또는 스팸';

  @override
  String get adminAccessTitle => '관리자 액세스';

  @override
  String get adminAccessSubtitle => '패널을 열려면 관리자 코드를 입력하세요';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method— 자신의 코드, 이 채팅에만 해당';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount라이트닝 지갑으로 한 번, 스크린샷을 보내세요';
  }

  @override
  String premiumPendingBody(String window) {
    return '귀하의 스크린샷이 있습니다. 관리자가 이를 확인하고 귀하의 계정에 대해 프리미엄이 활성화됩니다.$window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. 지불$amount~와 함께$method, 또는$wallet.\n2. 결제 확인 스크린샷을 찍어주세요.\n3. 결제증명서 제출에서 보내주세요.\n4. 프리미엄이 켜져서 평생 유지됩니다.\n\nCRYPT는 1인 개발자에 의해 구축되었으며 구독이 필요 없는 한 번의 결제로 전체 서비스를 제공합니다.';
  }

  @override
  String get reportIntro =>
      '무슨 일이 있었는지 알려주세요. 다른 사람을 신고하는 경우 올바른 계정에 조치를 취할 수 있도록 해당 사람의 사용자 이름을 추가하세요.';

  @override
  String get reportSent => '보고서가 전송되었습니다. 감사합니다.';

  @override
  String get reportSendFailed => '보고서를 보낼 수 없습니다.';

  @override
  String get reportTypeLabel => '보고서 유형';

  @override
  String get reportCategoryBug => '버그';

  @override
  String get reportCategoryAbuse => '학대';

  @override
  String get reportCategorySpam => '스팸';

  @override
  String get reportCategoryOther => '기타';

  @override
  String get reportUsernameLabel => '사용자 이름(선택사항)';

  @override
  String get reportUsernameHint => '예를 들어 누군가_당신이_원하는_신고됨';

  @override
  String get reportDetailsLabel => '무슨 일이 일어났나요?';

  @override
  String get reportScreenshotsLabel => '스크린샷';

  @override
  String get reportAddScreenshot => '스크린샷 추가';

  @override
  String get reportSendButton => '보고서 보내기';

  @override
  String get reportPrivacyNote =>
      '보고서는 관리자가 검토합니다. 스크린샷은 비공개로 저장되며 중재자에게만 표시됩니다.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount한 번,$lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return '구독이나 갱신이 필요하지 않습니다. 결제 수단$method, 확인 스크린샷을 보내면 프리미엄이 켜집니다.$window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT는 개인 개발자가 구축했습니다. 프리미엄은 광고 없이 적극적으로 유지 관리되는 기능입니다.';

  @override
  String get premiumStepPay => '지갑으로 결제하세요';

  @override
  String get premiumLightningAddressLabel => '번개 주소';

  @override
  String get premiumOpenWallet => '지갑 열기';

  @override
  String get premiumCopyAddress => '주소 복사';

  @override
  String get premiumWorksWith => 'Phoenix 및 기타 Lightning 지갑과 함께 작동합니다.';

  @override
  String get premiumStepScreenshot => '스크린샷 보내기';

  @override
  String get premiumScreenshotHint => '라이트닝 지갑의 결제 확인 스크린샷을 찍어 아래에 첨부하세요.';

  @override
  String get premiumAttachScreenshot => '스크린샷 첨부';

  @override
  String get premiumReplaceScreenshot => '스크린샷 교체';

  @override
  String get premiumStepAmount => '금액을 확인하세요';

  @override
  String get premiumAmountLabel => '지불한 금액(USD)';

  @override
  String get premiumNoteLabel => '참고(선택사항)';

  @override
  String get premiumSendProof => '내 증거를 보내';

  @override
  String get premiumAddressCopied => '라이트닝 주소가 복사되었습니다.';

  @override
  String get premiumAttachConfirmation => '결제 확인 스크린샷을 첨부하세요.';

  @override
  String get premiumSendProofFailed => '결제 증빙 자료를 보낼 수 없습니다.';

  @override
  String premiumAmountHelper(String amount) {
    return '최저한의$amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return '활성화에 소요되는 시간$window.';
  }

  @override
  String premiumProofReceived(String window) {
    return '증거가 접수되었습니다. 프리미엄은 다음 기간 내에 활성화됩니다.$window.';
  }

  @override
  String get premiumTableFeature => '특징';

  @override
  String get premiumTableFree => '무료';

  @override
  String get premiumTablePremium => '프리미엄';

  @override
  String get premiumTableEncrypted => '암호화된 P2P 메시징';

  @override
  String get premiumTableMessagesStay => '메시지는 기기에 남아 있습니다.';

  @override
  String get premiumTableChatLocks => '자신의 PIN으로 잠긴 채팅';

  @override
  String get premiumTableFingerprint => '지문이나 얼굴로 잠금 해제';

  @override
  String get premiumTablePrice => '가격';

  @override
  String get premiumTableAccess => '액세스';

  @override
  String get premiumTableIncluded => '포함됨';

  @override
  String get premiumTableOneChat => '채팅 1개';

  @override
  String get premiumTableUnlimited => '무제한';

  @override
  String get premiumTableNotIncluded => '포함되지 않음';

  @override
  String get premiumTableFreeValue => '무료';

  @override
  String get premiumTableWhileFree => '앱이 무료인 동안';

  @override
  String get premiumTableLifetime => '평생';

  @override
  String premiumTableOnePayment(String amount) {
    return '한 번의 지불$amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return '한 번의 지불$amount프리미엄은 평생 동안 귀하의 것입니다. 구독이나 갱신할 사항이 없습니다.';
  }

  @override
  String get settingsSaveFailed => '해당 설정을 저장할 수 없습니다. 다시 시도해 보세요.';

  @override
  String get settingsLockFailed => '이 채팅을 잠글 수 없습니다. 다시 시도해 보세요.';

  @override
  String get settingsUnlockFailed => '이 채팅을 잠금 해제할 수 없습니다. 다시 시도해 보세요.';

  @override
  String pinSetTitle(String chat) {
    return 'PIN을 설정하세요$chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'PIN을 확인하세요.$chat';
  }

  @override
  String pinSetHelper(String chat) {
    return '이 PIN이 열립니다$chat오직. 모든 채팅에는 귀하가 선택한 고유한 PIN이 있습니다. 앱에는 단일 코드가 없습니다.';
  }

  @override
  String get pinMismatch => 'PIN이 일치하지 않습니다. 잠금이 활성화되지 않았습니다.';

  @override
  String get biometricNotSetUp => '이 기기에는 지문이나 얼굴 잠금해제가 설정되어 있지 않습니다.';

  @override
  String get biometricVerifyFailed => '이 기기에서 본인인지 확인할 수 없습니다.';

  @override
  String get lightningAddressCopied => '라이트닝 주소가 복사되었습니다. 결제하려면 지갑에 붙여넣으세요.';

  @override
  String get accountSuspended => '계정이 정지되었습니다';

  @override
  String get premiumLifetimeAccess => '평생 프리미엄 액세스';

  @override
  String premiumActivationStep1(String amount, String method) {
    return '지불하다$amount~에서$method위의 라이트닝 주소로';
  }

  @override
  String get premiumActivationStep2 => '결제 확인 스크린샷을 찍어 결제 증빙 자료로 보내주세요.';

  @override
  String get pinFourDigits => '정확히 4자리를 입력하세요.';

  @override
  String get scanOwnCode =>
      '그것은 당신 자신의 코드입니다. 다른 사람의 CRYPT 코드를 스캔하여 채팅을 시작하세요.';

  @override
  String get couldNotGenerateQrImage => 'QR 이미지를 생성할 수 없습니다.';

  @override
  String get conversationUpdateFailed => '대화를 업데이트하지 못했습니다. 다시 시도해 보세요.';

  @override
  String get conversationCreationFailed => '대화 생성에 실패했습니다. 다시 시도해 보세요.';

  @override
  String get accountSuspendedByAdmin => '이 계정은 관리자에 의해 정지되었습니다.';
}
