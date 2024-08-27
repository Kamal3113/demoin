import 'package:get/instance_manager.dart';

import '../controller/diet_controller.dart';

class DietBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DietController>(
      () => DietController(),
    );
  }
}
