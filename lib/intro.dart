import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/intro';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  List<Map<String, String>> pages = [
    {
      "image": "assets/images/intro1.png",
      "title": "Welcome To Islami App",
      "subtitle": "",
    },
    {
      "image": "assets/images/intro2.png",
      "title": "Welcome To Islami",
      "subtitle": "We Are Very Excited To Have You In Our Community",
    },
    {
      "image": "assets/images/intro3.png",
      "title": "Reading the Quran",
      "subtitle": "Read, and your Lord is the Most Generous",
    },
    {
      "image": "assets/images/intro4.png",
      "title": "Bearish",
      "subtitle": "Praise the name of your Lord, the Most High",
    },
    {
      "image": "assets/images/intro5.png",
      "title": "Holy Quran Radio",
      "subtitle":
          "You can listen to the Holy Quran Radio through the application for free and easily",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset("assets/images/header.png", height: 80),
          ),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(pages[index]["image"]!, height: 250),
                    SizedBox(height: 20),
                    Text(
                      pages[index]["title"]!,
                      style: TextStyle(
                        fontSize: 22,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      pages[index]["subtitle"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // مؤشر النقاط + زر التالي أو إنهاء
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppTheme.primary,
                    dotColor: Colors.white38,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (currentIndex > 0)
                      TextButton(
                        onPressed: () {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == pages.length - 1) {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        }
                      },
                      child: Text(
                        currentIndex == pages.length - 1 ? "Finish" : "Next",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
