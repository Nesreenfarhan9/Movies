import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/app_theme.dart';
import 'profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const routeNamed = "/home";
  @override
  Widget build(BuildContext context) {
     TextTheme themeText = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        backgroundColor: AppTheme.black,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(state.avatarUrl),
                            ),
                            SizedBox(height: 10),
                            Text(
                              state.name,
                              style: themeText.titleMedium,
                                  
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _statItem("Wish List", state.wishListCount),
                          SizedBox(width: 40),
                          _statItem("History", state.historyCount),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: _customButton(
                                "Edit Profile", AppTheme.yellow, Icons.edit)),
                        SizedBox(width: 20),
                      
                           _customButton(
                              "Exit", AppTheme.red, Icons.exit_to_app),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _tabButton("Watch List", Icons.list, true),
                        SizedBox(width: 120),
                        _tabButton("History", Icons.folder, false),
                      ],
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/image.png",
                    width: 140,
                    height: 150,
                  ),
                  Spacer(),
                  BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.grey[800],
                      selectedItemColor: AppTheme.yellow,
                      unselectedItemColor: AppTheme.primary,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.explore), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: ""),
                      ],
                    ),
                 
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _statItem(String title, int count) {
  return Column(
    children: [
      Text("$count", style: TextStyle(color: AppTheme.primary, fontSize: 18)),
      Text(title, style: TextStyle(color: AppTheme.primary, fontSize: 14)),
    ],
  );
}

Widget _customButton(String text, Color color, IconData icon) {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: Icon(icon, color: AppTheme.black),
    label: Text(text),
    style: ElevatedButton.styleFrom(backgroundColor: color),
  );
}

Widget _tabButton(String text, IconData icon, bool isSelected) {
  return Column(
    children: [
      Icon(icon, color: isSelected ? AppTheme.yellow : AppTheme.primary),
      Text(text,
          style:
              TextStyle(color: isSelected ? Colors.yellow : AppTheme.primary)),
    ],
  );
}
