import 'package:animal_app/pages/auth/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class ShelterAccountPage extends StatefulWidget {
  const ShelterAccountPage({super.key});

  @override
  State<ShelterAccountPage> createState() => _ShelterAccountPageState();
}

class _ShelterAccountPageState extends State<ShelterAccountPage> {

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
            //iconSize fotoğraf yükleme olmalı
            AppIcon(icon: Icons.add_a_photo,
                backgroundColor: AppColors.iconColor2,
                size: Dimensions.height15*10),
            //Icon(Icons.person, size:50, color: Colors.black)
            SizedBox(height: Dimensions.height30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //barınak adı
                    AccountWidget(appIcon: AppIcon(icon: Icons.home_repair_service,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Yuvam Barinak"),),
                    SizedBox(height: Dimensions.height20),
                    // yetkili ad-syoad
                    AccountWidget(appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Asli Demirel"),),
                    SizedBox(height: Dimensions.height20),
                    //mail
                    AccountWidget(appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "barinak@gmail.com"),),
                    SizedBox(height: Dimensions.height20),
                    //konum/adres
                    AccountWidget(appIcon: AppIcon(icon: Icons.location_on_outlined,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Denizli"),),
                    SizedBox(height: Dimensions.height20),
                    //telefon
                    AccountWidget(appIcon: AppIcon(icon: Icons.phone_in_talk,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "5555555555"),),
                    SizedBox(height: Dimensions.height20),
                    //ayarlar
                    AccountWidget(appIcon: AppIcon(icon: Icons.settings,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Ayarlar"),),
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
