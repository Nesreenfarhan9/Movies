import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/home.dart';
import 'package:islaami/tabs/Quran/sura_details_screen.dart';

void main() {
  runApp(islami_app());
}

class islami_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.routeName: (_) => homeScreen(),
        SuraDetailsScreen.routname: (_) => SuraDetailsScreen(),
      },
      initialRoute: homeScreen.routeName,
      theme: AppTheme.light_theme,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.Dark_theme,
    );
  }
}
