import 'package:animal_app/utils/colors.dart';
import 'package:animal_app/utils/dimensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page.dart';


class AdvertsDetail extends StatefulWidget {
  var _adverts;
  AdvertsDetail(this._adverts);

  @override
  State<AdvertsDetail> createState() => _AdvertsDetailState();
}

class _AdvertsDetailState extends State<AdvertsDetail> {

  List<String> _images = [];
  var _firestoreInstance = FirebaseFirestore.instance;

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


  Future addFavorite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("favorites");
    return _collectionRef
        .doc()
        .set({
      "adverts-name":widget._adverts["adverts-name"],
      "adverts-age":widget._adverts["adverts-age"],
      "adverts-gender":widget._adverts["adverts-gender"],
      "adverts-location":widget._adverts["adverts-location"],
      "adverts-sci_name":widget._adverts["adverts-sci_name"],
      "adverts-description":widget._adverts["adverts-description"],
      //"adverts-img":widget._adverts["adverts-img"],

    }).then((value) => print("Favorilere eklendi"));
  }

  Future addRequest() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("requests");
    return _collectionRef
        .doc()
        .set({
      "adverts-name":widget._adverts["adverts-name"],
      "adverts-age":widget._adverts["adverts-age"],
      "adverts-gender":widget._adverts["adverts-gender"],
      "adverts-location":widget._adverts["adverts-location"],
      "adverts-sci_name":widget._adverts["adverts-sci_name"],
      "adverts-description":widget._adverts["adverts-description"],
      //"adverts-img":widget._adverts["adverts-img"],
    }).then((value) => print("İstek gönderildi"));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
          alignment: Alignment.center,
          children: <Widget>[ Column(
            children:
            <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // image konumu ve arka plan
                  Container(
                    height: screenHeight*0.5,
                    color: Colors.grey,
                    child: Image(
                      image: AssetImage("assets/cat.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                    /*child: Hero(
                      tag: widget._adverts["adverts-name"],
                      child: Container(
                        child: CarouselSlider(
                          items: widget._adverts["adverts-img"].map((item)=>Padding(
                            padding: EdgeInsets.only(right: 5, left: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitWidth
                                )
                              ),
                            ),
                          )).toList(),
                          options: CarouselOptions(
                            enlargeCenterPage: true
                          ),
                        ),
                        height: Dimensions.listViewImgSize,
                        //fit: BoxFit.fitHeight,
                        width: Dimensions.listViewImgSize,
                      ),
                    ),*/
                  ),
                  /*AspectRatio(
                    aspectRatio: 3.5,
                    child: CarouselSlider(
                      items: widget._adverts["adverts-img"].map((item) => Padding(
                        padding: EdgeInsets.only(right: 5, left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitWidth
                              )
                          ),
                        ),
                      )).toList(),
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true
                      ),
                    ),
                  ),*/
                  // image yükseklik - büyüklük
                  /* Container(
                    height: screenHeight*0.5,
                    child: Image(
                        image: AssetImage("assets/cat.jpg"),
                        fit: BoxFit.fitWidth),
                  ) */
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: [
                                CircleAvatar(
                                  //radius: 20.0,
                                  backgroundImage: AssetImage("assets/profile.png"),
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Busra Sen", style: TextStyle(
                                          color: AppColors.textColor, fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      SizedBox(width: Dimensions.width20*3),
                                      Icon(Icons.location_on, color: Colors.grey),

                                      // adverts-location
                                      Text(widget._adverts["adverts-location"], style: TextStyle(
                                          color: Colors.grey[700], fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text("busra@gmail.com",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w600
                          ),),
                        SizedBox(height: Dimensions.height20),
                        // adverts-description
                        Text(widget._adverts["adverts-description"],
                          style: TextStyle(
                            color: Colors.black, fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  //color: AppColors.mainColor.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // favorite icon
                      StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("favorites")
                              .doc(FirebaseAuth.instance.currentUser?.email)
                              .collection("items").where("name",
                              isEqualTo: widget._adverts["adverts-name"]).snapshots(),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if(snapshot.data==null){
                              return Text("");
                            }
                            return Container(
                              width: Dimensions.screenWidth/5,
                              height: Dimensions.screenHeight/5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.iconColor3,
                                  child: IconButton(
                                    iconSize: 30,
                                      onPressed: () => snapshot.data.docs.length==0?addFavorite()
                                          :print("Zaten favorilerde"),
                                      icon: snapshot.data.docs.length==0?Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                      ): Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      )
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(width: Dimensions.width20),

                      // istek atma
                      Expanded(
                        child: Container(
                          width: Dimensions.screenWidth/2,
                          height: Dimensions.screenHeight/13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor
                          ),
                          child: ElevatedButton(
                            onPressed: ()=> addRequest(),
                              child: Text("Sahiplenmek İste",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.iconColor3,
                              elevation: 3,
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                elevation: 10.0,
                child: Container(
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
                          SizedBox(width: Dimensions.width10*3),

                          // adverts-name
                          Text(
                            widget._adverts["adverts-name"],
                            style: TextStyle(
                              fontSize: 26.0,
                              color:
                              AppColors.textColor,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),

                          // adverts-gender
                          /*Icon(
                            widget._adverts.isFemale
                                ? Icons.female_rounded
                                : Icons.male_rounded,
                            color: Colors.grey,
                          ),*/
                        ],
                      ),
                      SizedBox(height: Dimensions.height10),

                      // adverts-sci_name
                      Text(
                        widget._adverts["adverts-sci_name"],
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),

                      // adverts-age
                      Text(
                        '${widget._adverts["adverts-age"]} yaşında',
                        style: TextStyle(
                          color: AppColors.textColor,
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
                            color: Colors.black,
                          ),

                          //adverts-location
                          Text(
                            widget._adverts["adverts-location"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight:
                              FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.iconColor3,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 130,
                ),
              ),
            )
          ]
      ),


    );
  }
}

