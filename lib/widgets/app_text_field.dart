import 'package:animal_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  AppTextField({Key? key,

  required this.textController,
  required this.hintText,
  required this.icon,
  this.isObscure=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(        /* EMAIL */
      margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1,10),
                color: Colors.grey.withOpacity(0.3)
            )
          ]
      ),
      child: TextField(
        obscureText: isObscure?true:false,
          controller: textController,
          decoration: InputDecoration(
            //hintText
              hintText: hintText,
              //prefixIcon
              prefixIcon: Icon(icon, color: AppColors.iconColor1),
              //focusedBorder
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )
              ),
              //enabledBorder
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )
              ),
              //border
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
              )
          )
      ),
    );
  }
}
