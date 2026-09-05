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
  String get maybeLater => '나중에';

  @override
  String get submitProof => '증빙 제출';

  @override
  String get couldNotOpenWallet => '지갑을 열 수 없습니다. 아래 코드를 복사하세요.';

  @override
  String get proofSubmittedSnackbar => '증빙이 제출되었습니다. 수동 검토: 24~48시간 (주말 제외).';
}
