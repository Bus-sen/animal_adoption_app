import 'package:animal_app/pages/adverts/add_advert.dart';
import 'package:animal_app/pages/home/search_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'adverts_detail.dart';

class Animal {
  String name;
  String scientificName;
  int age;
  bool gender; //isFemale
  String imageUrl;
  String location;
  String description;

  Animal({
    required this.name,
    required this.scientificName,
    required this.age,
    required this.gender,
    required this.imageUrl,
    required this.location,
    required this.description
});
}
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedAnimalIconIndex = 0;
  List<String> _images = [];
  List _adverts = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  List<String> animalTypes = [
    "Kedi",
    "Köpek",
    "Kuş",
    "Balık",
    "Tavşan"

  ];
  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
    FontAwesomeIcons.carrot
  ];

  //resimler
  fetchImages() async{
    QuerySnapshot qn = await _firestoreInstance.collection("images").get();
    setState(() {
      for(int i=0; i<qn.docs.length; i++){
        _images.add(
          qn.docs[i]["url"],
        );
        print(qn.docs[i]["url"]);
      }
    });
    return qn.docs;
  }

  //ilanlar
  fetchAdverts() async{
    QuerySnapshot qn = await _firestoreInstance.collection("adverts").get();
    setState(() {
      for(int i=0; i<qn.docs.length; i++){
        _adverts.add({
          "adverts-name":qn.docs[i]["adverts-name"],
          "adverts-age":qn.docs[i]["adverts-age"],
          "adverts-gender":qn.docs[i]["adverts-gender"],
          "adverts-location":qn.docs[i]["adverts-location"],
          "adverts-sci_name":qn.docs[i]["adverts-sci_name"],
          "adverts-description":qn.docs[i]["adverts-description"],
          //"adverts-img":qn.docs[i]["adverts-img"],
        });
      }
    });
    return qn.docs;
  }

  void initState(){
    fetchImages();
    fetchAdverts();
    super.initState();
  }

  @override
  Widget buildAnimalIcon(int index) {
    return Padding(
        padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Material(
              color: selectedAnimalIconIndex == index
              ? AppColors.iconColor1 : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(10.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                  child: Icon(
                    animalIcons[index],
                    size: 30.0,
                    color: selectedAnimalIconIndex == index
                    ? Colors.black : AppColors.mainColor,
                  ),
                ),
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            animalTypes[index],
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.width10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.width30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.search,
                                color: Colors.grey[800],
                              ),
                              Expanded(
                                child: TextField(
                                  readOnly: true,
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Search pets to adopt'),
                                  onTap: ()=> Navigator.push(context, CupertinoPageRoute(builder: (_)=>SearchScreen())),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.filter,
                                color: Colors.grey[800],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.iconColor1
                          ),
                         child: Center(
                              child: RichText(
                                text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(() => AddAdvertPage()),
                                  text: "İLAN VER",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: Dimensions.font20 + Dimensions.font20/2
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                      Container(
                        height: Dimensions.pageViewContainer/1.6,
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                              left: Dimensions.height20,
                              top: Dimensions.height20,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: animalTypes.length,
                            itemBuilder: (context, index) {
                              return buildAnimalIcon(index);
                            }),
                      ),
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: Dimensions.width10),
                            itemCount: _adverts.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: ()=> Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=> AdvertsDetail(_adverts[index]))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: Dimensions.height20,
                                      left: Dimensions.height20,
                                      bottom: Dimensions.height20
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      /*AspectRatio(
                                        aspectRatio: 3.5,
                                        child: CarouselSlider(
                                          items: _images.map((item) => Padding(
                                            padding: EdgeInsets.only(right: 5, left: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(item),
                                                      fit: BoxFit.fitWidth
                                                  )
                                              ),
                                            ),
                                          )
                                          ).toList(),
                                          options: CarouselOptions(
                                              autoPlay: false,
                                              enlargeCenterPage: true
                                          ),
                                        ),
                                      ),*/
                                      Material(
                                        borderRadius: BorderRadius.circular(10.0),
                                        elevation: 5.0,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.height20,
                                              left: Dimensions.height20
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          /*CarouselSlider(
                                                              items: _images.map((item) => Padding(
                                                                padding: EdgeInsets.only(right: 5, left: 5),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                      image: NetworkImage(item),
                                                                      fit: BoxFit.fitWidth
                                                                      )
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).toList(),
                                                              options: CarouselOptions(
                                                                autoPlay: false,
                                                                enlargeCenterPage: true
                                                                )
                                                              ),*/
                                                          SizedBox(width: Dimensions.width10*3),
                                                          Text(
                                                            "${_adverts[index]["adverts-name"]}",
                                                            style: TextStyle(
                                                              fontSize: 26.0,
                                                              color:
                                                              AppColors.textColor,
                                                              fontWeight:
                                                              FontWeight.bold,
                                                            ),
                                                          ),
                                                          SizedBox(width: Dimensions.width10),
                                                          /*Icon(
                                                            _adverts[index].gender
                                                                ? Icons.female_rounded
                                                                : Icons.male_rounded,
                                                            color: Colors.grey,
                                                          ),*/
                                                        ],
                                                      ),
                                                      SizedBox(height: Dimensions.height10),
                                                      Text(
                                                        "${_adverts[index]["adverts-sci_name"]}",
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: AppColors.textColor,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(height: Dimensions.height10),
                                                      Text(
                                                        '${_adverts[index]["adverts-age"]} yaşında',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(height: Dimensions.height10),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            color: Colors.grey,
                                                          ),
                                                          Text(
                                                            "${_adverts[index]["adverts-location"]}",
                                                            style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: AppColors.textColor,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: Dimensions.height10),
                                                    ],
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                            ),
                                            height: Dimensions.height20,
                                            //width: deviceWidth * 0.4,
                                          ),
                                          /*Hero(
                                            tag: _adverts[index]["adverts-name"],
                                            child: Container(
                                              child: Image(image: AssetImage("assets/cat.jpg"),),
                                              /*child: Card(
                                                child: Column(
                                                  children: [
                                                    AspectRatio(aspectRatio: 3,
                                                      child: Container(
                                                        child: Image.network(_images.first),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),*/
                                              height: Dimensions.listViewImgSize,
                                              //fit: BoxFit.fitHeight,
                                              width: Dimensions.listViewImgSize,
                                            ),
                                          ),*/
                                        ],
                                        alignment: Alignment.centerLeft,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
