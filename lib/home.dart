import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islaami/nav_bar_selected_item.dart';
import 'package:islaami/nav_bar_unselected_icon.dart';
import 'package:islaami/tabs/Quran/quran_tab.dart';
import 'package:islaami/tabs/hadeth/hadeth_tab.dart';
import 'package:islaami/tabs/radio/radio_tab.dart';
import 'package:islaami/tabs/sebha/sebha_tab.dart';
import 'package:islaami/tabs/time/time_tab.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> baackgroundImage = [
    'quranBackground',
    'hadethBackground ',
    'quranBackground',
    'quranBackground',
    'quranBackground',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/${baackgroundImage[currentIndex]}.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Image.asset('assets/images/header.png',
                height: MediaQuery.sizeOf(context).height * 0.18),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: NavBarUnselectedIcon(imageName: 'Vector (1)'),
                activeIcon: NavBarSelectedItem(imageName: 'Vector (1)'),
                label: 'Quran'),
            BottomNavigationBarItem(
                icon:
                    NavBarUnselectedIcon(imageName: 'book-album-svgrepo-com 1'),
                activeIcon:
                    NavBarSelectedItem(imageName: 'book-album-svgrepo-com 1'),
                label: 'hadeth'),
            BottomNavigationBarItem(
                icon: NavBarUnselectedIcon(
                    imageName: 'necklace-islam-svgrepo-com 1'),
                activeIcon: NavBarSelectedItem(
                    imageName: 'necklace-islam-svgrepo-com 1'),
                label: 'sebha'),
            BottomNavigationBarItem(
                icon: NavBarUnselectedIcon(imageName: 'radio-svgrepo-com 1'),
                activeIcon:
                    NavBarSelectedItem(imageName: 'radio-svgrepo-com 1'),
                label: 'radio'),
            BottomNavigationBarItem(
                icon: NavBarUnselectedIcon(imageName: 'Vector'),
                activeIcon: NavBarSelectedItem(imageName: 'Vector'),
                label: 'Time'),
          ]),
    );
  }
}
