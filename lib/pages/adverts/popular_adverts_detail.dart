import 'package:animal_app/utils/dimensions.dart';
import 'package:animal_app/widgets/app_column.dart';
import 'package:animal_app/widgets/app_icon.dart';
import 'package:animal_app/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class PopularAdvertsDetail extends StatelessWidget {
  const PopularAdvertsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularAdvertsImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/dog.png"
                    )
                  )
                ),
          )),
          //icon
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                children: [
                  AppIcon(icon: Icons.arrow_back_ios)
                ],
          )),
          //introduction
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularAdvertsImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                  child: Column(
                    children: [
                      AppColumn(text: "KÖPEK"),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(1, (index) {return Icon(Icons.pets, color: AppColors.iconColor2, size: Dimensions.font20);}) //favorilere ekleyen sayısı olabilir
                          ),
                          SizedBox(width: Dimensions.width10),
                          BigText(text: "Hakkında Bilgiler", color: AppColors.textColor),
                          SizedBox(width: Dimensions.width10),
                          Wrap(
                              children: List.generate(1, (index) {return Icon(Icons.pets, color: AppColors.iconColor2, size: Dimensions.font20);}) //favorilere ekleyen sayısı olabilir
                          )
                        ],
                      ),
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text: "Evcil hayvanlar genelde, aile, partner, çocuk yerine konmada rol "
                                  "oynamaktadır (Franklin, 1999). Kırdan kente göç olgusu, aileler ile "
                                  "birlikte hayvanların da evlerin içine girmesini beraberinde "
                                  "getirirken aynı zamanda aile yapılarının da değişmesine yol açmıştır."),
                        ),
                      )
                    ],
                ),
              ))
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height20,
          bottom: Dimensions.height20,
          left: Dimensions.width20,
          right: Dimensions.width20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.favorite_border_outlined, color: Colors.red, size: 50),
                  //BigText(text: "Favorilerime ekle"),
                  SizedBox(width: Dimensions.width10/2),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),
              child: BigText(text: "Sahiplenmek iste", color: Colors.black),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
