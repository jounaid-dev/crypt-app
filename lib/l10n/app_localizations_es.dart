// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'CRYPT';

  @override
  String get welcome => 'Bienvenido';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get signup => 'Registrarse';

  @override
  String get settings => 'Ajustes';

  @override
  String get chats => 'Chats';

  @override
  String get typeMessage => 'Escribe un mensaje...';

  @override
  String get send => 'Enviar';

  @override
  String get p2p => 'P2P';

  @override
  String get connecting => 'Conectando...';

  @override
  String get connectingP2p => 'Conectando a P2P...';

  @override
  String get p2pConnectionNotReady => 'P2P no está listo.';

  @override
  String get searchLanguage => 'Buscar idioma...';

  @override
  String get language => 'Idioma';

  @override
  String get forceEscapeSignOutTitle => '¿FORZAR CIERRE?';

  @override
  String get forceEscapeSignOutContent =>
      'ADVERTENCIA: Se borrarán todos los datos del dispositivo.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get wipeDevice => 'BORRAR DISPOSITIVO';

  @override
  String get accountDestructionAlertTitle => 'ELIMINAR CUENTA';

  @override
  String get accountDestructionWarning =>
      'ADVERTENCIA: Se borrarán los datos del dispositivo y los mensajes remotos.';

  @override
  String get accountDestructionCriticalNotice =>
      'CRÍTICO: Los códigos incorrectos bloquearán el sistema. Usa tu contraseña de cuenta o el escape de emergencia.';

  @override
  String verificationSecurityKey(String code) {
    return 'Clave de seguridad: $code';
  }

  @override
  String get copyDigitsHint => 'Copia los 5 dígitos de arriba';

  @override
  String get codeMismatchNotice =>
      'El código no coincide. Introduce tu contraseña maestra o espera 10 minutos.';

  @override
  String get accountPasswordLabel => 'Contraseña de la cuenta';

  @override
  String get deleteEverythingPermanently => 'ELIMINAR TODO';

  @override
  String get escapeAndPurgeDeviceData => 'ESCAPE Y BORRAR DATOS';

  @override
  String get addContact => 'Añadir contacto';

  @override
  String get addContactConfirmation => '¿Añadir este contacto?';

  @override
  String get noMessagesYet => 'Aún no hay mensajes';

  @override
  String get addNewContact => 'Nuevo contacto';

  @override
  String get usernameLabel => 'Nombre de usuario';

  @override
  String get nicknameOptionalLabel => 'Apodo (opcional)';

  @override
  String get add => 'Añadir';

  @override
  String get usernameCannotBeEmpty => 'El nombre de usuario es obligatorio';

  @override
  String contactAlreadyExists(String name) {
    return 'El contacto \'$name\' ya existe.';
  }

  @override
  String userNotFoundOnRegistry(String name) {
    return 'No se encontró al usuario \'$name\'. No se puede crear el secreto compartido.';
  }

  @override
  String successfullyAddedContact(String name) {
    return '¡$name añadido correctamente!';
  }

  @override
  String get contacts => 'Contactos';

  @override
  String get noContactsYet => 'Aún no hay contactos';

  @override
  String get securityLockoutActive => 'Bloqueo de seguridad';

  @override
  String tooManyAttemptsFrozen(int minutes) {
    return 'Demasiados intentos. Bloqueado durante $minutes min.';
  }

  @override
  String get acknowledge => 'Aceptar';

  @override
  String get accessBlocked => 'Acceso bloqueado';

  @override
  String accessSuspended(int minutes) {
    return '5 intentos fallidos. Acceso suspendido durante $minutes min.';
  }

  @override
  String get ok => 'OK';

  @override
  String unlockSecureNode(String username) {
    return 'Desbloquear: $username';
  }

  @override
  String verificationMetricsRemaining(int count) {
    return 'Intentos restantes: $count';
  }

  @override
  String get secureKeyPasscode => 'Código de seguridad';

  @override
  String get warningHardwareLockout =>
      'ADVERTENCIA: El próximo fallo bloqueará la seguridad.';

  @override
  String get abort => 'Cancelar';

  @override
  String get authenticate => 'Autenticar';

  @override
  String get searchPipelinesHint => 'Buscar conexiones seguras...';

  @override
  String get zeroPipelinesDiscovered => 'No se encontraron conexiones.';

  @override
  String get processingDecryption => 'Descifrando...';

  @override
  String get decrypting => 'Descifrando...';

  @override
  String get decryptionError => '[Error de descifrado]';

  @override
  String get cryptContainerSecure => 'CONTENEDOR CRYPT SEGURO';

  @override
  String get connectAnAccount => 'Conectar cuenta';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get enterMasterSecurityPassword => 'Introduce tu contraseña maestra';

  @override
  String get pleaseFillAllFields => 'Completa todos los campos';

  @override
  String get wrongUsernameOrPassword =>
      'Nombre de usuario o contraseña incorrectos';

  @override
  String loginError(String error) {
    return 'Error de inicio de sesión: $error';
  }

  @override
  String get dontHaveAnAccountSignUp => '¿No tienes cuenta? Regístrate';

  @override
  String get myIdentity => 'Mi identidad';

  @override
  String get scanToAddMe => 'Escanea para añadirme';

  @override
  String get shareProfileLink => 'Compartir perfil';

  @override
  String addMeOnCrypt(String link) {
    return '¡Añádeme en CRYPT!\n\n$link';
  }

  @override
  String get scanQr => 'Escanear QR';

  @override
  String get invalidCryptQrFormat => 'Código QR de CRYPT no válido.';

  @override
  String get userScanned => '¡Usuario escaneado!';

  @override
  String addingUser(String username) {
    return 'Añadiendo $username...';
  }

  @override
  String get defaultUser => 'Usuario';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get keepPasswordSecureHint =>
      'Guárdala bien. La contraseña no se puede cambiar.';

  @override
  String get pleaseFillInAllFields => 'Completa todos los campos';

  @override
  String get usernameExceedsLimit => 'Máximo 20 caracteres';

  @override
  String get invalidUsernameCharacters => 'Usa solo letras, números, _ o -.';

  @override
  String get weakPasswordNotice => 'Usa 8+ caracteres, 1 número y 1 mayúscula.';

  @override
  String get unableToGenerateUniqueUsername =>
      'No se pudo generar un nombre de usuario único.';

  @override
  String get accountCreated => 'Cuenta creada';

  @override
  String yourUsernameIs(String username) {
    return 'Tu nombre de usuario:\n\n$username';
  }

  @override
  String usernameTakenAssignedTag(String chosen, String assigned) {
    return 'El nombre \'$chosen\' ya está ocupado.\n\nTu nombre de usuario:\n\n$assigned\n\nGuárdalo para iniciar sesión.';
  }

  @override
  String get continueText => 'Continuar';

  @override
  String failedToGenerateIdentity(String error) {
    return 'No se pudo crear la identidad: $error';
  }

  @override
  String get welcomeToCrypt => 'Bienvenido a CRYPT';

  @override
  String get signupDescription =>
      'Crea un nombre de usuario y una contraseña para generar claves P2P.';

  @override
  String get chooseAUsername => 'Elige un nombre de usuario';

  @override
  String get usernameHelperText =>
      'No uses tu nombre real. Si está ocupado, se añadirá un sufijo automáticamente.';

  @override
  String get masterAuthenticationRequired => 'Autenticación maestra';

  @override
  String get verify => 'Verificar';

  @override
  String get darkThemeMode => 'Tema oscuro';

  @override
  String get secureConversations => 'Chats seguros';

  @override
  String get noActiveConversations =>
      'No hay chats activos. Inicia uno para activar los bloqueos.';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get wipeDeviceAndEscape => 'BORRAR DISPOSITIVO';

  @override
  String get falsePassword => 'Contraseña incorrecta';

  @override
  String accessSuspendedTimer(String time) {
    return 'Acceso suspendido por seguridad. Inténtalo de nuevo en $time.';
  }

  @override
  String get selectSecureLockMethod => 'Seleccionar método de bloqueo';

  @override
  String get selectSecureLockDescription =>
      '¿Bloquear con huella dactilar o PIN de 4 dígitos?';

  @override
  String get fourDigitPin => 'PIN de 4 dígitos';

  @override
  String get fingerprintUnlock => 'Huella dactilar 🔓';

  @override
  String get supportSoloDeveloper => 'Apoyar al desarrollador';

  @override
  String get maybeLater => 'Quizás más tarde';

  @override
  String get submitProof => 'Enviar comprobante';

  @override
  String get couldNotOpenWallet =>
      'No se pudo abrir la billetera. Copia el código de abajo.';

  @override
  String get proofSubmittedSnackbar =>
      '¡Comprobante enviado! La revisión manual tarda entre 24 y 48 horas (excepto fines de semana). Puedes seguir usando la aplicación con normalidad.';
}
