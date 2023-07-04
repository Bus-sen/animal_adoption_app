import 'package:animal_app/widgets/fetchAdverts.dart';
import 'package:flutter/material.dart';

class RequestDataPage extends StatefulWidget {
  const RequestDataPage({Key? key}) : super(key: key);

  @override
  State<RequestDataPage> createState() => _RequestDataPageState();
}

class _RequestDataPageState extends State<RequestDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: fetchData("requests"),
      ),
    );
  }
}
