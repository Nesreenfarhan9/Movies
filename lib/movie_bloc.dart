import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import 'movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieLoading()) {
    on<FetchMovies>((event, emit) async {
      try {
        final movies = await movieRepository.fetchMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError("Failed to load movies"));
      }
    });
  }
}