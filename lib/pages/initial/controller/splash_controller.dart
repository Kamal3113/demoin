import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  bool? loginCheck;
  var dark = false;
  final userData = GetStorage();

  @override
  void onInit() {
    Future.delayed(Duration.zero, () async {
      startTimer();
    });
    userData.writeIfNull('userLogin', false);

    super.onInit();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {


    userData.read('userLogin')
        ? Get.offNamed(AppRoutes.homeScreen)
        : Get.offNamed(AppRoutes.signUpScreen);
  }

  RxBool isDarkTheme = false.obs;

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? ThemeData.dark() : ThemeData.light());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
