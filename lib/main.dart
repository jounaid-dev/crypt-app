import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

import 'services/language_service.dart';
import 'services/account_service.dart';
import 'services/conversation_id_service.dart';
import 'services/hive_storage_service.dart';
import 'services/qr_validation_code_service.dart';

import 'pages/home_page.dart';
import 'pages/welcome_page.dart';
import 'pages/chat_page.dart';

import 'package:app_links/app_links.dart';

import 'models/conversation.dart';
import 'services/conversation_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final AppLinks appLinks = AppLinks();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveStorageService.initialize();

  await QrValidationCodeService().removeExpiredUsedCodes();

  await Supabase.initialize(
    url: 'https://zbfpuduadskgyjryxazo.supabase.co',
    publishableKey: 'sb_publishable_zk4gysZ9cUFBkTwLNnerBQ_nuunHSAC',
  );

  final language = await LanguageService().getLanguage();
  final prefs = await SharedPreferences.getInstance();
  final showSplashScreen = prefs.getBool('show_splash_screen') ?? true;

  runApp(
    CryptApp(
      initialLanguage: language,
      initialShowSplashScreen: showSplashScreen,
    ),
  );
}

class CryptApp extends StatefulWidget {
  final String initialLanguage;
  final bool initialShowSplashScreen;

  const CryptApp({
    super.key,
    required this.initialLanguage,
    required this.initialShowSplashScreen,
  });

  static void setLocale(BuildContext context, Locale newLocale) {
    final state = context.findAncestorStateOfType<_CryptAppState>();

    state?.setLocale(newLocale);
  }

  static void restartStartup(BuildContext context) {
    final state = context.findAncestorStateOfType<_CryptAppState>();

    state?._restartStartup();
  }

  @override
  State<CryptApp> createState() => _CryptAppState();
}

class _CryptAppState extends State<CryptApp> with WidgetsBindingObserver {
  // ============================================================
  // APP STATE
  // ============================================================

  late Locale _currentLocale;

  // TRUE = dark
  // FALSE = light
  bool _isDarkMode = true;
  late bool _showSplashScreen;

  StreamSubscription<Uri>? _linkSubscription;

  bool _isLoadingPreferences = false;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _currentLocale = Locale(widget.initialLanguage);
    _showSplashScreen = widget.initialShowSplashScreen;

    // Load everything immediately.
    _loadPreferences();

