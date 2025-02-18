import 'package:flutter/material.dart';
import 'package:islaami/tabs/Quran/most_recently_item.dart';
import 'package:islaami/tabs/Quran/sura_services.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: SuraServices.mostRecently.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recently',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => MostRecentlyItem(
                    SuraServices.mostRecently.reversed.toList()[index]),
                itemCount: SuraServices.mostRecently.length,
                separatorBuilder: (_, __) => SizedBox(
                  width: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
