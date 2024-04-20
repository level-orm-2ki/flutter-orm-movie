import 'package:level_ormmovie/domain/model/movie_detail.dart';

import '../model/movie.dart';

abstract interface class MovieRepository{
Future<List<Movie>> getMovieInfoData();

Future<List<Movie>> getMoviesByGenres(int genres);

Future<MovieDetail> getMovieDetail(int movie_Id);
}