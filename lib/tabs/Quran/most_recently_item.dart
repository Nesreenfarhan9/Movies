import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/tabs/Quran/sura.dart';
import 'package:islaami/tabs/Quran/sura_details_screen.dart';
import 'package:islaami/tabs/Quran/sura_services.dart';

class MostRecentlyItem extends StatefulWidget {
  MostRecentlyItem(this.sura);
  Sura sura;

  @override
  State<MostRecentlyItem> createState() => _MostRecentlyItemState();
}

class _MostRecentlyItemState extends State<MostRecentlyItem> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () async {
        SuraServices.addSuraTomostRecently(widget.sura);
        await Navigator.of(context).pushNamed(
          SuraDetailsScreen.routname,
          arguments: widget.sura,
        );
        setState(() {});
      },
      child: Container(
        height: double.infinity,
        width: screenSize.width * 0.7,
        padding: EdgeInsets.only(left: 12, right: 8),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.sura.englishName,
                  style:
                      textTheme.headlineSmall?.copyWith(color: AppTheme.black),
                ),
                Text(
                  widget.sura.arabicName,
                  style:
                      textTheme.headlineSmall?.copyWith(color: AppTheme.black),
                ),
                Text(
                  '${widget.sura.ayatCount} Verses',
                  style: textTheme.titleSmall?.copyWith(color: AppTheme.black),
                )
              ],
            ),
            Image.asset(
              'assets/images/Rectangle 124.png',
              height: screenSize.height * 0.14,
              width: screenSize.width * 0.3,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
