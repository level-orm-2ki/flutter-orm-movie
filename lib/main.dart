import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:level_ormmovie/data/api/movie_api.dart';
import 'package:level_ormmovie/data/api/movie_ganre_api.dart';
import 'package:level_ormmovie/data/api/movie_genre_local_api.dart';
import 'package:level_ormmovie/data/repository/movie_genre_repository_impl.dart';
import 'package:level_ormmovie/data/repository/movie_repository_impl.dart';
import 'package:level_ormmovie/di/di_setup.dart';
import 'package:level_ormmovie/presentation/main_screen.dart';
import 'package:level_ormmovie/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

import 'core/util/shared_preferences_util.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  diSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MovieViewModel(
          movieGenreRepository: MovieGenreRepositoryImpl(
            movieGenreApi: MovieGenreApi(),
            movieGenreLocalApi: MovieGenreLocalApi(SharedPreferencesUtil()),
          ),
          movieRepository: MovieRepositoryImpl(movieApi: MovieApi()),
        ),
        child: MainScreen(),
      ),
    );
  }
}
