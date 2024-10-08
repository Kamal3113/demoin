import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/color.dart';
import '../../../custom/simpleText.dart';
import '../../../sqlite_data/sqlite_data_store.dart';

class FoodListController extends GetxController
    with SingleGetTickerProviderMixin {
  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();
  bool isLoading = false;
  bool isLogin = false;
  double width = 0;
  bool myAnimation = false;
  String? image;

  final DBFoodData dbFoodData = new DBFoodData();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Food? food;
  List<Food>? foodDataList;

  Color suffixIconNameColor = Colors.grey;

  String? errorMessageFullName;
  String? errorMessagePrice;

  File? setImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      width = Get.width;
      myAnimation = true;
      update();
    });

    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    super.onClose();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

  void validateSet() {
    if (nameController.text.isEmpty) {
      errorMessageFullName = 'Please enter name';
    } else {
      errorMessageFullName = null;
    }

    if (priceController.text.isEmpty) {
      errorMessagePrice = 'Please enter price';
    } else {
      errorMessagePrice = null;
    }

    if (errorMessageFullName == null && errorMessagePrice == null) {
      if (setImage == '') {
        Get.snackbar(
          backgroundColor: appLightMainColor,
          'Hey, User!',
          '',
          messageText: CustomSimpleTextField(
            letterpsacingValue: true,
            textSizeValue: true,
            hintText: 'Kindly select an image.',
            textSize: 18,
            hintColor: blackColor,
            fontfamily: 'summary',
          ),
        );
      }else{
        submitFoodData(Get.context!);
        Get.back();
      }

    }

    update();
  }

  void submitFoodData(BuildContext context) {
    if (formkey.currentState!.validate()) {
      if (food == null) {
        Food st = new Food(
            name: nameController.text,
            image: setImage.toString(),
            price: priceController.text);
        dbFoodData.insertFood(st).then((value) => {
              nameController.clear(),
              priceController.clear(),
              print("Food Data Add to database $value"),
            });
      } else {
        food!.name = nameController.text;
        food!.image = setImage.toString();
        food!.price = priceController.text;
      }
    }
  }
}
