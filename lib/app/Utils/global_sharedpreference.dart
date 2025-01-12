import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  SharedPreferences? _preferences;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    print("SharedPreferences initialized");
  }

  Future<void> _ensureInitialized() async {
    if (_preferences == null) {
      await init();
    }
  }

  Future<void> saveString(String key, String value) async {
    await _ensureInitialized();
    await _preferences!.setString(key, value);
  }

  Future<String?> getString(String key) async {
    await _ensureInitialized();
    return _preferences!.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    await _ensureInitialized();
    await _preferences!.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    await _ensureInitialized();
    return _preferences!.getInt(key);
  }

  Future<void> saveDouble(String key, double value) async {
    await _ensureInitialized();
    await _preferences!.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    await _ensureInitialized();
    return _preferences!.getDouble(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _ensureInitialized();
    await _preferences!.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    await _ensureInitialized();
    return _preferences!.getBool(key);
  }
}
 
