import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../data/models/movie_model.dart';

class MovieStorage {
  static const String watchlistKey = 'watchlist';

  // Save a movie to the watchlist
  static Future<void> saveMovie(MovieDetails movie) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedMovies = prefs.getStringList(watchlistKey) ?? [];

    if (!savedMovies.contains(movie.id.toString())) {
      savedMovies.add(jsonEncode(movie.toJson()));
      await prefs.setStringList(watchlistKey, savedMovies);
    }
  }

  // Load watchlist
  static Future<List<MovieDetails>> loadWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedMovies = prefs.getStringList(watchlistKey) ?? [];
    return savedMovies.map((e) => MovieDetails.fromJson(jsonDecode(e))).toList();
  }

  // Remove a movie from the watchlist
  static Future<void> removeMovie(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedMovies = prefs.getStringList(watchlistKey) ?? [];
    savedMovies.removeWhere((movie) {
      final decodedMovie = jsonDecode(movie);
      return decodedMovie['id'] == movieId;
    });
    await prefs.setStringList(watchlistKey, savedMovies);
  }
}
