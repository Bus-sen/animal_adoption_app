import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../home/adverts_detail.dart';

class RequestListPage extends StatefulWidget {
  const RequestListPage({super.key});

  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  List _adverts = [];

  fetchReqAdverts() async{
    QuerySnapshot qn = await FirebaseFirestore.instance.collection("requests").get();
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
    fetchReqAdverts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.iconColor3,
        title: Center(
          child: BigText(
            text: "İsteklerim", size: 24, color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.width10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.width10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
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
                                                          SizedBox(width: Dimensions.width10*3),
                                                          Text("${_adverts[index]["adverts-name"]}",
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
                                                      Text("${_adverts[index]["adverts-sci_name"]}",
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: AppColors.textColor,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(height: Dimensions.height10),
                                                      Text("${_adverts[index]["adverts-age"]} yaşında'",
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
                                                          Text("${_adverts[index]["adverts-location"]}",
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
                                          Hero(
                                            tag:  _adverts[index]["adverts-name"],
                                            child: Container(
                                              //child: Image.network(_adverts[index]["adverts-img"][0]),
                                              child: Image(image: AssetImage("assets/cat.jpg"),),
                                              height: Dimensions.listViewImgSize,
                                              //fit: BoxFit.fitHeight,
                                              width: Dimensions.listViewImgSize,
                                            ),
                                          ),
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
