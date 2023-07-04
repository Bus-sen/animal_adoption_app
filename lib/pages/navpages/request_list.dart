import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class RequestListPage extends StatelessWidget {
  const RequestListPage({Key? key}) : super(key: key);

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

    );
  }
}
