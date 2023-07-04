import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetFavoriteListPage extends StatelessWidget {
  final String documentId;
  GetFavoriteListPage({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference _adverts = FirebaseFirestore.instance.collection("adverts");

    return FutureBuilder<DocumentSnapshot>(
        future: _adverts.doc(documentId).get(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data =
            snapshot.data?.data() as Map<String, dynamic>;
            return Text("${data["adverts-name"]}"+ "\n"
                "${data["adverts-age"]}"
            );
          }
          return Text("Yükleniyor..");
        });
  }
}