import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/tabs/Quran/sura.dart';
import 'package:islaami/tabs/Quran/sura_details_screen.dart';

class SuraItem extends StatelessWidget {
  SuraItem(this.sura);
  Sura sura;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          SuraDetailsScreen.routname,
          arguments: sura,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 52,
            width: 52,
            margin: EdgeInsets.only(right: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/suraNumFrame.png'))),
            child: Text(
              '${sura.num}',
              style: textTheme.titleLarge,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sura.englishName,
                style: textTheme.titleLarge,
              ),
              Text(
                '${sura.ayatCount} verses',
                style: textTheme.titleSmall,
              )
            ],
          ),
          Spacer(),
          Text(
            sura.arabicName,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
