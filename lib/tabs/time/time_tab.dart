import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islaami/api/api_manager.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/core/date_utils.dart';
import 'package:islaami/model/time_response_model.dart';
import 'package:islaami/tabs/time/azker_screen.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: FutureBuilder(
                future: ApiManager.gettimeData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primary,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something Went Wrong'),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text('Try Again'),
                        )
                      ],
                    );
                  }
                  TimeResponseModel data = snapshot.data!;
                  Map<String, dynamic> prayerTimes =
                      data.data.timings!.toJson();
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.brown,
                      image: DecorationImage(
                        image: AssetImage('assets/images/Group.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 10,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoSizeText(
                                dateForMatter
                                    .formarGregorian(data.data.date.gregorian),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              Column(
                                children: [
                                  AutoSizeText(
                                    'Pray Time',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          color: AppTheme.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  AutoSizeText(
                                    data.data.date.gregorian.weekday.en,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          color: AppTheme.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                dateForMatter.formarhajri(data.data.date.hijri),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider.builder(
                          itemCount: prayerTimes.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xff202020),
                                    Color(0xffB19768)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    prayerTimes.keys.elementAt(index),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    timeConverter.to12hour(
                                        prayerTimes.values.elementAt(index)),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: size.height * 0.21,
                            enlargeCenterPage: true,
                            viewportFraction: 0.28,
                            enlargeFactor: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Azkar',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAzkarCard(
                    context, 'assets/images/morning_azkar.png', 'أذكار الصباح'),
                _buildAzkarCard(
                    context, 'assets/images/evening_azkar.png', 'أذكار المساء'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAzkarCard(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AzkarScreen.routename, arguments: title);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.brown, width: 2),
            ),
            child: Image.asset(
              imagePath,
              width: 120,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
