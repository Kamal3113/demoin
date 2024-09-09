import 'package:get/instance_manager.dart';

import '../controller/add_food_controller.dart';
import '../controller/food_list_controller.dart';

class AddFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFoodController>(
      () => AddFoodController(),
    );
  }
}
