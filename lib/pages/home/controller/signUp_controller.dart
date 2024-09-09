import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/color.dart';
import '../view/add_food.dart';
import '../view/food_list.dart';

class SignUpController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();

  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();

  bool isLoading = false;
  bool isLogin = false;
  Color suffixIconNameColor = Colors.grey;

  String? errorMessageFullName;

  @override
  void onInit() {
    super.onInit();
isLogin = userData.read('userLogin');
    fullNameController.addListener(_validateName);
  }

  void _validateName() {
    final name = fullNameController.text;

    if (name.isEmpty || name.length < 3) {
      suffixIconNameColor = Colors.grey; // Invalid name
    } else {
      suffixIconNameColor = appMainColor; // Valid name
    }
    update();
  }

  void validateSet() {
    if( isLogin == true){
      Get.offAll(FoodListScreen());
      // Get.offAll(AddFood());
    }
    else{
      if (fullNameController.text.isEmpty) {
        errorMessageFullName = 'Please enter name';
      } else if (fullNameController.text.length < 3) {
        errorMessageFullName = 'Name must be at least 3 characters long';
      } else {
        errorMessageFullName = null;
      }
      if (errorMessageFullName == null) {
        registerUser();
      }
      update();
    }


   update();
  }

  @override
  void dispose() {
    fullNameController.dispose();

    super.dispose();
  }

  void registerUser() {
    userData.write('name', fullNameController.text);
    userData.write('userLogin', true);
    isLoading = true;

    Future.delayed(Duration(seconds: 3), () {
      // Get.offAll(AddFood());
      Get.offAll(FoodListScreen());
      isLoading = false;
    });
  }
}
