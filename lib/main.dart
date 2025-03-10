import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/feature_auth/profile _page_screen.dart';
import 'package:movies/feature_auth/login.dart';
import 'package:movies/feature_auth/update.dart';
import 'package:movies/feature_auth/forget_password_screen.dart';
import 'package:movies/feature_auth/register_screen.dart';
import 'package:movies/movie_bloc.dart';
import 'package:movies/movie_event.dart';
import 'package:movies/movie_repository.dart';

import 'onboarding/widgets/home_onboarding_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
            create: (context) =>
                MovieBloc(MovieRepository())..add(FetchMovies())),
      ],
      child: MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ProfilePageScreen.routeNamed: (_) => ProfilePageScreen(),
        Update.routeNamed: (_) => Update(),
        LoginScreen.routeNamed: (_) => LoginScreen(),
        HomeOnboardingScreen.routeNamed: (_) => HomeOnboardingScreen(),
        ForgetPasswordScreen.routeNamed: (_) => ForgetPasswordScreen(),
        RegisterScreen.routeNamed: (_) => RegisterScreen(),
      },
      initialRoute: LoginScreen.routeNamed,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
