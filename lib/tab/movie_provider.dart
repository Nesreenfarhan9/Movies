import 'package:flutter/material.dart';
import 'package:movies/tab/home_tabs/movie.dart';

class MovieProvider with ChangeNotifier {
  String _selectedImage = 'assets/images/1917.png';
  final List<Movie> _availableMovies = [
    Movie(
        name: '1917',
        image: 'assets/images/1917.png',
        rating: '7.7',
        genre: 'War'),
    Movie(
        name: 'Extraction',
        image: 'assets/images/extraction.png',
        rating: '7.0',
        genre: 'Action'),
    Movie(
        name: 'Red Notice',
        image: 'assets/images/red_notice.png',
        rating: '7.2',
        genre: 'Comedy'),
    Movie(
        name: 'Inception',
        image: 'assets/images/inception.png',
        rating: '8.8',
        genre: 'Sci-Fi'),
    Movie(
        name: 'Joker',
        image: 'assets/images/joker.png',
        rating: '8.4',
        genre: 'Drama'),
  ];

  String get selectedImage => _selectedImage;
  List<Movie> get availableMovies => _availableMovies;

  Map<String, List<Movie>> get categorizedMovies {
    Map<String, List<Movie>> categorized = {};
    for (var movie in _availableMovies) {
      categorized.putIfAbsent(movie.genre, () => []).add(movie);
    }
    return categorized;
  }

  void selectImage(String image) {
    _selectedImage = image;
    notifyListeners();
  }
}
