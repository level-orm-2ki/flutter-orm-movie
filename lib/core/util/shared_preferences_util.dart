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
}
