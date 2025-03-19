import 'package:equatable/equatable.dart';
import 'package:movies/feature_home/data/models/movie_model.dart';
abstract class ExploreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Movie> movies;
  ExploreLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class ExploreError extends ExploreState {
  final String message;
  ExploreError(this.message);

  @override
  List<Object?> get props => [message];
}
