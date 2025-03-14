import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_home/presentation/cubits/Search_Cubit.dart';
import 'package:movies/feature_home/presentation/cubits/search_state.dart';
import 'package:movies/shared/app_theme.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 21, right: 21),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.gray,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/icons/search.png'),
                  color: AppTheme.primary,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      context.read<SearchCubit>().searchMovies(query);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: AppTheme.primary),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return Center(child: CircularProgressIndicator(color: AppTheme.primary));
              } else if (state is SearchLoaded) {
                return state.movies.isEmpty
                    ? Center(
                        child: Image.asset("assets/images/image.png", width: 140, height: 150),
                      )
                    : ListView.builder(
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return ListTile(
                            leading: Image.network(movie['medium_cover_image']),
                            title: Text(movie['title'], style: TextStyle(color: Colors.white)),
                            subtitle: Text("Year: ${movie['year']}", style: TextStyle(color: Colors.white70)),
                          );
                        },
                      );
              } else if (state is SearchError) {
                return Center(
                  child: Text(state.message, style: TextStyle(color: AppTheme.red)),
                );
              }
              return Center(
                child: Image.asset("assets/images/image.png", width: 140, height: 150),
              );
            },
          ),
        ),
      ],
    );
  }
}



