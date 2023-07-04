import 'package:animal_app/widgets/fetchAdverts.dart';
import 'package:flutter/material.dart';

class FavoriteDataPage extends StatefulWidget {
  const FavoriteDataPage({Key? key}) : super(key: key);

  @override
  State<FavoriteDataPage> createState() => _FavoriteDataPageState();
}

class _FavoriteDataPageState extends State<FavoriteDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: fetchData("favorites"),
      ),
    );
  }
}
