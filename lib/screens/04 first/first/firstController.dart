
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottomOptionScreens/1 home/homeScreen.dart';
import '../bottomOptionScreens/2 order/orderScreen.dart';
import '../bottomOptionScreens/3 notifications/notificationScreen.dart';
import '../bottomOptionScreens/4 profile/profileScreen.dart';

class FirstController extends GetxController
{
  RxInt bottomIndex = 0.obs;

  List<Widget> bottomSelectScreens = [
    HomeScreen(),
    OrderScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];




}