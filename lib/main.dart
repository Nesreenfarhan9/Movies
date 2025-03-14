import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/feature_home/data/data_sources/movie_repository.dart';
import 'package:movies/feature_home/data/repositories/movie_event.dart';
import 'package:movies/feature_home/presentation/cubits/Search_Cubit.dart';
import 'package:movies/feature_home/presentation/cubits/explore_cubit.dart';
import 'package:movies/feature_home/presentation/cubits/movie_bloc.dart';

import 'package:movies/tab/profile_tab/update.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tab/profile_tab/profile%20_page_screen.dart';

import 'feature_auth/presentation/screens/forget_password_screen.dart';
import 'feature_auth/presentation/screens/login.dart';
import 'feature_auth/presentation/screens/register_screen.dart';
import 'onboarding/widgets/home_onboarding_screen.dart';

void main() {
  final movieRepository = MovieRepository(); 

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => MovieBloc(movieRepository)..add(FetchMovies())),
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => ExploreCubit()),
      ],

      child: MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        routes: {
          ProfilePageScreen.routeNamed: (_) => ProfilePageScreen(),
          Update.routeNamed: (_) => Update(),

         LoginScreen.routeNamed: (_) => LoginScreen(),
          HomeOnboardingScreen.routeNamed: (_) => HomeOnboardingScreen(),
          ForgetPasswordScreen.routeNamed: (_) => ForgetPasswordScreen(),
          RegisterScreen.routeNamed: (_) => RegisterScreen(),
        },
        initialRoute:  ProfilePageScreen.routeNamed,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.LightTheme,
        darkTheme: AppTheme.DarkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
