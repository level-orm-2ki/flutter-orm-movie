import 'package:flutter_dotenv/flutter_dotenv.dart';

class TheMovieDbConfig {
  static final String baseUrl = dotenv.env['THEMOVIEDB_BASE_URL'].toString();
  static final String accessToken = dotenv.env['THEMOVIEDB_TOKEN'].toString();
  static final String imageUrl = dotenv.env['THEIMAGE_BASE_URL'].toString();
}
