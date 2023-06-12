import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../routes/app_pages.dart';

class ScanscreenController extends GetxController {
  MobileScannerController? _mobileScannerController;

  scannerController() {
    if (_mobileScannerController != null) {
      return _mobileScannerController!;
    } else {
      _mobileScannerController = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        returnImage: true,
      );
      return _mobileScannerController!;
    }
  }

  RxBool isValid = true.obs;

  RxList<Map<String, dynamic>> scanHistory = <Map<String, dynamic>>[].obs;

  showDialogue(BarcodeCapture capture) {
    String code = capture.barcodes[0].rawValue.toString();
    bool codeExists = scanHistory.any((entry) => entry['code'] == code);

    if (!codeExists) {
      scanHistory.add({
        "code": code,
        "time": DateFormat('MM/dd/yyyy hh:mm:ss a')
            .format(DateTime.now())
            .toString(),
      });
    }
    scanHistory.refresh();
  }

  stopCamera() async {
    await _mobileScannerController!.stop();
    _mobileScannerController?.dispose();
  }

  nextPage() {
    stopCamera();
    Get.toNamed(Routes.CUSTOMERSCREEN);
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
