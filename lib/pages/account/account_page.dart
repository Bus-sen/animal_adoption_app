import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Profil", size: 24, color: Colors.black,
        ),
      ),
    );
  }
}
