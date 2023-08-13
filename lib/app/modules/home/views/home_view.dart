import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herlan_bp/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appassets.dart';
import '../../../data/appcolors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   leadingWidth: 55,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: ZoomTapAnimation(
        //     onTap: () async {
        //       // controller.stopCamera();
        //       Get.back();
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: AppColors.herlanMain,
        //     ),
        //   ),
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    Get.toNamed(Routes.CUSTOMERSCREEN);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 200,
                    decoration: BoxDecoration(
                        color: AppColors.modernBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            "SCAN NOW",
                            style: TextStyle(
                                color: Colors.grey.shade200, fontSize: 30),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Lottie.asset(AppAssets.ASSET_SCAN_ANIMATION),
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 200,
                  decoration: BoxDecoration(
                      color: AppColors.modernCoolPink,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        child: Text(
                          "COUPONS",
                          style: TextStyle(
                              color: Colors.grey.shade200, fontSize: 30),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        child: Lottie.asset(AppAssets.ASSET_GIFT_ANIMATION),
                      ))
                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    Get.toNamed(Routes.DASHBOARDSCEEN);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 200,
                    decoration: BoxDecoration(
                        color: AppColors.modernPurple,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            "DASHBOARD",
                            style: TextStyle(
                                color: Colors.grey.shade200, fontSize: 28),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Lottie.asset(AppAssets.ASSET_CHART_ANIMATION),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
