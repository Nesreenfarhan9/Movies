import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class ExploreScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Explore Screen", style: TextStyle(color: AppTheme.primary)),
    );
  }
}