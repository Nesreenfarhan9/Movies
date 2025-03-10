import 'package:dio/dio.dart';
import 'package:movies/feature_home/data/models/movie_model.dart';

import '../../../shared/constants.dart';

class MovieRepository {
  final Dio _dio = Dio();

  Future<List<Movie>> fetchMovies() async {
    final response = await _dio.get(APIConstants.ListMoviesHome);
    final movies = response.data['data']['movies'] as List;
    return movies.map((json) => Movie.fromJson(json)).toList();
  }
}
