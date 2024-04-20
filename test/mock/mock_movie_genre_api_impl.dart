import 'package:level_ormmovie/data/api/movie_ganre_api.dart';
import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';

class MockMovieGenreApiImpl implements MovieGenreApi {
  int getGenresCallCount = 0;
  List<Genres> getGenresReturnValue = [];

  void init() {
    getGenresCallCount = 0;
    getGenresReturnValue = [];
  }

  @override
  Future<List<Genres>> getGenres() async {
    getGenresCallCount++;
    return getGenresReturnValue;
  }

  @override
  // TODO: implement headers
  Map<String, String> get headers => throw UnimplementedError();
}
