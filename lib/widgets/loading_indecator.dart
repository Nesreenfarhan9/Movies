import 'package:flutter/material.dart';

class LoadingIndecator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    );
  }
}
