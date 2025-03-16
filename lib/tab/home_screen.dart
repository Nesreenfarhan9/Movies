import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/MovieCarousel.dart';
import 'package:movies/MoviesListScreen.dart';
import 'package:movies/movie_bloc.dart';
import 'package:movies/movie_state.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/movie_event.dart';

class HomeScreen extends StatefulWidget {
  @override
_HomeScreenState createState() => _HomeScreenState();
   }
class _HomeScreenState extends State<HomeScreen> {
  String currentGenre = "Action"; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<MovieBloc>(context).add(FetchMovies()); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/home_background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                final latestMovies = state.movies; 

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),

                    Image.asset(
                      "assets/images/availablenow.png",
                      width: 270,
                      height: 93,
                      fit: BoxFit.contain,
                    ),

                    MovieCarousel(
                      movies: latestMovies,
                      onMovieChanged: (Movie movie) {
                        setState(() {
                          currentGenre = movie.genre; 
                        });
                      },
                    ),

                    Image.asset(
                      "assets/images/watchnow.png",
                      width: 330,
                      height: 170,
                      fit: BoxFit.contain,
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currentGenre, 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MoviesListScreen(
                                          genre: currentGenre,
                                          movies: state.movies,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "See More →",
                                    style: TextStyle(color: AppTheme.yellow),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movies
                                  .where((movie) => movie.genre == currentGenre)
                                  .length, 
                              itemBuilder: (context, index) {
                                final filteredMovies = state.movies
                                    .where((movie) => movie.genre == currentGenre)
                                    .toList();
                                final movie = filteredMovies[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          movie.image,
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          height: MediaQuery.of(context).size.height * 0.4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 10,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AppTheme.black.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: AppTheme.yellow, size: 14),
                                              SizedBox(width: 3),
                                              Text(
                                                movie.rating.toString(),
                                                style: TextStyle(
                                                    color: AppTheme.primary,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
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
                  ],
                );
              } else if (state is MovieError) {
                return Center(
                  child: Text(
                    "Error: ${state.message}",
                    style: TextStyle(color: AppTheme.primary),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}


