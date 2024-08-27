import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  final TextEditingController emailController = TextEditingController();

  final userData = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
