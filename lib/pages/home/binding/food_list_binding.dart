import 'package:get/instance_manager.dart';

import '../controller/food_list_controller.dart';

class FoodListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodListController>(
      () => FoodListController(),
    );
  }
}
