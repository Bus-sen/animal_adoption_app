import 'package:animal_app/pages/account/shelter_account_page.dart';
import 'package:animal_app/pages/adverts/shelter_request_list.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/shelter_home.dart';


class ShelterBottomNav extends StatefulWidget {
  const ShelterBottomNav({Key? key}) : super(key: key);

  @override
  State<ShelterBottomNav> createState() => _ShelterBottomNavState();
}

class _ShelterBottomNavState extends State<ShelterBottomNav> {
  List pages = [
    ShelterHome(),
    ShelterRequestListPage(),
    ShelterAccountPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 26), label: "Profil"),
        ],
      ),
    );
  }
}
