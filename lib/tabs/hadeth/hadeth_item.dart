import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/tabs/hadeth/hadeth.dart';
import 'package:islaami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islaami/tabs/hadeth/hadeth_tab.dart';
import 'package:islaami/widgets/loading_indecator.dart';

class HadethItem extends StatefulWidget {
  HadethItem({required this.index});

  int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadethFile();
    }
    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          HadethDetailsScreen.routename,
          arguments: hadeth,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Cornerr 2.png',
                    height: screenHeight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Text(
                      hadeth?.title ?? '',
                      style: textTheme.headlineSmall
                          ?.copyWith(color: AppTheme.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    'assets/images/Cornerr 1.png',
                    height: screenHeight * 0.1,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/HadithCardBackGround.png',
                    ),
                  ),
                ),
                child: hadeth == null
                    ? LoadingIndecator(
                        color: AppTheme.black,
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        itemBuilder: (_, index) => Text(
                          hadeth!.contant[index],
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium
                              ?.copyWith(color: AppTheme.black),
                        ),
                        separatorBuilder: (_, __) => SizedBox(
                          height: 4,
                        ),
                        itemCount: hadeth!.contant.length,
                      ),
              ),
            ),
            Image.asset(
              'assets/images/Mosque-02 2.png',
              width: double.infinity,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  void loadHadethFile() async {
    String hadethFileContant = await rootBundle
        .loadString('assets/text/hadeth/h${widget.index + 1}.txt');
    List<String> hadethLines = hadethFileContant.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> contant = hadethLines;
    hadeth = Hadeth(
      title: title,
      contant: contant,
      num: widget.index + 1,
    );
    setState(() {});
  }
}
