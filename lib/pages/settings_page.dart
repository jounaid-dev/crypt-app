import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../services/language_service.dart';
import '../services/language_names.dart';
import 'signup_page.dart';
import 'terms_and_conditions_page.dart';
import '../services/identity_service.dart';
import '../services/account_service.dart';
import '../services/account_flags_service.dart';
import '../services/chat_lock_service.dart';
import '../services/conversation_service.dart';
import '../models/conversation.dart';
import '../services/premium_status_service.dart';
import '../services/session_service.dart';
import 'admin_access_page.dart';
import 'admin_panel_page.dart';
import 'report_page.dart';
import 'submit_payment_proof_page.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;
  final Function(Locale)? onLanguageChanged;
  final bool showSplashScreen;
  final Function(bool)? onSplashScreenChanged;

  const SettingsPage({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
    this.onLanguageChanged,
    this.showSplashScreen = true,
    this.onSplashScreenChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  bool _isUnlocked = false;
  bool _isTimedOut = false;
  int _remainingSeconds = 0;

  /// True while the master-password dialog is on screen.
  ///
  /// The lock check runs on every resume, and several flows (the fingerprint
  /// sheet, a file picker, the share sheet) background the app long enough to
  /// fire one. This stops a second dialog from stacking on the first.
  bool _lockPromptInFlight = false;

  String _currentUsername = "";
  String _currentLanguageCode = "en";

  late bool _isDarkMode;
  late bool _showSplashScreen;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final LocalAuthentication _localAuth = LocalAuthentication();

  final IdentityService _identityService = IdentityService();

  final AccountService _accountService = AccountService();

  final LanguageService _languageService = LanguageService();

  final List<Map<String, String>> _availableChats = [];
  final List<String> _lockedChatIds = [];

  /// Lock method per conversation id, for the tile subtitle.
  ///
  /// Cached because [ChatLockService.getLockType] is async and the label is
  /// read during build.
  final Map<String, String> _lockTypes = {};

  bool _settingsProtectionEnabled = false;

  bool _isPremiumUser = false;

  /// True when the user has a payment proof still waiting for an admin.
  bool _pendingProof = false;
  bool _isCountdownRunning = false;

  /// Persisted switch for "require the master password to open Settings".
  ///
  /// Absent means false. A user is never asked for a password to protect a
  /// screen they never asked to protect.
  static const String _settingsProtectionKey =
      'settings_protection_enabled';

  /// How many chats the free tier may lock.
  ///
  /// Premium is unlimited. Attempting a lock beyond this is what raises the
  /// premium question, so the limit is deliberately named rather than hidden in
  /// an inline comparison.
  static const int _freeLockedChatLimit = 1;

  final ChatLockService _chatLockService = ChatLockService();

  final ConversationService _conversationService =
      ConversationService();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _isDarkMode = widget.isDarkMode;
    _showSplashScreen = widget.showSplashScreen;

    // The lock check reads _settingsProtectionEnabled, so the preference has to
    // be resolved before it runs. Loading it asynchronously alongside the check
    // was a race: whichever await happened to win decided whether the password
    // prompt appeared.
    _bootstrapSettings();
    _loadCurrentLanguage();
  }

  /// Loads the protection preference, then applies the lock, then loads the
  /// rest of the settings state.
  ///
  /// The order matters. The preference decides whether a password is required
  /// at all, so it must never be read after the decision has been made.
  Future<void> _bootstrapSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Assigned directly rather than through setState: this runs before the
      // first build, so there is nothing to rebuild yet.
      _settingsProtectionEnabled =
          prefs.getBool(_settingsProtectionKey) ?? false;

      // _currentUsername used to be filled in only as a side effect of a
      // successful master-password check, so it was empty whenever settings
      // protection was off. That left the support dialog and the fingerprint
      // prompt saying "Unlock: " with nothing after it.
      try {
        _currentUsername = await _accountService.getUsername() ?? "";
      } catch (e) {
        debugPrint("[Settings] Could not read username: $e");
      }

      if (!mounted) return;

      await _checkLockoutTimerState();

      await _loadPasscodePreferences();
    } catch (e, stackTrace) {
      // Called without await from initState, so a throw here would be an
      // unhandled async error and the screen would sit on its spinner forever.
      debugPrint("[Settings] Could not load settings: $e");

      debugPrint("[Settings] $stackTrace");

      // Never leave the user stuck on a spinner: without the preference the
      // safe default is an unlocked screen, because the user never asked for
      // a lock.
      if (!mounted) return;

      setState(() {
        _isUnlocked = true;
      });
    }
  }

  // ============================================================
  // APP LIFECYCLE
  // ============================================================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Re-check saved settings every time the app
    // comes back to the foreground.
    if (state == AppLifecycleState.resumed) {
      _refreshSettingsPreferences();
    }
  }

  Future<void> _refreshSettingsPreferences() async {
    await Future.wait([_loadCurrentLanguage(), _loadThemeFromStorage()]);

    if (!mounted) return;

    // Refresh other settings too.
    await _loadPasscodePreferences();

    if (!mounted) return;

    // Re-apply the lock. This is what makes turning the switch on actually
    // protect Settings: the user is already inside the screen, so the lock is
    // evaluated again the next time the app comes back to the foreground.
    // Without it the switch could be turned on and never take effect.
    await _checkLockoutTimerState();
  }

  @override
  void didUpdateWidget(covariant SettingsPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isDarkMode != widget.isDarkMode) {
      if (mounted) {
        setState(() {
          _isDarkMode = widget.isDarkMode;
        });
      }
    }

    if (oldWidget.showSplashScreen != widget.showSplashScreen) {
      _showSplashScreen = widget.showSplashScreen;
    }
  }

  // ============================================================
  // LANGUAGE
  // ============================================================

  Future<void> _loadCurrentLanguage() async {
    final langCode = await _languageService.getLanguage();

    if (!mounted) return;

    if (_currentLanguageCode != langCode) {
      setState(() {
        _currentLanguageCode = langCode;
      });
    }
  }

  Future<void> _changeLanguage(String selectedCode) async {
    // Update the UI and app locale before persisting.
    if (!mounted) return;

    setState(() {
      _currentLanguageCode = selectedCode;
    });

    widget.onLanguageChanged?.call(Locale(selectedCode));

    await _languageService.setLanguage(selectedCode);
  }

  // ============================================================
  // THEME
  // ============================================================

  Future<void> _loadThemeFromStorage() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    final savedDarkMode = prefs.getBool('is_dark_mode') ?? true;

    if (_isDarkMode != savedDarkMode) {
      setState(() {
        _isDarkMode = savedDarkMode;
      });
    }
  }

  void _handleThemeChanged(bool value) {
    if (_isDarkMode == value) return;

    setState(() {
      _isDarkMode = value;
    });

    widget.onThemeChanged(value);
  }

  /// Turns the master-password requirement on or off.
  ///
  /// Turning it off takes effect immediately, because the user is already
  /// standing inside the unlocked screen. Turning it on deliberately does not
  /// lock the screen under them: the next time they leave and come back, or
  /// reopen Settings, the password is required.
  Future<void> _handleSettingsProtectionChanged(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    // Persist first. If the write fails the switch has to snap back, or the
    // UI would claim a protection the next launch will not apply.
    final bool saved = await prefs.setBool(_settingsProtectionKey, value);

    if (!saved) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Could not save that setting. Try again."),
        ),
      );

      return;
    }

    if (!mounted) return;

    setState(() {
      _settingsProtectionEnabled = value;
    });
  }

  // ============================================================
  // LOCKOUT
  // ============================================================

  Future<void> _checkLockoutTimerState() async {
    final String? expiryString = await _secureStorage.read(
      key: 'settings_lockout_expiry',
    );

    final int lockoutExpiry = int.tryParse(expiryString ?? '0') ?? 0;

    final int now = DateTime.now().millisecondsSinceEpoch;

    if (now < lockoutExpiry) {
      if (!mounted) return;

      setState(() {
        _isTimedOut = true;
        _remainingSeconds = ((lockoutExpiry - now) / 1000).ceil();
      });

      _startCountdown(lockoutExpiry);
    } else {
      await _secureStorage.delete(key: 'settings_lockout_expiry');

      if (!mounted) return;

      if (!_settingsProtectionEnabled) {
        // Protection is off, so there is nothing to verify. Only rebuild when
        // the screen is actually still gated.
        if (_isUnlocked) return;

        setState(() {
          _isUnlocked = true;
        });

        return;
      }

      // The lock check also runs on resume, and opening a system sheet (the
      // fingerprint prompt, a file picker, the share sheet) briefly backgrounds
      // the app. Without this guard a second password dialog stacks on the
      // first one.
      if (_lockPromptInFlight) return;

      _lockPromptInFlight = true;

      try {
        await _promptMasterPassword();
      } finally {
        _lockPromptInFlight = false;
      }
    }
  }

  void _startCountdown(int expiryTime) {
    if (_isCountdownRunning) return;

    _isCountdownRunning = true;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) {
        _isCountdownRunning = false;
        return false;
      }

      final now = DateTime.now().millisecondsSinceEpoch;

      if (now >= expiryTime) {
        setState(() {
          _isTimedOut = false;
        });

        _isCountdownRunning = false;

        if (!_settingsProtectionEnabled) {
          if (!_isUnlocked) {
            setState(() {
              _isUnlocked = true;
            });
          }

          return false;
        }

        if (!_lockPromptInFlight) {
          _lockPromptInFlight = true;

          try {
            await _promptMasterPassword();
          } finally {
            _lockPromptInFlight = false;
          }
        }

        return false;
      }

      setState(() {
        _remainingSeconds = ((expiryTime - now) / 1000).round();
      });

      return true;
    });
  }

  // ============================================================
  // PASSCODE / CONVERSATIONS
  // ============================================================

  Future<void> _loadPasscodePreferences() async {
    try {
      await Future.wait([
        _loadAvailableChats(),
        _loadPremiumStatus(),
      ]);
    } catch (e, stackTrace) {
      // This is reached from a lifecycle callback that nobody awaits, so a
      // throw here would surface as an unhandled async error rather than a
      // failed operation.
      debugPrint("[Settings] Could not load preferences: $e");

      debugPrint("[Settings] $stackTrace");
    }
  }

  /// Builds the "Secure conversations" list.
  ///
  /// This used to read an `active_conversations_list` SharedPreferences blob
  /// that nothing in the app ever wrote, so the list was permanently empty and
  /// the per-conversation checkbox was unreachable. The list is now read from
  /// the same conversation store the chat list itself uses, which is what
  /// makes every conversation the user actually has show up here.
  Future<void> _loadAvailableChats() async {
    final List<Conversation> conversations;

    try {
      conversations = await _conversationService.getConversations();
    } catch (e) {
      // A corrupt store must not take the whole Settings screen down.
      debugPrint("[Settings] Could not read conversations: $e");

      return;
    }

    final List<String> lockedIds = <String>[];
    final Map<String, String> lockTypes = <String, String>{};

    for (final Conversation conversation in conversations) {
      try {
        final String? lockType = await _chatLockService.getLockType(
          conversation.id,
        );

        if (lockType != null) {
          lockedIds.add(conversation.id);
          lockTypes[conversation.id] = lockType;
        }
      } catch (e) {
        debugPrint(
          "[Settings] Could not read lock state for "
          "${conversation.id}: $e",
        );
      }
    }

    if (!mounted) return;

    final List<Map<String, String>> chats = conversations
        .map(
          (Conversation conversation) => <String, String>{
            "id": conversation.id,
            "name": conversation.username,
          },
        )
        .toList();

    setState(() {
      _availableChats
        ..clear()
        ..addAll(chats);

      _lockedChatIds
        ..clear()
        ..addAll(lockedIds);

      _lockTypes
        ..clear()
        ..addAll(lockTypes);
    });
  }

  /// Human readable lock method for a conversation tile subtitle.
  String _lockTypeLabel(String chatId) {
    final loc = AppLocalizations.of(context)!;

    return _lockTypes[chatId] == ChatLockService.lockTypeBiometric
        ? loc.fingerprintUnlock
        : loc.fourDigitPin;
  }

  /// The username behind a conversation id, for the PIN prompts.
  String _chatNameFor(String chatId) {
    for (final Map<String, String> chat in _availableChats) {
      if (chat["id"] == chatId) {
        final String name = chat["name"] ?? "";

        if (name.isNotEmpty) return name;
      }
    }

    return "this chat";
  }

  /// Reads premium and the user's own payment proof status from the server.
  ///
  /// The conversation locks are not read here. They live in ChatLockService,
  /// which is the only thing that decides whether a chat is actually locked.
  Future<void> _loadPremiumStatus() async {
    bool premium = false;
    bool pending = false;

    try {
      premium = await AccountFlagsService.instance.isPremium();
    } catch (e) {
      debugPrint("Could not read premium status: $e");

      premium = false;
    }

    try {
      pending = await PremiumStatusService.instance.hasPendingProof();
    } catch (e) {
      debugPrint("Could not read payment proof status: $e");
      pending = false;
    }

    if (!mounted) return;

    setState(() {
      _isPremiumUser = premium;
      _pendingProof = pending;
    });
  }


  // ============================================================
  // MASTER PASSWORD
  // ============================================================

  Future<void> _promptMasterPassword() async {
    if (_isTimedOut) return;

    final loc = AppLocalizations.of(context)!;

    final bool registered = await _identityService.hasStoredIdentity();

    if (!registered) {
      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignupPage()),
        (route) => false,
      );

      return;
    }

    if (!mounted) return;

    final controller = TextEditingController();

    final String? inputPassword = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(loc.masterAuthenticationRequired),
            content: TextField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: loc.accountPasswordLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext, null);
                },
                child: Text(loc.cancel),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(dialogContext, controller.text);
                },
                child: Text(loc.verify),
              ),
            ],
          ),
        );
      },
    );

    controller.dispose();

    if (inputPassword == null) {
      return;
    }

    bool verifySuccess = false;

    if (!mounted) return;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const PopScope(
          canPop: false,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );

    try {
      final identity = await _identityService.getLocalIdentityWithPassword(
        inputPassword,
      );

      if (identity != null) {
        verifySuccess = true;
        _currentUsername = identity.username;
      }
    } catch (e, stackTrace) {
      verifySuccess = false;

      debugPrint("[Settings] Password verification failed: $e");

      debugPrint("[Settings] $stackTrace");
    }

    // Close the busy dialog before anything else. This runs before the
    // `mounted` guard on purpose: returning early while the barrier was still
    // up left the app covered by an undismissable spinner.
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    if (verifySuccess) {
      await prefs.setInt('failed_settings_attempts', 0);

      if (!mounted) return;

      setState(() {
        _isUnlocked = true;
      });
    } else {
      int currentFails = (prefs.getInt('failed_settings_attempts') ?? 0) + 1;

      await prefs.setInt('failed_settings_attempts', currentFails);

      int penaltyMinutes = 10;

      if (currentFails == 2) {
        penaltyMinutes = 20;
      }

      if (currentFails == 3) {
        penaltyMinutes = 30;
      }

      if (currentFails == 4) {
        penaltyMinutes = 60;
      }

      if (currentFails == 5) {
        penaltyMinutes = 600;
      }

      if (currentFails >= 6) {
        penaltyMinutes = 6000;
      }

      final int totalPenaltySeconds = penaltyMinutes * 60;

      final int expiry =
          DateTime.now().millisecondsSinceEpoch + (totalPenaltySeconds * 1000);

      await _secureStorage.write(
        key: 'settings_lockout_expiry',
        value: expiry.toString(),
      );

      if (!mounted) return;

      setState(() {
        _isTimedOut = true;
        _remainingSeconds = totalPenaltySeconds;
      });

      _startCountdown(expiry);
    }
  }

  // ============================================================
  // EMERGENCY SIGN OUT
  // ============================================================

  Future<void> _executeEmergencySignOut() async {
    final loc = AppLocalizations.of(context)!;

    final confirm =
        await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(loc.forceEscapeSignOutTitle),
            content: Text(loc.forceEscapeSignOutContent),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: Text(loc.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                child: Text(loc.wipeDevice),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirm) return;

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    await _secureStorage.delete(key: 'settings_lockout_expiry');

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SignupPage()),
      (route) => false,
    );
  }

  // ============================================================
  // LANGUAGE SELECTION
  // ============================================================

  Future<void> _showLanguageSelectionDialog() async {
    final loc = AppLocalizations.of(context)!;

    String filterQuery = "";

    final List<Map<String, String>> languageList = LanguageNames
        .nativeNames
        .keys
        .map((code) {
          return {
            'code': code,
            'native': LanguageNames.nativeNames[code] ?? code,
            'english': LanguageNames.englishNames[code] ?? code,
          };
        })
        .toList();

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            final filteredLanguages = languageList.where((lang) {
              final nativeName = lang['native']!.toLowerCase();

              final englishName = lang['english']!.toLowerCase();

              final code = lang['code']!.toLowerCase();

              final query = filterQuery.toLowerCase();

              return nativeName.contains(query) ||
                  englishName.contains(query) ||
                  code.contains(query);
            }).toList();

            return AlertDialog(
              title: Text(loc.searchLanguage),
              content: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: loc.searchLanguage,
                        prefixIcon: const Icon(Icons.search),
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                      ),
                      onChanged: (value) {
                        setDialogState(() {
                          filterQuery = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredLanguages.length,
                        itemBuilder: (context, index) {
                          final lang = filteredLanguages[index];

                          final isSelected =
                              lang['code'] == _currentLanguageCode;

                          return ListTile(
                            title: Text(
                              lang['native']!,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            subtitle: Text(
                              lang['english']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: isSelected
                                ? const Icon(Icons.check, color: Colors.green)
                                : Text(
                                    lang['code']!.toUpperCase(),
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                            onTap: () async {
                              final selectedCode = lang['code']!;

                              // SAVE + UPDATE EVERYTHING
                              // IMMEDIATELY.
                              await _changeLanguage(selectedCode);

                              if (!dialogContext.mounted) {
                                return;
                              }

                              Navigator.pop(dialogContext);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: Text(loc.cancel),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ============================================================
  // CHAT LOCKS
  // ============================================================

  /// Repaints the lock checkboxes after a refused change.
  ///
  /// [CheckboxListTile] is driven entirely by its `value`, so a tap that is
  /// rejected without a rebuild would leave the tick drawn on screen while the
  /// saved state says otherwise.
  void _refreshLockTiles() {
    if (!mounted) return;

    setState(() {});
  }

  Future<void> _toggleChatCheckbox(String chatId, bool isChecked) async {
    final prefs = await SharedPreferences.getInstance();

    final loc = AppLocalizations.of(context)!;

    if (isChecked) {
      // ============================================================
      // FREE TIER LIMIT
      //
      // One locked chat is free. Asking for a second one is what brings the
      // premium question up. Fingerprint unlock is not offered here at all,
      // because it is a premium feature: a free account is always given the PIN
      // path further down, never the biometric one.
      // ============================================================

      final bool overFreeLimit =
          _lockedChatIds.length >= _freeLockedChatLimit;

      if (overFreeLimit && !_isPremiumUser) {
        if (!mounted) return;

        double selectedAmount = 15000;

        final inputController = TextEditingController();

        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setDialogState) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Row(
                    children: [
                      const Icon(Icons.coffee, color: Colors.amber, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          loc.supportSoloDeveloper,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loc.supportIntro,
                          style: TextStyle(fontSize: 12, height: 1.3),
                        ),
                        const SizedBox(height: 12),
                        // ======================================================
                        // WHY THE PREMIUM QUESTION IS BEING SHOWN
                        //
                        // Spelled out in words as well as the table below,
                        // because the two rules that caused this dialog are
                        // the ones people are most surprised by: only one chat
                        // is lockable for free, and fingerprint unlock is not
                        // part of the free tier at all.
                        // ======================================================
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.07),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.red.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You already have a locked chat.",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Free: lock 1 chat with your own 4-digit PIN.\n"
                                "Premium: lock as many chats as you like, and "
                                "unlock them with your fingerprint or face "
                                "instead of typing a PIN.\n\n"
                                "Every chat gets its own PIN, chosen by you. "
                                "There is no single code for the whole app.",
                                style: const TextStyle(
                                  fontSize: 11,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.amber.withValues(alpha: 0.15),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                loc.chooseSupportAmount,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              Text(
                                loc.poorGang,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "${selectedAmount.toStringAsFixed(0)} sats (${selectedAmount == 7500
                                    ? loc.launchOfferMinimum
                                    : selectedAmount <= 10000
                                    ? loc.buyMeCoffee
                                    : loc.superSupporter})",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Slider(
                                value: selectedAmount,
                                min: 7500,
                                max: 25000,
                                divisions: 7,
                                activeColor: Colors.amber,
                                inactiveColor: Colors.grey.withValues(
                                  alpha: 0.2,
                                ),
                                onChanged: (double val) {
                                  setDialogState(() {
                                    selectedAmount = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                              color: Colors.grey.withValues(alpha: 0.15),
                              width: 0.5,
                            ),
                          ),
                          columnWidths: const {
                            0: FlexColumnWidth(1.2),
                            1: FlexColumnWidth(1.0),
                            2: FlexColumnWidth(1.0),
                          },
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.feature,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.freeTier,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    loc.premium,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.chatLocks,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.maxOneRoom,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.unlimited,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.biometrics,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.disabled,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    loc.fingerprintUnlock,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                7,
                                255,
                                90,
                              ),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.bolt),
                            label: Text(
                              loc.supportWithSats(
                                selectedAmount.toStringAsFixed(0),
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              const String paymentLink =
                                  "bitcoin:?lno=lno1pqp7fcwqpgx5x5je2p2zqurjv4kkjatdzrhq8pjw7qjlm68mtp7e3yvxee4y5xrgjhhyf2fxhlphpckrvevh50u0q24pzh2v8vu2g6ety7rtfhg284c8v3n7r2eykde7epxp4r6z2xkkyqszt5m6t5pt4anhz92gyflsttxdd8rpk60fwmuvwh8v3xrs4ednd08qqvetd723w88efu8gkdx8zh9nfq5sy5ag2x0khx7uygcwftsw640hzc9l687cun9unvje47aqyzan59r2cvmuq274jagu6rtrs25ggem04sl7hdvzt07qsgt4xe90y0thhjywet55cqpju6w9zmtc0wdw3l4y6d9679mxht3pth7pktpv94yp45ql6f4tg7c8ekdmw8qqjj2jhntawrmevv33d6fv";

                              final Uri parsedUri = Uri.parse(paymentLink);

                              if (await canLaunchUrl(parsedUri)) {
                                await launchUrl(
                                  parsedUri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                if (!dialogContext.mounted) {
                                  return;
                                }

                                ScaffoldMessenger.of(
                                  dialogContext,
                                ).showSnackBar(
                                  SnackBar(
                                    content: Text(loc.couldNotOpenWallet),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          loc.boltOffer,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () async {
                            const String bolt12Offer =
                                "bitcoin:?lno=lno1pqp7fcwqpgx5x5je2p2zqurjv4kkjatdzrhq8pjw7qjlm68mtp7e3yvxee4y5xrgjhhyf2fxhlphpckrvevh50u0q24pzh2v8vu2g6ety7rtfhg284c8v3n7r2eykde7epxp4r6z2xkkyqszt5m6t5pt4anhz92gyflsttxdd8rpk60fwmuvwh8v3xrs4ednd08qqvetd723w88efu8gkdx8zh9nfq5sy5ag2x0khx7uygcwftsw640hzc9l687cun9unvje47aqyzan59r2cvmuq274jagu6rtrs25ggem04sl7hdvzt07qsgt4xe90y0thhjywet55cqpju6w9zmtc0wdw3l4y6d9679mxht3pth7pktpv94yp45ql6f4tg7c8ekdmw8qqjj2jhntawrmevv33d6fv";

                            await Clipboard.setData(
                              const ClipboardData(text: bolt12Offer),
                            );

                            if (!dialogContext.mounted) {
                              return;
                            }

                            ScaffoldMessenger.of(dialogContext).showSnackBar(
                              SnackBar(
                                content: Text(loc.boltOfferCopied),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.copy, size: 16, color: Colors.amber),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    loc.tapToCopyBoltOffer,
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          loc.simpleInstructionsToUnlock,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          loc.unlockInstructions(_currentUsername),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: inputController,
                          decoration: InputDecoration(
                            labelText: loc.supportRequestHint,
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            labelStyle: TextStyle(fontSize: 11),
                          ),
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                      child: Text(loc.maybeLater),
                    ),
                    FilledButton(
                      onPressed: () async {
                        final String comment = inputController.text.trim();

                        if (comment.isNotEmpty) {
                          await prefs.setString(
                            'premium_user_support_comment',
                            comment,
                          );
                        }

                        if (!dialogContext.mounted) {
                          return;
                        }

                        Navigator.pop(dialogContext);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(loc.proofSubmittedSnackbar)),
                        );
                      },
                      child: Text(loc.submitProof),
                    ),
                  ],
                );
              },
            );
          },
        );

        inputController.dispose();

        // The premium question was shown instead of a lock, so the tick has to
        // go back off.
        _refreshLockTiles();

        return;
      }

      // ============================================================
      // ARM THE LOCK
      //
      // The checkbox used to only write `lock_type_$chatId` and a list of ids
      // that nothing read, so it showed a locked chat that opened with no
      // prompt at all. The lock is now created through ChatLockService, the
      // same service the chat list uses to enforce it.
      //
      // Each chat is stored under its own conversation id, so the PIN belongs
      // to this one chat. There is deliberately no app-wide code.
      // ============================================================

      // A free account is always given the PIN path. Fingerprint unlock is a
      // premium feature and is only offered by _chooseLockType.
      final String? lockType = _isPremiumUser
          ? await _chooseLockType()
          : ChatLockService.lockTypePin;

      if (lockType == null) {
        _refreshLockTiles();

        return;
      }

      // Bound to a non-nullable local before the awaits below.
      final String chosenType = lockType;

      if (!mounted) return;

      final String? passcode = chosenType ==
              ChatLockService.lockTypeBiometric
          ? await _createBiometricSecret()
          : await _promptForNewPin(
              chatName: _chatNameFor(chatId),
            );

      // The user backed out of the dialog, so no lock was created.
      if (passcode == null) {
        _refreshLockTiles();

        return;
      }

      if (!mounted) return;

      try {
        await _chatLockService.setPasscode(
          conversationId: chatId,
          passcode: passcode,
          lockType: chosenType,
        );
      } catch (e) {
        debugPrint("[Settings] Could not lock $chatId: $e");

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Could not lock this chat. Try again."),
          ),
        );

        _refreshLockTiles();

        return;
      }

      if (!mounted) return;

      setState(() {
        if (!_lockedChatIds.contains(chatId)) {
          _lockedChatIds.add(chatId);
        }

        _lockTypes[chatId] = chosenType;
      });
    } else {
      try {
        await _chatLockService.removePasscode(chatId);
      } catch (e) {
        debugPrint("[Settings] Could not unlock $chatId: $e");

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("Could not unlock this chat. Try again."),
          ),
        );

        _refreshLockTiles();

        return;
      }

      if (!mounted) return;

      setState(() {
        _lockedChatIds.remove(chatId);

        _lockTypes.remove(chatId);
      });
    }
  }

  // ============================================================
  // LOCK SETUP DIALOGS
  // ============================================================

  /// Asks whether this chat should be unlocked with a PIN or a fingerprint.
  ///
  /// Only reached by premium accounts: fingerprint unlock is a paid feature, so
  /// a free account is never shown this choice. Returns null when the user
  /// dismisses without picking.
  Future<String?> _chooseLockType() async {
    final loc = AppLocalizations.of(context)!;

    return showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.selectSecureLockMethod),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.selectSecureLockDescription),
            const SizedBox(height: 10),
            const Text(
              'Fingerprint unlock is a premium feature. Either way, the '
              'code you set belongs to this one chat only.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                height: 1.3,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(
              dialogContext,
              ChatLockService.lockTypePin,
            ),
            child: Text(loc.fourDigitPin),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(
              dialogContext,
              ChatLockService.lockTypeBiometric,
            ),
            child: Text(loc.fingerprintUnlock),
          ),
        ],
      ),
    );
  }

  /// Collects a new 4-digit PIN and confirms it by asking for it twice.
  ///
  /// [chatName] is named in the prompt so it is clear the code belongs to this
  /// one conversation. Returns null when the user cancels or the two entries
  /// disagree, so the lock is never armed with a PIN the user cannot reproduce.
  Future<String?> _promptForNewPin({required String chatName}) async {
    final loc = AppLocalizations.of(context)!;

    final String? first = await _askForPin(
      title: "Set a PIN for $chatName",
      helper: "This PIN opens $chatName only. Every chat has its own PIN, "
          "chosen by you. There is no single code for the app.",
    );

    if (first == null) return null;

    if (!mounted) return null;

    final String? second = await _askForPin(
      title: "Confirm the PIN for $chatName",
      helper: loc.secureKeyPasscode,
    );

    if (second == null) return null;

    if (first != second) {
      if (!mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("The PINs did not match. Lock not enabled."),
        ),
      );

      return null;
    }

    return first;
  }

  /// Single PIN entry. Returns null unless exactly four digits were entered.
  Future<String?> _askForPin({
    required String title,
    required String helper,
  }) async {
    final loc = AppLocalizations.of(context)!;

    final TextEditingController controller = TextEditingController();

    String errorText = "";

    final String? entered = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    helper,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      labelText: loc.secureKeyPasscode,
                      counterText: "",
                      border: const OutlineInputBorder(),
                      errorText: errorText.isEmpty ? null : errorText,
                    ),
                    onChanged: (String value) {
                      // Strip anything that is not a digit and keep the field
                      // in sync with the sanitised value, so the length limit
                      // counts digits rather than characters.
                      final String digits = value.replaceAll(
                        RegExp(r'[^0-9]'),
                        '',
                      );

                      if (digits != value) {
                        controller.text = digits;
                        controller.selection = TextSelection.collapsed(
                          offset: digits.length,
                        );
                      }

                      if (errorText.isEmpty) return;

                      setDialogState(() {
                        errorText = "";
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: Text(loc.cancel),
                ),
                FilledButton(
                  onPressed: () {
                    final String digits = controller.text.replaceAll(
                      RegExp(r'[^0-9]'),
                      '',
                    );

                    if (digits.length != 4) {
                      setDialogState(() {
                        errorText = "Enter exactly 4 digits.";
                      });

                      return;
                    }

                    Navigator.pop(dialogContext, digits);
                  },
                  child: Text(loc.ok),
                ),
              ],
            );
          },
        );
      },
    );

    controller.dispose();

    return entered;
  }

  /// Creates the hidden secret behind a fingerprint lock.
  ///
  /// The user never types this, so it is random rather than memorable, and the
  /// device sensor is verified first so a lock cannot be armed by whoever
  /// happens to be holding an unlocked phone. Returns null when the user
  /// cancels or the device cannot verify them.
  Future<String?> _createBiometricSecret() async {
    final loc = AppLocalizations.of(context)!;

    try {
      final List<BiometricType> enrolled =
          await _localAuth.getAvailableBiometrics();

      if (enrolled.isEmpty) {
        if (!mounted) return null;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              "No fingerprint or face unlock is set up on this device.",
            ),
          ),
        );

        return null;
      }

      if (!mounted) return null;

      final bool confirmed = await _localAuth.authenticate(
        localizedReason: loc.unlockSecureNode(_currentUsername),
        biometricOnly: true,
        sensitiveTransaction: true,
        persistAcrossBackgrounding: true,
      );

      if (!confirmed) return null;
    } catch (e) {
      debugPrint("[Settings] Biometric setup failed: $e");

      if (!mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Could not verify it is you on this device."),
        ),
      );

      return null;
    }

    final List<int> secret = List<int>.generate(
      32,
      (_) => Random.secure().nextInt(256),
    );

    return base64UrlEncode(secret).replaceAll("=", "");
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  Future<void> _handleLogout() async {
    await _accountService.logout();
    SessionService.instance.lock();

    if (!mounted) return;

    CryptApp.restartStartup(context);
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return PopScope(
      canPop: !_isTimedOut,
      child: Scaffold(
        appBar: AppBar(
          title: Text(loc.settings),
          automaticallyImplyLeading: !_isTimedOut,
        ),
        body: _buildPageLayout(),
      ),
    );
  }

  Widget _buildPageLayout() {
    final ThemeData theme = Theme.of(context);

    final AppLocalizations loc = AppLocalizations.of(context)!;


    if (_isTimedOut) {
      final int hours = _remainingSeconds ~/ 3600;

      final int minutes = (_remainingSeconds % 3600) ~/ 60;

      final int seconds = _remainingSeconds % 60;

      String timeText = "$_remainingSeconds seconds";

      if (hours > 0) {
        timeText = "${hours}h ${minutes}m ${seconds}s";
      } else if (minutes > 0) {
        timeText = "${minutes}m ${seconds}s";
      }

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_clock, size: 72, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                loc.falsePassword,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                loc.accessSuspendedTimer(timeText),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              FilledButton.icon(
                onPressed: _executeEmergencySignOut,
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.delete_forever),
                label: Text(
                  loc.wipeDeviceAndEscape,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!_isUnlocked) {
      return const Center(child: CircularProgressIndicator());
    }

    final activeNativeName =
        LanguageNames.nativeNames[_currentLanguageCode] ?? loc.language;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // ======================================================
        // THEME
        //
        // Neither tile below may set `isThreeLine`. Flutter's ListTile asserts
        // that a three-line tile has a subtitle, and a title-only tile asserted
        // that way took down this whole screen with a red error. These tiles
        // have no subtitle, so the flag has to stay off.
        // ======================================================
        SwitchListTile(
          title: Text(loc.darkThemeMode, softWrap: true),
          value: _isDarkMode,
          onChanged: _handleThemeChanged,
        ),

        SwitchListTile(
          title: Text(loc.showSplashScreen, softWrap: true),
          value: _showSplashScreen,
          onChanged: (value) {
            setState(() {
              _showSplashScreen = value;
            });
            widget.onSplashScreenChanged?.call(value);
          },
        ),

        SwitchListTile(
          title: const Text('Protect settings with master password'),
          subtitle: const Text('Require password to access settings'),
          value: _settingsProtectionEnabled,
          onChanged: _handleSettingsProtectionChanged,
        ),

        // ======================================================
        // LANGUAGE
        // ======================================================
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(loc.language),
          subtitle: Text(activeNativeName),
          trailing: const Icon(Icons.chevron_right),
          onTap: _showLanguageSelectionDialog,
        ),

        ListTile(
          leading: const Icon(Icons.description_outlined),
          title: Text(loc.settingsTermsAndConditions),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TermsAndConditionsPage()),
            );
          },
        ),

        // ======================================================
        // SUPPORT AND MODERATION
        // ======================================================

        ListTile(
          leading: const Icon(Icons.report_gmailerrorred_outlined),
          title: const Text('Report a problem'),
          subtitle: const Text('Bugs, abuse or spam'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ReportPage()),
            );
          },
        ),

        ListTile(
          leading: const Icon(Icons.receipt_long_outlined),
          title: const Text('Submit payment proof'),
          subtitle: Text(
            _isPremiumUser
                ? 'Premium is on for your account'
                : _pendingProof
                    ? 'Waiting for an admin to review your receipt'
                    : 'How to get premium: pay, then send the receipt here',
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SubmitPaymentProofPage(),
              ),
            ).then((_) => _loadPremiumStatus());
          },
        ),

        // ======================================================
        // PREMIUM EXPLAINER
        //
        // The locked chats are the only premium feature today, and the
        // only way to unlock them is an admin turning on the flag after
        // seeing a receipt. Spell that out rather than leaving people to
        // guess why paying changed nothing.
        // ======================================================

        if (!_isPremiumUser)
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.amber.withAlpha(24),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber.withAlpha(90)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.workspace_premium,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'How premium works',
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _pendingProof
                      ? 'Your receipt is in. An admin checks it and premium '
                          'turns on for your account automatically. You do '
                          'not need to do anything else.'
                      : '1. Pay using any method your admin gave you.\n'
                          '2. Open Settings and tap Submit payment proof.\n'
                          '3. Enter the amount, the transaction reference '
                          'from your receipt, and a photo of it.\n'
                          '4. An admin approves it and premium turns on.\n\n'
                          'Premium is decided on the server, so it cannot be '
                          'switched on by editing the app.',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),

        // The access code is verified by the server, so it is not stored in
        // the app and cannot be pulled out of the APK.
        ListTile(
          leading: const Icon(Icons.shield_outlined),
          title: const Text('Admin access'),
          subtitle: const Text('Enter your admin code to open the panel'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            final unlocked = await Navigator.push<bool>(
              context,
              MaterialPageRoute(builder: (_) => const AdminAccessPage()),
            );

            if (unlocked != true || !mounted) return;

            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AdminPanelPage()),
            );
          },
        ),

        const Divider(),

        // ======================================================
        // SECURE CONVERSATIONS
        // ======================================================
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            loc.secureConversations,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        if (_availableChats.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              loc.noActiveConversations,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          )
        else
          for (final chat in _availableChats)
            CheckboxListTile(
              title: Text(chat["name"]!, softWrap: true),
              // The lock method is shown so a locked chat is not a mystery
              // checkbox, and the wording makes it clear the code belongs to
              // this one chat rather than to the app.
              subtitle: Text(
                _lockedChatIds.contains(chat["id"])
                    ? "${_lockTypeLabel(chat["id"]!)} — own code, "
                        "this chat only"
                    : "Tap to set your own PIN for this chat",
                style: const TextStyle(fontSize: 12),
              ),
              value: _lockedChatIds.contains(chat["id"]),
              onChanged: (val) =>
                  _toggleChatCheckbox(chat["id"]!, val ?? false),
            ),

        const Divider(),

        const SizedBox(height: 24),

        // ======================================================
        // LOGOUT
        // ======================================================
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _handleLogout,
            icon: const Icon(Icons.logout),
            label: Text(loc.logout),
          ),
        ),

        const SizedBox(height: 12),

        // ======================================================
        // WIPE DEVICE
        // ======================================================
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _executeEmergencySignOut,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            icon: const Icon(Icons.delete_forever),
            label: Text(loc.wipeDevice),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }
}
