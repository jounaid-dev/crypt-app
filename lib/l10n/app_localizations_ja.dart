// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => '利用規約';

  @override
  String get settingsTermsAndConditions => '利用規約';

  @override
  String get termsIntro =>
      'CRYPT は、人々を直接接続して会話を行うための初期段階のアプリケーションです。あなたには、アプリケーションを適切に使用し、アカウントの資格情報を安全に保つ責任があります。';

  @override
  String get termsConnectivity =>
      'CRYPT はオンライン サービスを使用して、デバイスが接続を検出して確立できるようにします。可用性と接続の動作は、アプリケーションの開発に応じて変更される可能性があります。 CRYPT を唯一の通信手段として依存しないでください。';

  @override
  String get termsAgreement =>
      '続行すると、これらの規約を読み、それに基づいて CRYPT を使用することに同意したことになります。';

  @override
  String get agreeTerms => '利用規約に同意します';

  @override
  String get agreeAndContinue => '同意して続行';

  @override
  String get beforeYouStart => '始める前に';

  @override
  String get connected => '接続済み';

  @override
  String get connectFirstThenChat => 'まず接続してからチャットする';

  @override
  String get betaIntro =>
      'CRYPT は初期のベータ版であるため、将来のバージョンではエクスペリエンスが向上する可能性があります。';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT はトランシーバーのように機能します。接続を確立するには、両方の人がオンラインになり、同時に CRYPT を開いている必要があります。';

  @override
  String get howToUseCrypt =>
      'クリプトの使用方法:\n1. 相手の CRYPT QR コードをスキャンします。\n2. 両方の人が CRYPT をオープンかつオンラインにする必要があります。\n3. CRYPT が P2P 接続を確立するまで待ちます。\n4. 「接続中...」状態が消え、接続が確立されるまで待ちます。\n5. 接続したら、チャットを開始できます。';

  @override
  String get messageStorageExplanation =>
      'メッセージは、接続されたデバイス間で直接送信されるように設計されています。 CRYPT はチャット メッセージをサーバーに保存しません。現在、サーバーは接続とシグナリングを支援しており、チャット履歴はサーバーに保存されません。相手がオフラインの場合、現在の P2P 接続は確立できません。';

  @override
  String get settingsAndSupportExplanation =>
      'CRYPT エクスペリエンスをカスタマイズするには、[設定] にアクセスしてください。さらに多くのカスタマイズ オプションが近日公開される予定です。\n\nCRYPTをサポートしたいですか?寄付オプションは「設定」にあります。';

  @override
  String get saving => '保存中...';

  @override
  String get continueToCrypt => 'クリプトに進む';

  @override
  String get showSplashScreen => 'スプラッシュ画面を表示する';

  @override
  String get retry => 'リトライ';

  @override
  String get connectionFailed => '接続に失敗しました';

  @override
  String get connectionFailedDetails =>
      '接続に失敗しました。接続するには、両方のデバイスがオンラインで、CRYPT が開いている必要があります。';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get alignQrCode => 'QRコードを揃える';

  @override
  String get scanFromGallery => 'ギャラリーからスキャン';

  @override
  String get couldNotScanImage => '画像をスキャンできませんでした。';

  @override
  String couldNotShareQrCode(String error) {
    return 'QR コードを共有できませんでした: $error';
  }

  @override
  String newContact(String username) {
    return '新しい連絡先: $username';
  }

  @override
  String get publicEncryptionKeyMissing => '公開暗号化キーがありません。';

  @override
  String get contactEncryptionKeyMissing => '連絡先の暗号化キーがありません。';

  @override
  String get localEncryptionKeyMissing => 'ローカル暗号化キーがありません。';

  @override
  String get noQrCodeFound => 'この画像には QR コードが見つかりません。';

  @override
  String get shareQrCode => 'QRコードを共有する';

  @override
  String get welcome => 'ようこそ';

  @override
  String get login => 'ログイン';

  @override
  String get signup => 'サインアップ';

  @override
  String get settings => '設定';

  @override
  String get chats => 'チャット';

  @override
  String get typeMessage => 'メッセージを入力...';

  @override
  String get send => '送信';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => '接続中...';

  @override
  String get connectingP2p => 'P2Pに接続中...';

  @override
  String get p2pConnectionNotReady => 'P2Pの準備ができていません。';

  @override
  String get searchLanguage => '言語を検索...';

  @override
  String get language => '言語';

  @override
  String get forceEscapeSignOutTitle => '強制サインアウトしますか？';

  @override
  String get forceEscapeSignOutContent => '警告：すべてのデバイスデータが消去されます。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get wipeDevice => 'デバイスを消去';

  @override
  String get accountDestructionAlertTitle => 'アカウント削除';

  @override
  String get accountDestructionWarning => '警告：デバイスデータとリモートメッセージが消去されます。';

  @override
  String get accountDestructionCriticalNotice =>
      '重要：間違ったコードを入力するとシステムがロックされます。アカウントパスワードまたは緊急エスケープを使用してください。';

  @override
  String verificationSecurityKey(String code) {
    return 'セキュリティキー：$code';
  }

  @override
  String get copyDigitsHint => '5桁の数字をコピー';

  @override
  String get codeMismatchNotice => 'コードが一致しません。マスターパスワードを入力するか、10分間待ってください。';

  @override
  String get accountPasswordLabel => 'アカウントパスワード';

  @override
  String get deleteEverythingPermanently => 'すべてを完全に削除';

  @override
  String get escapeAndPurgeDeviceData => 'エスケープしてデータを消去';

  @override
  String get addContact => '連絡先を追加';

  @override
  String get addContactConfirmation => 'この連絡先を追加しますか？';

  @override
  String get noMessagesYet => 'まだメッセージはありません';

  @override
  String get addNewContact => '新しい連絡先';

  @override
  String get usernameLabel => 'ユーザー名';

  @override
  String get nicknameOptionalLabel => 'ニックネーム（任意）';

  @override
  String get add => '追加';

  @override
  String get usernameCannotBeEmpty => 'ユーザー名は必須です';

  @override
  String contactAlreadyExists(String name) {
    return '連絡先「$name」はすでに存在します。';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'ユーザー「$name」が見つかりません。共有シークレットを利用できません。';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$nameを追加しました！';
  }

  @override
  String get contacts => '連絡先';

  @override
  String get noContactsYet => 'まだ連絡先はありません';

  @override
  String get securityLockoutActive => 'セキュリティロック';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return '試行回数が多すぎます。$minutes分間ロックされます。';
  }

  @override
  String get acknowledge => '確認';

  @override
  String get accessBlocked => 'アクセスがブロックされました';

  @override
  String accessSuspended(int minutes) {
    return '5回の検証失敗。$minutes分間アクセスが停止されます。';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'ロック解除：$username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return '残りの試行回数：$count';
  }

  @override
  String get secureKeyPasscode => 'セキュリティパスコード';

  @override
  String get warningHardwareLockout => '警告：次の失敗でセキュリティがロックされます。';

  @override
  String get abort => '中止';

  @override
  String get authenticate => '認証';

  @override
  String get searchPipelinesHint => '安全な接続を検索...';

  @override
  String get zeroPipelinesDiscovered => '接続が見つかりません。';

  @override
  String get processingDecryption => '復号中...';

  @override
  String get decrypting => '復号中...';

  @override
  String get decryptionError => '[復号エラー]';

  @override
  String get cryptContainerSecure => 'CRYPTコンテナは安全です';

  @override
  String get connectAnAccount => 'アカウントを接続';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get enterMasterSecurityPassword => 'マスターパスワードを入力してください';

  @override
  String get pleaseFillAllFields => 'すべての項目を入力してください';

  @override
  String get wrongUsernameOrPassword => 'ユーザー名またはパスワードが間違っています';

  @override
  String loginError(String error) {
    return 'ログインエラー：$error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'アカウントをお持ちでないですか？サインアップ';

  @override
  String get myIdentity => '自分のID';

  @override
  String get scanToAddMe => 'スキャンして追加';

  @override
  String get shareProfileLink => 'プロフィールを共有';

  @override
  String addMeOnCrypt(String link) {
    return 'CRYPTで追加してください！\n\n$link';
  }

  @override
  String get scanQr => 'QRをスキャン';

  @override
  String get invalidCryptQrFormat => '無効なCRYPT QRコードです。';

  @override
  String get userScanned => 'ユーザーをスキャンしました！';

  @override
  String addingUser(String username) {
    return '$usernameを追加中...';
  }

  @override
  String get defaultUser => 'ユーザー';

  @override
  String get createAccount => 'アカウントを作成';

  @override
  String get keepPasswordSecureHint => '安全に保管してください。パスワードは変更できません。';

  @override
  String get pleaseFillInAllFields => 'すべての項目を入力してください';

  @override
  String get usernameExceedsLimit => 'ユーザー名は最大20文字です';

  @override
  String get invalidUsernameCharacters => '英字、数字、_、-のみ使用してください。';

  @override
  String get weakPasswordNotice => '8文字以上、数字1つ、大文字1つを使用してください。';

  @override
  String get unableToGenerateUniqueUsername => '一意のユーザー名を生成できませんでした。';

  @override
  String get accountCreated => 'アカウントを作成しました';

  @override
  String yourUsernameIs(String username) {
    return 'あなたのユーザー名：\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'ユーザー名「$chosen」はすでに使用されています。\n\nあなたのユーザー名：\n\n$assigned\n\nログインに必要なので保存しておいてください。';
  }

  @override
  String get continueText => '続行';

  @override
  String failedToGenerateIdentity(String error) {
    return 'IDの作成に失敗しました：$error';
  }

  @override
  String get welcomeToCrypt => 'CRYPTへようこそ';

  @override
  String get signupDescription => 'ユーザー名とパスワードを作成して、P2Pキーを生成します。';

  @override
  String get chooseAUsername => 'ユーザー名を選択';

  @override
  String get usernameHelperText => '本名は使用しないでください。使用済みの場合はサフィックスが追加されます。';

  @override
  String get masterAuthenticationRequired => 'マスター認証';

  @override
  String get verify => '確認';

  @override
  String get darkThemeMode => 'ダークテーマ';

  @override
  String get secureConversations => '安全な会話';

  @override
  String get noActiveConversations => 'アクティブなチャットはありません。開始するとロックが有効になります。';

  @override
  String get logout => 'ログアウト';

  @override
  String get wipeDeviceAndEscape => 'デバイスを消去';

  @override
  String get falsePassword => '間違ったパスワード';

  @override
  String accessSuspendedTimer(String time) {
    return 'アクセスが停止されています。$time後に再試行してください。';
  }

  @override
  String get selectSecureLockMethod => 'ロック方法を選択';

  @override
  String get selectSecureLockDescription => '指紋または4桁のPINでロックしますか？';

  @override
  String get fourDigitPin => '4桁のPIN';

  @override
  String get fingerprintUnlock => '指紋 🔓';

  @override
  String get supportSoloDeveloper => '開発者を支援';

  @override
  String get supportIntro =>
      'おい！ 👋 私は CRYPT に熱心に取り組んでいるソロ開発者です。予算も企業資金もありません。アプリを改善し続け、広告が永久に表示されないことを保証するために、私はあなたの正直さと共感に全面的に依存しています。';

  @override
  String get chooseSupportAmount => '価格を選択してください (サポートにスライド):';

  @override
  String get poorGang => '私は可哀想なギャングです🥀✌️';

  @override
  String get launchOfferMinimum => 'ローンチオファーの最低価格 🚀';

  @override
  String get buyMeCoffee => 'コーヒー買ってきて ☕';

  @override
  String get superSupporter => 'スーパーサポーター🔥';

  @override
  String get feature => '特徴';

  @override
  String get freeTier => '無料利用枠';

  @override
  String get premium => 'プレミアム';

  @override
  String get chatLocks => 'チャットロック';

  @override
  String get maxOneRoom => '最大1部屋';

  @override
  String get unlimited => '無制限';

  @override
  String get biometrics => '生体認証';

  @override
  String get disabled => '🚫 無効';

  @override
  String supportWithSats(String amount) {
    return '$amount の衛星によるサポート (フェニックス)';
  }

  @override
  String get boltOffer => '⚡ BOLT12 支払い特典 • タップしてコピー';

  @override
  String get boltOfferCopied => 'BOLT12 支払いオファーがコピーされました';

  @override
  String get tapToCopyBoltOffer => 'タップして BOLT12 支払いオファーをコピーします';

  @override
  String get simpleInstructionsToUnlock => '📬 ロックを解除するための簡単な手順:';

  @override
  String unlockInstructions(String username) {
    return '1. Android で Phoenix Wallet を使用して支払います (ロック解除するには最低 7,500 が必要です。それ以上の場合は常に感謝されます)。\n2. 成功した取引確認画面のスクリーンショットを撮ります。\n3. そのスクリーンショットを jounaidnadirmed@gmail.com に電子メールで送信し、誰が支払ったのかがわかるように、自分の一意のアカウントのユーザー名「$username」を教えてください。\n4. 以下のボックスに何かを入力して、このデバイスにリクエストを保存します。';
  }

  @override
  String get supportRequestHint => 'ここに名前または取引情報を入力してください...';

  @override
  String get maybeLater => '後で';

  @override
  String get submitProof => '証明を送信';

  @override
  String get couldNotOpenWallet => 'ウォレットを開けませんでした。以下のコードをコピーしてください。';

  @override
  String get proofSubmittedSnackbar => '証明を送信しました。手動審査：24～48時間（週末を除く）。';
}
