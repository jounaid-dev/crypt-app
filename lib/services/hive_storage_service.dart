import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiveStorageService {
  static const String _boxName = 'app_preferences_box';
  static const String _secureKeyName = 'hive_storage_key';
  static const String _migrationFlagKey = 'has_migrated_sp_to_hive';

  static Box<dynamic>? _box;

  /// Call this inside main() before runApp()
  static Future<void> initialize() async {
    await Hive.initFlutter();
    final encryptionKey = await _getOrCreateEncryptionKey();

    _box = await Hive.openBox<dynamic>(
      _boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );

    await _migrateSharedPreferencesData();
  }

  /// One-time automatic transfer of existing SharedPreferences into Hive
  static Future<void> _migrateSharedPreferencesData() async {
    if (_box?.get(_migrationFlagKey, defaultValue: false) == true) return;

    debugPrint('[HiveStorage] Migrating existing SharedPreferences to Hive...');
    final prefs = await SharedPreferences.getInstance();
    final Set<String> keys = prefs.getKeys();

    for (String key in keys) {
      final value = prefs.get(key);
      if (value != null) {
        await _box?.put(key, value);
      }
    }

    await _box?.put(_migrationFlagKey, true);
    debugPrint('[HiveStorage] Migration completed successfully.');
  }

  /// Securely fetches or generates the AES encryption key
  static Future<Uint8List> _getOrCreateEncryptionKey() async {
    const secureStorage = FlutterSecureStorage();
    final String? existingKey = await secureStorage.read(key: _secureKeyName);

    if (existingKey != null) {
      return base64Url.decode(existingKey);
    }

    final newKey = Hive.generateSecureKey();
    await secureStorage.write(
      key: _secureKeyName,
      value: base64Url.encode(newKey),
    );
    return Uint8List.fromList(newKey);
  }

  // --- Drop-in SharedPreferences Equivalents ---

  static List<String>? getStringList(String key) {
    final dynamic data = _box?.get(key);
    if (data is List) {
      return data.cast<String>();
    }
    return null;
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await _box?.put(key, value);
  }

  static String? getString(String key) {
    return _box?.get(key) as String?;
  }

  static Future<void> setString(String key, String value) async {
    await _box?.put(key, value);
  }

  static bool? getBool(String key) {
    return _box?.get(key) as bool?;
  }

  static Future<void> setBool(String key, bool value) async {
    await _box?.put(key, value);
  }

  static Set<String> getKeys() {
    return _box?.keys.cast<String>().toSet() ?? {};
  }

  static Future<void> remove(String key) async {
    await _box?.delete(key);
  }
}