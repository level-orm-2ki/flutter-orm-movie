import 'package:level_ormmovie/data/api/movie_genre_local_api.dart';
import 'package:level_ormmovie/domain/model/movie_genre.dart';
import 'package:level_ormmovie/domain/repository/movie_genre_local_repository.dart';

class MovieGenreLocalRepositoryImpl implements MovieGenreLocalRepository {
  final MovieGenreLocalApi _movieGenreLocalApi;

  MovieGenreLocalRepositoryImpl(this._movieGenreLocalApi);

  @override
  Future<List<MovieGenre>> getMovieGenreList() async {
    final result = await _movieGenreLocalApi.getGenresMap();

    return result.map((e) => MovieGenre.fromJson(e)).toList();
  }

  @override
  Future<bool> saveMovieGenreList(List<MovieGenre> movieGanreList) {
    // TODO: implement saveMovieGenreList
    throw UnimplementedError();
  }
}
