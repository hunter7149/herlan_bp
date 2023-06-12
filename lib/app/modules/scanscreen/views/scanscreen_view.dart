import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appcolors.dart';
import '../../../data/qroverlay.dart';
import '../../../data/qroverlay2.dart';
import '../controllers/scanscreen_controller.dart';

class ScanscreenView extends GetView<ScanscreenController> {
  const ScanscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 55,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: ZoomTapAnimation(
            onTap: () async {
              // controller.stopCamera();
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.modernDeepSea,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 400,
                            // width: 250,
                            child: MobileScanner(
                              controller: controller.scannerController(),
                              onDetect: (capture) {
                                print(capture.barcodes);
                                controller.showDialogue(capture);
                              },
                            ),
                          ),
                          Container(
                              height: 400,
                              child: Obx(() => controller.isValid.value
                                  ? QRScannerOverlay(
                                      overlayColour: Colors.white)
                                  : QRlAY2(overlayColour: Colors.white))),
                          Obx(() => !controller.isValid.value
                              ? Container(
                                  height: 400,
                                  child: Center(
                                    child: Container(
                                      height: 80,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      color: AppColors.modernSexyRed
                                          .withOpacity(0.7),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.error,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "INVALID",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container())
                        ],
                      ),
                      Obx(
                        () => controller.scanHistory.isEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 150,
                                child: Center(
                                  child: Text(
                                    "Please position your camera towards the QR code for scanning.",
                                    style: TextStyle(
                                      color: AppColors.herlanMain,
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Container(
                                height: 300,
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.modernGreen),
                                    borderRadius: BorderRadius.circular(0)),
                                // color: Colors.green,
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 24),
                                      height: 40,
                                      // width: double.maxFinite,
                                      color: AppColors.modernGreen,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "CODE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "TIME",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount:
                                              controller.scanHistory.length,
                                          itemBuilder: (BuildContext, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 2),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${controller.scanHistory[index]['code']}",
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${controller.scanHistory[index]['time']}",
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: ZoomTapAnimation(
                onTap: () {
                  controller.nextPage();
                },
                child: Container(
                  color: AppColors.herlanMain,
                  height: 60,
                  child: Center(
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
