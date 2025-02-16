import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/tabs/Quran/sura.dart';
import 'package:islaami/widgets/loading_indecator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routname = '/suradetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  late Sura sura;

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
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
                  sura.arabicName,
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
          ayat.isEmpty
              ? LoadingIndecator()
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppTheme.primary),
                      textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (_, __) => SizedBox(
                      height: 12,
                    ),
                    itemCount: ayat.length,
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

  void loadSuraFile() async {
    String suraFileContant =
        await rootBundle.loadString('assets/text/sura/${sura.num}.txt');
    ayat = suraFileContant.split('\r\n');
    setState(() {});
  }
}
