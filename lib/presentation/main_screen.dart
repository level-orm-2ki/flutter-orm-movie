import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:level_ormmovie/data/api/movie_api.dart';
import 'package:level_ormmovie/domain/use_case/get_movie_detail_by_movie_Id_use_case.dart';
import 'package:level_ormmovie/presentation/movie_detail_view.dart';
import 'package:level_ormmovie/presentation/movie_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:level_ormmovie/presentation/main_view_model.dart';

import '../core/config/themoviedb_config.dart';
import '../data/repository/movie_repository_impl.dart';
import '../domain/model/movie_genre.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? selectedMovieId;
  bool isLatestSelected = true;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: '');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<MovieViewModel>().getUpComingMovieInfo();
      context.read<MovieViewModel>().getMovieGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieViewModel = context.watch<MovieViewModel>();
    final String imageUrl = '${TheMovieDbConfig.imageUrl}/t/p/w500';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'level orm movie information',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              keyboardType: TextInputType.text,
              controller: _searchController,
              onChanged: (e) {
                movieViewModel.searchQuery = e;
              },
              decoration: InputDecoration(
                labelText: '영화 제목 검색',
                hintText: '제목을 입력하세요',
                suffix: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (movieViewModel.searchQuery.isNotEmpty) {
                      movieViewModel
                          .getMovieByTitle(movieViewModel.searchQuery);
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: isLatestSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          isLatestSelected = value!;
                          selectedMovieId = null;
                          movieViewModel.selectedGenreId = null;
                        });
                      },
                    ),
                    Text('최신영화'),
                  ],
                ),
                DropdownButton<int?>(
                  hint: Text('장르 선택'),
                  value: movieViewModel.selectedGenreId,
                  onChanged: (int? newValue) {
                    setState(() {
                      movieViewModel.selectedGenreId = newValue;
                      isLatestSelected = false;
                      print("${movieViewModel.selectedGenreId}");

                      // 선택된 장르에 따라 영화 정보 가져오기
                      if (newValue != null) {
                        movieViewModel.getMoviesByGenres(newValue);
                      }
                    });
                  },
                  items: movieViewModel.genres.map((MovieGenre genre) {
                    return DropdownMenuItem<int?>(
                      value: genre.id,
                      child: Text(genre.name),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLatestSelected
                ? (movieViewModel.movies.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: movieViewModel.movies.length,
                        itemBuilder: (context, index) {
                          final movie = movieViewModel.movies[index];
                          return ListTile(
                            leading: Image.network(
                              '$imageUrl${movie.posterPath}',
                            ),
                            title: Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              context.push('/detail', extra: movie.id);
                            },
                          );
                        },
                      ))
                : (movieViewModel.movies.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: movieViewModel.movies.length,
                        itemBuilder: (context, index) {
                          final movie = movieViewModel.movies[index];
                          return ListTile(
                            leading: Image.network(
                              '$imageUrl${movie.posterPath}',
                            ),
                            title: Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              context.push('/detail', extra: movie.id);
                            },
                          );
                        },
                      )),
          )
        ],
      ),
    );
  }
}
