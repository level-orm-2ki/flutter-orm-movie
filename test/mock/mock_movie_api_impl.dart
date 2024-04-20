import 'package:level_ormmovie/data/api/movie_api.dart';
import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';
import 'package:level_ormmovie/data/dto/movie_dto.dart';

class MockMovieApiImpl implements MovieApi {
  @override
  Future<MovieDto> getMovieByGenres(int genres) async {
    final genreVal = genres;

    return MovieDto(results: [
      ResultDto(
        genreIds: [
          genreVal,
        ],
      ),
    ]);
  }

  @override
  Future<MovieDetailDto> getMovieDetail(int movie_Id) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<MovieDto> getMovieInfo() {
    // TODO: implement getMovieInfo
    throw UnimplementedError();
  }

  @override
  Future<MovieDto> getMoviesByTitle(String query) async {
    final queryVal = query;

    return MovieDto(results: [
      ResultDto(
        title: queryVal,
      ),
    ]);
  }

  @override
  // TODO: implement headers
  Map<String, String> get headers => throw UnimplementedError();
}
