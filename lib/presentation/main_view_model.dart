import 'package:flutter/cupertino.dart';
import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';

class MovieViewModel with ChangeNotifier {
  final MovieRepository _repository;
  List<Movie> movies = [];

  MovieViewModel({
    required MovieRepository repository,
  }) : _repository = repository;

  Future<void> getUpComingMovieInfo() async {
    movies = await _repository.getMovieInfoData();
    notifyListeners();
  }
}
