

import 'package:movies/feature_home/data/models/movie_model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieDetails movie;
  MovieLoaded(this.movie);}
class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
