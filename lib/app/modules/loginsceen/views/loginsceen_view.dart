import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appassets.dart';
import '../../../data/appcolors.dart';
import '../../../data/commonwidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/loginsceen_controller.dart';

class LoginsceenView extends GetView<LoginsceenController> {
  const LoginsceenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ProsteBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    BezierCurveSection(
                      start: Offset(0, (screenheight / 2.4) - 25),
                      top: Offset(screenWidth / 4, screenheight / 2.4),
                      end: Offset(screenWidth / 2, (screenheight / 2.4) - 40),
                    ),
                    BezierCurveSection(
                      start: Offset(screenWidth / 2, (screenheight / 2.4) - 25),
                      top: Offset(
                          screenWidth / 4 * 3, (screenheight / 2.4) - 75),
                      end: Offset(screenWidth, screenheight / 2.4 - 25),
                    ),
                  ],
                ),
                child: Container(
                    height: screenheight / 2.4,
                    color: AppColors.herlanMain.withOpacity(0.7)),
              ),
              ClipPath(
                clipper: ProsteBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    BezierCurveSection(
                      start: Offset(
                          0,
                          (screenheight / 2.5 -
                              150)), //Screen divided by 3 means it will go less to the bottom than dividng by 2.7,
                      top: Offset(screenWidth / 4, screenheight / 2.5 - 30),
                      end: Offset(screenWidth / 2, (screenheight / 2.5) - 25),
                    ),
                    BezierCurveSection(
                      start: Offset(screenWidth / 2, (screenheight / 2.5) - 25),
                      top: Offset(
                          screenWidth / 4 * 3, (screenheight / 2.5) - 50),
                      end: Offset(screenWidth, screenheight / 2.6),
                    ),
                  ],
                ),
                child: Container(
                  height: screenheight / 2.6,
                  color: AppColors.herlanMain,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.ASSET_HERLAN_LOGO,
                          height: 200,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                COMMONWIDGET.loginInput(
                    controller: controller.email,
                    hinttext: "Enter your ID",
                    obsecure: false),
                SizedBox(
                  height: 20,
                ),
                passwordField(
                    hinttext: "Enter your password", controller: controller),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => controller.isLogingIn.value
                        ? SpinKitDoubleBounce(
                            color: AppColors.herlanMain,
                          )
                        : ZoomTapAnimation(
                            onTap: () {
                              Get.offNamed(Routes.HOME);
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
                          ))
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Dont have an account?',
                //       textAlign: TextAlign.center,
                //     ),
                //     Text(
                //       ' Create Account',
                //       style:
                //           TextStyle(fontSize: 16, color: AppColors.modernBlue),
                //     )
                //   ],
                // )
              ],
            ),
          ),
          // ClipPath(
          //   clipper: ProsteBezierCurve(
          //     position: ClipPosition.top,
          //     list: [
          //       BezierCurveSection(
          //         start: Offset(screenWidth, 30),
          //         top: Offset(screenWidth / 4 * 3, 0),
          //         end: Offset(screenWidth / 2, 30),
          //       ),
          //       BezierCurveSection(
          //         start: Offset(screenWidth / 2, 30),
          //         top: Offset(screenWidth / 4, 60),
          //         end: Offset(0, 0),
          //       ),
          //     ],
          //   ),
          //   child: Container(
          //     color: AppColors.herlanMain,
          //     height: 180,
          //   ),
          // ),
        ],
      ),
    ));
  }

  static passwordField(
      {required String hinttext, required LoginsceenController controller}) {
    return Obx(() {
      return TextField(
        controller: controller.password,
        obscureText: controller.obsecure.value,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.herlanMain,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.herlanMain,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.modernChocolate,
                width: 1,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.obsecureUpdater();
              },
              child: Icon(
                Icons.visibility,
                color: AppColors.herlanMain,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.herlanMain,
            )),
      );
    });
  }
}
