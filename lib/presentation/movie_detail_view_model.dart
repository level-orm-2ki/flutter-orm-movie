import 'package:flutter/cupertino.dart';
import 'package:level_ormmovie/domain/model/movie_detail.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_detail_by_movie_Id_use_case.dart';

class MovieDetailViewModel with ChangeNotifier {
  final GetMovieDetailByMovieIdUseCase _getMovieDetailByMovieIdUseCase;
  MovieDetail? moviesDetail;

  bool isLoading = false;

  MovieDetailViewModel(
      {required GetMovieDetailByMovieIdUseCase getMovieDetailByMovieIdUseCase})
      : _getMovieDetailByMovieIdUseCase = getMovieDetailByMovieIdUseCase;

  Future<void> getMovieDetailByMovieIdInfo(movieId) async {
    moviesDetail = await _getMovieDetailByMovieIdUseCase.execute(movieId);
    notifyListeners();
  }
}
