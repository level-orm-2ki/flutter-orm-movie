import 'package:level_ormmovie/domain/model/movie_genre.dart';
import 'package:level_ormmovie/domain/repository/movie_genre_repository.dart';

class GetMovieGenreUseCase {
  final MovieGenreRepository _movieGenreRepository;

  GetMovieGenreUseCase({
    required MovieGenreRepository movieGenreRepository,
  }) : _movieGenreRepository = movieGenreRepository;

  Future<List<MovieGenre>> execute() async {
    return await _movieGenreRepository.getMovieGenreList();
  }
}
