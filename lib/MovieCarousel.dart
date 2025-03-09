import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies/model/movie_model.dart';

class MovieCarousel extends StatelessWidget {
  final List<Movie> movies;

  MovieCarousel({required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: movies.map((movie) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                movie.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                top: 10,
                left: 10,
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
    );
  }
}
