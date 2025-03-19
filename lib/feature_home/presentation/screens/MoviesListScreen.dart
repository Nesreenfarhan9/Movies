import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

import '../../data/models/movie_model.dart';


class MoviesListScreen extends StatelessWidget {
  final String genre;
  final List<Movie> movies;

  MoviesListScreen({required this.genre, required this.movies});

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) => movie.genre == genre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("$genre Movies"),
        backgroundColor: AppTheme.black,
      ),
      backgroundColor: AppTheme.black,
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: filteredMovies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final movie = filteredMovies[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.image,
                  height: 1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Text(
                movie.title,
                style: TextStyle(color: AppTheme.primary, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
