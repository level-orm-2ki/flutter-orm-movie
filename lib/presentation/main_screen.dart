import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:level_ormmovie/presentation/main_view_model.dart';

import '../core/config/themoviedb_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? selectedMovieId;
  bool isLatestSelected = false;

  @override
  void initState() {
    super.initState();
    // 앱이 처음 화면을 렌더링한 후에 데이터를 로드하도록 보장
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieViewModel>().getUpComingMovieInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieViewModel = context.watch<MovieViewModel>();
    final String imageUrl = '${TheMovieDbConfig.imageUrl}/t/p/w500';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'level orm movie information',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '영화 제목 검색',
                hintText: '제목을 입력하세요',
                suffix: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: isLatestSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isLatestSelected = value!;
                      selectedMovieId = null;
                    });
                  },
                ),
                Text('최신영화'),
              ],
            ),
          ),
          isLatestSelected
              ? Expanded(
                  child: movieViewModel.movies.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: movieViewModel.movies.length,
                          itemBuilder: (context, index) {
                            final movie = movieViewModel.movies[index];
                            return ListTile(
                              leading: Image.network(
                                '$imageUrl${movie.posterPath}',
                                width: 100,
                                height: 100,
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
                                setState(() {
                                  selectedMovieId = movie.id;
                                });
                              },
                            );
                          },
                        ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
