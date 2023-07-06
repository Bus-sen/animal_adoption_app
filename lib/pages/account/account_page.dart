import 'package:animal_app/pages/auth/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  setData (){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> SignInPage()));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profilim", size: 24, color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //iconSize problemli, fotoğraf yükleme olmalı
            AppIcon(icon: Icons.add_a_photo,
                backgroundColor: AppColors.iconColor2,
                size: Dimensions.height15*10),
            //Icon(Icons.person, size:50, color: Colors.black)
            SizedBox(height: Dimensions.height30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //ad-soyad
                    AccountWidget(appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Busra Sen"),),
                    SizedBox(height: Dimensions.height20),
                    //mail
                    AccountWidget(appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "busra@gmail.com"),),
                    SizedBox(height: Dimensions.height20),
                    //konum
                    AccountWidget(appIcon: AppIcon(icon: Icons.location_on_outlined,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Bursa"),),
                    SizedBox(height: Dimensions.height20),
                    //telefon
                    /*AccountWidget(appIcon: AppIcon(icon: Icons.phone_in_talk,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Telefon"),),
                    SizedBox(height: Dimensions.height20),*/
                    //ayarlar
                    AccountWidget(appIcon: AppIcon(icon: Icons.settings,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Ayarlar"),),
                    SizedBox(height: Dimensions.height20),
                    //çıkış
                    GestureDetector(
                      /*onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          // diğer datalar da gelmeli
                          Get.offNamed(RouteHelper.getSignInPage());
                        }
                      },*/
                      onTap: (){
                        _auth.signOut();
                      },
                      /*child: AccountWidget(appIcon: AppIcon(icon: Icons.logout,
                          backgroundColor: Colors.red,
                          size: Dimensions.height10*5),
                        bigText: BigText(text: "Çıkış Yap"),),*/
                      child: ElevatedButton(
                        onPressed: () {
                          setData();
                        },
                        child: BigText(
                            text: "Çıkış yap",
                            size: Dimensions.font20, color: Colors.red
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[300],
                            elevation: 0
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