    _listenForLinks();
  }

  // ============================================================
  // APP LIFECYCLE
  // ============================================================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Every time CRYPT comes back to the foreground,
    // check the saved settings again.
    if (state == AppLifecycleState.resumed) {
      _loadPreferences();
    }
  }

  // ============================================================
  // LOAD ALL PREFERENCES
  // ============================================================

  Future<void> _loadPreferences() async {
    // Prevent multiple simultaneous preference loads.
    if (_isLoadingPreferences) {
      return;
    }

    _isLoadingPreferences = true;

    try {
      final prefs = await SharedPreferences.getInstance();

      final languageService = LanguageService();

      final savedLanguage = await languageService.getLanguage();

      final savedDarkMode = prefs.getBool('is_dark_mode') ?? true;

      if (!mounted) {
        return;
      }

      final newLocale = Locale(savedLanguage);

      bool needsUpdate = false;

      if (_currentLocale.languageCode != newLocale.languageCode) {
        _currentLocale = newLocale;
        needsUpdate = true;
      }

      if (_isDarkMode != savedDarkMode) {
        _isDarkMode = savedDarkMode;
        needsUpdate = true;
      }

      if (needsUpdate) {
        setState(() {});
      }
    } catch (e) {
      debugPrint("[Preferences] Error loading preferences: $e");
    } finally {
      _isLoadingPreferences = false;
    }
  }

  // ============================================================
  // THEME
  // ============================================================

  Future<void> _loadThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final savedDarkMode = prefs.getBool('is_dark_mode') ?? true;

      if (!mounted) {
        return;
      }

      if (_isDarkMode != savedDarkMode) {
        setState(() {
          _isDarkMode = savedDarkMode;
        });
      }
    } catch (e) {
      debugPrint("[Theme] Error loading theme: $e");
    }
  }

  Future<void> _onThemeChanged(bool value) async {
    // Change the UI immediately.
    if (mounted) {
      setState(() {
        _isDarkMode = value;
      });
    }

    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('is_dark_mode', value);

      debugPrint("[Theme] Saved: ${value ? "dark" : "light"}");
    } catch (e) {
      debugPrint("[Theme] Error saving theme: $e");
    }
  }

  Future<void> _onSplashScreenChanged(bool value) async {
    if (_showSplashScreen != value && mounted) {
      setState(() {
        _showSplashScreen = value;
      });
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('show_splash_screen', value);
  }

  // ============================================================
  // LANGUAGE
  // ============================================================

  Future<void> _loadLanguagePreference() async {
    try {
      final languageService = LanguageService();

      final savedLanguage = await languageService.getLanguage();

      if (!mounted) {
        return;
      }

      final newLocale = Locale(savedLanguage);

      if (_currentLocale.languageCode != newLocale.languageCode) {
        setState(() {
          _currentLocale = newLocale;
        });

        debugPrint("[Language] Loaded: $savedLanguage");
      }
    } catch (e) {
      debugPrint("[Language] Error loading language: $e");
    }
  }

  void setLocale(Locale locale) {
    if (!mounted) {
      return;
    }

    if (_currentLocale.languageCode == locale.languageCode) {
      return;
    }

    setState(() {
      _currentLocale = locale;
    });

    debugPrint("[Language] Changed immediately to: ${locale.languageCode}");
  }

  // ============================================================
  // DEEP LINKS
  // ============================================================

  void _listenForLinks() async {
    try {
      final Uri? initialUri = await appLinks.getInitialLink();

      if (initialUri != null) {
        await _handleIncomingLink(initialUri);
      }
    } catch (e) {
      debugPrint("Initial link error: $e");
    }

    _linkSubscription = appLinks.uriLinkStream.listen(
      (uri) {
        _handleIncomingLink(uri);
      },
      onError: (error) {
        debugPrint("Deep link stream error: $error");
      },
    );
  }

  Future<void> _handleIncomingLink(Uri uri) async {
    try {
      if (uri.scheme != "crypt" || uri.host != "contact") {
        return;
      }

      final encoded = uri.queryParameters["data"];

      if (encoded == null || encoded.isEmpty) {
        return;
      }

      final decoded = Uri.decodeComponent(encoded);

      final Map<String, dynamic> data = jsonDecode(decoded);

      if (data["app"] != "CRYPT") {
        return;
      }

      final peerPublicEncryptionKey = data["publicEncryptionKey"]?.toString();

      final peerPublicSigningKey = data["publicSigningKey"]?.toString();

      final peerUsername = data["username"]?.toString();

      if (peerPublicEncryptionKey == null ||
          peerPublicEncryptionKey.isEmpty ||
          peerPublicSigningKey == null ||
          peerPublicSigningKey.isEmpty ||
          peerUsername == null ||
          peerUsername.isEmpty) {
        debugPrint("Deep link error: incomplete contact data.");
        return;
      }

      final accountService = AccountService();

      final myPublicEncryptionKey = await accountService
          .getPublicEncryptionKey();

      if (myPublicEncryptionKey == null || myPublicEncryptionKey.isEmpty) {
        debugPrint("Deep link error: my public encryption key is missing.");
        return;
      }

      final conversationService = ConversationService();

      final existing = await conversationService.findConversationByPublicKey(
        peerPublicEncryptionKey,
      );

      if (existing != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final nav = navigatorKey.currentState;

          if (nav != null && nav.mounted) {
            nav.push(
              MaterialPageRoute(
                builder: (_) => ChatPage(conversation: existing),
              ),
            );
          }
        });

        return;
      }

      final conversationId = ConversationIdService.generate(
        myPublicEncryptionKey: myPublicEncryptionKey,
        peerPublicEncryptionKey: peerPublicEncryptionKey,
      );

      debugPrint("=== DEEP LINK CONVERSATION ID ===");

      debugPrint("Generated conversation ID: $conversationId");

      debugPrint("=================================");

      final conversation = Conversation(
        id: conversationId,
        username: peerUsername,
        publicSigningKey: peerPublicSigningKey,
        publicEncryptionKey: peerPublicEncryptionKey,
        createdAt: DateTime.now(),
        lastMessageAt: DateTime.now(),
        lastMessage: "",
        unreadCount: 0,
        verified: true,
      );

      await conversationService.addConversation(conversation);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final nav = navigatorKey.currentState;

        if (nav != null && nav.mounted) {
          nav.push(
            MaterialPageRoute(
              builder: (_) => ChatPage(conversation: conversation),
            ),
          );
        }
      });
    } catch (e, stack) {
      debugPrint("Deep link error: $e");

      debugPrint(stack.toString());
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,

      title: "CRYPT",

      debugShowCheckedModeBanner: false,

      // ========================================================
      // LANGUAGE
      // ========================================================
      locale: _currentLocale,

      supportedLocales: const [
        Locale("en"),
        Locale("fr"),
        Locale("ar"),
        Locale("ru"),
        Locale("es"),
        Locale("de"),
        Locale("pt"),
        Locale("zh"),
        Locale("hi"),
        Locale("id"),
        Locale("ja"),
        Locale("tr"),
        Locale("vi"),
        Locale("it"),
        Locale("ko"),
        Locale("pl"),
        Locale("uk"),
        Locale("bn"),
        Locale("pa"),
        Locale("mr"),
        Locale("te"),
        Locale("ta"),
        Locale("fa"),
        Locale("ur"),
        Locale("sw"),
        Locale("tl"),
        Locale("th"),
        Locale("ha"),
        Locale("nl"),
        Locale("gu"),
        Locale("kn"),
        Locale("ml"),
        Locale("or"),
      ],

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // ========================================================
      // LIGHT THEME
      // ========================================================
      theme: ThemeData(
        brightness: Brightness.light,

        scaffoldBackgroundColor: const Color(0xFFF2F3F5),

        colorScheme: const ColorScheme.light(
          primary: Colors.blueAccent,
          surface: Color(0xFFF2F3F5),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE9EAED),
          foregroundColor: Color(0xFF17181A),
          elevation: 0,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFE8E9EC),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // ========================================================
      // DARK THEME
      // ========================================================
      darkTheme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: const Color(0xFF030405),

        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
          surface: Color(0xFF030405),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF020303),
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF0B0D0F),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // ========================================================
      // MANUAL THEME MODE
      // ========================================================
      //
      // CRYPT deliberately uses its saved preference.
      // The phone's system theme does NOT override it.
      //
      // true  = dark
      // false = light
      //
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // ========================================================
      // HOME
      // ========================================================
      home: _buildStartupRoute(),
    );
  }

  Widget _buildStartupPage(AccountService accountService) {
    return FutureBuilder<bool>(
      future: accountService.accountExists(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData && snapshot.data == true) {
          return FutureBuilder<String?>(
            future: accountService.getPublicEncryptionKey(),

            builder: (context, keySnapshot) {
              if (keySnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              return HomePage(
                uid: keySnapshot.data ?? "",

                isDarkMode: _isDarkMode,

                onThemeChanged: _onThemeChanged,

                // IMPORTANT:
                // This allows language changes
                // to update MaterialApp immediately.
                onLanguageChanged: setLocale,
                showSplashScreen: _showSplashScreen,
                onSplashScreenChanged: _onSplashScreenChanged,
              );
            },
          );
        }

        return const WelcomePage();
      },
    );
  }

  Widget _buildStartupRoute() {
    final startupPage = _buildStartupPage(AccountService());

    if (!_showSplashScreen) {
      return startupPage;
    }

    return SplashScreen(nextPage: startupPage);
  }

  void _restartStartup() {
    if (!mounted) return;

    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => _buildStartupRoute()),
      (route) => false,
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _linkSubscription?.cancel();

    super.dispose();
  }
}

