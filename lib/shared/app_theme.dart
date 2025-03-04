import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffFFFFFF);
  static const Color black = Color(0xff121312);
  static const Color red = Color(0xffE82626);
  static const Color green = Color(0xff57AA53);
  static const Color yellow = Color(0xffFFBB3B);
  

  static ThemeData LightTheme = ThemeData();
  static ThemeData DarkTheme = ThemeData(
      primaryColor:primary,
   
     textTheme: const TextTheme(
      displaySmall:TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: primary),
      headlineSmall:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: primary),
      titleLarge:TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: primary),
      titleMedium:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: primary), 
      titleSmall:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: primary),
     ), 





  );

 

}