import 'package:dio/dio.dart';
import 'package:movies/feature_home/data/models/movie_model.dart';
import '../../../shared/constants.dart';

class MovieRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://yts.mx/api/v2/';

  /// جلب قائمة الأفلام الرئيسية
  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await _dio.get(APIConstants.ListMoviesHome);

      if (response.statusCode != 200 || response.data['data'] == null) {
        return List<Movie>.empty(); // تجنب التوقف المفاجئ
      }

      final moviesData = response.data['data']['movies'];
      return moviesData != null
          ? (moviesData as List).map((json) => Movie.fromJson(json)).toList()
          : List<Movie>.empty();
    } catch (error) {
      throw Exception('Failed to load movies: $error');
    }
  }

  /// جلب تفاصيل الفيلم
  Future<MovieDetails?> fetchMovieDetails(int movieId) async {
    try {
      final response = await _dio.get('${baseUrl}movie_details.json',
          queryParameters: {'movie_id': movieId});

      if (response.statusCode != 200 || response.data['data'] == null) {
        return null; // بدلًا من رمي خطأ، يرجّع null
      }

      final movieJson = response.data['data']['movie'];
      return MovieDetails.fromJson(movieJson);
    } catch (error) {
      throw Exception('Failed to load movie details: $error');
    }
  }

  /// جلب الأفلام المشابهة
  Future<List<Movie>> fetchSimilarMovies(int movieId) async {
    try {
      final response = await _dio.get('${baseUrl}movie_suggestions.json',
          queryParameters: {'movie_id': movieId});

      if (response.statusCode != 200 || response.data['data'] == null) {
        return List<Movie>.empty();
      }

      final moviesData = response.data['data']['movies'];
      return moviesData != null
          ? (moviesData as List).map((json) => Movie.fromJson(json)).toList()
          : List<Movie>.empty();
    } catch (error) {
      throw Exception('Failed to load similar movies: $error');
    }
  }
}
