import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appassets.dart';
import '../../../data/appcolors.dart';
import '../controllers/qrscreen_controller.dart';

class QrscreenView extends GetView<QrscreenController> {
  const QrscreenView({Key? key}) : super(key: key);
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
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.modernDeepSea,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Lottie.asset(
                AppAssets.ASSET_TYPING,
              ),
            ),

            Obx(
              () => controller.scanHistory.isEmpty
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 150,
                      child: Center(
                        child: Text(
                          // "Please position your camera towards the QR code for scanning.",
                          "Please enter the voucher code bellow",
                          style: TextStyle(
                            color: AppColors.herlanMain,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: AppColors.modernGreen),
                          borderRadius: BorderRadius.circular(10)),
                      // color: Colors.green,
                      child: ListView.builder(
                          itemCount: controller.scanHistory.length,
                          itemBuilder: (BuildContext, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${controller.scanHistory[index]['code']}",
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${controller.scanHistory[index]['time']}",
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
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
            ),
            // Container(
            //   height: 20,
            //   child: Center(
            //     child: Text(
            //       "valid",
            //       style: TextStyle(color: AppColors.modernGreen),
            //     ),
            //   ),
            // ),
            // Stack(
            //   children: [
            //     // Container(
            //     //   height: 400,
            //     //   // width: 250,
            //     //   child: MobileScanner(
            //     //     controller: controller.HomescannerController(),
            //     //     onDetect: (capture) {
            //     //       print(capture.barcodes);
            //     //       controller.showDialogue(capture);
            //     //     },
            //     //   ),
            //     // ),
            //     Container(
            //         height: 400,
            //         child: Obx(() => controller.isValid.value
            //             ? QRScannerOverlay(overlayColour: Colors.white)
            //             : QRlAY2(overlayColour: Colors.white))),
            //     Obx(() => !controller.isValid.value
            //         ? Container(
            //             height: 400,
            //             child: Center(
            //               child: Container(
            //                 height: 80,
            //                 padding: EdgeInsets.symmetric(
            //                     vertical: 20, horizontal: 20),
            //                 color: AppColors.modernSexyRed.withOpacity(0.7),
            //                 child: Column(
            //                   children: [
            //                     Icon(
            //                       Icons.error,
            //                       color: Colors.white,
            //                     ),
            //                     Text(
            //                       "INVALID",
            //                       style: TextStyle(
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 16),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           )
            //         : Container())
            //   ],
            // ),

            ZoomTapAnimation(
              onLongTap: () {
                controller.isEditableUpdater(value: true);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                // color: Colors.red,
                height: 80,
                child: Obx(() => Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 4) {
                                // Move focus to the next field
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: TextStyle(color: AppColors.modernPlantation),
                            textAlign: TextAlign.center,
                            controller: controller.firstSection,
                            enabled: controller.isEditable.value,
                            decoration: InputDecoration(
                              // hintText: "+88",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 4) {
                                // Move focus to the next field
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: TextStyle(color: AppColors.modernGreen),
                            // style: TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,

                            controller: controller.secondSection,
                            enabled: controller.isEditable.value,
                            decoration: InputDecoration(
                              // hintText: "+88",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 4) {
                                // Move focus to the next field
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: TextStyle(color: AppColors.modernBlue),
                            textAlign: TextAlign.center,
                            controller: controller.thirdSection,
                            enabled: controller.isEditable.value,
                            decoration: InputDecoration(
                              // hintText: "+88",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 4) {
                                controller.disableField();
                              }
                            },
                            style: TextStyle(color: AppColors.modernPurple),
                            textAlign: TextAlign.center,
                            controller: controller.fourthSection,
                            enabled: controller.isEditable.value,
                            decoration: InputDecoration(
                              // hintText: "+88",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ZoomTapAnimation(
              onTap: () {
                controller.nextPage();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: AppColors.herlanMain,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
