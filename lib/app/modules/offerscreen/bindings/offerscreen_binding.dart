import 'package:get/get.dart';

import '../controllers/offerscreen_controller.dart';

class OfferscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferscreenController>(
      () => OfferscreenController(),
    );
  }
}
