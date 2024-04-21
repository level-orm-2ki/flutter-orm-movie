import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class MovieUpcomingUseCase {
  final MovieRepository _repository;

  const MovieUpcomingUseCase({
    required MovieRepository repository,
  }) : _repository = repository;

  Future<List<Movie>> execute() async{
    return await _repository.getMovieInfoData();
  }
}
