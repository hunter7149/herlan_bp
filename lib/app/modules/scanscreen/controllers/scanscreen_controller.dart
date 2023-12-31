import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:herlan_bp/app/data/appassets.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../routes/app_pages.dart';

class ScanscreenController extends GetxController {
  Rx<MobileScannerController?> mobileScannerController =
      Rx<MobileScannerController?>(null);

  MobileScannerController? get scannerController =>
      mobileScannerController.value;

  initializeScannerController() {
    if (mobileScannerController.value == null) {
      mobileScannerController.value = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        detectionTimeoutMs: 2000,
        torchEnabled: false,
        autoStart: true,
        returnImage: false,
      );

      // mobileScannerController.value!.start();
      update();
      return mobileScannerController.value;
    } else {
      mobileScannerController.value = null;
      update();
      mobileScannerController.value = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        detectionTimeoutMs: 2000,
        autoStart: false,
        torchEnabled: false,
        returnImage: false,
      );
      // mobileScannerController.value!.start();
      update();
      return mobileScannerController.value;
    }
  }

  RxBool isValid = true.obs;

  RxList<Map<String, dynamic>> scanHistory = <Map<String, dynamic>>[].obs;
  RxBool isScanned = false.obs;
  onScan(BarcodeCapture capture) async {
    await mobileScannerController.value!.stop();
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer
        .setSourceAsset(AppAssets.ASSET_BEEP_SOUND)
        .then((value) async {
      await audioPlayer.play(AssetSource(AppAssets.ASSET_BEEP_SOUND));
    });

    await audioPlayer.onPlayerComplete.first;
    await audioPlayer.release();
    await audioPlayer.dispose();
    String code = capture.barcodes[0].rawValue.toString();
    bool codeExists = scanHistory.any((entry) => entry['code'] == code);

    if (!codeExists) {
      scanHistory.add({"code": code, "quantity": 1});
    } else {
      // Find the existing entry with the matching code
      var existingEntry =
          scanHistory.firstWhere((entry) => entry['code'] == code);
      // Update the quantity by incrementing it by 1
      existingEntry['quantity']++;
    }
    scanHistory.refresh();

    await Future.delayed(Duration(seconds: 2));
    await mobileScannerController.value!.start();
  }

  stopCamera() async {
    await mobileScannerController.value!.stop();
    mobileScannerController.value!.dispose();
  }

  nextPage() async {
    // await stopCamera();
    Get.put<ScanscreenController>(ScanscreenController());
    Get.toNamed(Routes.CUSTOMERSCREEN);
    // Get.toNamed(Routes.CUSTOMERSCREEN)?.then((_) {
    //   initializeScannerController();
    // });
  }

  @override
  void onInit() {
    super.onInit();
    initializeScannerController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    await mobileScannerController.value!.stop();
    mobileScannerController.value!.dispose();
    super.onClose();
  }
}
