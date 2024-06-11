import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absen_controller.dart';

class AbsenView extends GetView<AbsenController> {
   AbsenView({Key? key}) : super(key: key);
   final AbsenController controller = Get.put(AbsenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(
          'Welcome, ${controller.displayName.value}',
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
