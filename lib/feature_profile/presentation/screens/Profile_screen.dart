import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_profile/presentation/profile_bloc.dart';
import 'package:movies/feature_profile/presentation/screens/update_screen.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/custom_elevated_button.dart';

import '../../../feature_home/data/models/movie_model.dart';
import '../../../feature_home/presentation/view_model/save_movie.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme themeText = Theme.of(context).textTheme;

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              if (!state.showWatchlist) ...[
                // Show only when NOT in watchlist view
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(state.avatarUrl),
                          ),
                          SizedBox(height: 10),
                          Text(state.name, style: themeText.titleMedium),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statItem("Wish List", state.wishListCount),
                        SizedBox(width: 40),
                        _statItem("History", state.historyCount),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomElevatedButton(
                        lable: 'Edit Profile',
                        onpressed: () {
                          Navigator.pushNamed(context, Update.routeNamed);
                        },
                        widthOfElevatedButton: 0.6,
                        buttonColor: AppTheme.yellow,
                        labelColor: AppTheme.black,
                      ),
                      // Expanded(
                      //   child: _customButton(
                      //     "Edit Profile",
                      //     AppTheme.yellow,
                      //     Icons.edit,
                      //     () {
                      //       Navigator.pushNamed(context, Update.routeNamed);
                      //     },
                      //   ),
                      // ),
                      SizedBox(width: 10),
                      CustomElevatedButton(
                        lable: 'Exit',
                        onpressed: () {

                        },
                        widthOfElevatedButton: 0.25,
                        buttonColor: AppTheme.red,
                        labelColor: AppTheme.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],

              // Tabs
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ProfileBloc>().add(ToggleWatchlistView());
                      },
                      child: _tabButton(
                          "Watch List", Icons.list, state.showWatchlist),
                    ),
                    SizedBox(width: 120),
                    GestureDetector(
                      onTap: () {},
                      child: _tabButton(
                          "History", Icons.folder, !state.showWatchlist),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: state.showWatchlist ? WatchlistGrid() : Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Watchlist Grid View
class WatchlistGrid extends StatefulWidget {
  @override
  _WatchlistGridState createState() => _WatchlistGridState();
}

class _WatchlistGridState extends State<WatchlistGrid> {
  List<MovieDetails> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    List<MovieDetails> movies = await MovieStorage.loadWatchlist();
    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _movies.isEmpty
        ? Center(
            child: Text("No saved movies.",
                style: TextStyle(color: AppTheme.primary)))
        : GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: _movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjust grid columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 17,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              final movie = _movies[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppTheme.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      child: Image.network(
                        movie.mediumCoverImage,
                        height: 180,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}

Widget _statItem(String title, int count) {
  return Column(
    children: [
      Text("$count", style: TextStyle(color: AppTheme.primary, fontSize: 18)),
      Text(title, style: TextStyle(color: AppTheme.primary, fontSize: 14)),
    ],
  );
}

Widget _customButton(
    String text, Color color, IconData icon, VoidCallback onTap) {
  return ElevatedButton.icon(
    onPressed: onTap,
    icon: Icon(icon, color: AppTheme.black),
    label: Text(text),
    style: ElevatedButton.styleFrom(backgroundColor: color),
  );
}

Widget _tabButton(String text, IconData icon, bool isSelected) {
  return Column(
    children: [
      Icon(icon, color: isSelected ? AppTheme.yellow : AppTheme.primary),
      Text(
        text,
        style: TextStyle(color: isSelected ? Colors.yellow : AppTheme.primary),
      ),
    ],
  );
}
