import 'package:flutter/material.dart';

import 'widgets/onboarding_widget.dart';

class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      text1: 'Explore All Genres',
      image: 'assets/images/third_onboarding.png',
      text2:
      'Discover movies from every genre, in all \navailable qualities. Find something new \n     and exciting to watch every day.\n\n\n',
    );
  }
}
