import 'package:flutter/material.dart';
import '../../data/models/movie_model.dart';
import '../../../shared/app_theme.dart';

class SecondSection extends StatelessWidget {
  final List<String> screenshots;
  final List<Movie> similarMovies;

  SecondSection({
    required this.screenshots,
    required this.similarMovies,
  });
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screen Shots',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppTheme.primary),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: screenshots.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                            "https://image.tmdb.org/t/p/w500${screenshots[index]}")),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Similar',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppTheme.primary),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: similarMovies.length,
                itemBuilder: (context, index) {
                  final movie = similarMovies[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            movie.image,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 160,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          movie.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppTheme.primary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
