import 'package:get/instance_manager.dart';

import '../controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
  }
}
