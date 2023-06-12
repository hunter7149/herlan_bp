import 'package:get/get.dart';

import '../controllers/loginsceen_controller.dart';

class LoginsceenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginsceenController>(
      () => LoginsceenController(),
    );
  }
}
