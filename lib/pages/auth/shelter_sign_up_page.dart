import 'package:animal_app/pages/auth/sign_in_page.dart';
import 'package:animal_app/pages/navpages/shelter_bottom_nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class ShelterSignUpPage extends StatefulWidget {
  const ShelterSignUpPage({super.key});

  @override
  State<ShelterSignUpPage> createState() => _ShelterSignUpPageState();
}

class _ShelterSignUpPageState extends State<ShelterSignUpPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var shelterController = TextEditingController();

  sendUserDataDB()async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("shelter registration data");
    return _collectionRef.add({
      "shelter": shelterController.text,
      "name":nameController.text,
      "email":emailController.text,
      "address":addressController.text,
      "password":passwordController.text,
      "phone": phoneController.text
    }).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (_)=>ShelterBottomNav()))).catchError((error)=>print("Bir şeyler yanlış gitti. $error"));
  }

  /*signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => ShelterBottomNav()));
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
      body: SingleChildScrollView( //!_authController.isLoading? 'di
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/background.jpg"
                      ),
                      fit: BoxFit.fitWidth
                  )
              ),
              height: Dimensions.screenHeight*0.25,
            ),
            SizedBox(height: Dimensions.height20,),

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
            //kayıt olunuz
            Container(
              child: Column(
                children: [
                  Text(
                    "Lütfen kayıt olunuz.",
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

            AppTextField(textController: shelterController,
                hintText: "Barınak adı",
                icon: Icons.person),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: nameController,
                hintText: "Yetkili ad - soyad",
                icon: Icons.person),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: emailController,
                hintText: "Mail adresiniz",
                icon: Icons.email),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: phoneController,
                hintText: "Telefon numaranız",
                icon: Icons.phone),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: addressController,
                hintText: "Adresiniz",
                icon: Icons.location_on_outlined),
            SizedBox(height: Dimensions.height20,),

            AppTextField(textController: passwordController,
                hintText: "Şifreniz",
                icon: Icons.password_sharp, isObscure: true),
            SizedBox(height: Dimensions.height20,),


            //kayıt ol butonu
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: (){
                    sendUserDataDB();
                  },
                  child: BigText(
                      text: "Kayıt Ol",
                      size: Dimensions.font20 + Dimensions.font20/2, color: Colors.black
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.mainColor,
                      elevation: 0
                  ),
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
            ),

          ],
        ),
      ),
    );
  }
}
