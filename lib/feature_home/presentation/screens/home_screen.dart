import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_home/presentation/screens/movies_details_screen.dart';
import 'package:movies/feature_home/presentation/cubits/movie_bloc.dart';
import 'package:movies/feature_home/presentation/cubits/movie_state.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/feature_home/data/repositories/movie_event.dart';
import 'package:movies/feature_home/presentation/cubits/movie_details_cubit.dart';
import '../../data/models/movie_model.dart';
import '../view_model/MovieCarousel.dart';
import 'MoviesListScreen.dart';
import '../../data/data_sources/movie_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentGenre = "Action";
  Movie? selectedMovie;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<MovieBloc>(context).add(FetchMovies());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenSize.height * 0.70,
              width: screenSize.width,
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

                //  Set the first movie as the selected movie initially
                selectedMovie ??=
                    latestMovies.isNotEmpty ? latestMovies.first : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Image.asset(
                      "assets/images/availablenow.png",
                      width: screenSize.width * .9,
                      height: screenSize.height * .1,
                      fit: BoxFit.contain,
                    ),
                    InkWell(
                      onTap: () {
                        if (selectedMovie != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) =>
                                    MovieDetailsCubit(MovieRepository())
                                      ..fetchMovieDetails(selectedMovie!.id),
                                child: MoviesDetailsScreen(),
                              ),
                              settings:
                                  RouteSettings(arguments: selectedMovie!.id),
                            ),
                          );
                        }
                      },
                      child: MovieCarousel(
                        movies: latestMovies,
                        onMovieChanged: (Movie movie) {
                          setState(() {
                            selectedMovie =
                                movie; //  Update the selected movie properly
                            currentGenre = movie.genre;
                          });
                        },
                      ),
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
                                    .where(
                                        (movie) => movie.genre == currentGenre)
                                    .toList();
                                final movie = filteredMovies[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BlocProvider(
                                                  create: (context) =>
                                                      MovieDetailsCubit(
                                                          MovieRepository())
                                                        ..fetchMovieDetails(
                                                            movie.id),
                                                  child: MoviesDetailsScreen(),
                                                ),
                                                settings: RouteSettings(
                                                    arguments: movie.id),
                                              ),
                                            );
                                          },
                                          child: Image.network(
                                            movie.image,
                                            width: screenSize.width * 0.3,
                                            height: screenSize.height * 0.5,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        left: 10,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                            color:
                                                AppTheme.black.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: AppTheme.yellow,
                                                  size: 14),
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
