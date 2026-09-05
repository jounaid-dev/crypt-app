import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferences {
  static const String _boxName = 'app_preferences_box';
  static const String _secureKeyName = 'hive_storage_key';
  static Box<dynamic>? _box;
  static SharedPreferences? _instance;

  SharedPreferences._();

  /// Drop-in Replacement for SharedPreferences.getInstance()
  static Future<SharedPreferences> getInstance() async {
    if (_instance != null && _box != null && _box!.isOpen) {
      return _instance!;
    }

    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.initFlutter();
      final key = await _getOrCreateKey();
      _box = await Hive.openBox<dynamic>(
        _boxName,
        encryptionCipher: HiveAesCipher(key),
      );
    } else {
      _box = Hive.box<dynamic>(_boxName);
    }

    _instance = SharedPreferences._();
    return _instance!;
  }

  static Future<Uint8List> _getOrCreateKey() async {
    const storage = FlutterSecureStorage();
    final keyStr = await storage.read(key: _secureKeyName);
    if (keyStr != null) return base64Url.decode(keyStr);

    final newKey = Hive.generateSecureKey();
    await storage.write(key: _secureKeyName, value: base64Url.encode(newKey));
    return Uint8List.fromList(newKey);
  }

  // --- Exact SharedPreferences Methods used by ChatPage ---

  List<String>? getStringList(String key) {
    final dynamic data = _box?.get(key);
    if (data is List) return data.cast<String>();
    return null;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    await _box?.put(key, value);
    return true;
  }

  String? getString(String key) {
    return _box?.get(key) as String?;
  }

  Future<bool> setString(String key, String value) async {
    await _box?.put(key, value);
    return true;
  }

  bool? getBool(String key) {
    return _box?.get(key) as bool?;
  }

  Future<bool> setBool(String key, bool value) async {
    await _box?.put(key, value);
    return true;
  }

  Set<String> getKeys() {
    return _box?.keys.cast<String>().toSet() ?? {};
  }

  Future<bool> remove(String key) async {
    await _box?.delete(key);
    return true;
  }

  Future<bool> clear() async {
    await _box?.clear();
    return true;
  }
}