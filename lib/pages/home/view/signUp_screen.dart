import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../common/image.dart';
import '../../../common/string.dart';
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
    child: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        right:
                            MediaQuery.of(Get.context!).size.height * 0.04,
                      ),
                      child: CustomButton(

                          color: appMainColor,
                          text: 'Proceed to next',
                          onPressed: () {
                            controller.validateSet();
                          }),
                    ),

                    controller.isLoading == true
                        ? CircularProgressIndicator(color: appMainColor)
                        : SizedBox()
                  ],
                )),
          ),
        ),
      ],
    ),
  );
}
