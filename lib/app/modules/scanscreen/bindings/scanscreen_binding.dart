import 'package:get/get.dart';

import '../controllers/scanscreen_controller.dart';

class ScanscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanscreenController>(
      () => ScanscreenController(),
    );
  }
}
