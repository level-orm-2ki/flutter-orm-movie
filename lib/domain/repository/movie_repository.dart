import '../model/movie.dart';

abstract interface class MovieRepository{
Future<List<Movie>> getMovieInfoData();

Future<List<Movie>> getMoviesByGenres(int genres);
}