import 'package:get/get.dart';

import '../controllers/add_absen_controller.dart';

class AddAbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAbsenController>(
      () => AddAbsenController(),
    );
  }
}
