import 'package:level_ormmovie/domain/model/movie_genre.dart';

abstract interface class MovieGenreRepository {
  Future<List<MovieGenre>> getMovieGenreList();
}
