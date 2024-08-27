import 'package:get/instance_manager.dart';

import '../controller/signUp_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
          () => SignUpController(),
    );
  }
}
