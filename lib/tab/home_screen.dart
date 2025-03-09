import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:movies/MovieCarousel.dart';
import 'package:movies/movie_bloc.dart';
import 'package:movies/movie_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              "assets/images/home_background.png",
              fit: BoxFit.cover,
            ),
          ),

          // محتوى الصفحة
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // العنوان
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Available Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // السلايدر للأفلام المميزة
                      MovieCarousel(movies: state.movies),

                      // قسم أفلام الأكشن
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Action",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See More →",
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // عرض أفلام الأكشن
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            final movie = state.movies[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      movie.image,
                                      width: 100,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        movie.rating.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is MovieError) {
                return Center(
                    child: Text("Error: ${state.message}",
                        style: TextStyle(color: Colors.white)));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

