import 'package:animal_app/pages/auth/shelter_sign_in_page.dart';
import 'package:animal_app/pages/auth/shelter_sign_up_page.dart';
import 'package:animal_app/pages/auth/sign_up_page.dart';
import 'package:animal_app/pages/navpages/bottom_nav.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  setData (){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> BottomNav()));
  }

  /*signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => HomePage()));
      }
      else {
        Fluttertoast.showToast(msg: "Bir şeyler yanlış gitti");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "Daha güçlü bir şifre kullanın.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "Bu e-mail ile açılmış bir hesap zaten var.");
      }
    } catch (e) {
      print(e);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05,),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/background.jpg"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              height: Dimensions.screenHeight * 0.25,
              width: Dimensions.screenWidth,
              /*child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      /*backgroundImage: AssetImage(      /*  LOGO Gerek  */
                          "assets/..."
                      )*/
                    ),
                  ),*/
            ),
            //hoşgeldiniz
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hoşgeldiniz",
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: Dimensions.font20 * 2 +
                              Dimensions.font20 / 2,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //giriş yapınız
            Container(
              child: Column(
                children: [
                  Text(
                    "Lütfen giriş yapınız.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),

            AppTextField(textController: emailController,
                hintText: "Mail adresiniz",
                icon: Icons.email),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: passwordController,
                hintText: "Şifreniz",
                icon: Icons.password_sharp, isObscure: true),
            SizedBox(height: Dimensions.height20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor
                ),
                child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setData();
                      },
                      child: BigText(
                          text: "Giriş Yap",
                          size: Dimensions.font20 + Dimensions.font20/2, color: Colors.black
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.mainColor,
                          elevation: 0
                      ),
                    )
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10,),

            RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => SignUpPage()),
                  text: "Hesabınız yok mu?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20
                  ),
                )
            ),
            SizedBox(height: Dimensions.height10),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>ShelterSignInPage()),
                    text: "Barınak hesabı mısınız?",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}