import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../home/home_page.dart';
import '../navpages/bottom_nav.dart';

class AddAdvertPage extends StatefulWidget {

  var _adverts;
  AddAdvertPage(this._adverts);

  @override
  State<AddAdvertPage> createState() => _AddAdvertPageState();
}

class _AddAdvertPageState extends State<AddAdvertPage> {

  static const List<String> gender = <String>['Female', 'Male'];
  static const List<String> tur = <String>['Kedi', 'Köpek', 'Kuş', 'Balık', 'Tavşan'];
  static const List<String> il = <String>["Adana", "Adıyaman", "Afyonkarahisar",
    "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın",
    "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu",
    "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce",
    "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun",
    "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir",
    "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis",
    "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya",
    "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye",
    "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak",
    "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"];

  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;

  var nameController = TextEditingController();
  var sci_nameController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var locationController = TextEditingController();
  var descriptionController = TextEditingController();

  sendUserDataDB()async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("adverts");
    return _collectionRef.add({
      "adverts-name":nameController.text,
      "adverts-sci_name":sci_nameController.text,
      "adverts-age":ageController.text,
      "adverts-gender":genderController.text,
      "adverts-location":locationController.text,
      "adverts-description":descriptionController.text,
    }).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (_)=>BottomNav()))).catchError((error)=>print("Bir şeyler yanlış gitti. $error"));
  }

  /*Future addAdvert() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("uploaded adverts");
    return _collectionRef.doc(currentUser?.email)
        .collection("items")
        .doc()
        .set({
      "name":widget._adverts["adverts-name"],
      "sci_name":widget._adverts["adverts-sci_name"],
      "imageUrl":widget._adverts["adverts-img"],
      "gender":widget._adverts["adverts-gender"],
      "age":widget._adverts["adverts-age"],
      "location":widget._adverts["adverts-location"],
      "description":widget._adverts["adverts-description"],
    }).then((value) => print("İlan kaydedildi"));
  }*/

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async{
    final path = "adverts-images/${pickedFile!.name}";
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot =  await uploadTask!.whenComplete(() => {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print("Download link: $urlDownload");

    setState(() {
      uploadTask = null;
    });
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot){
        if(snapshot.hasData){
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(height: Dimensions.height20);
        }
        else {
          return SizedBox(height: Dimensions.height20);
        }
      }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.iconColor3,
        title: Center(
          child: BigText(
            text: "İlan Yükle", size: 24, color: Colors.white,
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: nameController,
                  hintText: "Hayvan adını giriniz",
                  icon: Icons.person),
              SizedBox(height: Dimensions.height20,),

              AppTextField(textController: descriptionController,
                  hintText: "Hayvan hakkında bilgi veriniz",
                  icon: Icons.textsms),
              SizedBox(height: Dimensions.height20,),

              Container(
                margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,10),
                          color: Colors.grey.withOpacity(0.3)
                      )
                    ]
                ),
                child: TextField(
                  controller: genderController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Hayvanın cinsiyetini seçiniz",
                    prefixIcon: DropdownButton<String> (
                      items: gender.map((String value){
                        return DropdownMenuItem<String>(
                            child: new Text(value),
                            value: value,
                            onTap: (){
                              setState(() {
                                genderController.text=value;
                              });
                          },
                        );
                      }).toList(),
                      onChanged: (_){},
                  ),
                ),
                ),
              ),

              SizedBox(height: Dimensions.height20,),

              AppTextField(textController: ageController,
                  hintText: "Hayvanın yaşını giriniz",
                  icon: Icons.numbers_rounded),
              SizedBox(height: Dimensions.height20,),

              Container(
                margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,10),
                          color: Colors.grey.withOpacity(0.3)
                      )
                    ]
                ),
                child: TextField(
                  controller: sci_nameController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Hayvanın türünü seçiniz",
                    prefixIcon: DropdownButtonHideUnderline(
                      child: DropdownButton<String> (
                        items: tur.map((String value){
                          return DropdownMenuItem<String>(
                            child: new Text(value),
                            value: value,
                            onTap: (){
                              setState(() {
                                sci_nameController.text=value;
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (_){},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20,),

              Container(
                margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,10),
                          color: Colors.grey.withOpacity(0.3)
                      )
                    ]
                ),
                child: TextField(
                  controller: locationController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "İl seçiniz",
                    prefixIcon: DropdownButton<String> (
                      items: il.map((String value){
                        return DropdownMenuItem<String>(
                          child: new Text(value),
                          value: value,
                          onTap: (){
                            setState(() {
                              locationController.text=value;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (_){},
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20),

              Container(
                child: Center(
                  child: Column(
                    children: [
                      if (pickedFile != null)
                        Text(pickedFile!.name,
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      SizedBox(height: Dimensions.height10),
                      Container(
                          width: Dimensions.screenWidth/2,
                          height: Dimensions.screenHeight/13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.iconColor2
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              selectFile();
                            },
                            child: BigText(text: "Dosya Seç",
                              size: Dimensions.font20 + Dimensions.font20/2,
                                color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.iconColor2,
                              elevation: 3,
                            ),
                          )
                      ),
                      SizedBox(height: Dimensions.height10),
                      Container(
                          width: Dimensions.screenWidth/2,
                          height: Dimensions.screenHeight/13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.iconColor2
                          ),
                          child: ElevatedButton(
                            onPressed: (){
                              sendUserDataDB();
                              uploadFile();
                            },
                            child: BigText(text: "Kaydet",
                              size: Dimensions.font20 + Dimensions.font20/2,
                              color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.iconColor2,
                              elevation: 3,
                            ),
                          )
                      ),
                      SizedBox(height: Dimensions.height10),
                      buildProgress()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
