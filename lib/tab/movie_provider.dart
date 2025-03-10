import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movie.dart';

final movieProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) => MovieNotifier());

class MovieNotifier extends StateNotifier<List<Movie>> {
  MovieNotifier()
      : super([
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
        ]);
}

final selectedImageProvider =
    StateProvider<String>((ref) => 'assets/images/1917.png');
