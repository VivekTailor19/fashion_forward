import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/productModel.dart';

class ViewProductScreen extends StatefulWidget {
  const ViewProductScreen({super.key});

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {

  ProductModel? model ;

  @override
  void initState() {
    super.initState();
    model = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back_rounded,size: 22.sp,color: Colors.black,),onPressed: (){},),

          actions: [
            IconButton(icon: Icon(Icons.card_travel_rounded,size: 22.sp,color: Colors.black,),onPressed: (){},),
            SizedBox(width: 2.w,)
          ],
        ),

        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.h,width: 100.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),
                color: Color(0xfff3f4f6),
                image: DecorationImage(
                  image: NetworkImage("https://media.istockphoto.com/id/1254508881/photo/woman-holding-sale-shopping-bags-consumerism-shopping-lifestyle-concept.jpg?s=612x612&w=0&k=20&c=wuS3z6nPQkMM3_wIoO67qQXP-hfXkxlBc2sedwh-hxc="),
                      fit: BoxFit.cover,opacity: 50,
                )
                ),
              ),
              SizedBox(height: 2.h,),

              SizedBox(height: 7.h,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ON EAR HeadPhone",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),),
                        Text("Beats Solo3 Wireless Kulak",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11.sp),),
                      ],
                    ),

                    Container(height: 5.h,width: 25.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5.h),
                        color: Color(0xfff3f4f6)
                      ),
                      alignment: Alignment.center,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(height:12.sp,width: 12.sp,alignment: Alignment.center,
                               child: Icon(Icons.remove_rounded,size: 12.sp,),
                            ),
                          ),
                          Container(height:12.sp,alignment: Alignment.center,
                             child: Text("100",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400),),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(height:12.sp,width: 12.sp,alignment: Alignment.center,
                              child: Icon(Icons.add_rounded,size: 12.sp,),
                            ),
                          ),



                        ],
                      ),

                    )
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 1.5.h),
                child: Text("Description",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),),
              ),
              Text("An ecommerce app—sometimes referred to as a mobile commerce app—is a piece of software that allows customers to browse and purchase items from an online store.Mobile commerce apps are beneficial both for business owners and their customers. Brands can better engage their customers in a dedicated space and customers can personalize and control their experience. And thanks to platforms like Shopify and Ecwid by Lightspeed, the mobile app development process can be pretty painless, too.  ",
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11.5.sp),),

              SizedBox(height: 1.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(height: 6.h,width: 6.h,alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      color: Color(0xfff3f4f6)
                    ),
                    child: Icon(Icons.favorite_outline_rounded,size: 18.sp,),
                  ),
                  Container(height: 6.h,width: 40.w,alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: Colors.black
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,textBaseline: TextBaseline.alphabetic,
                      children: [
                      Icon(Icons.card_travel_rounded,color: Colors.white,size: 16.sp,),
                      SizedBox(width: 3.w,),
                      Text("Add to cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 13.5.sp),)
                    ],)
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
