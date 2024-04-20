import 'package:level_ormmovie/data/api/movie_ganre_api.dart';
import 'package:level_ormmovie/data/api/movie_genre_local_api.dart';
import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';
import 'package:level_ormmovie/data/mapper/movie_genre_mapper.dart';
import 'package:level_ormmovie/domain/model/movie_genre.dart';
import 'package:level_ormmovie/domain/repository/movie_genre_repository.dart';

class MovieGenreRepositoryImpl implements MovieGenreRepository {
  final MovieGenreLocalApi _movieGenreLocalApi;
  final MovieGenreApi _movieGenreApi;

  MovieGenreRepositoryImpl({
    required MovieGenreLocalApi movieGenreLocalApi,
    required MovieGenreApi movieGenreApi,
  })  : _movieGenreLocalApi = movieGenreLocalApi,
        _movieGenreApi = movieGenreApi;

  @override
  Future<List<MovieGenre>> getMovieGenreList() async {
    List<MovieGenre> result = [];
    final localGenreDto = await _movieGenreLocalApi.getGenresMap();

    if (localGenreDto.isEmpty ||
        !_isUpdatedToday(await _movieGenreLocalApi.getGenreUpdatedDate())) {
      final movieGenreList = await _movieGenreApi.getGenres();
      result = movieGenreList.map(_genreDtoToGenre).toList();

      await Future.wait([
        _movieGenreLocalApi.createGenreUpdatedDate(),
        _saveMovieGenreList(result)
      ]);
    } else {
      result = localGenreDto.map(_jsonToGenre).toList();
    }

    return result;
  }

  Future<bool> _saveMovieGenreList(List<MovieGenre> movieGenreList) async {
    final genres = movieGenreList.map((e) => e.toJson()).toList();

    return await _movieGenreLocalApi.createGenresMap(genres);
  }

  MovieGenre _genreDtoToGenre(Genres dto) {
    return dto.toMovieGenre();
  }

  MovieGenre _jsonToGenre(Map<String, dynamic> dto) {
    return MovieGenre(id: dto['id'], name: dto['name']);
  }

  bool _isUpdatedToday(String? date) {
    return date ==
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
  }
}
