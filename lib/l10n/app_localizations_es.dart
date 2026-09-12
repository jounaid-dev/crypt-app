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
  String get termsAndConditions => 'Términos y condiciones';

  @override
  String get settingsTermsAndConditions => 'Términos y condiciones';

  @override
  String get termsIntro =>
      'CRYPT es una aplicación en etapa inicial para conectar personas directamente para conversar. Usted es responsable de utilizar la aplicación de manera adecuada y de mantener seguras las credenciales de su cuenta.';

  @override
  String get termsConnectivity =>
      'CRYPT utiliza servicios en línea para ayudar a los dispositivos a descubrir y establecer conexiones. La disponibilidad y el comportamiento de la conexión pueden cambiar a medida que se desarrolla la aplicación. No confíe en CRYPT como su único medio de comunicación.';

  @override
  String get termsAgreement =>
      'Al continuar, confirma que ha leído y acepta utilizar CRYPT según estos términos.';

  @override
  String get agreeTerms => 'Acepto los Términos y Condiciones';

  @override
  String get agreeAndContinue => 'Aceptar y continuar';

  @override
  String get beforeYouStart => 'Antes de comenzar';

  @override
  String get connected => 'Conectado';

  @override
  String get connectFirstThenChat => 'Conéctate primero, luego chatea';

  @override
  String get betaIntro =>
      'CRYPT es una versión beta temprana, por lo que la experiencia puede mejorar en versiones futuras.';

  @override
  String get walkieTalkieExplanation =>
      'CRYPT funciona como un walkie-talkie: ambas personas deben estar en línea y tener CRYPT abierto al mismo tiempo para establecer la conexión.';

  @override
  String get howToUseCrypt =>
      'Cómo utilizar CRIPTAR:\n1. Escanee el código QR CRYPT de la otra persona.\n2. Ambas personas necesitan CRYPT abierto y en línea.\n3. Espere mientras CRYPT establece la conexión P2P.\n4. Espere a que desaparezca el estado \"Conectando...\" y se establezca la conexión.\n5. Una vez conectado, puedes comenzar a chatear.';

  @override
  String get messageStorageExplanation =>
      'Sus mensajes están diseñados para viajar directamente entre dispositivos conectados. CRYPT no almacena sus mensajes de chat en nuestros servidores. Actualmente, el servidor ayuda con la conexión y la señalización, y el historial de chat no se almacena en el servidor. Si la otra persona está desconectada, no se podrá establecer la conexión P2P actual.';

  @override
  String get settingsAndSupportExplanation =>
      'Visita Configuración para personalizar tu experiencia CRYPT. Próximamente habrá más opciones de personalización.\n\n¿Quieres apoyar a CRYPT? Puedes encontrar la opción de donación en Configuración.';

  @override
  String get saving => 'Ahorro...';

  @override
  String get continueToCrypt => 'Continuar a CRIPTAR';

  @override
  String get showSplashScreen => 'Mostrar pantalla de presentación';

  @override
  String get retry => 'Rever';

  @override
  String get connectionFailed => 'La conexión falló';

  @override
  String get connectionFailedDetails =>
      'La conexión falló. Ambos dispositivos deben estar en línea con CRYPT abierto para conectarse.';

  @override
  String get gallery => 'Galería';

  @override
  String get alignQrCode => 'ALINEAR CÓDIGO QR';

  @override
  String get scanFromGallery => 'ESCANEAR DESDE LA GALERÍA';

  @override
  String get couldNotScanImage => 'No se pudo escanear la imagen.';

  @override
  String couldNotShareQrCode(String error) {
    return 'No se pudo compartir el código QR: $error';
  }

  @override
  String newContact(String username) {
    return 'Nuevo contacto: $username';
  }

  @override
  String get publicEncryptionKeyMissing => 'Falta tu clave de cifrado pública.';

  @override
  String get contactEncryptionKeyMissing =>
      'Falta la clave de cifrado de contactos.';

  @override
  String get localEncryptionKeyMissing => 'Falta la clave de cifrado local.';

  @override
  String get noQrCodeFound => 'No se encontró ningún código QR en esta imagen.';

  @override
  String get shareQrCode => 'Compartir código QR';

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
  String get supportIntro =>
      '¡Hola! Soy un desarrollador independiente que trabaja mucho en CRYPT. No tengo presupuesto ni financiación corporativa. Dependo de tu honestidad y empatía para mejorar la aplicación y garantizar que nunca haya anuncios.';

  @override
  String get chooseSupportAmount => 'Elige tu importe de apoyo:';

  @override
  String get poorGang => 'Soy del grupo de los pobres 🥀✌️';

  @override
  String get launchOfferMinimum => 'Mínimo de la oferta de lanzamiento 🚀';

  @override
  String get buyMeCoffee => 'Cómprame un café ☕';

  @override
  String get superSupporter => 'Súper colaborador 🔥';

  @override
  String get feature => 'Función';

  @override
  String get freeTier => 'Nivel gratuito';

  @override
  String get premium => 'Plan premium';

  @override
  String get chatLocks => 'Bloqueos de chat';

  @override
  String get maxOneRoom => 'Máximo 1 sala';

  @override
  String get unlimited => 'Ilimitado';

  @override
  String get biometrics => 'Biometría';

  @override
  String get disabled => 'Desactivado 🚫';

  @override
  String supportWithSats(String amount) {
    return 'Apoyar con $amount sats (Phoenix)';
  }

  @override
  String get boltOffer => 'Oferta de pago BOLT12 ⚡ • Toca para copiar';

  @override
  String get boltOfferCopied => 'Oferta de pago BOLT12 copiada';

  @override
  String get tapToCopyBoltOffer => 'Toca para copiar la oferta de pago BOLT12';

  @override
  String get simpleInstructionsToUnlock =>
      'Instrucciones sencillas para desbloquear 📬:';

  @override
  String unlockInstructions(String username) {
    return '1. Paga con Phoenix Wallet en Android (mínimo 7.500 para desbloquear).\n2. Haz una captura de la confirmación de la transacción.\n3. Envía la captura a jounaidnadirmed@gmail.com e indica tu nombre de usuario \'$username\'.\n4. Escribe algo abajo para guardar tu solicitud en este dispositivo:';
  }

  @override
  String get supportRequestHint =>
      'Escribe aquí tu nombre o información de la transacción...';

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
