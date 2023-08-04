import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/productModel.dart';
import '../../../../utils/firebase_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {




  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
         SizedBox(height: 5.h,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Cart",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),
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

                        return

                          Container(
                            height: 68.h,
                            child: NotificationListener<OverscrollIndicatorNotification>(
                              onNotification: (OverscrollIndicatorNotification overscroll) {
                                overscroll.disallowIndicator();
                                return true;
                              },child: ListView.builder(
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
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
                                              Text("\$ ${cartItems[index].price}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13.sp,wordSpacing: -1,letterSpacing: -0.5),),
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {

                                                      int? tempQty = cartItems[index].qty;

                                                      ProductModel model = ProductModel(
                                                        name: cartItems[index].name,
                                                        price: cartItems[index].price,
                                                        qty: tempQty,
                                                        category: cartItems[index].category,
                                                        img: cartItems[index].img,
                                                        desc: cartItems[index].desc,
                                                        fav: cartItems[index].fav,
                                                        uId: cartItems[index].uId
                                                      );
                                                      FirebaseHelper.firebaseHelper.updateMyCart(model);
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



                              },
                            ),
                            ),
                          );

                      }

                      return Center(child: CircularProgressIndicator());


                    },
                  ),



                SizedBox(height: 1.h,),


                GestureDetector(
                  onTap: () {
                    Get.toNamed("/myCart");
                  },
                  child: Container(height:6.h,width: 100.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                      color: Colors.black,
                    ),
                    alignment: Alignment.center,
                    child: Text("Next",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp,color: Colors.white),),
                  ),
                ),
                SizedBox(height: 1.h,),
              ],
            ),
          ),
        ],
      );
  }
}

Widget CartTile({img,title,desc,qty,price})
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
                    image: NetworkImage("$img"),fit: BoxFit.contain
                )

            ),
          ),
          SizedBox(width: 2.w,),
          SizedBox(width: 35.w,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h,),
                Text("$title",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                SizedBox(height: 0.5.h,),
                Text("$desc",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 11.sp),maxLines: 2,),
                Spacer(),

                Text("Quantity: $qty",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12.sp),),
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
                Text("\$ ${price*qty}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13.sp,wordSpacing: -1,letterSpacing: -0.5),),
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
