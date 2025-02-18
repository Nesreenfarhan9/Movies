import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islaami/app_theme.dart';

class NavBarSelectedItem extends StatelessWidget {
  NavBarSelectedItem({super.key, required this.imageName});
  String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: AppTheme.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(66)),
      child: SvgPicture.asset(
        'assets/icons/$imageName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(
          AppTheme.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
