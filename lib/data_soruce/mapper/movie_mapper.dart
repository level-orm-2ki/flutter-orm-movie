import '../../domain/model/movie.dart';
import '../dto/movie_dto.dart';

extension ToMovie on ResultDto{
  Movie toMovie(){
    return Movie(
      id : id?.toInt() ?? 0,
      title:  title ?? '' ,
      posterPath:  posterPath ?? '',
      originalTitle:  originalTitle ?? '',
      overview:  overview ?? '',
        releaseDate: releaseDate ?? '',
      voteCount: voteCount ?? '',
    );
  }
}