import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islaami/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
        ),
        itemCount: 15,
        itemBuilder: (_, index, __) => HadethItem(index: index),
      ),
    );
  }
}
