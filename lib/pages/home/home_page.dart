import 'package:animal_app/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List pages = [
      SignUpPage(),
      Container(child: Center(child: Text("Sonraki Sayfa")),)
    ];

    return Scaffold(
      body:  pages[0], //giriş sayfası bu olmayacak-değişecek
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              title: Text("Home")
          )
        ],
      ),
    );
  }
}
