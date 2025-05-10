import 'package:flutter/material.dart';
import 'package:movies/feature_auth/login.dart';

import '../../shared/app_theme.dart';
import '../../shared/custom_elevated_button.dart';
import '../fifth_onboarding.dart';
import '../first_onboarding.dart';
import '../fourth_onboarding.dart';
import '../second_onboarding.dart';
import '../sixth_onboarding.dart';
import '../third_onboarding.dart';

class HomeOnboardingScreen extends StatefulWidget {
  const HomeOnboardingScreen({super.key});

  static const String routeNamed = '/home-onboarding';

  @override
  State<HomeOnboardingScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeOnboardingScreen> {
  PageController pageController = PageController();
  String buttonText = 'Continue  ';
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageIndex = index;

              // Update buttonText based on the page index
              if (index == 5) {
                buttonText = 'Finish  ';
              } else {
                buttonText = 'Next  ';
              }
              setState(() {});
            },
            children: [
              FirstOnboarding(),
              SecondOnboarding(),
              ThirdOnboarding(),
              FourthOnboarding(),
              FifthOnboarding(),
              SixthOnboarding(),
            ],
          ),
          SizedBox(height: 20),
          Positioned(
            bottom: currentPageIndex >= 2 ? 100 : 33,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                lable: buttonText,
                onpressed: () {
                  buttonText == 'Finish  '
                      ? Navigator.pushReplacementNamed(
                          context, LoginScreen.routeNamed)
                      : pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                },
                widthOfElevatedButton: .91,
                buttonColor: AppTheme.yellow,
                labelColor: AppTheme.black,
              ),
            ),
          ),
          currentPageIndex >= 2
              ? Positioned(
                  bottom: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.yellow),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomElevatedButton(
                        lable: "back",
                        onpressed: () {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        widthOfElevatedButton: .91,
                        buttonColor: Colors.transparent,
                        labelColor: AppTheme.yellow,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
