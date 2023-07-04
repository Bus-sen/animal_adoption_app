import 'package:animal_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget customButton (String buttonText,onPressed){
  return SizedBox(
    width: Dimensions.height20,
    height: Dimensions.height20,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.mainColor,
        elevation: 3,
      ),
    ),
  );
}