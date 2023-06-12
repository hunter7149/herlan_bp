import 'package:get/get.dart';

import '../controllers/customerscreen_controller.dart';

class CustomerscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerscreenController>(
      () => CustomerscreenController(),
    );
  }
}
