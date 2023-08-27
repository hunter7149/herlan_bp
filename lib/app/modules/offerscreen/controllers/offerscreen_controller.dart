import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/repository/repository.dart';
import '../../../data/appcolors.dart';
import '../../../routes/app_pages.dart';
import '../../customerscreen/controllers/customerscreen_controller.dart';
import '../../qrscreen/controllers/qrscreen_controller.dart';
import '../../scanscreen/controllers/scanscreen_controller.dart';

class OfferscreenController extends GetxController {
  RxMap<String, dynamic> userInfo = <String, dynamic>{}.obs;
  RxString code = ''.obs;
  RxString qrvalue = ''.obs;
  RxString codeStatus = ''.obs;
  Rx<Uint8List?> image = Rx<Uint8List?>(null);
  RxBool animaTionEnded = false.obs;
  RxString offerAmmount = "".obs;
  RxString expiryDate = "".obs;
  RxString issueDate = "".obs;
  RxBool isLoading = true.obs;
  animationEndedUpdater() {
    animaTionEnded.value = true;
    update();
  }

  // requestVerification() async {
  //   try {
  //     await Repository()
  //         .requestVerification(map: {"code": code.value}).then((value) {
  //       print("verified");
  //     });
  //   } on Exception {}
  // }

  initVerification({required dynamic data}) {
    userInfo.clear();
    userInfo.value = data ?? {};
    userInfo.refresh();
    update();
    verifyVoucher();
  }

  verifyVoucher() async {
    try {
      await Repository()
          .verifyVoucher(map: {"code": userInfo['code']}).then((value) {
        if (value != null) {
          if (value['status'].toString().contains("yes")) {
            dynamic data = value['data'];
            if (data['type'].toString().contains("percentage")) {
              offerAmmount.value = "${data['value']}%";
              codeStatus.value = data['status'].toString().toUpperCase() ?? '';

              update();
            } else {
              offerAmmount.value = "${data['value']} BDT";
              codeStatus.value = data['status'].toString().toUpperCase() ?? '';

              update();
            }

            expiryDate.value = data['expiry'] ?? "";
            issueDate.value = data['creation'] ?? "";
            update();
          } else {
            offerAmmount.value = "N/A";
            codeStatus.value = value['data'].toString().toUpperCase() ?? '';

            update();
          }

          isLoading.value = false;
          update();
          Timer(Duration(milliseconds: 2300), () {
            animationEndedUpdater();
          });
        }
      });
    } on Exception catch (e) {
      isLoading.value = false;
      update();
      Get.back();
      Get.snackbar("Error", "Server error",
          backgroundColor: AppColors.modernRed,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 1),
          borderRadius: 0);
    }
  }

  RxBool isUpdating = false.obs;
  updateCode() async {
    isUpdating.value = true;
    update();
    Map<String, dynamic> updateMap = {
      "phone": userInfo['phone'],
      "code": userInfo['code'],
    };
    try {
      await Repository().updateVoucher(map: updateMap).then((value) {
        if (value != null) {
          if (value['status'].toString().contains("yes")) {
            isUpdating.value = false;
            update();
            Get.delete<CustomerscreenController>();
            Get.delete<ScanscreenController>();
            Get.delete<QrscreenController>();
            // Get.delete<OfferscreenController>();
            Get.offNamed(Routes.HOME);
          } else {
            isUpdating.value = false;
            update();
            Get.snackbar("Error", "${value['message']}?? Server error",
                backgroundColor: AppColors.modernRed,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP,
                duration: Duration(seconds: 1),
                borderRadius: 0);
          }
        }
      });
    } on Exception catch (e) {
      isUpdating.value = false;
      update();
      Get.snackbar("Error", "Server error",
          backgroundColor: AppColors.modernRed,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 1),
          borderRadius: 0);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Get.delete<HomescreenController>();
    Map<String, dynamic> data = Get.arguments ?? {};
    print(data);
    if (data.isNotEmpty && data['code'] != null) {
      code.value = data['code'] ?? '';
      qrvalue.value = 'https://herlan.com/offer/?code=${data['code']}';
      image.value = data['image'] ?? null;
      update();
    }
    initVerification(data: data);
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
