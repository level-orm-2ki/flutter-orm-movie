import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  Future<List<String>?> getStringList(String key) async {
    final prefs = await sharedPreferences;

    return prefs.getStringList(key);
  }

  Future<bool> createStringList(String key, List<String> value) async {
    final prefs = await sharedPreferences;

    return await prefs.setStringList(key, value);
  }

  Future<bool> createString(String key, String value) async {
    final prefs = await sharedPreferences;

    return await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await sharedPreferences;

    return prefs.getString(key);
  }
}