// ============================================================
// SPLASH SCREEN
// ============================================================

class SplashScreen extends StatefulWidget {
  final Widget nextPage;

  const SplashScreen({super.key, required this.nextPage});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _studioOpacity;
  late Animation<double> _cryptOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    // ==========================================================
    // ATLAS STUDIO SPLASH
    // ==========================================================

    _studioOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 15),

      TweenSequenceItem(tween: ConstantTween(1.0), weight: 25),

      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 15),

      TweenSequenceItem(tween: ConstantTween(0.0), weight: 45),
    ]).animate(_controller);

    // ==========================================================
    // CRYPT SPLASH
    // ==========================================================

    _cryptOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 45),

      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 15),

      TweenSequenceItem(tween: ConstantTween(1.0), weight: 25),

      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 15),
    ]).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) return;

        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget.nextPage;
            },

            transitionDuration: const Duration(milliseconds: 600),

            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Splash intentionally stays black.
      backgroundColor: Colors.black,

      body: AnimatedBuilder(
        animation: _controller,

        builder: (context, child) {
          return Stack(
            children: [
              // =================================================
              // ATLAS STUDIO
              // =================================================
              Center(
                child: Opacity(
                  opacity: _studioOpacity.value,

                  child: const Text(
                    "ATLAS\nSTUDIO",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6,
                      height: 1.1,
                    ),
                  ),
                ),
              ),

              // =================================================
              // CRYPT
              // =================================================
              Center(
                child: Opacity(
                  opacity: _cryptOpacity.value,

                  child: const Text(
                    "CRYPT",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
