import 'package:level_ormmovie/domain/model/movie_detail.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class GetMovieDetailByMovieIdUseCase {
  final MovieRepository _movieRepository;

  GetMovieDetailByMovieIdUseCase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<MovieDetail> execute(int movieId) async {
    final movieDetailByMovieId = await _movieRepository.getMovieDetail(movieId);

    return movieDetailByMovieId;
  }
}
