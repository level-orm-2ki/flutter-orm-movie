import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class MovieUpcommingUseCase {
  final MovieRepository _repository;

  const MovieUpcommingUseCase({
    required MovieRepository repository,
  }) : _repository = repository;

  Future<List<Movie>> getMovies() {
    return _repository.getMovieInfoData();
  }
}
