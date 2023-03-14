import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          SizedBox(height: Dimensions.screenHeight*0.05,),
          Container(           /*  LOGO Gerek  */
            height: Dimensions.screenHeight*0.25,
            child: Center(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  /*backgroundImage: AssetImage(
                      "assets/..."
                  )*/
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
            height: Dimensions.screenWidth/13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Colors.blueAccent
            ),
            
          )

        ],
      )
    );
  }
}
