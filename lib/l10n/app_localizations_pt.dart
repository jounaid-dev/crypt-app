// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get termsAndConditions => 'Termos e Condições';

  @override
  String get settingsTermsAndConditions => 'Termos e Condições';

  @override
  String get termsIntro =>
      'CRYPT é uma aplicação em estágio inicial para conectar pessoas diretamente para conversas. Você é responsável por usar o aplicativo de forma adequada e por manter as credenciais da sua conta seguras.';

  @override
  String get termsConnectivity =>
      'A CRYPT usa serviços online para ajudar os dispositivos a descobrir e estabelecer conexões. O comportamento de disponibilidade e conexão pode mudar à medida que o aplicativo se desenvolve. Por favor, não confie na CRIPTA como seu único meio de comunicação.';

  @override
  String get termsAgreement =>
      'Ao continuar, você confirma que leu e concorda em usar CRYPT sob estes termos.';

  @override
  String get agreeTerms => 'Concordo com os termos e condições';

  @override
  String get agreeAndContinue => 'Aceitar e continuar';

  @override
  String get beforeYouStart => 'Antes de começar';

  @override
  String get connected => 'Conectado';

  @override
  String get connectFirstThenChat => 'Ligue-se primeiro e depois converse';

  @override
  String get betaIntro =>
      'CRYPT é uma versão beta inicial, portanto, a experiência pode melhorar em versões futuras.';

  @override
  String get walkieTalkieExplanation =>
      'A CRIPTA funciona como um walkie-talkie: ambas as pessoas precisam estar online e ter a CRIPTA aberta ao mesmo tempo para estabelecer a conexão.';

  @override
  String get howToUseCrypt =>
      'Como usar a CRIPTA:\n1. Digitalize o código QR da CRIPTA da outra pessoa.\n2. Ambas as pessoas precisam de CRIPTA aberta e online.\n3. Aguarde enquanto a CRYPT estabelece a conexão P2P.\n4. Aguarde até que o estado \"Conectando...\" desapareça e a conexão seja estabelecida.\n5. Uma vez ligado, pode começar a conversar.';

  @override
  String get messageStorageExplanation =>
      'As suas mensagens foram concebidas para viajar diretamente entre dispositivos ligados. A CRYPT não armazena as suas mensagens de chat nos nossos servidores. No momento, o servidor ajuda com a conexão e a sinalização, e o histórico de conversas não é armazenado no servidor. Se a outra pessoa estiver offline, a ligação P2P atual não pode ser estabelecida.';

  @override
  String get settingsAndSupportExplanation =>
      'Visite Definições para personalizar a sua experiência de CRIPTA. Mais opções de personalização estão por vir em breve.\n\nQuer apoiar a CRYPT? Pode encontrar a opção de donativo em Definições.';

  @override
  String get saving => 'Salvando...';

  @override
  String get continueToCrypt => 'Continuar para a CRIPTA';

  @override
  String get showSplashScreen => 'Mostrar o ecrã inicial';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get connectionFailed => 'Falha na ligação';

  @override
  String get connectionFailedDetails =>
      'A ligação falhou. Ambos os dispositivos devem estar online com a CRIPTA aberta para se ligarem.';

  @override
  String get gallery => 'Galeria';

  @override
  String get alignQrCode => 'ALINHAR CÓDIGO QR';

  @override
  String get scanFromGallery => 'DIGITALIZAR DA GALERIA';

  @override
  String get couldNotScanImage => 'Não foi possível digitalizar a imagem.';

  @override
  String couldNotShareQrCode(String error) {
    return 'Não foi possível partilhar o código QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Novo contacto: $username';
  }

  @override
  String get publicEncryptionKeyMissing =>
      'A sua chave de encriptação pública está em falta.';

  @override
  String get contactEncryptionKeyMissing =>
      'A chave de encriptação de contacto está em falta.';

  @override
  String get localEncryptionKeyMissing =>
      'A chave de encriptação local está em falta.';

  @override
  String get noQrCodeFound => 'Nenhum código QR encontrado nesta imagem.';

  @override
  String get shareQrCode => 'Partilhar código QR';

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get login => 'Entrar';

  @override
  String get signup => 'Cadastrar-se';

  @override
  String get settings => 'Configurações';

  @override
  String get chats => 'Conversas';

  @override
  String get typeMessage => 'Digite uma mensagem...';

  @override
  String get send => 'Enviar';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Conectando...';

  @override
  String get connectingP2p => 'Conectando ao P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P não está pronto.';

  @override
  String get searchLanguage => 'Buscar idioma...';

  @override
  String get language => 'Idioma';

  @override
  String get forceEscapeSignOutTitle => 'FORÇAR SAÍDA DE EMERGÊNCIA?';

  @override
  String get forceEscapeSignOutContent =>
      'AVISO: Fazer isso apagará completamente todos os dados deste dispositivo.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get wipeDevice => 'APAGAR DISPOSITIVO';

  @override
  String get accountDestructionAlertTitle => 'ALERTA DE DESTRUIÇÃO DE CONTA';

  @override
  String get accountDestructionWarning =>
      'AVISO: Esta ação exclui todos os seus dados deste dispositivo. Quando conectado à Internet, isso acionará um comando de autodestruição remota. Cada mensagem enviada do seu ID de usuário exclusivo será permanentemente apagada da memória de todos os pares.';

  @override
  String get accountDestructionCriticalNotice =>
      'CRÍTICO: Se você digitar esses números de validação incorretamente, o sistema será bloqueado. Para desbloqueá-lo, você deve fornecer sua Senha Mestra da Conta ou usar a saída de emergência, que limpa instantaneamente todos os dados deste dispositivo.';

  @override
  String verificationSecurityKey(String code) {
    return 'Chave de Segurança de Verificação: $code';
  }

  @override
  String get copyDigitsHint => 'Copie os 5 dígitos acima';

  @override
  String get codeMismatchNotice =>
      'Código incorreto. Digite a Senha Mestra para substituir a verificação ou aguarde 10 minutos.';

  @override
  String get accountPasswordLabel => 'Senha da Conta';

  @override
  String get deleteEverythingPermanently => 'EXCLUIR TUDO PERMANENTEMENTE';

  @override
  String get escapeAndPurgeDeviceData => 'Sair e Apagar Dados do Dispositivo';

  @override
  String get addContact => 'Adicionar Contato';

  @override
  String get addContactConfirmation => 'Deseja adicionar este contato?';

  @override
  String get noMessagesYet => 'Nenhuma mensagem ainda';

  @override
  String get addNewContact => 'Adicionar Novo Contato';

  @override
  String get usernameLabel => 'Nome de usuário';

  @override
  String get nicknameOptionalLabel => 'Apelido (Opcional)';

  @override
  String get add => 'Adicionar';

  @override
  String get usernameCannotBeEmpty => 'O nome de usuário não pode estar vazio';

  @override
  String contactAlreadyExists(String name) {
    return 'O contato \'$name\' já está em sua agenda.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'Usuário \'$name\' não encontrado no registro da rede. Não é possível formar um segredo compartilhado.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '$name adicionado com sucesso!';
  }

  @override
  String get contacts => 'Contatos';

  @override
  String get noContactsYet => 'Nenhum contato ainda';

  @override
  String get securityLockoutActive => 'Bloqueio de Segurança Ativo';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Muitas tentativas inválidas. Bloqueado por $minutes min.';
  }

  @override
  String get acknowledge => 'Ciente';

  @override
  String get accessBlocked => 'Acesso Bloqueado';

  @override
  String accessSuspended(int minutes) {
    return '5 verificações incorretas. O acesso está suspenso pelos próximos $minutes minutos.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Desbloquear Nó Seguro: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Tentativas de verificação restantes: $count';
  }

  @override
  String get secureKeyPasscode => 'Senha da Chave Segura';

  @override
  String get warningHardwareLockout =>
      'AVISO: A próxima falha acionará o bloqueio de segurança do sistema.';

  @override
  String get abort => 'Abortar';

  @override
  String get authenticate => 'Autenticar';

  @override
  String get searchPipelinesHint => 'Procurando conexões seguras...';

  @override
  String get zeroPipelinesDiscovered => 'Nenhuma conexão encontrada.';

  @override
  String get processingDecryption => 'Descriptografando...';

  @override
  String get decrypting => 'Descriptografando...';

  @override
  String get decryptionError => '[Erro de Descriptografia]';

  @override
  String get cryptContainerSecure => 'CONTÊINER CRYPT SEGURO';

  @override
  String get connectAnAccount => 'Conectar uma Conta';

  @override
  String get username => 'Nome de usuário';

  @override
  String get password => 'Senha';

  @override
  String get enterMasterSecurityPassword =>
      'Digite sua Senha Mestra de Segurança';

  @override
  String get pleaseFillAllFields => 'Por favor, preencha todos os campos';

  @override
  String get wrongUsernameOrPassword => 'Nome de usuário ou senha incorretos';

  @override
  String loginError(String error) {
    return 'Erro de login: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => 'Não tem uma conta? Cadastre-se';

  @override
  String get myIdentity => 'Minha Identidade';

  @override
  String get scanToAddMe => 'Escaneie para me adicionar';

  @override
  String get shareProfileLink => 'Compartilhar Link do Perfil';

  @override
  String addMeOnCrypt(String link) {
    return 'Adicione-me no CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Escanear QR';

  @override
  String get invalidCryptQrFormat => 'Formato de QR Code do CRYPT inválido.';

  @override
  String get userScanned => 'Usuário Escaneado!';

  @override
  String addingUser(String username) {
    return 'Adicionando $username...';
  }

  @override
  String get defaultUser => 'Usuário';

  @override
  String get createAccount => 'Criar Conta';

  @override
  String get keepPasswordSecureHint =>
      'Mantenha-a segura, a senha não pode ser alterada';

  @override
  String get pleaseFillInAllFields => 'Por favor, preencha todos os campos';

  @override
  String get usernameExceedsLimit =>
      'O nome de usuário não pode exceder 20 caracteres';

  @override
  String get invalidUsernameCharacters =>
      'O nome de usuário pode conter apenas letras, números, sublinhados e hífens';

  @override
  String get weakPasswordNotice =>
      'A senha deve ter pelo menos 8 caracteres, incluir um número e uma letra maiúscula';

  @override
  String get unableToGenerateUniqueUsername =>
      'Não foi possível gerar um nome de usuário exclusivo.';

  @override
  String get accountCreated => 'Conta Criada';

  @override
  String yourUsernameIs(String username) {
    return 'Seu nome de usuário é:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'O nome de usuário \'$chosen\' já está em uso.\n\nSeu nome de usuário atribuído é:\n\n$assigned\n\nLembre-se dele. Você precisará dele para entrar.';
  }

  @override
  String get continueText => 'Continuar';

  @override
  String failedToGenerateIdentity(String error) {
    return 'Falha ao criar a identidade: $error';
  }

  @override
  String get welcomeToCrypt => 'Bem-vindo ao CRYPT';

  @override
  String get signupDescription =>
      'Crie um nome de usuário e uma senha para gerar suas chaves P2P.';

  @override
  String get chooseAUsername => 'Escolha um nome de usuário';

  @override
  String get usernameHelperText =>
      'Não use seu nome real. Se o nome de usuário estiver ocupado, adicionaremos automaticamente um sufixo exclusivo.';

  @override
  String get masterAuthenticationRequired => 'Autenticação Mestra Necessária';

  @override
  String get verify => 'Verificar';

  @override
  String get darkThemeMode => 'Modo Escuro';

  @override
  String get secureConversations => 'Conversas Seguras';

  @override
  String get noActiveConversations =>
      'Nenhuma conversa ativa. Inicie uma conversa para ativar os bloqueios.';

  @override
  String get logout => 'Sair';

  @override
  String get wipeDeviceAndEscape => 'APAGAR DISPOSITIVO E ESCAPAR';

  @override
  String get falsePassword => 'Senha Incorreta';

  @override
  String accessSuspendedTimer(String time) {
    return 'O acesso está suspenso por motivos de segurança. Tente novamente em $time.';
  }

  @override
  String get selectSecureLockMethod => 'Selecionar Método de Bloqueio Seguro';

  @override
  String get selectSecureLockDescription =>
      'Deseja bloquear esta conversa usando a biometria de impressão digital do dispositivo ou um PIN padrão de 4 dígitos?';

  @override
  String get fourDigitPin => 'PIN de 4 Dígitos';

  @override
  String get fingerprintUnlock => 'Impressão Digital 🔓';

  @override
  String get supportSoloDeveloper => 'Apoiar um Desenvolvedor Solo';

  @override
  String get supportIntro =>
      'Ei! 👋 Sou um desenvolvedor solo trabalhando duro no CRYPT. Não tenho orçamento nem financiamento corporativo. Confio inteiramente na sua honestidade e empatia para continuar melhorando o aplicativo e garantir SEM ANÚNCIOS PARA SEMPRE.';

  @override
  String get chooseSupportAmount =>
      'Escolha o seu preço (deslize para apoiar):';

  @override
  String get poorGang => 'Eu sou pobre galera 🥀✌️';

  @override
  String get launchOfferMinimum => 'Oferta Mínima de Lançamento 🚀';

  @override
  String get buyMeCoffee => 'Compre um café para mim ☕';

  @override
  String get superSupporter => 'Super Apoiador 🔥';

  @override
  String get feature => 'Recurso';

  @override
  String get freeTier => 'Nível gratuito';

  @override
  String get premium => 'Prêmio';

  @override
  String get chatLocks => 'Bloqueios de bate-papo';

  @override
  String get maxOneRoom => 'Máximo de 1 quarto';

  @override
  String get unlimited => 'Ilimitado';

  @override
  String get biometrics => 'Biometria';

  @override
  String get disabled => '🚫 Desativado';

  @override
  String supportWithSats(String amount) {
    return 'Suporte com $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => '⚡ Oferta de pagamento BOLT12 • Toque para copiar';

  @override
  String get boltOfferCopied => 'Oferta de pagamento BOLT12 copiada';

  @override
  String get tapToCopyBoltOffer =>
      'Toque para copiar a oferta de pagamento BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      '📬 Instruções simples para desbloquear:';

  @override
  String unlockInstructions(String username) {
    return '1. Pague usando Phoenix Wallet no Android (mínimo de 7.500 para desbloquear – mais é sempre apreciado).\n2. Faça uma captura de tela da tela de confirmação da transação bem-sucedida.\n3. Envie essa captura de tela por e-mail para jounaidnadirmed@gmail.com e diga-me o nome de usuário exclusivo da sua conta: \'$username\' para que eu saiba quem pagou.\n4. Digite qualquer coisa na caixa abaixo para salvar sua solicitação neste dispositivo:';
  }

  @override
  String get supportRequestHint =>
      'Digite seu nome ou informações da transação aqui...';

  @override
  String get maybeLater => 'Talvez Mais Tarde';

  @override
  String get submitProof => 'Enviar Comprovante';

  @override
  String get couldNotOpenWallet =>
      'Não foi possível abrir a carteira. Copie o código abaixo.';

  @override
  String get proofSubmittedSnackbar =>
      'Comprovante enviado. A revisão manual leva de 24 a 48 horas (exceto fins de semana).';

  @override
  String get loadingChats => 'Carregando bate-papos...';

  @override
  String get noChatsYetTitle => 'Ainda não há bate-papos';

  @override
  String get noChatsYetHint =>
      'Um bate-papo começa quando você escaneia o código QR CRYPT da outra pessoa. Abra sua página de identidade para compartilhar a sua para que eles possam digitalizá-la.';

  @override
  String get scanQrToStartChat => 'Digitalize um código QR';

  @override
  String get noChatsMatchSearch =>
      'Nenhum bate-papo corresponde à sua pesquisa';

  @override
  String get noChatsMatchSearchHint =>
      'Experimente um nome diferente ou limpe a pesquisa para ver todos os chats.';

  @override
  String get requestSentTitle => 'Solicitação enviada';

  @override
  String requestSentBody(String username) {
    return 'Seu pedido foi para $username. Por favor, espere enquanto eles aceitam.';
  }

  @override
  String get requestSentKeepOpen =>
      'O chat abre assim que eles aceitam. Mantenha o CRYPT aberto neste dispositivo para não perder.';

  @override
  String get requestSentGotIt => 'Entendi';

  @override
  String get scanCouldNotReadCode =>
      'Esse código não pôde ser lido. Digitalize um código QR CRYPT.';

  @override
  String get scanMissingTheirIdentity =>
      'Esse código não contém a identidade da pessoa. Digitalize o código da página de identidade.';

  @override
  String get scanOwnIdentityMissing =>
      'Sua própria chave de criptografia está faltando. Saia e entre novamente e digitalize novamente.';

  @override
  String get noLightningWalletFound =>
      'Nenhuma carteira Lightning encontrada. Instale um ou copie o endereço e cole-o em uma carteira.';

  @override
  String get settingsSectionAppearance => 'Aparência';

  @override
  String get settingsSectionPrivacy => 'Privacidade e segurança';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Ajuda e jurídico';

  @override
  String get settingsSectionAdministration => 'Administração';

  @override
  String get settingsSectionAccount => 'Conta';

  @override
  String get settingsProtectTitle =>
      'Proteja as configurações com senha mestra';

  @override
  String get settingsProtectSubtitle =>
      'Exigir senha para acessar as configurações';

  @override
  String get chatLockSetPinSubtitle =>
      'Toque para definir seu próprio PIN para este bate-papo';

  @override
  String get premiumTileTitle => 'Obtenha Premium Vitalício';

  @override
  String get premiumActiveSubtitle => 'O Premium está ativado para sua conta';

  @override
  String get premiumPendingSubtitle =>
      'Aguardando que um administrador revise sua captura de tela';

  @override
  String get premiumHowItWorks => 'Como funciona o Premium';

  @override
  String get reportProblemTitle => 'Informar um problema';

  @override
  String get reportProblemSubtitle => 'Bugs, abuso ou spam';

  @override
  String get adminAccessTitle => 'Acesso de administrador';

  @override
  String get adminAccessSubtitle =>
      'Digite seu código de administrador para abrir o painel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — código próprio, apenas neste chat';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount uma vez com sua carteira Lightning e envie uma captura de tela';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Sua captura de tela está pronta. Um administrador a verifica e o premium é ativado para sua conta em $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. Pague $amount com $method, ou $wallet.\n2. Faça uma captura de tela da confirmação do pagamento.\n3. Envie em Enviar comprovante de pagamento.\n4. O Premium é ativado e permanece ativado por toda a vida.\n\nCRYPT é construído por um desenvolvedor solo, e esta é a oferta completa: um pagamento, sem assinatura.';
  }

  @override
  String get reportIntro =>
      'Conte-nos o que aconteceu. Se você estiver denunciando outra pessoa, adicione o nome de usuário dela para que possamos agir na conta correta.';

  @override
  String get reportSent => 'Relatório enviado. Obrigado.';

  @override
  String get reportSendFailed => 'Não foi possível enviar o relatório.';

  @override
  String get reportTypeLabel => 'Tipo de relatório';

  @override
  String get reportCategoryBug => 'Erro';

  @override
  String get reportCategoryAbuse => 'Abuso';

  @override
  String get reportCategorySpam => 'Spam';

  @override
  String get reportCategoryOther => 'Outro';

  @override
  String get reportUsernameLabel => 'Seu nome de usuário (opcional)';

  @override
  String get reportUsernameHint => 'por exemplo alguém_você_quer_relatou';

  @override
  String get reportDetailsLabel => 'O que aconteceu?';

  @override
  String get reportScreenshotsLabel => 'Capturas de tela';

  @override
  String get reportAddScreenshot => 'Adicionar captura de tela';

  @override
  String get reportSendButton => 'Enviar relatório';

  @override
  String get reportPrivacyNote =>
      'Os relatórios são revisados por um administrador. As capturas de tela são armazenadas de forma privada e visíveis apenas para moderadores.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount uma vez, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Nenhuma assinatura e nada para renovar. Pague com $method, envie uma captura de tela da confirmação e o premium será ativado em $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT é construído por um desenvolvedor solo. Premium é o que o mantém livre de anúncios e com manutenção ativa.';

  @override
  String get premiumStepPay => 'Pague com sua carteira';

  @override
  String get premiumLightningAddressLabel => 'Endereço Lightning';

  @override
  String get premiumOpenWallet => 'Abrir carteira';

  @override
  String get premiumCopyAddress => 'Copiar endereço';

  @override
  String get premiumWorksWith =>
      'Funciona com Phoenix e qualquer outra carteira Lightning.';

  @override
  String get premiumStepScreenshot => 'Envie sua captura de tela';

  @override
  String get premiumScreenshotHint =>
      'Faça uma captura de tela da confirmação de pagamento em sua carteira Lightning e anexe-a abaixo.';

  @override
  String get premiumAttachScreenshot => 'Anexe captura de tela';

  @override
  String get premiumReplaceScreenshot => 'Substituir captura de tela';

  @override
  String get premiumStepAmount => 'Confirme o valor';

  @override
  String get premiumAmountLabel => 'Valor que você pagou (USD)';

  @override
  String get premiumNoteLabel => 'Nota (opcional)';

  @override
  String get premiumSendProof => 'Enviar meu comprovante';

  @override
  String get premiumAddressCopied => 'Endereço Lightning copiado.';

  @override
  String get premiumAttachConfirmation =>
      'Anexe uma captura de tela da sua confirmação de pagamento.';

  @override
  String get premiumSendProofFailed =>
      'Não foi possível enviar o comprovante de pagamento.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Mínimo $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'A ativação leva $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Prova recebida. Premium é ativado dentro $window.';
  }

  @override
  String get premiumTableFeature => 'Recurso';

  @override
  String get premiumTableFree => 'Grátis';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Mensagens ponto a ponto criptografadas';

  @override
  String get premiumTableMessagesStay =>
      'As mensagens permanecem nos seus dispositivos';

  @override
  String get premiumTableChatLocks =>
      'Bate-papos bloqueados com seu próprio PIN';

  @override
  String get premiumTableFingerprint =>
      'Desbloquear com impressão digital ou rosto';

  @override
  String get premiumTablePrice => 'Preço';

  @override
  String get premiumTableAccess => 'Acesso';

  @override
  String get premiumTableIncluded => 'Incluído';

  @override
  String get premiumTableOneChat => '1 bate-papo';

  @override
  String get premiumTableUnlimited => 'Ilimitado';

  @override
  String get premiumTableNotIncluded => 'Não incluído';

  @override
  String get premiumTableFreeValue => 'Grátis';

  @override
  String get premiumTableWhileFree => 'Embora o aplicativo seja gratuito';

  @override
  String get premiumTableLifetime => 'Vitalício';

  @override
  String premiumTableOnePayment(String amount) {
    return 'Um pagamento de $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Um pagamento de $amount e o Premium é seu para sempre. Sem assinatura e nada para renovar.';
  }

  @override
  String get settingsSaveFailed =>
      'Não foi possível salvar essa configuração. Tente novamente.';

  @override
  String get settingsLockFailed =>
      'Não foi possível bloquear este chat. Tente novamente.';

  @override
  String get settingsUnlockFailed =>
      'Não foi possível desbloquear este chat. Tente novamente.';

  @override
  String pinSetTitle(String chat) {
    return 'Defina um PIN para $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Confirme o PIN para $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Este PIN abre $chat apenas. Cada chat possui seu próprio PIN, escolhido por você. Não existe um código único para o aplicativo.';
  }

  @override
  String get pinMismatch => 'Os PINs não correspondiam. Bloqueio não ativado.';

  @override
  String get biometricNotSetUp =>
      'Nenhuma impressão digital ou desbloqueio facial está configurado neste dispositivo.';

  @override
  String get biometricVerifyFailed =>
      'Não foi possível verificar se é você neste dispositivo.';

  @override
  String get lightningAddressCopied =>
      'Endereço Lightning copiado. Cole-o em uma carteira para pagar.';

  @override
  String get accountSuspended => 'Conta suspensa';

  @override
  String get premiumLifetimeAccess => 'Acesso Premium vitalício';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Pagar $amount de $method para o endereço Lightning acima.';
  }

  @override
  String get premiumActivationStep2 =>
      'Faça uma captura de tela da confirmação de pagamento e envie-a como comprovante de pagamento.';
}
