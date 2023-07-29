import 'package:fashion_forward/utils/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Success_LoginScreen extends StatefulWidget {
  const Success_LoginScreen({super.key});

  @override
  State<Success_LoginScreen> createState() => _Success_LoginScreenState();
}

class _Success_LoginScreenState extends State<Success_LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w,),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 10.h,),
                Icon(Icons.check_circle_outline_rounded,size: 55.sp,
                  color: Colors.green.shade500,),
                SizedBox(height: 3.h,),
                Text(
                  "Successful !",
                  style:
                  TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp),
                ),
                SizedBox(height: 1.5.h,),
                SizedBox(width: 80.w,
                  child: Text("You have successfully registered and login in our app. Now you can start working on it.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w300,color: Colors.black45),
                    ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed("/first");
                  },
                  child: Container(height: 8.h,width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    alignment: Alignment.center,
                    child: Text("Start",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h),color: Color(0xff000000)),),
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("To SignOut from this Account ? ",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12.sp),),

                    TextButton(onPressed: () {
                      FirebaseHelper.firebaseHelper.accountLogOut();
                      Get.offAllNamed("/signIn");
                    }, child: Text("Sign Out",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14.sp),))
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

