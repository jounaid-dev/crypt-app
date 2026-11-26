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

  @override
  String get loadingChats => 'Cargando chats...';

  @override
  String get noChatsYetTitle => 'Aún no hay chats';

  @override
  String get noChatsYetHint =>
      'Un chat comienza cuando escaneas el código QR CRYPT de la otra persona. Abre tu página de identidad para compartir la tuya y que puedan escanearla.';

  @override
  String get scanQrToStartChat => 'Escanea un código QR';

  @override
  String get noChatsMatchSearch => 'Ningún chat coincide con tu búsqueda';

  @override
  String get noChatsMatchSearchHint =>
      'Pruebe con un nombre diferente o borre la búsqueda para ver todos los chats.';

  @override
  String get requestSentTitle => 'Solicitud enviada';

  @override
  String requestSentBody(String username) {
    return 'Su solicitud fue a $username. Espere mientras lo aceptan.';
  }

  @override
  String get requestSentKeepOpen =>
      'El chat se abre en cuanto aceptan. Mantenga CRYPT abierto en este dispositivo para no perdérselo.';

  @override
  String get requestSentGotIt => 'Lo tengo';

  @override
  String get scanCouldNotReadCode =>
      'Ese código no se pudo leer. Escanee un código QR CRYPT.';

  @override
  String get scanMissingTheirIdentity =>
      'A ese código le falta la identidad de la persona. Escanee el código de su página de identidad.';

  @override
  String get scanOwnIdentityMissing =>
      'Falta su propia clave de cifrado. Cierre sesión y vuelva a iniciar sesión, luego escanee nuevamente.';

  @override
  String get noLightningWalletFound =>
      'No se encontró ninguna billetera Lightning. Instale uno o copie la dirección y péguela en una billetera.';

  @override
  String get settingsSectionAppearance => 'Apariencia';

  @override
  String get settingsSectionPrivacy => 'Privacidad y seguridad';

  @override
  String get settingsSectionPremium => 'Premium';

  @override
  String get settingsSectionHelp => 'Ayuda y legal';

  @override
  String get settingsSectionAdministration => 'administración';

  @override
  String get settingsSectionAccount => 'cuenta';

  @override
  String get settingsProtectTitle =>
      'Proteger la configuración con contraseña maestra';

  @override
  String get settingsProtectSubtitle =>
      'Requerir contraseña para acceder a la configuración';

  @override
  String get chatLockSetPinSubtitle =>
      'Toca para configurar tu propio PIN para este chat';

  @override
  String get premiumTileTitle => 'Obtén Premium de por vida';

  @override
  String get premiumActiveSubtitle => 'Premium está activado para tu cuenta';

  @override
  String get premiumPendingSubtitle =>
      'Esperando a que un administrador revise tu captura de pantalla';

  @override
  String get premiumHowItWorks => 'Cómo funciona la Premium';

  @override
  String get reportProblemTitle => 'Informar un problema';

  @override
  String get reportProblemSubtitle => 'Errores, abuso o spam';

  @override
  String get adminAccessTitle => 'Acceso de administrador';

  @override
  String get adminAccessSubtitle =>
      'Ingrese su código de administrador para abrir el panel';

  @override
  String chatLockOwnCodeSubtitle(String method) {
    return '$method — código propio, solo este chat';
  }

  @override
  String premiumPayOnceSubtitle(String amount) {
    return '$amount una vez con su billetera Lightning, luego envíe una captura de pantalla';
  }

  @override
  String premiumPendingBody(String window) {
    return 'Su captura de pantalla está disponible. Un administrador la verifica y se activa premium para su cuenta dentro $window.';
  }

  @override
  String premiumHowItWorksBody(String amount, String method, String wallet) {
    return '1. pagar $amount con $method, o $wallet.\n2. Captura de pantalla de la confirmación del pago.\n3. Envíalo desde Presentar comprobante de pago.\n4. Premium se activa y permanece activado de por vida.\n\nCRYPT fue creado por un desarrollador en solitario, y esta es la oferta completa: un pago, sin suscripción.';
  }

  @override
  String get reportIntro =>
      'Cuéntanos qué pasó. Si está denunciando a otra persona, agregue su nombre de usuario para que podamos actuar en la cuenta correcta.';

  @override
  String get reportSent => 'Informe enviado. Gracias.';

  @override
  String get reportSendFailed => 'No se pudo enviar el informe.';

  @override
  String get reportTypeLabel => 'Tipo de informe';

  @override
  String get reportCategoryBug => 'error';

  @override
  String get reportCategoryAbuse => 'Abuso';

  @override
  String get reportCategorySpam => 'spam';

  @override
  String get reportCategoryOther => 'Otro';

  @override
  String get reportUsernameLabel => 'Su nombre de usuario (opcional)';

  @override
  String get reportUsernameHint => 'por ej. alguien_que_quieres_reportar';

  @override
  String get reportDetailsLabel => '¿Qué pasó?';

  @override
  String get reportScreenshotsLabel => 'Capturas de pantalla';

  @override
  String get reportAddScreenshot => 'Agregar captura de pantalla';

  @override
  String get reportSendButton => 'Enviar informe';

  @override
  String get reportPrivacyNote =>
      'Los informes son revisados por un administrador. Las capturas de pantalla se almacenan de forma privada y solo son visibles para los moderadores.';

  @override
  String premiumOfferSummary(String amount, String lifetime) {
    return '$amount una vez, $lifetime.';
  }

  @override
  String premiumOfferBody(String method, String window) {
    return 'Sin suscripción y nada que renovar. Paga con $method, envía una captura de pantalla de la confirmación y la Premium se activa dentro $window.';
  }

  @override
  String get premiumSoloNote =>
      'CRYPT está construido por un desarrollador en solitario. Premium es lo que lo mantiene libre de publicidad y con un mantenimiento activo.';

  @override
  String get premiumStepPay => 'Paga con tu billetera';

  @override
  String get premiumLightningAddressLabel => 'dirección relámpago';

  @override
  String get premiumOpenWallet => 'Abrir billetera';

  @override
  String get premiumCopyAddress => 'Copiar dirección';

  @override
  String get premiumWorksWith =>
      'Funciona con Phoenix y cualquier otra billetera Lightning.';

  @override
  String get premiumStepScreenshot => 'Envía tu captura de pantalla';

  @override
  String get premiumScreenshotHint =>
      'Tome una captura de pantalla de la confirmación de pago en su billetera Lightning y adjúntela a continuación.';

  @override
  String get premiumAttachScreenshot => 'Adjuntar captura de pantalla';

  @override
  String get premiumReplaceScreenshot => 'Reemplazar captura de pantalla';

  @override
  String get premiumStepAmount => 'Confirmar la cantidad';

  @override
  String get premiumAmountLabel => 'Monto que pagó (USD)';

  @override
  String get premiumNoteLabel => 'Nota (opcional)';

  @override
  String get premiumSendProof => 'enviar mi prueba';

  @override
  String get premiumAddressCopied => 'Dirección Lightning copiada.';

  @override
  String get premiumAttachConfirmation =>
      'Adjunte una captura de pantalla de su confirmación de pago.';

  @override
  String get premiumSendProofFailed =>
      'No se pudo enviar el comprobante de pago.';

  @override
  String premiumAmountHelper(String amount) {
    return 'Mínimo $amount.';
  }

  @override
  String premiumActivationNote(String window) {
    return 'La activación toma $window.';
  }

  @override
  String premiumProofReceived(String window) {
    return 'Prueba recibida. Premium está activado dentro $window.';
  }

  @override
  String get premiumTableFeature => 'Característica';

  @override
  String get premiumTableFree => 'Gratis';

  @override
  String get premiumTablePremium => 'Premium';

  @override
  String get premiumTableEncrypted => 'Mensajería cifrada de igual a igual';

  @override
  String get premiumTableMessagesStay =>
      'Los mensajes permanecen en tus dispositivos';

  @override
  String get premiumTableChatLocks => 'Chats bloqueados con tu propio PIN';

  @override
  String get premiumTableFingerprint =>
      'Desbloquear con huella digital o rostro';

  @override
  String get premiumTablePrice => 'Precio';

  @override
  String get premiumTableAccess => 'Acceso';

  @override
  String get premiumTableIncluded => 'Incluido';

  @override
  String get premiumTableOneChat => '1 charla';

  @override
  String get premiumTableUnlimited => 'Ilimitado';

  @override
  String get premiumTableNotIncluded => 'No incluido';

  @override
  String get premiumTableFreeValue => 'Gratis';

  @override
  String get premiumTableWhileFree => 'Si bien la aplicación es gratuita';

  @override
  String get premiumTableLifetime => 'Toda la vida';

  @override
  String premiumTableOnePayment(String amount) {
    return 'un pago de $amount';
  }

  @override
  String premiumPaymentOneTime(String amount) {
    return 'Un pago de $amount y Premium es tuyo de por vida. No hay suscripción ni nada que renovar.';
  }

  @override
  String get settingsSaveFailed =>
      'No se pudo guardar esa configuración. Intentar otra vez.';

  @override
  String get settingsLockFailed =>
      'No se pudo bloquear este chat. Intentar otra vez.';

  @override
  String get settingsUnlockFailed =>
      'No se pudo desbloquear este chat. Intentar otra vez.';

  @override
  String pinSetTitle(String chat) {
    return 'Establecer un PIN para $chat';
  }

  @override
  String pinConfirmTitle(String chat) {
    return 'Confirme el PIN para $chat';
  }

  @override
  String pinSetHelper(String chat) {
    return 'Este PIN se abre $chat solo. Cada chat tiene su propio PIN, elegido por ti. No existe un código único para la aplicación.';
  }

  @override
  String get pinMismatch => 'Los PIN no coincidían. Bloqueo no habilitado.';

  @override
  String get biometricNotSetUp =>
      'No hay huellas dactilares ni desbloqueo facial configurados en este dispositivo.';

  @override
  String get biometricVerifyFailed =>
      'No se pudo verificar que eres tú en este dispositivo.';

  @override
  String get lightningAddressCopied =>
      'Dirección Lightning copiada. Pégalo en una billetera para pagar.';

  @override
  String get accountSuspended => 'Cuenta suspendida';

  @override
  String get premiumLifetimeAccess => 'Acceso Premium de por vida';

  @override
  String premiumActivationStep1(String amount, String method) {
    return 'Pagar $amount de $method a la dirección Lightning arriba.';
  }

  @override
  String get premiumActivationStep2 =>
      'Tome una captura de pantalla de la confirmación de pago y envíela como comprobante de pago.';

  @override
  String get pinFourDigits => 'Introduzca exactamente 4 dígitos.';

  @override
  String get scanOwnCode =>
      'Ese es tu propio código. Escanea el código CRYPT de otra persona para iniciar un chat con esa persona.';

  @override
  String get couldNotGenerateQrImage => 'No se pudo generar la imagen QR';

  @override
  String get conversationUpdateFailed =>
      'Error al actualizar la conversación. Intentar otra vez.';

  @override
  String get conversationCreationFailed =>
      'Error al crear la conversación. Intentar otra vez.';

  @override
  String get accountSuspendedByAdmin =>
      'Esta cuenta ha sido suspendida por un administrador.';

  @override
  String get unlockCrypt => 'Desbloquear aplicación';

  @override
  String get unlockCryptBody =>
      'Ingrese su contraseña maestra para descifrar sus mensajes en este dispositivo.';

  @override
  String get unlock => 'Desbloquear ahora';

  @override
  String get attachPhoto => 'Foto';

  @override
  String get attachFile => 'Archivo';

  @override
  String attachmentTooLarge(int mb) {
    return 'Ese archivo es demasiado grande. El límite es $mb MB.';
  }

  @override
  String get attachmentSendFailed => 'No se pudo enviar ese archivo adjunto.';
}
