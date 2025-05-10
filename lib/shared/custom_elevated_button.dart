import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  String lable;
  double widthOfElevatedButton;
  Color labelColor;
  Color buttonColor;
  VoidCallback onpressed;

  CustomElevatedButton(
      {required this.lable,
      required this.onpressed,
      required this.widthOfElevatedButton,
      required this.buttonColor,
      required this.labelColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
        child: Text("$lable",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: labelColor)),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
                MediaQuery.sizeOf(context).width * widthOfElevatedButton, 56),
            backgroundColor: buttonColor));
  }
}
