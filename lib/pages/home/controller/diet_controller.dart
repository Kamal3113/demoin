import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DietController extends GetxController with SingleGetTickerProviderMixin {
  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();
  bool isLoading = false;
  double width = 0;
  bool myAnimation = false;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      width = Get.width;
      myAnimation = true;
      update();
    });
    print(myAnimation);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
