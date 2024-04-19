import 'package:flutter_test/flutter_test.dart';
import 'package:level_ormmovie/data_soruce/api/movie_genre_local_api.dart';

import '../mock/mock_shared_preferences_uitl.dart';

void main() {
  group('MovieGenreLocalApi 클래스', () {
    final mockSharedPreferencesUtil = MockSharedPreferencesUtil();
    final movieGenreLocalApi = MovieGenreLocalApi(mockSharedPreferencesUtil);
    setUp(() => {
          mockSharedPreferencesUtil.init(),
        });
    group('getGenresMap 메소드는', () {
      test('genres 키에 담긴 genres Map 객체를 반환한다.', () async {
        // given
        final expected = [
          {'id': 28, 'name': 'Action'}
        ];

        // when
        final actual = await movieGenreLocalApi.getGenresMap();

        // then
        expect(actual.first['id'], expected.first['id']);
        expect(actual.first['name'], expected.first['name']);
      });

      test('SharedPreferencesUtil의 getStringList 메소드를 1번 호출한다.', () async {
        // given
        int expected = 1;

        // when
        await movieGenreLocalApi.getGenresMap();

        // then
        expect(mockSharedPreferencesUtil.getStringListCallCount, expected);
      });

      test('SharedPreferencesUtil의 getStringList 함수에 genre라는 key값을 전달한다.',
          () async {
        // given
        const String expected = 'genres';

        // when
        await movieGenreLocalApi.getGenresMap();

        // then
        expect(mockSharedPreferencesUtil.key, expected);
      });
    });
  });
}
