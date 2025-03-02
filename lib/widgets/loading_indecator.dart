import 'package:flutter/material.dart';

class LoadingIndecator extends StatelessWidget {
  LoadingIndecator({required this.color});
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
