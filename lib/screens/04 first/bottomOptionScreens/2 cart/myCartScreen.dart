import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/cartScreen.dart';
import 'package:fashion_forward/screens/04%20first/first/firstController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  FirstController f_control = Get.put(FirstController());

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
                    height: 54.h,
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
                  ),
                  SizedBox(height: 1.h,),

                  Container(height: 18.5.h,width: 100.w,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)
                     ),

                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 3.5.w ,vertical: 2.h),


                  child: Column(children: [
                    MoneyCartTile(title: "Subtotal",money: "483"),
                    Divider(color: Colors.black12,height: 2.h,thickness: 1.1),
                    MoneyCartTile(title: "Shipping",money: "17"),
                    Divider(color: Colors.black12,height: 2.h,thickness: 1.1),
                    MoneyCartTile(title: "BagTotal",money: "500"),
                  ],),),
                  SizedBox(height: 1.5.h,),

                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(title: "",
                        content: Column(
                          children: [
                            Stack(
                              children: [
                                Align(alignment: Alignment.center,
                                  child: CircleAvatar(radius: 3.5.h,
                                    child: Icon(Icons.credit_card,color: Colors.white,size: 25.sp,),
                                    backgroundColor: Colors.black,),
                                ),

                                Align(alignment:Alignment(0.15,0),
                                  child: CircleAvatar(radius: 1.h,backgroundColor: Colors.green,
                                    child: Icon(Icons.done_rounded,color: Colors.white,size: 10.sp,),
                                  ),
                                )


                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Text("Successful!",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                            Text("You have successfully your\nConfirm Payment send!",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12.sp),textAlign: TextAlign.center,),
                            GestureDetector(
                                onTap:(){
                                  f_control.bottomIndex.value = 0;
                                  Get.offAllNamed("/first");
                                },
                              child: Container(height:5.h,width: 55.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 2.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5.h),
                              color: Colors.black),
                              child: Text("continue Shopping",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                              ),
                            )
                          ],
                        )
                      );
                    },
                    child: Container(height:6.h,width: 100.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      child: Text("Proceed to Checkout",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp,color: Colors.white),),
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }

  Row MoneyCartTile({title,money}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                    Text("$title:",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                    Text("\$$money",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),

                  ],);
  }
}
