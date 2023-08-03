import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/notificationModel.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<NotificationModel> notificationList = [
    NotificationModel(orderSize: 3,customerName: "Jack Ma",customerImg: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Enabling_eCommerce-_Small_Enterprises%2C_Global_Players_%2839008130265%29_%28cropped%29.jpg/220px-Enabling_eCommerce-_Small_Enterprises%2C_Global_Players_%2839008130265%29_%28cropped%29.jpg"),
    NotificationModel(orderSize: 5,customerName: "Hie Wordse",customerImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWHGFgsFsWZiRlyz4YWqGBvoNeeWmXRA-T5Q&usqp=CAU"),
    NotificationModel(orderSize: 1,customerName: "Liu Ning",customerImg: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c2e1563-ba1e-44fc-b029-8897181b1142/d8qk8ro-1011ebe6-1814-4853-aca1-101ff9cfb60b.png/v1/fit/w_500,h_639/random_girl_png_by_jessicarufus_d8qk8ro-375w-2x.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjM5IiwicGF0aCI6IlwvZlwvMmMyZTE1NjMtYmExZS00NGZjLWIwMjktODg5NzE4MWIxMTQyXC9kOHFrOHJvLTEwMTFlYmU2LTE4MTQtNDg1My1hY2ExLTEwMWZmOWNmYjYwYi5wbmciLCJ3aWR0aCI6Ijw9NTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.MnDA0Q04RZtEo2SyByIoTjeTgdu6xm42ZvuN34lEE0o"),
    NotificationModel(orderSize: 3,customerName: "Zin Abdoe",customerImg: "https://i.pinimg.com/564x/c0/8e/a1/c08ea199ab270e631b90f02ba75a289f.jpg"),
    NotificationModel(orderSize: 2,customerName: "Manana Cdre",customerImg: "https://img.freepik.com/premium-photo/flirty-random-pose-girl-image-generative-ai_849906-2062.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.h),
            child: Text("Notification",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 11.h,

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: Colors.amberAccent,radius: 3.h,backgroundImage: NetworkImage("${notificationList[index].customerImg}"),),
                          SizedBox(width: 3.w,),
                          SizedBox(width: 70.w,
                            child: Text.rich(maxLines: 3,
                              TextSpan(
                                style: TextStyle(fontSize: 18), // default text style
                                children: <TextSpan>[
                                  TextSpan(text: '${notificationList[index].customerName} ', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13.sp)),
                                  TextSpan(text: 'was happy with his ecommerce app shopping. He had bought ${notificationList[index].orderSize} items of his choice and paid a reasonable price. He checked his email and saw the confirmation message.',
                                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11.sp)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w),
                        child: Text("2 hours ago",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 9.sp),textAlign: TextAlign.left,),
                      ),
                      index == (notificationList.length-1) ? Text(""):
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w),
                        child: Divider(color: Colors.black12,thickness: 0.5,),
                      )
                    ],
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
