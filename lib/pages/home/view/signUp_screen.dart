import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../custom/customTextBox.dart';
import '../../../custom/material_button.dart';
import '../../../custom/simpleText.dart';
import '../controller/signUp_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (context) {
          Get.put(SignUpController());
          return Scaffold(body: _bodyWidget(controller));
        });
  }
}

_bodyWidget(SignUpController controller) {
  return SafeArea(
    child:
    controller.isLogin == true?
    Center(
      child: CustomButton(
          color: appMainColor,
          text: controller.isLogin == true
              ? 'Proceed to next'
              : "Register",
          onPressed: () {
            controller.validateSet();
          }),
    ) :
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(
              left: 30.0,
              top: MediaQuery.of(Get.context!).size.height * 0.15,
              bottom: MediaQuery.of(Get.context!).size.height * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSimpleTextField(
                textSizeValue: true,
                hintText: 'Sign Up',
                fontfamily: 'semiBold',
                textSize: MediaQuery.of(Get.context!).size.height * 0.034,
                hintColor: appMainColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Form(
                key: controller.formkey,
                child: Column(

                  children: [
                    CustomFormField(
                      controller: controller.fullNameController,
                      hintText: 'Name',
                      errorMessage: controller.errorMessageFullName,
                      suffixIcon: Icon(
                        Icons.done,
                        color: controller.suffixIconNameColor,
                        //appEyeColor,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: greyColor,
                        //appEyeColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(Get.context!).size.height * 0.04,
                      ),
                      child: CustomButton(
                          color: appMainColor,
                          text: "Register",
                          onPressed: () {
                            controller.validateSet();
                          }),
                    ),
                    controller.isLoading == true
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator(color: appMainColor)),
                        )
                        : SizedBox()
                  ],
                )),
          ),
        ),
      ],
    ),
  );
}
