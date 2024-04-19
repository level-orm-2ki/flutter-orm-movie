import 'package:level_ormmovie/data/api/movie_genre_local_api.dart';

class MockMovieGenreApiImpl implements MovieGenreLocalApi {
  String? key;
  int getGenresMapCallCount = 0;
  int createGenresMapCallCount = 0;

  void init() {
    key = null;
    getGenresMapCallCount = 0;
    createGenresMapCallCount = 0;
  }

  @override
  Future<bool> createGenresMap(List<Map<String, dynamic>> genres) async {
    // TODO: implement createGenresMap
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getGenresMap() async {
    getGenresMapCallCount++;
    return [
      {'id': 28, 'name': 'Action'}
    ];
  }
}
