import 'package:dio/dio.dart';
import 'package:movies/feature_home/data/models/movie_model.dart';

import '../../../shared/constants.dart';

class MovieRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://yts.mx/api/v2/movie_details.json';

  Future<List<Movie>> fetchMovies() async {
    final response = await _dio.get(APIConstants.ListMoviesHome);

    final movies = response.data['data']['movies'] as List;

    return movies.map((json) => Movie.fromJson(json)).toList();
  }

  Future<MovieDetails> fetchMovieDetails(int movieId) async {
    try {
      final response =
          await _dio.get(baseUrl, queryParameters: {'movie_id': movieId});

      final movieJson = response.data['data']['movie'];

      return MovieDetails.fromJson(movieJson);
    } catch (error) {
      throw Exception('Failed to load movie details: $error');
    }
  }
}
