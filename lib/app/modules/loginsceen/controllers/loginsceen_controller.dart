import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/repository/repository.dart';
import '../../../api/service/connection_checker.dart';
import '../../../api/service/prefrences.dart';
import '../../../routes/app_pages.dart';

class LoginsceenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool obsecure = false.obs;

  RxBool isLogingIn = false.obs;
  dynamic data;
  obsecureUpdater() {
    obsecure.value = !obsecure.value;
  }

  requestLogin() async {
    if (email.text.isEmpty) {
      Get.snackbar("Warning", "Username is empty!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    } else if (password.text.isEmpty) {
      Get.snackbar("Warning", "Password is empty!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      if (await IEchecker.checker()) {
        isLogingIn.value = true;
        update();

        try {
          await Repository().requestLogin(map: {
            "id": email.text,
            "password": password.text
          }).then((value) async {
            print(value);
            // dynamic data = value["value"] ?? {};
            // if (data != {}) {
            //   // Pref.writeData(key: Pref.USER_PROFILE, value: data);
            // }
            if (value["status"] == "success" && value["accessToken"] != "") {
              Pref.writeData(
                  key: Pref.LOGIN_INFORMATION, value: value['accessToken']);
              Pref.writeData(key: Pref.USER_ID, value: email.text);
              Pref.writeData(key: Pref.USER_PASSWORD, value: password.text);
              isLogingIn.value = false;
              update();

              Get.offNamed(Routes.HOME);
            } else {
              isLogingIn.value = false;
              update();
              Get.snackbar("Failed", "${value['error'] ?? "Try again"}",
                  colorText: Colors.white,
                  animationDuration: Duration(seconds: 0),
                  borderRadius: 0,
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.BOTTOM);
            }
          });
        } on Exception {
          isLogingIn.value = false;
          update();
          Get.snackbar("SERVER ERROR", "TRY AGAIN LATER",
              colorText: Colors.white,
              animationDuration: Duration(seconds: 0),
              borderRadius: 0,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade500,
              duration: Duration(seconds: 2));
        }
      } else {
        Get.snackbar("NO INTERNET", "PLEASE ENABLE INTERNET",
            colorText: Colors.white,
            animationDuration: Duration(seconds: 0),
            borderRadius: 0,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade500,
            duration: Duration(seconds: 2));
      }
    }
    isLogingIn.value = false;
    update();
    // onTapLogin();
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
