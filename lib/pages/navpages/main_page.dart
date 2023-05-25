import 'package:animal_app/pages/account/account_page.dart';
import 'package:animal_app/pages/navpages/favourite_page.dart';
import 'package:animal_app/pages/navpages/request_page.dart';
import 'package:animal_app/pages/home/main_pet_page.dart';
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
    MainPetPage(), //HomePage vardı
    RequestPage(),
    FavouritePage(),
    AccountPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 26), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_sharp, size: 26), label: "İstekler"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, size: 26), label: "Favoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 26), label: "Profil"),
        ],
      ),
    );
  }
}
