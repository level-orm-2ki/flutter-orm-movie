import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';
import 'package:level_ormmovie/domain/model/movie_detail.dart';

extension ToMovieDetail on MovieDetailDto {
  MovieDetail toMovieDetail() {
    return MovieDetail(
         genres: genres ?? [],
         overView: overview ?? '',
         popularity: popularity ?? -1,
         releaseDate: releaseDate ?? '', // "revenue": 683813734
         status: status ?? '', // "status": "Released",
         title: title ?? '', //  "title": "Dune: Part Two",
         voteAverage: voteAverage?.toInt() ?? -1,
      posterPath: posterPath ?? '',
    );
  }
}