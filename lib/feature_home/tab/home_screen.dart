import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("home Screen", style: TextStyle(color: AppTheme.primary)),
    );
  }
}