import 'package:animal_app/pages/home/main_adverts_page_body.dart';
import 'package:animal_app/utils/colors.dart';
import 'package:animal_app/widgets/big_text.dart';
import 'package:animal_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class MainAdvertsPage extends StatefulWidget {
  const MainAdvertsPage({Key? key}) : super(key: key);

  @override
  State<MainAdvertsPage> createState() => _MainAdvertsPageState();
}

class _MainAdvertsPageState extends State<MainAdvertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SmallText(text: "İl", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded),
                          SmallText(text: "İlçe", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.iconColor1, // APPCOLORS P1: 23:12:00
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //body
          Expanded(child: SingleChildScrollView(
            child: MainAdvertsPageBody(),
          )),
        ],
      )
    );
  }
}
