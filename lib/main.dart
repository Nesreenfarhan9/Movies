import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/home.dart';
import 'package:islaami/provider/radio_manager_provider.dart';
import 'package:islaami/tabs/Quran/sura_details_screen.dart';
import 'package:islaami/tabs/Quran/sura_services.dart';
import 'package:islaami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraServices.getRecentlyIndex();
  runApp(ChangeNotifierProvider(
      create: (context) => RadioManagerProvider(), child: islami_app()));
}

class islami_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.routeName: (_) => homeScreen(),
        SuraDetailsScreen.routname: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routename: (_) => HadethDetailsScreen(),
      },
      initialRoute: homeScreen.routeName,
      theme: AppTheme.light_theme,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.Dark_theme,
    );
  }
}
