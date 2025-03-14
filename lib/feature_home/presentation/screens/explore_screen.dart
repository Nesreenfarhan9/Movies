import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_home/presentation/cubits/explore_cubit.dart';
import 'package:movies/feature_home/presentation/cubits/explore_state.dart';
import 'package:movies/shared/app_theme.dart';


class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String? selectedGenre;

  @override
  void initState() {
    super.initState();
    context.read<ExploreCubit>().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse', style: TextStyle(color: AppTheme.primary)),
        backgroundColor: AppTheme.black,
        elevation: 0,
      ),
      backgroundColor: AppTheme.black,
      body: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          if (state is ExploreLoading) {
            return const Center(
                child: CircularProgressIndicator(color: AppTheme.primary));
          } else if (state is ExploreLoaded) {
            final genres = state.movies.map((m) => m.genre).toSet().toList();
            final filteredMovies = selectedGenre == null
                ? state.movies
                : state.movies.where((m) => m.genre == selectedGenre).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      final isSelected = genre == selectedGenre;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ChoiceChip(
                          label: Text(
                            genre,
                            style: TextStyle(
                              color:
                                  isSelected ? AppTheme.black : AppTheme.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          selected: isSelected,
                          backgroundColor: AppTheme.black,
                          selectedColor: AppTheme.yellow,
                          shape: StadiumBorder(
                              side: BorderSide(color: AppTheme.yellow)),
                          onSelected: (selected) {
                            setState(() {
                              selectedGenre = selected ? genre : null;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: filteredMovies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final movie = filteredMovies[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                movie.image,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                movie.title,
                                style: TextStyle(
                                    color: AppTheme.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ExploreError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: AppTheme.red)));
          }
          return Center(
              child: Text('No movies found',
                  style: TextStyle(color: AppTheme.primary)));
        },
      ),
    );
  }
}

