import 'package:flutter_test/flutter_test.dart';
import 'package:level_ormmovie/data/repository/movie_genre_local_repository_impl.dart';

import '../mock/mock_movie_genre_local_api_impl.dart';

void main() {
  group('MovieGenreLocalRepository 클래스', () {
    final mockMovieGenreApiImpl = MockMovieGenreApiImpl();
    final movieGenreLocalRepository = MovieGenreLocalRepositoryImpl(mockMovieGenreApiImpl);
    setUp(() => {
      mockMovieGenreApiImpl.init(),
    });
    group('getMovieGenreList 메소드는', () {
      test('MovieGenreLocalApi의 getGenresMap 메소드를 호출한다.', () async {
        // given
        int expected = 1;

        // when
        await movieGenreLocalRepository.getMovieGenreList();

        // then
        expect(mockMovieGenreApiImpl.getGenresMapCallCount, expected);
      });

      test('MovieGenreLocalApi의 getGenresMap 메소드의 반환값을 MovieGenre 리스트로 변환하여 반환한다.', () async {
        // given
        final expected = [
          {'id': 28, 'name': 'Action'}
        ];

        // when
        final actual = await movieGenreLocalRepository.getMovieGenreList();

        // then
        expect(actual.first.id, expected.first['id']);
        expect(actual.first.name, expected.first['name']);
      });
    });
  });
}
