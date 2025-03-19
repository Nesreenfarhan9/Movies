import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies/feature_home/presentation/view_model/first_section.dart';
import 'package:movies/feature_home/presentation/cubits/movie_details_cubit.dart';
import 'package:movies/feature_home/presentation/cubits/movie_details_state.dart';
import 'package:movies/feature_home/presentation/view_model/second_screen.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesDetailsScreen extends StatelessWidget {
  const MoviesDetailsScreen({Key? key}) : super(key: key);

  static const String routeNamed = '/screen_details';

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments == null || arguments is! int) {
      return Scaffold(
        body: Center(
          child: Text(
            ' Movie ID is missing or invalid!',
            style: const TextStyle(color: AppTheme.primary, fontSize: 18),
          ),
        ),
      );
    }

    final int movieId = arguments;
    context.read<MovieDetailsCubit>().fetchMovieDetails(movieId);

    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoadedWithSimilar) {
            final movie = state.movie;
            final similarMovies = state.similarMovies ?? [];
            final screenshots = state.screenshots ?? [];

            return CustomScrollView(
              slivers: [
                FirstSection(
                  movieDetails: movie,
                  onTap: () async {
                    final String websiteUrl = movie.url;
                    final Uri websiteUri = Uri.parse(websiteUrl);
                    if (await canLaunchUrl(websiteUri)) {
                      await launchUrl(websiteUri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      _showErrorMessage(
                          context, 'Could not launch movie website');
                    }
                  },
                  save: () {
                    bool save = movie.isSaved;
                    save = true;
                  },
                ),
                SecondSection(
                  screenshots: screenshots,
                  similarMovies: similarMovies,
                ),
              ],
            );
          } else if (state is MovieError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: AppTheme.primary),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
