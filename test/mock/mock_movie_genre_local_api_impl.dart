import 'package:level_ormmovie/data/api/movie_genre_local_api.dart';

class MockMovieGenreLocalApiImpl implements MovieGenreLocalApi {
  String? key;
  int getGenresMapCallCount = 0;
  int createGenresMapCallCount = 0;
  int getGenreUpdatedDateCallCount = 0;
  int createGenreUpdatedDateCallCount = 0;
  bool createGenreUpdatedDateValue = false;
  List<Map<String, dynamic>> getGenresMapReturnValue = [];
  String genreUpdatedDate = '';
  bool createGenresMapReturnValue = false;

  void init() {
    key = null;
    getGenresMapCallCount = 0;
    createGenresMapCallCount = 0;
    getGenreUpdatedDateCallCount = 0;
    createGenreUpdatedDateCallCount = 0;
    genreUpdatedDate = '';
    getGenresMapReturnValue = [];
    createGenreUpdatedDateValue = false;
    createGenresMapReturnValue = false;
  }

  @override
  Future<bool> createGenresMap(List<Map<String, dynamic>> genres) async {
    createGenresMapCallCount++;
    return createGenresMapReturnValue;
  }

  @override
  Future<List<Map<String, dynamic>>> getGenresMap() async {
    getGenresMapCallCount++;
    return [
      {'id': 28, 'name': 'Action'}
    ];
  }

  @override
  Future<bool> createGenreUpdatedDate() async {
    createGenreUpdatedDateCallCount++;
    return createGenreUpdatedDateValue!;
  }

  @override
  Future<String?> getGenreUpdatedDate() async {
    getGenreUpdatedDateCallCount++;
    return genreUpdatedDate;
  }
}
