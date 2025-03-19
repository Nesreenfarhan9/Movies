import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Image.asset(
          'assets/images/first_onboarding.png',
          height:double.infinity ,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '     Find Your Next \nFavorite Movie Here',
                  style: textTheme.displaySmall?.copyWith(fontSize: 36),
                ),
                SizedBox(height: 8,),

                Opacity(
                  opacity: .6,
                  child: Text(
                    'Get access to a huge library of movies \nto suit all tastes. You will surely like it.',
                    style: textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 24,),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
