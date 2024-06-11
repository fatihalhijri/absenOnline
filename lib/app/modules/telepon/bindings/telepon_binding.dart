import 'package:get/get.dart';

import '../controllers/telepon_controller.dart';

class TeleponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeleponController>(
      () => TeleponController(),
    );
  }
}
