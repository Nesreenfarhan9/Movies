import 'package:flutter/material.dart';
import 'package:islaami/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/home.dart';
import 'package:islaami/provider/radio_manager_provider.dart';
import 'package:islaami/tabs/Quran/sura_details_screen.dart';
import 'package:islaami/tabs/Quran/sura_services.dart';
import 'package:islaami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islaami/tabs/time/azker_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraServices.getRecentlyIndex();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seenIntro = prefs.getBool('seenIntro');

  runApp(ChangeNotifierProvider(
      create: (context) => RadioManagerProvider(),
      child: IslamiApp(seenIntro: seenIntro ?? false)));
}

class IslamiApp extends StatelessWidget {
  final bool seenIntro;
  IslamiApp({required this.seenIntro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        homeScreen.routeName: (_) => homeScreen(),
        SuraDetailsScreen.routname: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routename: (_) => HadethDetailsScreen(),
        AzkarScreen.routename: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return AzkarScreen(azkarType: args);
        },
      },
      initialRoute: seenIntro ? homeScreen.routeName : IntroScreen.routeName,
      theme: AppTheme.light_theme,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.Dark_theme,
    );
  }
}
