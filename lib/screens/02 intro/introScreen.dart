import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h,horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/add/brand.png"),
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: const [
                    Center(
                      child: Text('Page 1'),
                    ),
                    Center(
                      child: Text('Page 2'),
                    ),
                    Center(
                      child: Text('Page 3'),
                    ),
                    Center(
                      child: Text('Page 4'),
                    ),
                    Center(
                      child: Text('Page 5'),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: WormEffect(),
              ),
               SizedBox(height: 50),
            ],
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: 40.h,
          //       width: 100.w,
          //       decoration: BoxDecoration(
          //         color: Colors.amber,
          //         borderRadius: BorderRadius.circular(8.w),
          //       ),
          //     ),
          //
          //     SizedBox(height: 3.h,),
          //
          //     Text(" All Types Offers Within YOur Reach",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25.sp),maxLines: 2,textAlign: TextAlign.left,),
          //
          //
          //     Padding(
          //       padding:  EdgeInsets.symmetric(vertical: 2.h),
          //       child: Text(" All Types Offers Within YOur ReachAll Types Offers Within YOur All Types Offers Within YOur ",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14.sp),maxLines: 3,textAlign: TextAlign.left,),
          //     ),
          //
          //
          //
          //
          //
          //   ],
          // ),
        ),
      ),
    );
  }
}
