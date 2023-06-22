import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../routes/app_pages.dart';

class QrscreenController extends GetxController {
  Rx<MobileScannerController?> mobileScannerController =
      Rx<MobileScannerController?>(null);

  MobileScannerController? get scannerController =>
      mobileScannerController.value;

  initializeScannerController() {
    if (mobileScannerController.value == null) {
      mobileScannerController.value = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        autoStart: true,
        returnImage: true,
      );
      mobileScannerController.value!.start();
      update();
      return mobileScannerController.value;
    } else {
      mobileScannerController.value = null;
      update();
      mobileScannerController.value = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        autoStart: true,
        returnImage: true,
      );
      mobileScannerController.value!.start();
      update();
      return mobileScannerController.value;
    }
  }

  TextEditingController firstSection = TextEditingController();
  TextEditingController secondSection = TextEditingController();
  TextEditingController thirdSection = TextEditingController();
  TextEditingController fourthSection = TextEditingController();
  RxBool isEditable = true.obs;
  isEditableUpdater({required bool value}) {
    if (value == false) {
      isEditable.value = false;
      update();
    } else {
      firstSection = TextEditingController(text: "");
      secondSection = TextEditingController(text: "");
      thirdSection = TextEditingController(text: "");
      fourthSection = TextEditingController(text: "");
      isEditable.value = value;
      update();
    }
  }

  disableField() {
    isEditable.value = false;
    update();
  }

  RxBool isValid = true.obs;

  RxList<Map<String, dynamic>> scanHistory = <Map<String, dynamic>>[].obs;

  // showDialogue(BarcodeCapture capture) {
  //   stopCamera();
  //   final Uint8List? image = capture.image;

  //   // print(capture.barcodes[0].rawValue.toString().split("/")[4]);
  //   // print(capture.barcodes[0].rawValue.toString().split("offer/?code=")[1]);

  //   if (capture.barcodes[0].rawValue
  //       .toString()
  //       .startsWith('https://herlan.com/')) {
  //     String code = capture.barcodes[0].rawValue
  //         .toString()
  //         .split("herlan.com/offer/?code=")[1];
  //     if (checkValid(code: code)) {
  //       isValid.value = true;
  //       update();
  //       firstSection.text = code.split("-")[0];
  //       secondSection.text = code.split("-")[1];
  //       thirdSection.text = code.split("-")[2];
  //       fourthSection.text = code.split("-")[3];
  //       imageFile = image;
  //       isEditableUpdater(value: false);
  //       bool codeExists = scanHistory.any((entry) => entry['code'] == code);

  //       if (!codeExists) {
  //         scanHistory.add({
  //           "code": code,
  //           "time": DateFormat('MM/dd/yyyy hh:mm:ss a')
  //               .format(DateTime.now())
  //               .toString(),
  //         });
  //       }
  //       scanHistory.refresh();
  //     } else {
  //       isValid.value = false;
  //       update();
  //       resetValidity();
  //     }
  //   } else {
  //     isValid.value = false;
  //     update();
  //     resetValidity();
  //   }
  // }

  // resetValidity() {
  //   Timer(Duration(seconds: 2), () {
  //     isValid.value = true;
  //     update();
  //   });
  // }

  // checkValid({required String code}) {
  //   if (code.split("-")[0].length == 4 &&
  //       code.split("-")[1].length == 4 &&
  //       code.split("-")[2].length == 4 &&
  //       code.split("-")[3].length == 4) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  nextPage() async {
    if (firstSection.text.length == 4 &&
        secondSection.text.length == 4 &&
        thirdSection.text.length == 4 &&
        fourthSection.text.length == 4) {
      final code =
          "${firstSection.text}-${secondSection.text}-${thirdSection.text}-${fourthSection.text}";

      // Get.delete<HomescreenController>();
      await Get.toNamed(Routes.OFFERSCREEN,
          arguments: {
            "code": code,
          },
          preventDuplicates: true);
      // Get.delete<HomescreenController>();
    } else {
      Get.snackbar("NOTICE", "ENTER VALID CODE",
          colorText: Colors.white,
          animationDuration: Duration(seconds: 0),
          borderRadius: 0,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // initializeScannerController();
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
