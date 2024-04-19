import 'package:level_ormmovie/core/config/themoviedb_config.dart';

class MovieApi {
  final headers = {
    'accept': 'application/json',
    'Authorization':
        'Bearer ${TheMovieDbConfig.accessToken}'
  };

}
