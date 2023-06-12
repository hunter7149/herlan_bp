import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerscreenController extends GetxController {
  TextEditingController phonePrefix = TextEditingController(text: '+88');
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  RxBool otherFieldVisibility = false.obs;
  RxBool isLogingIn = false.obs;
  checkCustomer() {
    if (phone.text.length == 11) {
      otherFieldVisibility.value = true;
      update();

      print(otherFieldVisibility.value);
    } else {
      otherFieldVisibility.value = false;
      update();
      print(otherFieldVisibility.value);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
