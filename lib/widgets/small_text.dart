import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key, this.color = Colors.black,
    required this.text,
    this.size= 14,
    this.height=1.4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto ',
          fontSize: size,
          color: color,
          height: height,
      ),
    );
  }
}
