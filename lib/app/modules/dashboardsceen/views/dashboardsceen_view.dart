import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/appcolors.dart';
import '../../../models/chartDATA.dart';
import '../controllers/dashboardsceen_controller.dart';

class DashboardsceenView extends GetView<DashboardsceenController> {
  const DashboardsceenView({Key? key}) : super(key: key);
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
                  height: 250,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.modernBlue),
                      // color: AppColors.modernBlue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          color: AppColors.modernBlue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Current point:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "400",
                                style: TextStyle(
                                  color: AppColors.modernLightBrown,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          color: Colors.grey.shade300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "80% compeleted",
                                style: TextStyle(
                                  color: AppColors.modernGreen,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  // minHeight: 30,

                                  semanticsLabel: "80%",
                                  value: 0.8,
                                  color: AppColors.modernGreen,
                                  backgroundColor: AppColors.modernRed,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "20% left",
                                style: TextStyle(
                                  color: AppColors.modernSexyRed,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.modernBlue,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Target \n point:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "500",
                                style: TextStyle(
                                  color: AppColors.modernGreen,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  // height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 5, color: AppColors.modernGreen),
                      borderRadius: BorderRadius.circular(5)),
                  child: SfCartesianChart(
                      primaryXAxis:
                          CategoryAxis(title: AxisTitle(text: "Name")),
                      primaryYAxis:
                          NumericAxis(title: AxisTitle(text: "Points")),
                      // Chart title
                      title: ChartTitle(text: 'Top BP'),
                      // Enable legend
                      // legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <BarSeries<ChartData, String>>[
                        BarSeries<ChartData, String>(
                            // borderWidth: 2,
                            sortingOrder: SortingOrder.ascending,
                            borderColor: Colors.red,
                            color: AppColors.modernGreen,
                            dataSource: controller.topSeller,
                            sortFieldValueMapper: (ChartData sales, _) =>
                                sales.value,
                            xAxisName: "Points",
                            xValueMapper: (ChartData sales, _) => sales.title,
                            yValueMapper: (ChartData sales, _) => sales.value,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  // height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: AppColors.modernBlue),
                      borderRadius: BorderRadius.circular(5)),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Brand per call'),
                      // Enable legend
                      // legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <BarSeries<ChartData, String>>[
                        BarSeries<ChartData, String>(
                            // borderWidth: 2,
                            sortingOrder: SortingOrder.ascending,
                            borderColor: Colors.blue,
                            color: AppColors.modernBlue,
                            dataSource: controller.brandPerCall,
                            sortFieldValueMapper: (ChartData sales, _) =>
                                sales.value,
                            xAxisName: "Points",
                            xValueMapper: (ChartData data, _) => data.title,
                            yValueMapper: (ChartData data, _) => data.value,
                            name: 'BPC',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
