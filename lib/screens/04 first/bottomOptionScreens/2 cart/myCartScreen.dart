import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,

        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w,),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    Get.back();
                  },
                    icon:Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 22.sp,
                    ),),
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Cart",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),
                  SizedBox(height: 1.h,),

                  Container(
                    height: 48.h,
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                        return CartTile();
                      },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
