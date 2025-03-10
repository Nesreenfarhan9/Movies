import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.gray,
          selectedItemColor: AppTheme.yellow,
          unselectedItemColor: AppTheme.primary,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/home.png')),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/search.png')),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/explore.png')),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/profile.png')),
                label: ""),
          ],
        ),
      ),
    );
  }
}
