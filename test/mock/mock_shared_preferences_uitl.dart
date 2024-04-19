import 'package:level_ormmovie/core/util/shared_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferencesUtil implements SharedPreferencesUtil {
  String? key;
  int getStringListCallCount = 0;

  @override
  Future<List<String>?> getStringList(String key) async {
    this.key = key;
    getStringListCallCount++;

    List<String> result = [];
    if (key == 'genres') {
      result.add('{"id": 28, "name": "Action"}');
    }

    return result;
  }

  void init() {
    key = null;
    getStringListCallCount = 0;
  }

  @override
  Future<bool> createStringList(String key, List<String> value) {
    throw UnimplementedError();
  }

  @override
  Future<SharedPreferences> get sharedPreferences => throw Exception();
}
