import 'package:movies/feature_home/data/models/movie_model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieDetails movie;
  final List<String> screenshots;
  MovieLoaded(this.movie, this.screenshots);
}

class MovieLoadedWithSimilar extends MovieState {
  final MovieDetails movie;
  final List<Movie> similarMovies;
  final List<String> screenshots;
  MovieLoadedWithSimilar(this.movie, this.similarMovies, this.screenshots);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}
