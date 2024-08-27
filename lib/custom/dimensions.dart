import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDimension {
  static double containerHeight = MediaQuery.of(Get.context!).size.height;
  static double containerWidth = MediaQuery.of(Get.context!).size.width;

  static double containerSizeHeight =
      MediaQuery.of(Get.context!).size.height * 0.30;
  static double containerSizeWidthHome =
      MediaQuery.of(Get.context!).size.width * 0.30;

  // static  double containerSizeHeight = MediaQuery.of(Get.context!).size.height*0.23;
  static double containerHomeScreenSizeHeight =
      MediaQuery.of(Get.context!).size.height * 0.38;
  static double containerSizeProfileHeight =
      MediaQuery.of(Get.context!).size.height * 0.09;
  static double containerSizeProfileAccountHeight =
      MediaQuery.of(Get.context!).size.height * 0.14;
  static double containerSizeProfileWidth =
      MediaQuery.of(Get.context!).size.height * 0.13;
  static double containerSizeWidth =
      MediaQuery.of(Get.context!).size.width * 0.6;

  static double screenWidth = MediaQuery.of(Get.context!).size.width;
  static double screenHeight = MediaQuery.of(Get.context!).size.height;
}
