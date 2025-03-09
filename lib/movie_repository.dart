import 'package:dio/dio.dart';
import 'package:movies/model/movie_model.dart';


class MovieRepository {
  final Dio _dio = Dio();

  Future<List<Movie>> fetchMovies() async {
    final response = await _dio.get('https://yts.mx/api/v2/list_movies.json');
    final movies = response.data['data']['movies'] as List;
    return movies.map((json) => Movie.fromJson(json)).toList();
  }
}
