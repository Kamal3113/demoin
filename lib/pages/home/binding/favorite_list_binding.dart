import 'package:get/instance_manager.dart';

import '../controller/favorite_list_controller.dart';

class FavoriteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteListController>(
      () => FavoriteListController(),
    );
  }
}
