import 'package:get/get.dart';

import '../controllers/lupapass_controller.dart';

class LupapassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LupapassController>(
      () => LupapassController(),
    );
  }
}
