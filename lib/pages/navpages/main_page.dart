import 'package:animal_app/pages/home/home_page.dart';
import 'package:animal_app/pages/navpages/bar_item_page.dart';
import 'package:animal_app/pages/navpages/my_profile_page.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    MyProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.iconColor1,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
