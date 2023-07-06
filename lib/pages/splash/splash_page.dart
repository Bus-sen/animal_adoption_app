import 'dart:async';

import 'package:animal_app/pages/auth/sign_in_page.dart';
import 'package:animal_app/pages/navpages/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;


  @override
  void initState(){
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear);
    Timer(
      const Duration(seconds: 3),
            //()=>Get.offNamed(RouteHelper.getInitial())
        ()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>SignInPage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/logo.png", width: Dimensions.splashImg))),
          Center(child: Image.asset("assets/adonim.png", width: Dimensions.splashImg))
        ],
      ),
    );
  }
}
