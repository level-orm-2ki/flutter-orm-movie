import 'package:flutter/cupertino.dart';
import 'package:level_ormmovie/domain/model/movie_detail.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_detail_by_movie_Id_use_case.dart';

class MovieDetailViewModel with ChangeNotifier {
  final GetMovieDetailByMovieIdUseCase _getMovieDetailByMovieIdUseCase;

  MovieDetailViewModel(
      {required GetMovieDetailByMovieIdUseCase getMovieDetailByMovieIdUseCase})
      : _getMovieDetailByMovieIdUseCase = getMovieDetailByMovieIdUseCase;

  int selectedMovieId = 0;


  MovieDetail moviesDetailOnViewModel = const MovieDetail(
    genres: [],
    overView: 'over view',
    popularity: -1,
    releaseDate: '',
    status: 'status',
    title: 'title',
    voteAverage: -1,
    posterPath: 'posterPath',
  );

  // bool isLoading = false;

  Future<void> getMovieDetailOnViewModel(int movieId) async {
    moviesDetailOnViewModel =
    await _getMovieDetailByMovieIdUseCase.execute(movieId);
    notifyListeners();
  }
}
