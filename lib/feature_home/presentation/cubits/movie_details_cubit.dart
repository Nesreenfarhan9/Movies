import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/data_sources/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieDetailsCubit(this._movieRepository) : super(MovieInitial());

  Future<void> fetchMovieDetails(int movieId) async {
    try {
      emit(MovieLoading());

      final movie = await _movieRepository.fetchMovieDetails(movieId);
      final similarMovies = await _movieRepository.fetchSimilarMovies(movieId);
      final screenshots = movie?.screenshots ?? [];

      if (movie == null) {
        emit(MovieError('Movie data is empty'));
        return;
      }

      emit(MovieLoadedWithSimilar(movie, similarMovies, screenshots));
    } catch (error, stackTrace) {
      debugPrint('Error fetching movie details: $error');
      debugPrintStack(stackTrace: stackTrace);
      emit(MovieError('Failed to fetch movie details'));
    }
  }
}
