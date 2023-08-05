import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/introScreenModel.dart';

class IntroScreenController extends GetxController
{
  List<IntroModel> introList = [
    IntroModel(img: "assets/images/intro/intro (1).jpg" , heading: "20% Discount New Arrival Product",data: "" ),
    IntroModel(img: "assets/images/intro/intro (2).jpg" , heading: "Take Advantage Of The Offer Shopping" ),
    IntroModel(img: "assets/images/intro/intro (3).jpeg" , heading: "All Types Offers Within Your Reach",),
  ];

  RxInt currentIndex = 0.obs;





}