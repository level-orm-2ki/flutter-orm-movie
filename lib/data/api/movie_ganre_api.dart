import 'dart:convert';
import 'package:level_ormmovie/core/config/themoviedb_config.dart';
import 'package:http/http.dart' as http;
import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';

class MovieGenreApi {
  final headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${TheMovieDbConfig.accessToken}'
  };

  Future<List<Genres>> getGenres() async {
    final http.Response response = await http.get(
      Uri.parse('${TheMovieDbConfig.baseUrl}/3/genre/movie/list?language=ko'),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('network error');
    }

    return (jsonDecode(response.body)["genres"] as List)
        .map((e) => Genres.fromJson(e))
        .toList();
  }
}
