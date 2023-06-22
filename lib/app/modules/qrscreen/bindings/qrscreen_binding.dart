import 'package:get/get.dart';

import '../controllers/qrscreen_controller.dart';

class QrscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrscreenController>(
      () => QrscreenController(),
    );
  }
}
