import 'package:animal_app/pages/auth/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var surnameController = TextEditingController();
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
              child: const Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage(    /*  LOGO  */
                      "assets/profile.png"
                    )
                ),
              ),
            ),

            AppTextField(textController: nameController,
                hintText: "Adınız",
                icon: Icons.person),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: surnameController,
                hintText: "Soyadınız",
                icon: Icons.person),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: emailController,
                hintText: "Mail adresiniz",
                icon: Icons.email),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: passwordController,
                hintText: "Şifreniz",
                icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20,),

            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.lightBlue
              ),
              child: Center(
                child: BigText(
                  text: "Kayıt Ol",
                  size: Dimensions.font20 + Dimensions.font20/2, color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: Dimensions.height10,),

            RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignInPage()),
                  text: "Zaten hesabınız var mı?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.bold
                  )
                )
            )
          ],
        ),
      )
    );
  }
}
