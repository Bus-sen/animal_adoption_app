import 'package:animal_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
                children: List.generate(1, (index) {return Icon(Icons.favorite, color: Colors.red, size: Dimensions.font20);}) //favorilere ekleyen sayısı olabilir
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "0000"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "kişinin favorilerinde")
          ],
        )
      ],
    );
  }
}
