import 'dart:convert';

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
import '../services/session_service.dart';
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

  bool _isPremiumUser = false;
  bool _isCountdownRunning = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _isDarkMode = widget.isDarkMode;
    _showSplashScreen = widget.showSplashScreen;

    _checkLockoutTimerState();
    _loadPasscodePreferences();
    _loadCurrentLanguage();
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

      await _promptMasterPassword();
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

        await _promptMasterPassword();

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
    final prefs = await SharedPreferences.getInstance();

    try {
      final String? rawConversationsJson = prefs.getString(
        'active_conversations_list',
      );

      if (rawConversationsJson != null && rawConversationsJson.isNotEmpty) {
        final List<dynamic> decodedList = jsonDecode(rawConversationsJson);

        if (mounted) {
          setState(() {
            _availableChats.clear();

            for (var item in decodedList) {
              _availableChats.add({
                "id": item["id"].toString(),
                "name": item["name"].toString(),
              });
            }
          });
        }
      }
    } catch (e) {
      debugPrint("Failed to fetch active database chats: $e");
    }

    if (!mounted) return;

    setState(() {
      _isPremiumUser = prefs.getBool('account_is_premium') ?? false;

      final savedLocks = prefs.getStringList('locked_conversation_ids') ?? [];

      _lockedChatIds.clear();
      _lockedChatIds.addAll(savedLocks);
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

    bool progressDialogOpen = true;

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

    if (!mounted) return;

    if (progressDialogOpen) {
      Navigator.of(context, rootNavigator: true).pop();

      progressDialogOpen = false;
    }

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

  Future<void> _toggleChatCheckbox(String chatId, bool isChecked) async {
    final prefs = await SharedPreferences.getInstance();

    final loc = AppLocalizations.of(context)!;

    if (isChecked) {
      if (_lockedChatIds.isNotEmpty && !_isPremiumUser) {
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

        return;
      }

      bool setupCompleted = false;

      if (_isPremiumUser) {
        if (!mounted) return;

        final String? lockType = await showDialog<String>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(loc.selectSecureLockMethod),
            content: Text(loc.selectSecureLockDescription),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, "PIN"),
                child: Text(loc.fourDigitPin),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, "BIOMETRIC"),
                child: Text(loc.fingerprintUnlock),
              ),
            ],
          ),
        );

        if (lockType != null) {
          setupCompleted = true;

          await prefs.setString("lock_type_$chatId", lockType);
        }
      } else {
        setupCompleted = true;
      }

      if (setupCompleted) {
        if (!mounted) return;

        setState(() {
          _lockedChatIds.add(chatId);
        });

        await prefs.setStringList('locked_conversation_ids', _lockedChatIds);
      }
    } else {
      if (!mounted) return;

      setState(() {
        _lockedChatIds.remove(chatId);
      });

      await prefs.setStringList('locked_conversation_ids', _lockedChatIds);

      await prefs.remove("pin_$chatId");

      await prefs.remove("lock_type_$chatId");
    }
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
    final loc = AppLocalizations.of(context)!;

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
        // ======================================================
        SwitchListTile(
          title: Text(loc.darkThemeMode, softWrap: true),
          isThreeLine: true,
          value: _isDarkMode,
          onChanged: _handleThemeChanged,
        ),

        SwitchListTile(
          title: Text(loc.showSplashScreen, softWrap: true),
          isThreeLine: true,
          value: _showSplashScreen,
          onChanged: (value) {
            setState(() {
              _showSplashScreen = value;
            });
            widget.onSplashScreenChanged?.call(value);
          },
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
              title: Text(chat["name"]!),
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
