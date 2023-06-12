import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboardsceen_controller.dart';

class DashboardsceenView extends GetView<DashboardsceenController> {
  const DashboardsceenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardsceenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DashboardsceenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
