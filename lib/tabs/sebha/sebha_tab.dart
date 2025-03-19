import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;

  int index = 0;

  List<String> azkar = [
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
    "لا إله إلا الله وحده لا شريك له",
    "الحمد لله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
    "أستغفر الله العظيم",
    "اللهم صل وسلم على نبينا محمد",
    "اللهم اغفر لي ولوالدي",
    "حسبي الله ونعم الوكيل",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/Sebhahead.png'),
              Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: GestureDetector(
                    onTap: () {
                      counter++;
                      if (counter % 33 == 0) {
                        index++;
                      }
                      if (index == azkar.length) {
                        index = 0;
                        counter = 0;
                      }
                      angle += 120 / 11;

                      setState(() {});
                    },
                    child: Transform.rotate(
                      child: Image.asset(
                        'assets/images/SebhaBody.png',
                      ),
                      angle: angle,
                    )),
              ),
              Positioned(
                top: height * 0.28,
                child: Column(
                  children: [
                    Text(
                      azkar[index],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '$counter',
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
