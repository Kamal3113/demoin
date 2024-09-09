import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/color.dart';
import '../../../custom/appBar.dart';
import '../../../custom/customTextBox.dart';
import '../../../custom/material_button.dart';
import '../../../custom/simpleText.dart';
import '../controller/add_food_controller.dart';

class AddFood extends GetView<AddFoodController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFoodController>(
      init: AddFoodController(),
      builder: (controller) {
        return Scaffold(

          body: _bodyWidget(controller),
        );
      },
    );
  }

  Widget _bodyWidget(AddFoodController controller) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: appGradientBg1),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  title: 'Add Food Detail',
                ),
                _addFoodSection(controller),

              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _addFoodSection(AddFoodController controller) {
    controller.width = MediaQuery.of(Get.context!).size.width;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child:  FadeInUp(
          duration: Duration(milliseconds: 1800),
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  controller: controller.nameController,
                  hintText: 'Name',
                  errorMessage: controller.errorMessageFullName,
                  suffixIcon: Icon(
                    Icons.done,
                    color: controller.suffixIconNameColor,
                  ),
                  prefixIcon: Icon(
                    Icons.fastfood_outlined,
                    color: greyColor,
                  ),
                ),
                CustomFormField(
                  isNumber: true,
                  controller: controller.priceController,
                  hintText: 'Enter price',
                  errorMessage: controller.errorMessagePrice,
                  prefixIcon: Icon(
                    Icons.money,
                    color: greyColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(Get.context!).size.height * 0.02,
                      left: MediaQuery.of(Get.context!).size.height * 0.04),
                  child: CustomSimpleTextField(
                    textSizeValue: true,
                    hintText: 'Add image',
                    fontfamily: 'semiBold',
                    textSize: MediaQuery.of(Get.context!).size.height * 0.02,
                    hintColor: appMainColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(Get.context!).size.height * 0.04),
                  child: GestureDetector(
                    onTap: () {
                      pickerOption();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // shadow only on the bottom side
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.camera_alt_sharp),
                        )),
                  ),
                ),
                controller.setImage == null
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(Get.context!).size.height * 0.02,
                            left: MediaQuery.of(Get.context!).size.height * 0.04),
                        child: Container(
                            width: MediaQuery.of(Get.context!).size.width * 0.4,
                            height:
                                MediaQuery.of(Get.context!).size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Center(child: Text('No image selected.'))),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(Get.context!).size.height * 0.04,
                          top: MediaQuery.of(Get.context!).size.height * 0.02,
                        ),
                        child:
                        Image.file(
                          controller.setImage!,
                          fit: BoxFit.fill,
                          // width: MediaQuery.of(Get.context!).size.width * 0.08,
                          height: MediaQuery.of(Get.context!).size.height * 0.1,
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(Get.context!).size.height * 0.02,
                  ),
                  child: Center(
                    child: CustomButton(
                        color: appMainColor,
                        text: "Save",
                        onPressed: () {
                          if (controller.setImage == null) {
                            Get.snackbar(
                              backgroundColor: appLightMainColor,
                              'Hey, User!',
                              '',
                              messageText: CustomSimpleTextField(
                                textSizeValue: true,
                                hintText: 'Kindly select an image.',
                                textSize: 18,
                                hintColor: blackColor,
                                fontfamily: 'summary',
                              ),
                            );
                          } else {
                            controller.validateSet();
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  pickerOption() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: CustomSimpleTextField(
                  textSizeValue: true,
                  hintText: 'Gallery',
                  textSize: MediaQuery.of(Get.context!).size.height * 0.020,
                  hintColor: appTextAllColor,
                  fontfamily: 'summary',
                ),
                onTap: () {
                  controller.pickImage(ImageSource.gallery);
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: CustomSimpleTextField(
                  textSizeValue: true,
                  hintText: 'Camera',
                  textSize: MediaQuery.of(Get.context!).size.height * 0.020,
                  hintColor: appTextAllColor,
                  fontfamily: 'summary',
                ),
                onTap: () {
                  controller.pickImage(ImageSource.camera);
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
