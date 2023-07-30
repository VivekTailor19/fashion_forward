import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/sub_screens/cartController.dart';
import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/sub_screens/completed_Order.dart';
import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/sub_screens/ongoing_Order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartController c_control = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return
       Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w,),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,

              children: [

                IconButton(onPressed: () {
                  Get.toNamed("/myCart");
                },
                  icon:Icon(
                    Icons.shopping_cart_checkout_rounded,
                    color: Colors.blue,
                    size: 20.sp,
                  ),),


              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
            child: Column(
              children: [

                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text("My Order",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),
                     Spacer(),
                    GestureDetector(
                      onTap: () {
                        c_control.selOrderTypeIndex.value = 0;
                      },
                      child: Obx(
                        () =>  Container(height: 4.h,width: 22.w,alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: c_control.selOrderTypeIndex.value == 0 ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.black12,width: 0.3)
                           ),

                          child:Text("Ongoing",style: TextStyle(fontSize: 12,
                              color: c_control.selOrderTypeIndex.value == 0 ? Colors.white : Colors.black26,
                              fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    GestureDetector(
                      onTap: () {
                        c_control.selOrderTypeIndex.value = 1;
                      },
                      child: Obx(
                        () =>  Container(height: 4.h,width: 22.w,alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: c_control.selOrderTypeIndex.value == 1 ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.black12,width: 0.3)
                           ),

                          child:Text("Completed",style: TextStyle(fontSize: 12,
                              color: c_control.selOrderTypeIndex.value == 1 ? Colors.white : Colors.black26,
                              fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h,),

                Obx(
                  () =>  c_control.selOrderTypeIndex.value == 0
                      ? OngoingScreen()
                      : CompletedScreen(),
                ),





              ],
            ),
          ),
        ],
      );
  }
}

Widget CartTile()
{
  return Container(height: 14.h,width: 100.w,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          //color: Colors.amberAccent.shade100,
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color(0xffE5E5E5),offset: Offset(0,3),blurRadius: 2,spreadRadius: 1)]
      ),

      child: Row(
        children:[
          Container(
            height: 12.h,width: 11.h,alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),

                image:DecorationImage(
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/5511/5511396.png"),fit: BoxFit.contain
                )

            ),
          ),
          SizedBox(width: 2.w,),
          SizedBox(width: 35.w,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h,),
                Text("Soludos",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                SizedBox(height: 0.5.h,),
                Text("Ibiza Classic LAce Sneakers",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),maxLines: 2,),
                Spacer(),

                Text("Quantity: 3",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12.sp),),
                SizedBox(height: 1.h,)
              ],
            ),
          ),
          Spacer(),
          SizedBox(width: 22.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.close_rounded,size: 15.sp,),),
                  ],
                ),
                Text("\$ 120.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13.sp,wordSpacing: -1,letterSpacing: -0.5),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(height:4.h.sp,width: 4.h,alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xfff3f4f6)),
                        child: Icon(Icons.remove_rounded,size: 15.sp,),
                      ),
                    ),
                    SizedBox(width: 3.w,),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(height:4.h.sp,width: 4.h,alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xfff3f4f6)),
                        child: Icon(Icons.add_rounded,size: 15.sp,),
                      ),
                    ),



                  ],
                ),
              ],
            ),
          )
        ],
      )
  );
}

Widget OrderTile()
{
  return Container(height: 15.h,width: 100.w,
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          //color: Colors.amberAccent.shade100,
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color(0xffE5E5E5),offset: Offset(0,15),blurRadius: 15,spreadRadius: 3)]
      ),

      child: Row(
        children:[
          Container(
            height: 12.h,width: 11.h,alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),

                image:DecorationImage(
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/5511/5511396.png"),fit: BoxFit.contain
                )

            ),
          ),
          SizedBox(width: 2.w,),
          SizedBox(width: 35.w,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h,),
                Text("Soludos",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                SizedBox(height: 0.5.h,),
                Text("Ibiza Classic LAce Sneakers",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),maxLines: 2,),
                Spacer(),

                Text("Quantity: 3",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12.sp),),
                SizedBox(height: 1.h,)
              ],
            ),
          ),
          Spacer(),
          Text("\$ 120.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13.sp,wordSpacing: -1,letterSpacing: -0.5),)
        ],
      )
  );
}
