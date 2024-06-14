import 'package:get/get.dart';

import '../controllers/update_jadwal_controller.dart';

class UpdateJadwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateJadwalController>(
      () => UpdateJadwalController(),
    );
  }
}
