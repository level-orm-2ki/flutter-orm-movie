import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:level_ormmovie/data/api/movie_api.dart';

import '../mock/mock_movie_api_impl.dart';

void main() async {
  group('MovieApi class', () {
    final mockMovieApi = MockMovieApiImpl();
    group('MovieApi getMovieByGenres 메서드는', () {
      group('int genres 입력에 따라 다른 결과를 리턴하는데', () {
        test('genres가 28이면 액션이 포함된 영화들에 대한 정보를 리턴한다', () async {
          // given
          const expected = 0;

          // when
          // getMovieByGenre(28)을 호출하면 genre_ids에 28이 포함된
          // 영화의 정보들이 리스트로 넘어온다.
          final getMovieByGenresCall = await mockMovieApi.getMovieByGenres(28);

          // 리스트에서 genre_ids 리스트들만 꺼내서
          final actualGenresVal =
              getMovieByGenresCall.results?.map((e) => e.genreIds).toList();

          // then
          // 각 genre_ids에 28이 포함되어있지 않은 것은 없을 것이라 예상하므로
          // 28이 없는 genre_ids 리스트의 숫자는 0이다.
          expect(
              actualGenresVal?.where((e) => !e!.contains(28)).length ==
                  expected,
              true);
        });

        test('genres가 16이면 애니메이션이 포함된 영화들에 대한 정보를 리턴한다', () async {
          // given
          const expected = 0;

          // when
          // getMovieByGenre(28)을 호출하면 genre_ids에 28이 포함된
          // 영화의 정보들이 리스트로 넘어온다.
          final getMovieByGenresCall = await mockMovieApi.getMovieByGenres(12);

          // 리스트에서 genre_ids 리스트들만 꺼내서
          final actualGenresVal =
              getMovieByGenresCall.results?.map((e) => e.genreIds).toList();

          // then
          // 각 genre_ids에 28이 포함되어있지 않은 것은 없을 것이라 예상하므로
          // 28이 없는 genre_ids 리스트의 숫자는 0이다.
          expect(
              actualGenresVal?.where((e) => !e!.contains(12)).length ==
                  expected,
              true);
        });
      });
    });

    group('MovieApi getMoviesByTitle은', () {
      group('String query 입력에 따라 다른 결과를 리턴하는데', () {
        test('query를 넣으면 제목에 query가 들어간 영화가 나온다', () async {
          const expected = 'usual';
          final getMovieByTitleCall =
              await mockMovieApi.getMoviesByTitle('usual');

          expect(
              getMovieByTitleCall.results
                  ?.where((e) => e.title != expected)
                  .isEmpty,
              true);
        });

        test('query를 넣으면 제목에 query가 들어간 영화가 나온다', () async {
          const expected = 'kungfu';
          final getMovieByTitleCall =
          await mockMovieApi.getMoviesByTitle('kungfu');

          expect(
              getMovieByTitleCall.results
                  ?.where((e) => e.title != expected)
                  .isEmpty,
              true);
        });
      });
    });
  });
}
