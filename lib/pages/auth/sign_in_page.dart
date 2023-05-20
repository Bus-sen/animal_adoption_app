import 'package:animal_app/pages/auth/sign_up_page.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    /*backgroundImage: AssetImage(      /*  LOGO Gerek  */
                        "assets/..."
                    )*/
                  ),
                ),
              ),

              //welcome
              Container(
                  child: Column(
                    children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hoşgeldiniz",
                            style: TextStyle(
                              fontSize: Dimensions.font20*2+Dimensions.font20/2,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

              AppTextField(textController: emailController,
                  hintText: "Mail adresiniz",
                  icon: Icons.email),
              SizedBox(height: Dimensions.height20,),

              AppTextField(textController: passwordController,
                  hintText: "Şifreniz",
                  icon: Icons.password_sharp),
              SizedBox(height: Dimensions.height20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(
                      text: "Giriş Yap",
                      size: Dimensions.font20 + Dimensions.font20/2, color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: Dimensions.height10,),

              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage()),
                      text: "Hesabınız yok mu?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20
                      ),
                  )
              )
            ],
          ),
        )
    );
  }
}