import 'package:flutter/material.dart';

import 'widgets/onboarding_widget.dart';

class FifthOnboarding extends StatelessWidget {
  const FifthOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      text1: 'Rate, Review, and Learn',
      image: 'assets/images/fifth_onboarding.png',
      text2:
      "   Share your thoughts on the movies \n  you've watched. Dive deep into film \ndetails and help others discover great \n          movies with your reviews.\n\n",
    );
  }
}
