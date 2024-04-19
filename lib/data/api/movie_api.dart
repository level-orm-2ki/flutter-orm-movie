import 'dart:convert';
import 'package:level_ormmovie/core/config/themoviedb_config.dart';
import 'package:http/http.dart' as http;
import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';
import '../dto/movie_dto.dart';

class MovieApi {
  final headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${TheMovieDbConfig.accessToken}'
  };

  Future<MovieDto> getMovieInfo() async {
    final String apiUrl =
        '${TheMovieDbConfig.baseUrl}/3/movie/upcoming?language=ko&page=1';
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

  Future<MovieDto> getMovieByGenres(int genres) async {
    final String apiUrl =
        '${TheMovieDbConfig.baseUrl}/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=$genres';

    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('TheMoviedb api by genrs error');
    }
    final json = jsonDecode(response.body);
    return MovieDto.fromJson(json);
  }
  Future<MovieDetailDto> getMovieDetail(int movie_Id) async {
    final String apiUrl = '${TheMovieDbConfig.baseUrl}/3/movie/$movie_Id';

    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Error on Movie Detail db api with Network');
    }
    return MovieDetailDto.fromJson(jsonDecode(response.body));
  }

}
