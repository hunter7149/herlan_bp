import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appassets.dart';
import '../../../data/appcolors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/offerscreen_controller.dart';

class OfferscreenView extends GetView<OfferscreenController> {
  const OfferscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.green,
      Colors.lime,
      Colors.yellow,
      Colors.blue,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 65.0,
      fontFamily: 'caviar',
    );
    const colorizeTextStyle1 = TextStyle(
      fontSize: 150.0,
      fontFamily: 'copenhagen',
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 55,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: ZoomTapAnimation(
            onTap: () async {
              // Get.put(HomescreenController());
              // Get.find<HomescreenController>().onInit();

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
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: Container(
                        height: 300,
                        child: Lottie.asset(AppAssets.ASSET_LOADING_ANIMATION,
                            repeat: false),
                      ),
                    )
                  : Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 60,
                          left: 0,
                          right: 0,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  controller.animaTionEnded.value
                                      ? Container(
                                          height: 300,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(150)),
                                          child: Center(
                                              child: SizedBox(
                                            width: 300.0,
                                            child: AnimatedTextKit(
                                              totalRepeatCount: 1,
                                              animatedTexts: [
                                                ColorizeAnimatedText(
                                                    'Congrats!',
                                                    speed: Duration(
                                                        milliseconds: 300),
                                                    textStyle:
                                                        colorizeTextStyle1,
                                                    colors: colorizeColors,
                                                    textAlign:
                                                        TextAlign.center),
                                                ColorizeAnimatedText(
                                                    '50% \n Discount',
                                                    textStyle:
                                                        colorizeTextStyle,
                                                    colors: colorizeColors,
                                                    textAlign:
                                                        TextAlign.center),
                                              ],
                                              isRepeatingAnimation: true,
                                            ),
                                          )))
                                      : Container(
                                          height: 300,
                                          child: Lottie.asset(
                                              AppAssets.ASSET_VOUCHER_INFO),
                                        ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Coupon details",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: AppColors.modernGreen,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    height: 1,
                                    color: AppColors.modernGreen,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Obx(() => controller.qrvalue.value.isEmpty
                                  //     ? Container()
                                  //     : Column(
                                  //         children: [
                                  //           QrImageView(
                                  //               data: controller.qrvalue.value,
                                  //               version: QrVersions.auto,
                                  //               size: 150.0,
                                  //               dataModuleStyle:
                                  //                   QrDataModuleStyle(
                                  //                       dataModuleShape:
                                  //                           QrDataModuleShape
                                  //                               .square,
                                  //                       color: AppColors
                                  //                           .modernDeepSea)),
                                  //           SizedBox(
                                  //             height: 10,
                                  //           )
                                  //         ],
                                  //       )),
                                  // // Obx(
                                  //   () => controller.image.value == null
                                  //       ? Container()
                                  //       : Image(
                                  //           image: MemoryImage(
                                  //               controller.image.value!)),
                                  // ),
                                  Row(
                                    children: [
                                      Text(
                                        "Coupon code: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${controller.code.value}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Status: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "VALID",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: AppColors.modernGreen,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer name: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Khalid Bin Oalid",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer phone: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "+8801303146132",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer email: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "emonnatbd@gmail.com",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Issue date: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "10-11-2022",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expire date: ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.grey.shade700),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "10-11-2022",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ZoomTapAnimation(
                                    onTap: () {
                                      Get.offNamed(Routes.HOME);
                                    },
                                    child: Container(
                                      color: AppColors.herlanMain,
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          "DONE",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: ZoomTapAnimation(
                                //     onTap: () {
                                //       Get.offAllNamed(Routes.CUSTOMERSCREEN);
                                //     },
                                //     child: Container(
                                //       color: AppColors.modernGreen,
                                //       height: 60,
                                //       child: Center(
                                //         child: Text(
                                //           "FINISH",
                                //           style: TextStyle(
                                //               fontSize: 28,
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.w400),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ))
                      ],
                    ),
            )));
  }
}
