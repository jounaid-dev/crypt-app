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
  ///
  /// This runs before the first frame, so a throw here means the app never
  /// starts: a blank screen with no way out short of clearing app data. The
  /// encrypted box can fail to open through no fault in the code:
  ///
  ///  * the Keystore key is gone (backup restored onto another device,
  ///    keystore reset, "clear data"), so the stored bytes are undecryptable
  ///  * the box files were restored without the key that produced them
  ///
  /// Either way the data is already unreadable, so the box is reset and the
  /// app starts instead of hanging. A second attempt first, because a
  /// transient keystore failure must not cost the user their history.
  static Future<void> initialize() async {
    await Hive.initFlutter();

    // Already open (a second call or a hot restart): never reset it.
    if (Hive.isBoxOpen(_boxName)) {
      _box = Hive.box<dynamic>(_boxName);

      return;
    }

    try {
      await _openBox();
    } catch (firstError) {
      debugPrint(
        '[HiveStorage] Opening the encrypted box failed '
        '($firstError). Retrying once.',
      );

      try {
        await _openBox();
      } catch (error) {
        debugPrint(
          '[HiveStorage] Still unreadable ($error). Resetting local storage '
          'so the app can start; the old data cannot be decrypted anyway.',
        );

        await _resetBox();
        await _openBox();
      }
    }

    await _migrateSharedPreferencesData();
  }

  static Future<void> _openBox() async {
    final encryptionKey = await _getOrCreateEncryptionKey();

    _box = await Hive.openBox<dynamic>(
      _boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  /// Throws away an unreadable box together with the key that came with it.
  static Future<void> _resetBox() async {
    const secureStorage = FlutterSecureStorage();

    try {
      await _box?.close();
    } catch (_) {}

    _box = null;

    try {
      await Hive.deleteBoxFromDisk(_boxName);
    } catch (_) {}

    try {
      await secureStorage.delete(key: _secureKeyName);
    } catch (_) {}
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