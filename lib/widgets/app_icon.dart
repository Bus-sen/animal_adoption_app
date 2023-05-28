import 'package:animal_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  AppIcon({Key? key,
    required this.icon,
    this.backgroundColor=const Color.fromRGBO(201, 219, 178,1),
    this.iconColor=const Color.fromRGBO(0, 0, 0,1),
    this.size=40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize24,
      ),
    );
  }
}
