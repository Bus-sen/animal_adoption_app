import 'package:animal_app/controllers/auth_controller.dart';
import 'package:animal_app/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
                      bigText: BigText(text: "Ad Soyad"),),
                    SizedBox(height: Dimensions.height20),
                    //mail
                    AccountWidget(appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Mail adresi"),),
                    SizedBox(height: Dimensions.height20),
                    //konum
                    AccountWidget(appIcon: AppIcon(icon: Icons.location_on_outlined,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Adres"),),
                    SizedBox(height: Dimensions.height20),
                    //telefon
                    AccountWidget(appIcon: AppIcon(icon: Icons.phone_in_talk,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Telefon"),),
                    SizedBox(height: Dimensions.height20),
                    //ayarlar
                    AccountWidget(appIcon: AppIcon(icon: Icons.settings,
                        backgroundColor: AppColors.iconColor2,
                        size: Dimensions.height10*5),
                      bigText: BigText(text: "Ayarlar"),),
                    //çıkış
                    /*GestureDetector(
                      onTap: (){
                        if(Get.find<AuthController>().userLoggedIn()){
                          Get.find<AuthController>().clearSharedData();
                          // diğer datalar da gelmeli
                          Get.offNamed(RouteHelper.getSignInPage());
                        }
                      },
                      child: AccountWidget(appIcon: AppIcon(icon: Icons.logout,
                          backgroundColor: Colors.red,
                          size: Dimensions.height10*5),
                        bigText: BigText(text: "Çıkış Yap"),),
                    ),*/
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
