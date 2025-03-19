import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_auth/presentation/cubit/UpdateProfileCubit.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/feature_auth/reset_password_screen.dart';
import 'package:movies/feature_search&explore/cubits/explore_cubit.dart';
import 'package:movies/feature_home/presentation/screens/movies_details_screen.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/tab/profile_tab/update.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/tab/profile_tab/profile%20_page_screen.dart';
import 'feature_auth/presentation/screens/forget_password_screen.dart';
import 'feature_auth/presentation/screens/login.dart';
import 'feature_auth/presentation/screens/register_screen.dart';
import 'feature_search&explore/cubits/Search_cubit.dart';
import 'onboarding/widgets/home_onboarding_screen.dart';


void main() {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) =>  ExploreCubit ()),
        BlocProvider(create: (context) => UpdateProfileCubit(ApiService()),),
      

       
      ],
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        routes: {
          ProfilePageScreen.routeNamed: (_) => ProfilePageScreen(),
          Update.routeNamed: (_) => Update(),
          LoginScreen.routeNamed: (_) => LoginScreen(),
          HomeOnboardingScreen.routeNamed: (_) => const HomeOnboardingScreen(),
          ForgetPasswordScreen.routeNamed: (_) => const ForgetPasswordScreen(),
          RegisterScreen.routeNamed: (_) => RegisterScreen(),
          MoviesDetailsScreen.routeNamed: (_) => const MoviesDetailsScreen(),
          resetPasswordScreen.routeNamed: (_) => resetPasswordScreen(),
        },
        initialRoute:   LoginScreen.routeNamed,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.LightTheme,
        darkTheme: AppTheme.DarkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
