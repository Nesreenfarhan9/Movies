import 'package:flutter/material.dart';

import 'widgets/onboarding_widget.dart';

class FourthOnboarding extends StatelessWidget {
  const FourthOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      text1: 'Create Watchlists',
      image: 'assets/images/fourth_onboarding.png',
      text2:
      'Save movies to your watchlist to keep \ntrack of what you want to watch next. \n  Enjoy films in various qualities and \n                         genres.\n\n',
    );
  }
}
