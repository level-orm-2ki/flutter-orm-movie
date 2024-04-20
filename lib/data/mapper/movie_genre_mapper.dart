import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';
import 'package:level_ormmovie/domain/model/movie_genre.dart';

extension ToMovieGenre on Genres {
  MovieGenre toMovieGenre() {
    return MovieGenre(
      id: id?.toInt() ?? -1,
      name: name ?? '',
    );
  }
}
