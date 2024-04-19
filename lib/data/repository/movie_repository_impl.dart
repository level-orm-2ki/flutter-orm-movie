import 'package:level_ormmovie/data/api/movie_api.dart';
import 'package:level_ormmovie/data/mapper/movie_mapper.dart';
import 'package:level_ormmovie/domain/model/movie.dart';
import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;

  const MovieRepositoryImpl({
    required MovieApi movieApi,
  }) : _movieApi = movieApi;

  @override
  Future<List<Movie>> getMovieInfoData() async {
    final movieDto = await _movieApi.getMovieInfo();
    if (movieDto.results == null) {
      throw Exception('영화 정보를 가져오는데 실패했습니다.');
    }
    return movieDto.results!.map((e) => e.toMovie()).toList();
  }

  @override
  Future<List<Movie>> getMoviesByGenres(int genres) async {
    final movieDto = await _movieApi.getMovieByGenres(genres);

    if (movieDto.results == null) {
      throw Exception('장르 별 영화 정보를 가져오는데 실패했습니다.');
    }

    return movieDto.results!.map((e) => e.toMovie()).toList();
  }
}
