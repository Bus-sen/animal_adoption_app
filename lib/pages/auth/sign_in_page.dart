import 'package:animal_app/base/custom_loader.dart';
import 'package:animal_app/pages/auth/sign_up_page.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../home/home_page.dart';
import '../navpages/bottom_nav.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void _login(AuthController authController){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email.isEmpty){
      showCustomSnackbar("Lütfen mail adresinizi yazınız.", title: "Email Error!");
    } else if(!GetUtils.isEmail(email)){
      showCustomSnackbar("Lütfen geçerli bir mail adresi yazınız.", title: "Valid Email Error!");
    } else if(password.isEmpty){
      showCustomSnackbar("Lütfen şifrenizi giriniz.", title: "Password Error!");
    } else if(password.length<6){
      showCustomSnackbar("Şifre 6 karakterden az olamaz.", title: "Min Password Error!");
    } else if(password.length>8){
      showCustomSnackbar("Şifre 8 karakterden fazla olamaz.", title: "Max Password Error!");
    } else {
      //showCustomSnackbar("Kayıt Başarılı", title: "Perfect!");

      authController.login(email, password).then((status){
        if(status.isSuccess){
          //Get.toNamed(RouteHelper.getInitial());
        } else {
          showCustomSnackbar(status.message);
        }
      });
    }
  }

  signIn() async {
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
  }

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
                        signIn();
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
            )
          ],
        ),
      ),
    );
  }
}