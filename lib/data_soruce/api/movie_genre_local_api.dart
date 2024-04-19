import 'dart:convert';

import 'package:level_ormmovie/core/util/shared_preferences_util.dart';

class MovieGenreLocalApi {
  final SharedPreferencesUtil _prefs;

  MovieGenreLocalApi(this._prefs);

  Future<List<Map<String, dynamic>>> getGenresMap() async {
    final value = await _prefs.getStringList('genres');

    return value?.map((e) => jsonDecode(e) as Map<String, dynamic>).toList() ??
        [];
  }
}