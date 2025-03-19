import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/data_sources/movie_repository.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieDetailsCubit(this._movieRepository) : super(MovieInitial());

  Future<void> getMovieDetails(int movieId) async {
    try {
      emit(MovieLoading());
      final movie = await _movieRepository.fetchMovieDetails(movieId);

      if (movie == null) {
        emit(MovieError('Movie data is empty'));
        return;
      }

      emit(MovieLoaded(movie));
    } catch (error, stackTrace) {
      debugPrint('Error fetching movie details: $error');
      debugPrintStack(stackTrace: stackTrace);
      emit(MovieError('Failed to fetch movie details'));
    }
  }
}
