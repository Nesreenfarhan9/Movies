import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/onboarding_widget.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {

    return OnboardingWidget(text1:  'Discover Movies', image: 'assets/images/second_onboarding.png', text2: 'Explore a vast collection of movies in all \n    qualities and genres. Find your next \n                favorite film with ease.',);
  }
}
