import 'package:get/get.dart';

class ProductController extends GetxController
{
  RxBool isAdded = false.obs;

  List<String> categoryList = [
    "Electronics",
    "Clothes",
    "Shoes",
    "Kids",
    "Fitness",
    "Sports"
  ];

  RxString selCategory = "".obs;

  RxString filterCategory = "Electronics".obs;
  RxInt selFilterIndexCategory = 0.obs;


}