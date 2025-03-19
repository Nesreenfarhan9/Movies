import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_home/data/data_sources/movie_repository.dart';
import 'package:movies/feature_home/presentation/screens/movies_details_screen.dart';
import '../../data/models/movie_model.dart';
import '../../../shared/app_theme.dart';

class SecondSection extends StatelessWidget {
  final List<String> screenshots;
  final List<Movie> similarMovies;

  const SecondSection({
    Key? key,
    required this.screenshots,
    required this.similarMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Screen Shots'),
            const SizedBox(height: 10),
            _buildScreenshotsList(),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'Similar Movies'),
            const SizedBox(height: 10),
            _buildSimilarMoviesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: AppTheme.primary),
    );
  }

  Widget _buildScreenshotsList() {
    return SizedBox(
      height: 120,
      child: screenshots.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: screenshots.length,
              itemBuilder: (context, index) {
                String imageUrl =
                    "https://image.tmdb.org/t/p/w500${screenshots[index]}";

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported,
                            size: 100, color: Colors.grey);
                      },
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No screenshots available",
                style: TextStyle(color: Colors.grey),
              ),
            ),
    );
  }

  Widget _buildSimilarMoviesList(BuildContext context) {
    return SizedBox(
      height: 200,
      child: similarMovies.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarMovies.length,
              itemBuilder: (context, index) {
                final movie = similarMovies[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MoviesDetailsScreen.routeNamed,
                      arguments: movie.id,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            movie.image.isNotEmpty
                                ? movie.image
                                : "https://via.placeholder.com/120x160",
                            fit: BoxFit.cover,
                            width: 120,
                            height: 160,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.movie,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 120,
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppTheme.primary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No similar movies available",
                style: TextStyle(color: Colors.grey),
              ),
            ),
    );
  }
}
