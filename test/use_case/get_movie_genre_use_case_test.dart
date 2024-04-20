import 'package:flutter_test/flutter_test.dart';
import 'package:level_ormmovie/domain/model/movie_genre.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_genre_use_case.dart';

import '../mock/mock_movie_genre_repository_impl.dart';

void main() {
  group('GetMovieGenreUseCase 클래스', () {
    final movieGenreRepository = MockMovieGenreRepositoryImpl();
    final getMovieGenreUseCase =
        GetMovieGenreUseCase(movieGenreRepository: movieGenreRepository);
    setUp(() {
      movieGenreRepository.init();
    });
    group('execute 메소드는', () {
      test('movieGenreRepository.getMovieGenreList를 한번 호출한다.', () async {
        // when
        await getMovieGenreUseCase.execute();
        // then
        expect(movieGenreRepository.getMovieGenreListCallCount, 1);
      });

      test('movieGenreRepository.getMovieGenreList의 반환값을 반환한다.', () async {
        // given
        movieGenreRepository.movieGenreList = [
          const MovieGenre(id: 1, name: 'name1'),
          const MovieGenre(id: 2, name: 'name2'),
        ];
        final expected = movieGenreRepository.movieGenreList;

        // when
        final actual = await getMovieGenreUseCase.execute();

        // then
        expect(actual, expected);
      });
    });
  });
}
