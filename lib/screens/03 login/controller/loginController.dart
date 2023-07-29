import 'package:get/get.dart';

class LoginController extends GetxController
{
  RxBool isHiddenUp = true.obs;
  void togglePasswordViewUp() {
      isHiddenUp.value = !isHiddenUp.value;
  }

  RxBool isHiddenIn = true.obs;
  void togglePasswordViewIn() {
      isHiddenIn.value = !isHiddenIn.value;
  }

  RxBool isHiddenC = true.obs;
  void togglePasswordViewC() {
      isHiddenC.value = !isHiddenC.value;
  }

  RxBool checkConditions = false.obs;


}