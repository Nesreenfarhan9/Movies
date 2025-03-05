import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Custom_Bottom_Navigation_Bar.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tab/Profile_screen.dart';
import 'package:movies/tab/home_screen.dart';
import 'package:movies/tab/search_screen.dart';
import 'profile_bloc.dart';
import 'package:movies/tab/explore_screen.dart';

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
    HomeScreen(),
    SearchScreen(),
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



