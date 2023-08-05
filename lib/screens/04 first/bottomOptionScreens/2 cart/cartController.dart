import 'package:fashion_forward/model/productModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController
{
  RxInt subtotal = 0.obs;

  int shipping = 50;

  RxInt total = 0.obs;

  List<ProductModel> tempList = [];
  void insetTempCartCollection(List<ProductModel> list)
  {
    tempList = list;
  }
}