import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart'; 
import '../services/language_service.dart';
import '../services/language_names.dart';
import '../main.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final String currentLangCode = Localizations.localeOf(context).languageCode;

    // Dynamically fetch the current locales supported by the application shell
    final List<Map<String, String>> availableLanguages = AppLocalizations.supportedLocales.map((locale) {
      final code = locale.languageCode;
      return {
        "code": code,
        "name": LanguageNames.englishNames[code] ?? code.toUpperCase(),
        "native": LanguageNames.nativeNames[code] ?? code.toUpperCase(),
      };
    }).toList();

    // Execute live multi-field filtering query tracking
    List<Map<String, String>> filteredLanguages = availableLanguages.where((lang) {
      final matchName = lang["name"]!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchNative = lang["native"]!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchCode = lang["code"]!.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchName || matchNative || matchCode;
    }).toList();

    // Sort entries alphabetically by native description string, pinning English to position 0
    filteredLanguages.sort((a, b) {
      if (a["code"] == "en") return -1;
      if (b["code"] == "en") return 1;
      return a["native"]!.toLowerCase().compareTo(b["native"]!.toLowerCase());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.language), 
        backgroundColor: const Color(0xFF080808),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: l10n.searchLanguage, 
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF121212),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filteredLanguages.length,
              separatorBuilder: (context, index) => const Divider(color: Color(0xFF1A1A1A), height: 1),
              itemBuilder: (context, index) {
                final lang = filteredLanguages[index];
                final bool isSelected = currentLangCode == lang["code"];
                final String codeBadge = lang["code"]!.toUpperCase();

                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161616),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF262626)),
                    ),
                    child: Text(
                      codeBadge,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  title: Text(
                    lang["native"]!,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  subtitle: Text(
                    lang["name"]!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: isSelected 
                      ? const Icon(Icons.check_circle, color: Colors.blueAccent)
                      : null,
                  onTap: () async {
                    final chosenCode = lang["code"]!;
                    await LanguageService().setLanguage(chosenCode);
                    
                    if (context.mounted) {
                      CryptApp.setLocale(context, Locale(chosenCode));
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}