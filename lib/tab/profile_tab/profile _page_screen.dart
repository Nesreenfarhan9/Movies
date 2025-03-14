import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/feature_home/presentation/screens/home_screen.dart';
import 'package:movies/tab/profile_tab/profile_screen.dart';
import 'package:movies/feature_home/presentation/screens/search_screen.dart';
import '../../feature_home/data/data_sources/movie_repository.dart';
import '../../feature_home/presentation/cubits/movie_bloc.dart';
import '../../feature_home/data/repositories/movie_event.dart';
import '../../shared/Custom_Bottom_Navigation_Bar.dart';
import 'profile_bloc.dart';
import 'package:movies/feature_home/presentation/screens/explore_screen.dart';

class ProfilePageScreen extends StatefulWidget {
  static const String routeNamed = "/home";

  @override
  State<ProfilePageScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePageScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => MovieBloc(MovieRepository())..add(FetchMovies()), // ✅ Provide MovieBloc
      child: HomeScreen(),
    ),    SearchScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        backgroundColor: AppTheme.black,
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
