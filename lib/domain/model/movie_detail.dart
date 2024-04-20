import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/dto/movie_detail_dto.dart';

part 'movie_detail.freezed.dart';

part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required List<Genres> genres,
    required String overView,
    required num popularity,
    required String releaseDate, // "revenue": 683813734
    required String status, // "status": "Released",
    required String title, //  "title": "Dune: Part Two",
    required int voteAverage // "vote_average": 8.293,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, Object?> json) =>
      _$MovieDetailFromJson(json);
}
