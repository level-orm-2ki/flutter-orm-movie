// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['posterPath'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      releaseDate: json['releaseDate'] as String,
      voteCount: json['voteCount'] as String,
      popularity: json['popularity'] as String,
      voteAverage: json['voteAverage'] as String,
      video: json['video'] as bool,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'voteCount': instance.voteCount,
      'popularity': instance.popularity,
      'voteAverage': instance.voteAverage,
      'video': instance.video,
    };
