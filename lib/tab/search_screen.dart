import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 21, right: 21),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: AppTheme.gray, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ImageIcon(
                    AssetImage(
                      'assets/icons/search.png',
                    ),
                    color: AppTheme.primary),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: AppTheme.primary,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: AppTheme.primary),
                  ),
                )
              ],
            ),
          ),
       
        ),
          
        Expanded(
          child: Center(
            child: Image.asset("assets/images/image.png", width: 140, height: 150),
          ),
        ),
      ],
    );
    
  }
}
