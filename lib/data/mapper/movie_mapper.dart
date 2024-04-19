import '../../domain/model/movie.dart';
import '../dto/movie_dto.dart';

extension ToMovie on ResultDto {
  Movie toMovie() {
    return Movie(
      id: id?.toInt() ?? 0,
      title: title ?? '',
      posterPath: posterPath ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      releaseDate: releaseDate ?? '',
      voteCount: voteCount?.toInt() ?? 0,
      popularity: popularity ?? 0.0,
      voteAverage: voteAverage ?? 0.0,
      video: video ?? false,
    );
  }
}
