import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class SearchScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search Screen", style: TextStyle(color: AppTheme.primary)),
    );
  }
}

