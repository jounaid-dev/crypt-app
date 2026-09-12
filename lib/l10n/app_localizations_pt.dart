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
}
