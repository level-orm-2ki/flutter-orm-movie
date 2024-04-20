import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:level_ormmovie/data/api/movie_api.dart';
import 'package:level_ormmovie/data/repository/movie_repository_impl.dart';
import 'package:level_ormmovie/presentation/main_screen.dart';
import 'package:level_ormmovie/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MovieViewModel(
            repository: MovieRepositoryImpl(movieApi: MovieApi())),
        child: MainScreen(),
      ),
    );
  }
}
