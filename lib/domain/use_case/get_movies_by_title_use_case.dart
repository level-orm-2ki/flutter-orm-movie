import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class GetMoviesByTitleUseCase {
  final MovieRepository _movieRepository;

  const GetMoviesByTitleUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<List<Movie>> execute(String query) async {
    final moviesByTitle = await _movieRepository.getMoviesByTitle(query);

    return moviesByTitle;
  }
}
