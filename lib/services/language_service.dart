import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageKey = "language";

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString(_languageKey);

    if (savedLanguage != null) {
      return savedLanguage;
    }

    final deviceLanguage =
        PlatformDispatcher.instance.locale.languageCode;

    await prefs.setString(
      _languageKey,
      deviceLanguage,
    );

    return deviceLanguage;
  }

  Future<void> setLanguage(
    String language,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _languageKey,
      language,
    );
  }
}