import 'package:flutter/material.dart';
import 'package:movies/onboarding/widgets/onboarding_widget.dart';

class SixthOnboarding extends StatelessWidget {
  const SixthOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      text1: 'Start Watching Now',
      image: 'assets/images/sixth_onboarding.png',
      text2: '',
    );
  }
}
