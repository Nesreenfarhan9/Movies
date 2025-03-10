import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies/shared/app_theme.dart';

import '../../data/models/movie_model.dart';

class MovieCarousel extends StatefulWidget {
  final List<Movie> movies;
  final Function(Movie) onMovieChanged;

  MovieCarousel({required this.movies, required this.onMovieChanged});

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: screenSize.height * .37,
            //clipBehavior: ,

            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
              widget.onMovieChanged(widget.movies[index]);
            },

            enlargeFactor: 0.3,
            viewportFraction: 0.6,
          ),
          items: widget.movies.map((movie) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Image.network(
                    movie.image,
                    fit: BoxFit.contain,
                    width: screenSize.width * 0.6,
                    height: screenSize.width * 0.9,
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          SizedBox(width: 4),
                          Text(
                            movie.rating.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        // Text(
        //   widget.movies[currentIndex].title,
        //   style: TextStyle(
        //       color: AppTheme.primary,
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
