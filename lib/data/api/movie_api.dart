import 'dart:convert';
import 'package:level_ormmovie/core/config/themoviedb_config.dart';
import 'package:http/http.dart' as http;
import '../dto/movie_dto.dart';

class MovieApi {
  final headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${TheMovieDdConfig.accessToken}'
  };

  Future<MovieDto> getMovieInfo() async {
    final String apiUrl =
        '${TheMovieDdConfig.baseUrl}/3/movie/upcoming?language=ko&page=1';
    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('TheMoviedb api error');
    }
    final json = jsonDecode(response.body);
    return MovieDto.fromJson(json);
  }
}
