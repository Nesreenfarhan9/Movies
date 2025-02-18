import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/tabs/Quran/most_recently_section.dart';
import 'package:islaami/tabs/Quran/sura.dart';
import 'package:islaami/tabs/Quran/sura_details_screen.dart';
import 'package:islaami/tabs/Quran/sura_item.dart';
import 'package:islaami/tabs/Quran/sura_services.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: textTheme.titleMedium
                  ?.copyWith(color: AppTheme.white.withOpacity(0.6)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/icons/Vector (1).svg',
                  colorFilter:
                      ColorFilter.mode(AppTheme.primary, BlendMode.srcIn),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppTheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: textTheme.titleMedium,
            onChanged: (quary) {
              SuraServices.SuraSearchName(quary);
              setState(() {});
            },
          ),
        ),
        MostRecentlySection(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'sura List',
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: SuraServices.searchResult.isEmpty
              ? Center(
                  child: Text(
                    'No Sura Found',
                    style: textTheme.titleSmall,
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (_, index) {
                    Sura sura = SuraServices.searchResult[index];
                    return InkWell(
                      onTap: () async {
                        SuraServices.addSuraTomostRecently(sura);
                        await Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routname,
                          arguments: sura,
                        );
                        setState(() {});
                      },
                      child: SuraItem(sura),
                    );
                  },
                  separatorBuilder: (_, __) => Divider(
                    thickness: 1,
                    color: AppTheme.white,
                    indent: screenWidth * 0.1,
                    endIndent: screenWidth * 0.1,
                  ),
                  itemCount: SuraServices.searchResult.length,
                ),
        ),
      ],
    );
  }
}
