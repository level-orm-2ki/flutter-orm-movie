import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class GetMoviesByGenresUseCase {
  final MovieRepository _movieRepository;

  const GetMoviesByGenresUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<List<Movie>> execute(int genres) async {
    final moviesByGenres = await _movieRepository.getMoviesByGenres(genres);

    return moviesByGenres;
  }
}
