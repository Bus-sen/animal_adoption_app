import 'package:animal_app/pages/auth/shelter_sign_up_page.dart';
import 'package:animal_app/pages/auth/sign_in_page.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../home/home_page.dart';
import '../navpages/bottom_nav.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();

  /*void _registration(AuthController authController) {
    String name = nameController.text.trim();
    String surname = surnameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();

    /*Future<void> _selectDateFromPicker(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 20),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year),
      );
    }*/
    if(name.isEmpty){
      showCustomSnackbar("Lütfen adınızı yazınız.", title: "Name Error!");
    } else if(surname.isEmpty){
      showCustomSnackbar("Lütfen soyadınızı yazınız.", title: "Surname Error!");
    } else if(email.isEmpty){
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
      showCustomSnackbar("Kayıt Başarılı", title: "Perfect!");
      SignUpBody signUpBody = SignUpBody(name: name,
          surname: surname,
          email: email,
          password: password,
          phone: phone,
          address: address);
      authController.registration(signUpBody).then((status){
        if(status.isSuccess){
          print("Success registration");
        } else {
          showCustomSnackbar(status.message);
        }
      });
    }
  }*/

    sendUserDataDB()async{
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var  currentUser = _auth.currentUser;

      CollectionReference _collectionRef = FirebaseFirestore.instance.collection("user registration data");
      return _collectionRef.add({
        "name":nameController.text,
        "surname":surnameController.text,
        "email":emailController.text,
        "address":addressController.text,
        "password":passwordController.text,
      }).then((value) => Navigator.push(context,
          MaterialPageRoute(builder: (_)=>BottomNav()))).catchError((error)=>print("Bir şeyler yanlış gitti. $error"));
    }

    /*postDetailsFirestore() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var  currentUser = _auth.currentUser;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();

      userModel.email=user?.email;
      userModel.id=user?.uid;
      userModel.name=nameController.text;
      userModel.surname=surnameController.text;
      userModel.address=addressController.text;

      await firebaseFirestore.collection("user registration data").
      doc(user?.uid).set(userModel.toMap());
      print("başarılı");
      
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
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

            /*AppTextField(textController: phoneController,
                hintText: "Telefon numaranız",
                icon: Icons.phone),
            SizedBox(height: Dimensions.height20,),*/

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