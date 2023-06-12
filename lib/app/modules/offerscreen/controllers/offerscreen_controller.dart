import 'dart:async';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../api/repository/repository.dart';

class OfferscreenController extends GetxController {
  RxString code = ''.obs;
  RxString qrvalue = ''.obs;
  Rx<Uint8List?> image = Rx<Uint8List?>(null);
  RxBool animaTionEnded = false.obs;
  RxString offerAmmount = "50%".obs;
  RxBool isLoading = true.obs;
  animationEndedUpdater() {
    animaTionEnded.value = true;
    update();
  }

  requestVerification() async {
    try {
      await Repository()
          .requestVerification(map: {"code": code.value}).then((value) {
        print("verified");
      });
    } on Exception {}
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

    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
      update();
      Timer(Duration(milliseconds: 2300), () {
        animationEndedUpdater();
      });
    });
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
