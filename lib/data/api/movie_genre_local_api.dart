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

  Future<bool> createGenresMap(List<Map<String, dynamic>> genres) async {
    final value = genres.map((e) => jsonEncode(e)).toList();

    return await _prefs.createStringList('genres', value);
  }

  Future<bool> createGenreUpdatedDate() async {
    final date = DateTime.now();
    final value = '${date.year}-${date.month}-${date.day}';

    return await _prefs.createString('genreUpdateDate', value);
  }

  Future<String?> getGenreUpdatedDate() async {
    return await _prefs.getString('genreUpdateDate');
  }
}
