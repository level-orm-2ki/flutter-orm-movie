import 'package:flutter/material.dart';
import 'package:level_ormmovie/presentation/movie_detail_view_model.dart';
import 'package:provider/provider.dart';

import '../core/config/themoviedb_config.dart';

class MovieDetailView extends StatefulWidget {
  final int movieId;
  final MovieDetailViewModel movieDetailViewModel;

  const MovieDetailView(
      {super.key, required this.movieId, required this.movieDetailViewModel});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  void initState() {
    super.initState();
    widget.movieId;
    widget.movieDetailViewModel;
  }

  @override
  void dispose() {
    widget.movieId;
    widget.movieDetailViewModel;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetailViewModel = context.watch<MovieDetailViewModel>();
    movieDetailViewModel.getMovieDetailOnViewModel(widget.movieId);
    final String imageUrl = '${TheMovieDbConfig.imageUrl}/t/p/w500';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'level orm movie detail',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: movieDetailViewModel.moviesDetailOnViewModel.posterPath ==
                  'posterPath'
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Image.network(
                      '$imageUrl${movieDetailViewModel.moviesDetailOnViewModel.posterPath}',
                    ),
                    SizedBox(height: 15),
                    Text(
                      movieDetailViewModel.moviesDetailOnViewModel.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                                size: 30,
                              ),
                              Text(
                                movieDetailViewModel
                                    .moviesDetailOnViewModel.voteAverage
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(movieDetailViewModel
                                    .moviesDetailOnViewModel.status),
                                Text(movieDetailViewModel
                                    .moviesDetailOnViewModel.popularity
                                    .toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    Text(
                      movieDetailViewModel.moviesDetailOnViewModel.overView,
                      overflow: TextOverflow.fade,
                    )
                    // Text(movieDetailViewModel.getMovieDetailByMovieIdInfo(selectedMovieId).toString()),
                  ],
                ),
        ),
      ),
    );
  }
}
