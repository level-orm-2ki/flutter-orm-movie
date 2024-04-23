import 'package:get_it/get_it.dart';
import 'package:level_ormmovie/core/util/shared_preferences_util.dart';
import 'package:level_ormmovie/data/api/movie_api.dart';
import 'package:level_ormmovie/data/api/movie_ganre_api.dart';
import 'package:level_ormmovie/data/api/movie_genre_local_api.dart';
import 'package:level_ormmovie/data/repository/movie_genre_repository_impl.dart';
import 'package:level_ormmovie/data/repository/movie_repository_impl.dart';
import 'package:level_ormmovie/domain/repository/movie_genre_repository.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_detail_by_movie_Id_use_case.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_genre_use_case.dart';
import 'package:level_ormmovie/domain/use_case/get_movies_by_title_use_case.dart';

import '../domain/model/movie_detail.dart';
import '../domain/repository/movie_repository.dart';
import '../domain/use_case/movie_upcomming_use_case.dart';
import '../presentation/main_view_model.dart';
import '../presentation/movie_detail_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(movieApi: MovieApi()));
  getIt.registerSingleton<MovieGenreRepository>(MovieGenreRepositoryImpl(
      movieGenreLocalApi: MovieGenreLocalApi(SharedPreferencesUtil()),
      movieGenreApi: MovieGenreApi()));
  getIt.registerSingleton<MovieUpcomingUseCase>(
      MovieUpcomingUseCase(movieRepository: getIt()));
  getIt.registerSingleton<GetMovieGenreUseCase>(GetMovieGenreUseCase(
      movieGenreRepository: getIt()));
  getIt.registerSingleton<GetMoviesByTitleUseCase>(
      GetMoviesByTitleUseCase(movieRepository: getIt()));
  getIt.registerSingleton<GetMovieDetailByMovieIdUseCase>(
      GetMovieDetailByMovieIdUseCase(
          movieRepository: getIt()));
  getIt.registerFactory<MovieViewModel>(
      () => MovieViewModel(
          movieRepository: getIt(),
          movieGenreRepository: getIt()), instanceName: 'mainView');
  getIt.registerFactory<MovieDetailViewModel>(() => MovieDetailViewModel(
        getMovieDetailByMovieIdUseCase: getIt(),
      ));
}
