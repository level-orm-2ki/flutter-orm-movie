import 'package:go_router/go_router.dart';
import 'package:level_ormmovie/di/di_setup.dart';
import 'package:level_ormmovie/presentation/main_screen.dart';
import 'package:level_ormmovie/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

import '../presentation/movie_detail_view.dart';
import '../presentation/movie_detail_view_model.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt.get<MovieViewModel>(instanceName: 'mainView'),
          child: const MainScreen(),
        );
      },
      routes: [
        GoRoute(
            path: 'detail',
            builder: (context, state) {
              return ChangeNotifierProvider(
                create: (_) => getIt<MovieDetailViewModel>(),
                child: MovieDetailView(
                  movieDetailViewModel: getIt<MovieDetailViewModel>(),
                  movieId: state.extra as int,
                ),
              );
            })
      ],
    ),
  ],
);

//
