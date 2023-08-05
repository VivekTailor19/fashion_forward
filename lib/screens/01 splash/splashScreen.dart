import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/firebase_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool userStatus = false;
  @override
  void initState() {
    super.initState();

    userStatus = FirebaseHelper.firebaseHelper.check_user();
  }


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() =>
    userStatus == false
        ? Get.offAllNamed("/intro")
        : Get.offAllNamed("/first"));

    return SafeArea(
      child: Scaffold(
          body: Container(height: 100.h,width: 100.w,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splash/splash.jpg"),fit: BoxFit.fill),
            ),
            child:
              Column(children: [
                SizedBox(height: 45.h),
                Image.asset("assets/images/logo/logo_white.png",height: 20.h,)
          ],),),
      ),
    );
  }
}
