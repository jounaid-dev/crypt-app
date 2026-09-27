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
import '../services/premium_offer.dart';
import '../services/message_service.dart';
import '../widgets/premium_widgets.dart';
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

    final String? inputPassword = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => const _MasterPasswordDialog(),
    );

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

    // The decoded message cache is process wide, so it has to be dropped with
    // the stored data it was decoded from.
    MessageService().clearCache();

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

        await showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  const Icon(
                    Icons.coffee,
                    color: Colors.amber,
                    size: 24,
                  ),
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
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ======================================================
                    // WHAT PREMIUM ADDS
                    //
                    // Stated plainly rather than as a refusal. This used to
                    // be a red warning panel reading "You already have a
                    // locked chat", which came across as an error rather
                    // than an offer.
                    // ======================================================
                    const Text(
                      'Your free account already locks one chat. '
                      'Premium locks every chat you have, and lets each one '
                      'open with your fingerprint or face instead of a PIN.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const PremiumComparisonTable(),

                    const SizedBox(height: 16),

                    const PremiumPaymentInstructions(),

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
                          'Pay ${PremiumOffer.minimumAmountLabel} '
                          'with Phoenix',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          final Uri walletUri = PremiumOffer.walletUri;

                          if (await canLaunchUrl(walletUri)) {
                            await launchUrl(
                              walletUri,
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

                    const SizedBox(height: 8),

                    // ======================================================
                    // COPY THE ADDRESS
                    //
                    // The single fallback for a device with no Phoenix
                    // installed. Copying the address is enough to pay from any
                    // Lightning wallet.
                    // ======================================================
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                          const ClipboardData(
                            text: PremiumOffer.lightningAddress,
                          ),
                        );

                        if (!dialogContext.mounted) {
                          return;
                        }

                        ScaffoldMessenger.of(dialogContext).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Lightning address copied. Paste it into '
                              'Phoenix to pay.',
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.copy,
                              size: 16,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Tap to copy the Lightning address',
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
              ],
            );
          },
        );

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
  ///
  /// The dialog owns its controller and its own state, so nothing is disposed
  /// while the route is still on screen. Doing that by hand from here
  /// disposed the controller as soon as [showDialog] returned, which is before
  /// the dismissed dialog has finished animating out, and the text field was
  /// still attached to it.
  Future<String?> _askForPin({
    required String title,
    required String helper,
  }) async {
    return showDialog<String>(
      context: context,
      builder: (dialogContext) => _PinEntryDialog(
        title: title,
        helper: helper,
      ),
    );
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

    // ======================================================
    // SECTION ORDER
    //
    // Every control sits under the heading it belongs to, so related settings
    // are never split apart: the display toggles and the language picker
    // together, both locks (the master password and the per-chat codes)
    // together, everything about paying together, then the help and admin
    // entries, and the destructive account actions last where a scroll cannot
    // hit them by accident.
    // ======================================================
    return ListView(
      // Section headers carry their own horizontal padding, so the list itself
      // only needs room at the bottom. Matches the other edge-to-edge tile
      // lists in the app.
      padding: const EdgeInsets.only(bottom: 24.0),
      children: [
        // ======================================================
        // APPEARANCE
        //
        // Neither tile below may set `isThreeLine`. Flutter's ListTile asserts
        // that a three-line tile has a subtitle, and a title-only tile asserted
        // that way took down this whole screen with a red error. These tiles
        // have no subtitle, so the flag has to stay off.
        // ======================================================
        const _SettingsSectionHeader('Appearance'),

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

        ListTile(
          leading: const Icon(Icons.language),
          title: Text(loc.language),
          subtitle: Text(activeNativeName),
          trailing: const Icon(Icons.chevron_right),
          onTap: _showLanguageSelectionDialog,
        ),

        // ======================================================
        // PRIVACY AND SECURITY
        //
        // Both kinds of lock live here: the master password that guards this
        // whole screen, and the per-chat codes listed underneath it.
        // ======================================================
        const _SettingsSectionHeader('Privacy and security'),

        SwitchListTile(
          title: const Text('Protect settings with master password'),
          subtitle: const Text('Require password to access settings'),
          value: _settingsProtectionEnabled,
          onChanged: _handleSettingsProtectionChanged,
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
          child: Text(
            loc.secureConversations,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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

        // ======================================================
        // PREMIUM
        //
        // The locked chats above are the only premium feature today, and the
        // only way to unlock them is an admin turning on the flag after
        // seeing a receipt. Spell that out rather than leaving people to
        // guess why paying changed nothing.
        // ======================================================
        const _SettingsSectionHeader('Premium'),

        ListTile(
          leading: const Icon(Icons.receipt_long_outlined),
          title: const Text('Get Lifetime Premium'),
          subtitle: Text(
            _isPremiumUser
                ? 'Premium is on for your account'
                : _pendingProof
                    ? 'Waiting for an admin to review your screenshot'
                    : '${PremiumOffer.minimumAmountLabel} once with Phoenix, '
                        'then send a screenshot',
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
                      ? 'Your screenshot is in. An admin checks it and premium '
                          'turns on for your account within '
                          '${PremiumOffer.activationWindow}.'
                      : '1. Pay ${PremiumOffer.minimumAmountLabel} with '
                          '${PremiumOffer.paymentMethod}.\n'
                          '2. Screenshot the payment confirmation.\n'
                          '3. Send it from Submit payment proof.\n'
                          '4. Premium turns on and stays on for life.\n\n'
                          'CRYPT is built by a solo developer, and this is '
                          'the whole offer: one payment, no subscription.',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),

        // ======================================================
        // HELP AND LEGAL
        // ======================================================
        const _SettingsSectionHeader('Help and legal'),

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
        // ADMINISTRATION
        //
        // The access code is verified by the server, so it is not stored in
        // the app and cannot be pulled out of the APK.
        // ======================================================
        const _SettingsSectionHeader('Administration'),

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

        // ======================================================
        // ACCOUNT
        //
        // Last on purpose: signing out and wiping the device are the two
        // actions on this screen that cannot be undone.
        // ======================================================
        const _SettingsSectionHeader('Account'),

        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: _handleLogout,
              icon: const Icon(Icons.logout),
              label: Text(loc.logout),
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

/// Asks for the master password that guards Settings.
///
/// Self contained so the [TextEditingController] is disposed with the dialog
/// rather than the instant `showDialog` returns, which left the field holding
/// a disposed controller while the route was still animating away.
class _MasterPasswordDialog extends StatefulWidget {
  const _MasterPasswordDialog();

  @override
  State<_MasterPasswordDialog> createState() => _MasterPasswordDialogState();
}

class _MasterPasswordDialogState extends State<_MasterPasswordDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _submit() {
    Navigator.pop(context, _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: Text(loc.masterAuthenticationRequired),
        content: TextField(
          controller: _controller,
          autofocus: true,
          obscureText: true,
          textInputAction: TextInputAction.go,
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            labelText: loc.accountPasswordLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.cancel),
          ),
          FilledButton(
            onPressed: _submit,
            child: Text(loc.verify),
          ),
        ],
      ),
    );
  }
}

/// Asks for a four digit PIN and returns it, or null if cancelled.
///
/// Self contained on purpose: it owns the [TextEditingController] and the
/// validation message and disposes both in its own [dispose]. Building this by
/// hand with a `StatefulBuilder` and disposing the controller as soon as
/// `showDialog` returned left the text field attached to a disposed controller
/// while the dialog was still on its way out, which is what produced the
/// `dependents.isEmpty` assertion as soon as a chat lock was tapped.
///
/// Non numeric characters are rejected by an input formatter rather than by
/// rewriting `controller.text` from inside `onChanged`. Assigning to the
/// controller while the field is handling its own change re-enters the text
/// field's listener and can tear down an element mid-update.
class _PinEntryDialog extends StatefulWidget {
  final String title;

  final String helper;

  const _PinEntryDialog({required this.title, required this.helper});

  @override
  State<_PinEntryDialog> createState() => _PinEntryDialogState();
}

class _PinEntryDialogState extends State<_PinEntryDialog> {
  final TextEditingController _controller = TextEditingController();

  String _errorText = "";

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _submit() {
    final String digits = _controller.text;

    if (digits.length != 4) {
      setState(() {
        _errorText = "Enter exactly 4 digits.";
      });

      return;
    }

    Navigator.pop(context, digits);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.helper,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 14),

          TextField(
            controller: _controller,
            autofocus: true,
            obscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 4,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              labelText: loc.secureKeyPasscode,
              counterText: "",
              border: const OutlineInputBorder(),
              errorText: _errorText.isEmpty ? null : _errorText,
            ),
            onChanged: (String value) {
              if (_errorText.isEmpty) return;

              setState(() {
                _errorText = "";
              });
            },
            onSubmitted: (_) => _submit(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.cancel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(loc.ok),
        ),
      ],
    );
  }
}

/// Heading that introduces a group of related settings.
///
/// Replaces the bare [Divider]s the list used to be split with, so the section
/// a control belongs to is named rather than implied by a line on the screen.
class _SettingsSectionHeader extends StatelessWidget {
  final String label;

  const _SettingsSectionHeader(this.label);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Text(
        label.toUpperCase(),
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
