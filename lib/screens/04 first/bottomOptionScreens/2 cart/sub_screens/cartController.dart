import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'completed_Order.dart';
import 'ongoing_Order.dart';

class CartController extends GetxController
{
  List<Widget> cartScreens = [
    OngoingScreen(),
    CompletedScreen(),
  ];

  RxInt selOrderTypeIndex = 0.obs;

}