import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: BigText(
          text: "Profil", size: 24, color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: Dimensions.screenHeight*0.25,
            child: const Center(
              child: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  radius: 80,
                  backgroundImage: AssetImage(    /*  LOGO  */
                      "assets/profile.png"
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
