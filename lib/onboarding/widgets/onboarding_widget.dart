import 'package:flutter/material.dart';

import '../../shared/app_theme.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.text1,
    this.text2,
    required this.image,
  });

  String image;
  String text1;
  String? text2;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Image.asset(
          image,
          width: screenSize.width * 1,
          height: screenSize.height * .8,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 100,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.black,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(44),
                left: Radius.circular(44),
              ),
            ),
            width: screenSize.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 34,
                ),
                Text(
                  text1,
                  style: textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  text2!,
                  style: textTheme.titleLarge,
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
