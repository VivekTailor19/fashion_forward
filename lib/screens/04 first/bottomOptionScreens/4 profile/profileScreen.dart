import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/firebase_helper.dart';
import '../../first/firstController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  FirstController f_control = Get.put(FirstController());

  String? userImage ;
  String? userName ;
  String? userEmail ;
  Map mapData = {};
  @override
  void initState() {
    super.initState();
    mapData = FirebaseHelper.firebaseHelper.readUser();

    userImage = mapData['photo'];
    userName = mapData['name'];
    userEmail = mapData['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(height: 20.sp,
                child: IconButton(icon: Icon(
                  Icons.logout_rounded,
                  size: 22.sp,
                ),onPressed: () {

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
                          Text("Dear Customer !",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                          Text("Are you sure to signout through this Account ?",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12.sp),textAlign: TextAlign.center,),
                          GestureDetector(
                            onTap:() async {

                              f_control.bottomIndex.value = 0;
                              FirebaseHelper.firebaseHelper.accountLogOut();
                              Get.offAllNamed("/signIn");
                            },
                            child: Container(height:5.h,width: 55.w,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 2.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5.h),
                                  color: Colors.black),
                              child: Text("Sure",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                            ),
                          )
                        ],
                      )
                  );

                },),
              ),
            ],
          ),

          Container(
              height: 12.h,
              width: 100.w,
              margin: EdgeInsets.symmetric(vertical: 3.h),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffE5E5E5),
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ]),
              child: Row(
                children: [
                  Container(
                    height: 10.h,
                    width: 9.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        image: userImage != null
                            ? DecorationImage(
                            image: NetworkImage(
                                "$userImage"),
                            fit: BoxFit.cover)
                            : DecorationImage(
                            image: NetworkImage(
                                "https://miro.medium.com/v2/resize:fit:512/1*DubdXbUR4KcrzmAg8wyGXA.png"),
                            fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 2.5.w,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        userName != null ? "$userName" : "User",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
                      ),

                      Text("$userEmail",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 13.sp),
                        maxLines: 2,
                      ),


                    ],
                  ),
                ],
              )),

          Container(
            height: 40.h,
              padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 2.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),
              border: Border.all(color: Colors.black12)
            ),
          child: Column(
            children: [
              ProfileOptionTile(title: "Personal Details",iconData: Icons.person_2_rounded),
              ProfileOptionTile(title: "My Order",iconData: Icons.card_travel_rounded),
              ProfileOptionTile(title: "My Favourites",iconData: Icons.favorite_rounded),
              ProfileOptionTile(title: "Shipping Address",iconData: Icons.local_shipping_rounded),
              ProfileOptionTile(title: "My Card",iconData: Icons.credit_card_rounded),
              ProfileOptionTile(title: "Settings",iconData: Icons.settings),

            ],
          )),
          SizedBox(height: 2.5.h,),
          Container(
            height: 21.5.h,
            padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 2.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),
                border: Border.all(color: Colors.black12)
            ),
            child:Column(
              children: [
                ProfileOptionTile(title: "FAQs",iconData: Icons.info),
                ProfileOptionTile(title: "Privacy Policy",iconData: Icons.privacy_tip_rounded),
                ProfileOptionTile(title: "Help",iconData: Icons.help_outline_rounded),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget ProfileOptionTile({iconData,title})
  {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.5.h),
      child: Row(
        children: [
          Container(height: 5.h,width: 5.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
          color: Color(0xfff3f5f6)
          ),
          alignment: Alignment.center,
            child: Icon(iconData,size: 20.sp,),
          ),
          SizedBox(width: 5.w,),
          Text("$title",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.sp),),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded,size: 14.sp,),
        ],
      ),
    );
  }
}
