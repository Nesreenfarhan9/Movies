import 'package:movies/model/movie_model.dart';



abstract class MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  MovieLoaded(this.movies);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}
