import 'package:flutter/material.dart';

import '../colors.dart';
import 'nav_pages/bar_item_page.dart';
import 'nav_pages/main_page.dart';
import 'nav_pages/my_profile.dart';
import 'nav_pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  List pages = const [
    MainPage(),
    BarItemPage(),
    SearchPage(),
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColor.withOpacity(0.3),
        currentIndex: selectedPage,
        showSelectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Bar Item", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
