import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herlan_bp/app/data/appcolors.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // controller.saveDeviceInfo();
    Timer(Duration(seconds: 2), () {
      Get.offNamed(Routes.LOGINSCEEN);
    });
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.herlanMain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/logo/Herlan-Logo-With-Icon_real.png',
                height: 250,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   child: Image.asset(
            //     'assets/logo/login_logo_hb.png',
            //     height: 20,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
