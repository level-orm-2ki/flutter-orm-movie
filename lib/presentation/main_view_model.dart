import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:level_ormmovie/data/repository/movie_repository_impl.dart';
import 'package:level_ormmovie/domain/model/movie.dart';
import 'package:level_ormmovie/domain/repository/movie_genre_repository.dart';
import 'package:level_ormmovie/domain/repository/movie_repository.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_genre_use_case.dart';
import 'package:level_ormmovie/domain/use_case/get_movies_by_genres_use_case.dart';
import 'package:level_ormmovie/domain/use_case/get_movies_by_title_use_case.dart';

import '../domain/model/movie_genre.dart';
import '../domain/use_case/movie_upcomming_use_case.dart';

class MovieViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;
  final MovieGenreRepository _movieGenreRepository;

  List<Movie> movies = [];
  List<MovieGenre> genres = [];
  int? _selectedGenreId;
  String _searchQuery = '';
  List<Movie> moviesByGenre = [];

  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  int? get selectedGenreId => _selectedGenreId;

  set selectedGenreId(int? value) {
    _selectedGenreId = value;
    notifyListeners();
  }

  MovieViewModel({
    required MovieRepository movieRepository,
    required MovieGenreRepository movieGenreRepository,
  })  : _movieRepository = movieRepository,
        _movieGenreRepository = movieGenreRepository;

  Future<void> getUpComingMovieInfo() async {
    movies =
        await MovieUpcomingUseCase(movieRepository: _movieRepository).execute();
    notifyListeners();
  }

  Future<void> getMovieGenres() async {
    genres =
        await GetMovieGenreUseCase(movieGenreRepository: _movieGenreRepository)
            .execute();
    notifyListeners();
  }

  Future<void> getMoviesByGenres(int genreId) async {
    movies = await GetMoviesByGenresUseCase(movieRepository: _movieRepository)
        .execute(genreId);
    notifyListeners();
  }

  Future<void> getMovieByTitle(String query) async {
    movies = await GetMoviesByTitleUseCase(movieRepository: _movieRepository)
        .execute(query);
    notifyListeners();
  }
}
