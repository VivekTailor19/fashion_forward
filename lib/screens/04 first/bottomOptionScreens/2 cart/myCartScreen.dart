import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_forward/payment/razorpay.dart';
import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/cartController.dart';
import 'package:fashion_forward/screens/04%20first/bottomOptionScreens/2%20cart/cartScreen.dart';
import 'package:fashion_forward/screens/04%20first/first/firstController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/productModel.dart';
import '../../../../utils/firebase_helper.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  FirstController f_control = Get.put(FirstController());
  CartController c_control = Get.put(CartController());

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
                  Text("My Order",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),
                  SizedBox(height: 1.h,),

                  StreamBuilder(
                    stream: FirebaseHelper.firebaseHelper.readCartItems(),
                    builder: (context, snapshot) {
                      if(snapshot.hasError)
                      {
                        Center(child: Text("${snapshot.error}"));
                      }

                      else if(snapshot.hasData)
                      {

                        QuerySnapshot querySnapshot = snapshot.data!;
                        List<QueryDocumentSnapshot> qList = querySnapshot.docs;

                        Map mapDATA = {};
                        List<ProductModel> cartItems = [];

                        for(var temp in qList)
                        {
                          mapDATA = temp.data() as Map ;
                          String id = temp.id;
                          String name = mapDATA['pname'];
                          String category = mapDATA['pcategory'];
                          int price = mapDATA['pprice'];
                          bool fav = mapDATA['pfav'];
                          String description = mapDATA['pdesc'];
                          String img = mapDATA['pimg'];
                          int qty = mapDATA['pqty'];
                          ProductModel model = ProductModel(uId: id,category: category,name: name,desc: description,price: price,qty: qty,img: img,fav: fav);
                          cartItems.add(model);

                        }
                        c_control.insetTempCartCollection(cartItems);

                        return Container(
                            height: 50.h,
                            child: NotificationListener<OverscrollIndicatorNotification>(
                              onNotification: (OverscrollIndicatorNotification overscroll) {
                                overscroll.disallowIndicator();
                                return true;
                              },child: ListView.builder(
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                return Container(height: 15.h,width: 100.w,
                                    margin: EdgeInsets.symmetric(vertical: 1.5.h),
                                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.w),
                                        //color: Colors.amberAccent.shade100,
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(color: Color(0xffE5E5E5),offset: Offset(0,5),blurRadius: 8,)]
                                    ),

                                    child: Row(
                                      children:[
                                        Container(
                                          height: 12.h,width: 11.h,alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4.w),

                                              image:DecorationImage(
                                                  image: NetworkImage("${cartItems[index].img}"),fit: BoxFit.contain
                                              )

                                          ),
                                        ),
                                        SizedBox(width: 2.w,),
                                        SizedBox(width: 35.w,
                                          child: Column(

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 1.h,),
                                              Text("${cartItems[index].name}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                                              SizedBox(height: 0.5.h,),
                                              Text("${cartItems[index].desc}",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),maxLines: 2,),
                                              Spacer(),

                                              Text("Quantity: ${cartItems[index].qty}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12.sp),),
                                              SizedBox(height: 1.h,)
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Text("\$ ${cartItems[index].price! * cartItems[index].qty!}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13.sp,wordSpacing: -1,letterSpacing: -0.5),)
                                      ],
                                    )
                                );

                              },
                            ),
                            ),
                          );

                      }

                      return Center(child: CircularProgressIndicator());


                    },
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
                    MoneyCartTile(title: "Subtotal",money: "${c_control.subtotal.value}"),
                    Divider(color: Colors.black12,height: 2.h,thickness: 1.1),
                    MoneyCartTile(title: "Shipping",money: "${c_control.shipping}"),
                    Divider(color: Colors.black12,height: 2.h,thickness: 1.1),
                    MoneyCartTile(title: "BagTotal",money: "${c_control.total.value}"),
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
                                  PaymentHelper.payment.setPayment(10);
                                  FirebaseHelper.firebaseHelper.clearCart(c_control.tempList);
                                  c_control.total.value = 0;
                                  c_control.shipping = 0;
                                },
                              child: Container(height:5.h,width: 55.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 2.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5.h),
                              color: Colors.black),
                              child: Text("Go for Payment",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14.sp),),
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
