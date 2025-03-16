
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/movie_repository.dart';
import '../../data/models/movie_model.dart';
import '../view_model/save_movie.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieDetailsCubit(this._movieRepository) : super(MovieInitial());

  Future<void> getMovieDetails(int movieId) async {
    try {
      emit(MovieLoading());

      final movie = await _movieRepository.fetchMovieDetails(movieId);

      // Load watchlist from SharedPreferences
      final watchlist = await MovieStorage.loadWatchlist();

      // Check if the movie is saved
      final isMovieSaved = watchlist.any((savedMovie) => savedMovie.id == movieId);

      // Create a new instance with updated isSaved status
      final updatedMovie = MovieDetails(
        id: movie.id,
        url: movie.url,
        imdbCode: movie.imdbCode,
        title: movie.title,
        titleEnglish: movie.titleEnglish,
        titleLong: movie.titleLong,
        slug: movie.slug,
        year: movie.year,
        rating: movie.rating,
        runtime: movie.runtime,
        genres: movie.genres,
        likeCount: movie.likeCount,
        descriptionIntro: movie.descriptionIntro,
        descriptionFull: movie.descriptionFull,
        ytTrailerCode: movie.ytTrailerCode,
        language: movie.language,
        backgroundImage: movie.backgroundImage,
        smallCoverImage: movie.smallCoverImage,
        mediumCoverImage: movie.mediumCoverImage,
        largeCoverImage: movie.largeCoverImage,
        torrents: movie.torrents,
        isSaved: isMovieSaved, actors: [], // Load the saved status
      );

      emit(MovieLoaded(updatedMovie));
    } catch (error) {
      emit(MovieError('Failed to fetch movie details: $error'));
    }
  }

  void toggleSaveStatus() async {
    if (state is MovieLoaded) {
      final movie = (state as MovieLoaded).movie;
      final newStatus = !movie.isSaved;

      // Update isSaved status
      movie.isSaved = newStatus;
      emit(MovieLoaded(movie));

      // Store in SharedPreferences
      if (newStatus) {
        await MovieStorage.saveMovie(movie);
      } else {
        await MovieStorage.removeMovie(movie.id);
      }
    }
  }

}