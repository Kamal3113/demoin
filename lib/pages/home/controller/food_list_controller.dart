import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/diet_data.dart';

class FoodListController extends GetxController with SingleGetTickerProviderMixin {
  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();
  bool isLoading = false;
  double width = 0;
  bool myAnimation = false;
  String? dietName ;
  List<MealType> mealData = [];

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      width = Get.width;
      myAnimation = true;
      update();
    });
    getData();
    print(myAnimation);
    super.onInit();
  }
  getData() {
    if (Get.arguments != null) {
      if (Get.arguments["diet_data"] != null&&Get.arguments["diet_type"] != null) {
        mealData = (Get.arguments["diet_data"]);
        dietName = (Get.arguments["diet_type"]);

        debugPrint('$mealData');
        debugPrint('$dietName');

        update();
      }
    }
  }
  @override
  void onClose() {
    super.onClose();
  }
}
