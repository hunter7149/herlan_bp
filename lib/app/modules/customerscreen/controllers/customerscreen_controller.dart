import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herlan_bp/app/routes/app_pages.dart';

import '../../scanscreen/controllers/scanscreen_controller.dart';

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

  nextPage() async {
    // Get.delete<ScanscreenController>();

    Get.toNamed(Routes.QRSCREEN);
  }

  resetEverything() {
    phone.text = '';
    name.text = '';
    email.text = '';
    otherFieldVisibility.value = false;
    isLogingIn.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    resetEverything();
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
