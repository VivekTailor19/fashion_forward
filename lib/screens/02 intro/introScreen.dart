import 'package:fashion_forward/screens/02%20intro/introController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  IntroScreenController i_control = Get.put(IntroScreenController());



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h,horizontal: 8.w),
          child: Column(
            children: [
              Obx(
                () =>  Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("${i_control.introList[i_control.currentIndex.value].img}"),
                    fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
              ),

              SizedBox(height: 5.h,),

              Obx(() =>  Text("${i_control.introList[i_control.currentIndex.value].heading}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25.sp),maxLines: 2,textAlign: TextAlign.left,)),

              SizedBox(height: 2.h,),


              Padding(
                padding:  EdgeInsets.symmetric(vertical: 2.h),
                child: Text(" Publish up your selfies to make yourself more beautiful with this app. ",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14.sp),maxLines: 3,textAlign: TextAlign.left,),
              ),

              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Obx(
                    () =>  AnimatedSmoothIndicator(
                      activeIndex: i_control.currentIndex.value,
                      count: 3,
                      effect: ExpandingDotsEffect(),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {

                      if(i_control.currentIndex.value <2)
                      {
                        i_control.currentIndex.value++;
                      }
                      else
                        {
                          Get.offAllNamed("/signIn");
                        }

                      print("${i_control.currentIndex.value}");

                    },
                    child: Container(height: 50,width: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),

                      child: Icon(Icons.arrow_forward_ios_rounded,size: 22.sp,color: Colors.white),
                    ),
                  )
                ],
              )





            ],
          ),

        ),
      ),
    );
  }
}
