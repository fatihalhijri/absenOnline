import 'package:get/get.dart';

import '../controllers/homemain_controller.dart';

class HomemainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomemainController>(
      () => HomemainController(),
    );
  }
}
