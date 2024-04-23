// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailImpl _$$MovieDetailImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailImpl(
      genres: (json['genres'] as List<dynamic>).map(Genres.fromJson).toList(),
      overView: json['overView'] as String,
      popularity: json['popularity'] as num,
      releaseDate: json['releaseDate'] as String,
      status: json['status'] as String,
      title: json['title'] as String,
      voteAverage: json['voteAverage'] as int,
      posterPath: json['posterPath'] as String,
    );

Map<String, dynamic> _$$MovieDetailImplToJson(_$MovieDetailImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'overView': instance.overView,
      'popularity': instance.popularity,
      'releaseDate': instance.releaseDate,
      'status': instance.status,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'posterPath': instance.posterPath,
    };
