import 'package:animal_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({Key? key, this.color = Colors.black,
    required this.text,
    this.size= 0,
    this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto ',
        fontSize: size == 0?Dimensions.font20:size,
        color: color,
        fontWeight: FontWeight.w500
      ),
    );
  }
}
