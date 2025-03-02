import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/tabs/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routename = '/hadethscreen';
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hadeth ${hadeth.num}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/headerLeft.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  hadeth.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: AppTheme.primary),
                ),
                Image.asset(
                  'assets/images/headerRight.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => Text(
                hadeth.contant[index],
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppTheme.primary),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, __) => SizedBox(
                height: 12,
              ),
              itemCount: hadeth.contant.length,
            ),
          ),
          Image.asset(
            'assets/images/footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
