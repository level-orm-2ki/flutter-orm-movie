import 'package:flutter_dotenv/flutter_dotenv.dart';

class TheMovieDdConfig {
  static final String baseUrl = dotenv.env['THEMOVIEDB_BASE_URL'].toString();
  static final String accessToken = dotenv.env['THEMOVIEDB_TOKEN'].toString();
}
