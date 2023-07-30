import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.settings,
                  size: 22.sp,
                )
              ],
            ),

            Container(
                height: 12.h,
                width: 100.w,
                margin: EdgeInsets.symmetric(vertical: 2.h),
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
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://miro.medium.com/v2/resize:fit:512/1*DubdXbUR4KcrzmAg8wyGXA.png"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "User PRo 18324",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                        ),

                        Text(
                          "1845.userpro@gmail.com",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 13.sp),
                          maxLines: 2,
                        ),


                      ],
                    ),
                  ],
                )),

            Container(
              height: 41.h,
                padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
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
            SizedBox(height: 3.h,),
            Container(
              height: 23.h,
              padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
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
