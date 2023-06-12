import 'package:get/get.dart';

import '../controllers/dashboardsceen_controller.dart';

class DashboardsceenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardsceenController>(
      () => DashboardsceenController(),
    );
  }
}
