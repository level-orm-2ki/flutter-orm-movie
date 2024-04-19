import 'package:level_ormmovie/domain/model/movie_genre.dart';

abstract interface class MovieGenreLocalRepository {
  Future<List<MovieGenre>> getMovieGenreList();

  Future<bool> saveMovieGenreList(List<MovieGenre> movieGenreList);
}
