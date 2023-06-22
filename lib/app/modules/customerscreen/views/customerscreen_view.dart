import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:herlan_bp/app/modules/scanscreen/controllers/scanscreen_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appassets.dart';
import '../../../data/appcolors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/customerscreen_controller.dart';

class CustomerscreenView extends GetView<CustomerscreenController> {
  const CustomerscreenView({Key? key}) : super(key: key);
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
              // Get.delete<ScanscreenController>();
              // Get.put(ScanscreenController());
              Get.find<ScanscreenController>()
                  .mobileScannerController
                  .value!
                  .stop();
              // Get.find<ScanscreenController>().mobileScannerController.close();
              Get.find<ScanscreenController>()
                  .mobileScannerController
                  .value!
                  .start();

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: Lottie.asset(AppAssets.ASSET_CUSTOMER_INFO),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: controller.phonePrefix,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "+88",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  16.0), // Add some spacing between the text fields
                          Expanded(
                            flex: 4,
                            child: TextField(
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                              controller: controller.phone,
                              onChanged: (value) {
                                controller.checkCustomer();
                              },
                              maxLength: 11,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .herlanMain // Set the desired border color
                                        ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors
                                          .modernPlantation, // Set the desired border color
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => !controller.otherFieldVisibility.value
                            ? Container()
                            : Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.name,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        hintText: 'Name',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .herlanMain // Set the desired border color
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors
                                                  .modernPlantation, // Set the desired border color
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => !controller.otherFieldVisibility.value
                            ? Container()
                            : Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .herlanMain // Set the desired border color
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors
                                                  .modernPlantation, // Set the desired border color
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => !controller.otherFieldVisibility.value
                              ? Container()
                              : controller.isLogingIn.value
                                  ? SpinKitDoubleBounce(
                                      color: AppColors.herlanMain,
                                    )
                                  : ZoomTapAnimation(
                                      onTap: () {
                                        controller.nextPage();
                                        // Get.toNamed(Routes.QRSCREEN);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: AppColors.herlanMain,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
