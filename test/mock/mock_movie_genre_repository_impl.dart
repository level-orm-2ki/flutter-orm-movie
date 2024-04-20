import 'package:level_ormmovie/data/repository/movie_genre_repository_impl.dart';
import 'package:level_ormmovie/domain/model/movie_genre.dart';

class MockMovieGenreRepositoryImpl implements MovieGenreRepositoryImpl {
  int getMovieGenreListCallCount = 0;
  List<MovieGenre> movieGenreList = [];

  @override
  Future<List<MovieGenre>> getMovieGenreList() async {
    getMovieGenreListCallCount++;

    return movieGenreList;
  }

  void init() {
    getMovieGenreListCallCount = 0;
    movieGenreList = [];
  }
}
