import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/feature_auth/login.dart';
import 'package:movies/feature_auth/profile_screen.dart';

import 'onboarding/widgets/home_onboarding_screen.dart';


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
         HomeOnboardingScreen.routeNamed:(_)=>HomeOnboardingScreen(),
        },
           initialRoute: HomeOnboardingScreen.routeNamed,

      debugShowCheckedModeBanner: false,
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
