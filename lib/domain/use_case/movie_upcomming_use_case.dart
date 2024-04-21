import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class MovieUpcomingUseCase {
  final MovieRepository _movieRepository;

  const MovieUpcomingUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  Future<List<Movie>> execute() async{
    return await _movieRepository.getMovieInfoData();
  }
}
