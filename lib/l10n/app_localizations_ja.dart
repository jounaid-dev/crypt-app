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

  @override
  String get loadingChats => 'チャットを読み込んでいます...';

  @override
  String get noChatsYetTitle => 'まだチャットはありません';

  @override
  String get noChatsYetHint =>
      '相手のCRYPT QRコードを読み取るとチャットが始まります。自分の ID ページを開いて自分の ID ページを共有し、相手がそれをスキャンできるようにします。';

  @override
  String get scanQrToStartChat => 'QRコードをスキャンしてください';

  @override
  String get noChatsMatchSearch => '検索に一致するチャットはありません';

  @override
  String get noChatsMatchSearchHint => '別の名前を試すか、検索をクリアしてすべてのチャットを表示します。';

  @override
  String get requestSentTitle => 'リクエストを送信しました';

  @override
  String requestSentBody(String username) {
    return 'リクエストは以下に送信されました$username。受け付けるまでお待ちください。';
  }

  @override
  String get requestSentKeepOpen =>
      '受け入れられるとすぐにチャットが開きます。見逃さないように、このデバイスで CRYPT を開いたままにしてください。';

  @override
  String get requestSentGotIt => '分かりました';

  @override
  String get scanCouldNotReadCode => 'そのコードは読み取れませんでした。 CRYPT QR コードをスキャンします。';

  @override
  String get scanMissingTheirIdentity =>
      'そのコードにはその人の身元が欠けています。 ID ページからコードをスキャンします。';

  @override
  String get scanOwnIdentityMissing =>
      '自分の暗号化キーがありません。サインアウトして再度サインインし、再度スキャンします。';

  @override
  String get noLightningWalletFound =>
      'Lightning ウォレットが見つかりません。インストールするか、アドレスをコピーしてウォレットに貼り付けます。';

  @override
  String get settingsSectionAppearance => '外観';

  @override
  String get settingsSectionPrivacy => 'プライバシーとセキュリティ';

  @override
  String get settingsSectionPremium => 'プレミアム';

  @override
  String get settingsSectionHelp => 'ヘルプと法的';

  @override
  String get settingsSectionAdministration => '管理';

  @override
  String get settingsSectionAccount => 'アカウント';

  @override
  String get settingsProtectTitle => 'マスターパスワードで設定を保護する';

  @override
  String get settingsProtectSubtitle => '設定にアクセスするにはパスワードが必要です';

  @override
  String get chatLockSetPinSubtitle => 'タップしてこのチャットに独自の PIN を設定します';

  @override
  String get premiumTileTitle => '生涯プレミアムを入手';

  @override
  String get premiumActiveSubtitle => 'あなたのアカウントではプレミアムが有効です';

  @override
  String get premiumPendingSubtitle => '管理者がスクリーンショットを確認するのを待っています';

  @override
  String get premiumHowItWorks => 'プレミアムの仕組み';

  @override
  String get reportProblemTitle => '問題を報告する';

  @override
  String get reportProblemSubtitle => 'バグ、不正行為、またはスパム';

  @override
  String get adminAccessTitle => '管理者アクセス';

  @override
  String get adminAccessSubtitle => '管理者コードを入力してパネルを開きます';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method— 独自のコード、このチャットのみ';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '${amount}Lightning ウォレットで一度、スクリーンショットを送信してください';
  }

  @override
  String premiumPendingBody(String window) {
    return 'あなたのスクリーンショットが含まれています。管理者がそれを確認し、以内にアカウントのプレミアムが有効になります。$window。';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1.支払い$amountと$method、 または$wallet。\n2. 支払い確認のスクリーンショットを撮ります。\n3. 支払い証明の送信から送信します。\n4. プレミアムはオンになり、永久にオンのままになります。\n\nCRYPT は個人の開発者によって構築されており、これがすべてのオファーです。支払いは 1 回で、サブスクリプションは不要です。';
  }

  @override
  String get reportIntro =>
      '何が起こったのか教えてください。別の人を報告する場合は、適切なアカウントに基づいて対応できるよう、そのユーザー名を追加してください。';

  @override
  String get reportSent => 'レポートが送信されました。ありがとう。';

  @override
  String get reportSendFailed => 'レポートを送信できませんでした。';

  @override
  String get reportTypeLabel => 'レポートの種類';

  @override
  String get reportCategoryBug => 'バグ';

  @override
  String get reportCategoryAbuse => '虐待';

  @override
  String get reportCategorySpam => 'スパムメール';

  @override
  String get reportCategoryOther => 'その他';

  @override
  String get reportUsernameLabel => 'ユーザー名 (オプション)';

  @override
  String get reportUsernameHint => '例:あなたが欲しい人が報告しました';

  @override
  String get reportDetailsLabel => '何が起こったのでしょうか？';

  @override
  String get reportScreenshotsLabel => 'スクリーンショット';

  @override
  String get reportAddScreenshot => 'スクリーンショットを追加';

  @override
  String get reportSendButton => 'レポートの送信';

  @override
  String get reportPrivacyNote =>
      'レポートは管理者によってレビューされます。スクリーンショットは非公開で保存され、モデレーターのみが閲覧できます。';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount一度、$lifetime。';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'サブスクリプションも更新も必要ありません。で支払う$method、確認のスクリーンショットを送信すると、以内にプレミアムがオンになります。$window。';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT は個人の開発者によって構築されています。プレミアムは広告なしでアクティブに維持できるものです。';

  @override
  String get premiumStepPay => '財布で支払う';

  @override
  String get premiumLightningAddressLabel => 'ライトニングアドレス';

  @override
  String get premiumOpenWallet => 'ウォレットを開く';

  @override
  String get premiumCopyAddress => 'アドレスをコピーする';

  @override
  String get premiumWorksWith => 'Phoenix およびその他の Lightning ウォレットで動作します。';

  @override
  String get premiumStepScreenshot => 'スクリーンショットを送信してください';

  @override
  String get premiumScreenshotHint =>
      'Lightning ウォレットの支払い確認のスクリーンショットを撮り、以下に添付してください。';

  @override
  String get premiumAttachScreenshot => 'スクリーンショットを添付する';

  @override
  String get premiumReplaceScreenshot => 'スクリーンショットを置き換える';

  @override
  String get premiumStepAmount => '金額を確認する';

  @override
  String get premiumAmountLabel => '支払った金額 (USD)';

  @override
  String get premiumNoteLabel => '注記 (オプション)';

  @override
  String get premiumSendProof => '証拠を送ってください';

  @override
  String get premiumAddressCopied => 'ライトニングアドレスがコピーされました。';

  @override
  String get premiumAttachConfirmation => '支払い確認のスクリーンショットを添付してください。';

  @override
  String get premiumSendProofFailed => '支払い証明書を送信できませんでした。';

  @override
  String premiumAmountHelper(String amount) {
    return '最小$amount。';
  }

  @override
  String premiumActivationNote(String window) {
    return 'アクティベーションにかかる時間$window。';
  }

  @override
  String premiumProofReceived(String window) {
    return '証拠を受け取りました。プレミアムは 以内にオンになります$window。';
  }

  @override
  String get premiumTableFeature => '特徴';

  @override
  String get premiumTableFree => '無料';

  @override
  String get premiumTablePremium => 'プレミアム';

  @override
  String get premiumTableEncrypted => '暗号化されたピアツーピアメッセージング';

  @override
  String get premiumTableMessagesStay => 'メッセージはデバイスに残ります';

  @override
  String get premiumTableChatLocks => '自分の PIN でロックされたチャット';

  @override
  String get premiumTableFingerprint => '指紋または顔でロックを解除する';

  @override
  String get premiumTablePrice => '価格';

  @override
  String get premiumTableAccess => 'アクセス';

  @override
  String get premiumTableIncluded => '付属';

  @override
  String get premiumTableOneChat => '1 チャット';

  @override
  String get premiumTableUnlimited => '無制限';

  @override
  String get premiumTableNotIncluded => '含まれていない';

  @override
  String get premiumTableFreeValue => '無料';

  @override
  String get premiumTableWhileFree => 'アプリが無料である間は';

  @override
  String get premiumTableLifetime => '生涯';

  @override
  String premiumTableOnePayment(String amount) {
    return '1回のお支払いで$amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return '1回のお支払いで$amountそしてプレミアムは生涯あなたのものです。サブスクリプションや更新する必要はありません。';
  }

  @override
  String get settingsSaveFailed => 'その設定を保存できませんでした。もう一度やり直してください。';

  @override
  String get settingsLockFailed => 'このチャットをロックできませんでした。もう一度やり直してください。';

  @override
  String get settingsUnlockFailed => 'このチャットのロックを解除できませんでした。もう一度やり直してください。';

  @override
  String pinSetTitle(String chat) {
    return 'PIN を設定する$chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'PINを確認してください$chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'このPINは開きます$chatのみ。すべてのチャットには、あなたが選択した独自の PIN があります。アプリには単一のコードはありません。';
  }

  @override
  String get pinMismatch => 'PIN が一致しませんでした。ロックが有効になっていません。';

  @override
  String get biometricNotSetUp => 'このデバイスには指紋または顔によるロック解除が設定されていません。';

  @override
  String get biometricVerifyFailed => 'このデバイス上であなたであることを確認できませんでした。';

  @override
  String get lightningAddressCopied =>
      'ライトニングアドレスがコピーされました。それをウォレットに貼り付けて支払います。';

  @override
  String get accountSuspended => 'アカウントが停止されました';

  @override
  String get premiumLifetimeAccess => '生涯プレミアムアクセス';

  @override
  String premiumActivationStep1(String amount, String method) {
    return '支払う$amountから$method上記の Lightning アドレスに送信します。';
  }

  @override
  String get premiumActivationStep2 => '支払い確認のスクリーンショットを撮り、支払い証明として送信してください。';

  @override
  String get pinFourDigits => '正確に 4 桁を入力してください。';

  @override
  String get scanOwnCode => 'それはあなた自身のコードです。他の人の CRYPT コードをスキャンしてチャットを開始します。';

  @override
  String get couldNotGenerateQrImage => 'QR画像を生成できませんでした';

  @override
  String get conversationUpdateFailed => '会話の更新に失敗しました。もう一度やり直してください。';

  @override
  String get conversationCreationFailed => '会話の作成に失敗しました。もう一度やり直してください。';

  @override
  String get accountSuspendedByAdmin => 'このアカウントは管理者によって停止されました。';
}
