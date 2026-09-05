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
