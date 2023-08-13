import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herlan_bp/app/api/repository/repository.dart';
import 'package:herlan_bp/app/data/appcolors.dart';
import 'package:herlan_bp/app/routes/app_pages.dart';

import '../../scanscreen/controllers/scanscreen_controller.dart';

class CustomerscreenController extends GetxController {
  TextEditingController phonePrefix = TextEditingController(text: '+88');
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  RxBool isOldCustomer = false.obs;
  isOldCustomerUpdater({required bool value}) {
    isOldCustomer.value = value;
    update();
  }

  RxBool readOnly = false.obs;
  readOnlyUpdater({required bool value}) {
    readOnly.value = value;
    update();
  }

  RxBool otherFieldVisibility = false.obs;
  RxBool isLogingIn = false.obs;
  checkCustomer() async {
    if (phone.text.length == 11) {
      otherFieldVisibility.value = true;
      update();
      // readOnlyUpdater(value: true);
      await requestCustomer();
      print(otherFieldVisibility.value);
    } else {
      otherFieldVisibility.value = false;
      update();
      name.text = "";
      email.text = "";
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
    readOnly.value = false;
    update();
  }

  RxBool isLoading = false.obs;
  late dynamic data;
  requestCustomer() async {
    isLoading.value = true;
    update();
    try {
      await Repository()
          .requestVerification(map: {"phone": phone.text}).then((value) {
        print(value);
        if (value!['status']!.toString().contains("yes")) {
          name.text = value['data']['name'];
          email.text = value['data']['email'];
          data = value['data'];
          isOldCustomerUpdater(value: true);
        } else {
          isOldCustomerUpdater(value: false);
        }
        isLoading.value = false;
        update();
      });
    } on Exception catch (e) {
      isLoading.value = false;
      update();
      isOldCustomerUpdater(value: false);
      readOnlyUpdater(value: false);
      print(e);
    }
  }

  submitCustomer() async {
    try {
      if (isOldCustomer.value) {
        Get.toNamed(Routes.QRSCREEN, arguments: data);
      } else {
        if (name.text.isEmpty) {
          Get.snackbar("Notice", "Name field mandatory",
              backgroundColor: AppColors.modernRed,
              colorText: Colors.white,
              duration: Duration(seconds: 1),
              snackPosition: SnackPosition.TOP,
              borderRadius: 0);
        } else if (phone.text.length != 11) {
          Get.snackbar("Failed", "Enter valid 11 digit phone number",
              backgroundColor: AppColors.modernRed,
              colorText: Colors.white,
              duration: Duration(seconds: 1),
              snackPosition: SnackPosition.TOP,
              borderRadius: 0);
        } else {
          Repository().createCustomer(map: {
            "name": name.text,
            "phone": phone.text,
            "email": email.text
          }).then((value) {
            if (value['status'].toString().contains("yes") &&
                value['data'] != {}) {
              dynamic data = value['data'];
              Get.snackbar("Success", "Customer added",
                  backgroundColor: AppColors.modernGreen,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.TOP,
                  duration: Duration(seconds: 1),
                  borderRadius: 0);
              Get.toNamed(Routes.QRSCREEN, arguments: data);
            } else {
              Get.snackbar("Failed",
                  "${value['error'] ?? "User not added.try again later"}??",
                  backgroundColor: AppColors.modernRed,
                  colorText: Colors.white,
                  duration: Duration(seconds: 1),
                  snackPosition: SnackPosition.TOP,
                  borderRadius: 0);
            }
          });
        }
      }
    } on Exception catch (e) {
      Get.snackbar("Failed", "Server error",
          backgroundColor: AppColors.modernRed,
          colorText: Colors.white,
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.TOP,
          borderRadius: 0);
    }
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
