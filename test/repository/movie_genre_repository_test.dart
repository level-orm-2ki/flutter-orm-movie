import 'package:flutter_test/flutter_test.dart';
import 'package:level_ormmovie/data/dto/movie_detail_dto.dart';
import 'package:level_ormmovie/data/repository/movie_genre_repository_impl.dart';

import '../mock/mock_movie_genre_api_impl.dart';
import '../mock/mock_movie_genre_local_api_impl.dart';

void main() {
  group('MovieGenreRepository 클래스', () {
    final mockMovieGenreLocalApiImpl = MockMovieGenreLocalApiImpl();
    final mockMovieGenreApiImpl = MockMovieGenreApiImpl();
    final movieGenreRepository = MovieGenreRepositoryImpl(
        movieGenreLocalApi: mockMovieGenreLocalApiImpl,
        movieGenreApi: mockMovieGenreApiImpl);
    setUp(() {
      mockMovieGenreLocalApiImpl.init();
      mockMovieGenreApiImpl.init();
    });
    group('findAll 메소드는', () {
      test('local에 genre데이터가 없으면 movieGenreApi.getGenres를 한번 호출한다.', () async {
        // given
        mockMovieGenreLocalApiImpl.getGenresMapReturnValue = [];
        mockMovieGenreApiImpl.getGenresReturnValue = [
          Genres(id: 28, name: 'Action')
        ];

        // when
        await movieGenreRepository.getMovieGenreList();

        // then
        expect(mockMovieGenreLocalApiImpl.getGenresMapCallCount, 1);
        expect(mockMovieGenreApiImpl.getGenresCallCount, 1);
      });

      test('local에 genre데이터가 없으면 movieGenreApi.getGenres를 한번 호출하고 local에 저장한다.', () async {
        // given
        mockMovieGenreLocalApiImpl.getGenresMapReturnValue = [];
        mockMovieGenreApiImpl.getGenresReturnValue = [
          Genres(id: 28, name: 'Action')
        ];

        // when
        await movieGenreRepository.getMovieGenreList();

        // then
        expect(mockMovieGenreLocalApiImpl.createGenresMapCallCount, 1);
      });

      test('local에 genre데이터가 있고 오늘 안에 업데이트를 한번 이상 했으면 movieGenreApi.getGenres를 호출하지 않는다.', () async {
        // given
        mockMovieGenreLocalApiImpl.getGenresMapReturnValue = [
          {'id': 28, 'name': 'Action'}
        ];
        mockMovieGenreLocalApiImpl.genreUpdatedDate = '2024-4-20';

        // when
        await movieGenreRepository.getMovieGenreList();

        // then
        expect(mockMovieGenreApiImpl.getGenresCallCount, 0);
      });

      test('local에 genre데이터가 있고 오늘 안에 업데이트를 한번 이상 했으면 local에서 데이터를 가져온다.', () async {
        // given
        mockMovieGenreLocalApiImpl.getGenresMapReturnValue = [
          {'id': 28, 'name': 'Action'}
        ];
        mockMovieGenreLocalApiImpl.genreUpdatedDate = '2024-4-20';

        // when
        final result = await movieGenreRepository.getMovieGenreList();

        // then
        expect(result.length, 1);
        expect(result[0].id, 28);
        expect(result[0].name, 'Action');
      });
    });
  });
}
