import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/login.dart';
import 'package:movies/profile_screen.dart';


void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
        ProfileScreen.routeNamed: (_) => ProfileScreen(),
        LoginScreen.routeNamed:(_)=>LoginScreen(),
        },
           initialRoute: ProfileScreen.routeNamed,

      debugShowCheckedModeBanner: false,
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
