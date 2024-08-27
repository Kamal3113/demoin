import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../common/image.dart';
import '../../../common/string.dart';
import '../../../custom/customTextBox.dart';
import '../../../custom/material_button.dart';
import '../../../custom/simpleText.dart';
import '../../../routes/app_routes.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (context) {
          Get.put(LoginController());
          return Scaffold(body: _bodyWidget(controller));
        });
  }
}

_bodyWidget(LoginController controller) {
  return Stack(
    children: [
      SizedBox.expand(
        child: Image.asset(
          appBg2,
          fit: BoxFit.cover,
        ),
      ),
      // Image.asset(appBg,height:AppDimension.containerHeight ,width:AppDimension.containerWidth ,),
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 30.0,
                  top: MediaQuery.of(Get.context!).size.height * 0.2,
                  bottom: MediaQuery.of(Get.context!).size.height * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSimpleTextField(
                    textSizeValue: true,
                    hintText: 'Sign In',
                    fontfamily: 'semiBold',
                    textSize: MediaQuery.of(Get.context!).size.height * 0.034,
                    hintColor: appMainColor,
                  ),
                  CustomSimpleTextField(
                    textSizeValue: true,
                    hintText: 'Please sign in to continue.',
                    fontfamily: 'regular',
                    textSize: MediaQuery.of(Get.context!).size.height * 0.022,
                    hintColor: greyColor,
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
                          prefixIcon: Icon(
                            Icons.email,
                            color: greyColor,
                            //appEyeColor,
                          ),
                          controller: controller.emailController,
                          hintText: 'Email',
                          errorMessage: controller.errorMessage,
                          suffixIcon: Icon(
                            Icons.done,
                            color: controller.suffixIconColor,
                            //appEyeColor,
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter email';
                          //   } else if (!value.contains('@')) {
                          //     return 'Please enter a valid email';
                          //   }
                          //   // You can add additional validation rules here if needed
                          //   return null;
                          // },
                        ),
                        Obx(() {
                          return CustomFormField(
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: greyColor,
                              //appEyeColor,
                            ),
                            controller: controller.pasController,
                            hintText: 'Password',
                            isObscured: controller.isPasswordHidden.value,
                            errorMessage: controller.errorMessagePassword,
                            suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.suffixIconPswrdColor,
                                ),
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                }),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30.0, top: 5, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Checkbox(
                                        value: controller.isRememberMe.value,
                                        onChanged: controller.toggleRememberMe,
                                        activeColor: appMainColor,
                                      )),
                                  CustomSimpleTextField(
                                    textAlign: TextAlign.start,
                                    textSizeValue: true,
                                    hintText: 'Remember Me',
                                    fontfamily: 'regular',
                                    textSize: MediaQuery.of(Get.context!)
                                            .size
                                            .height *
                                        0.018,
                                    hintColor: blackColor,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                },
                                child: CustomSimpleTextField(
                                  textAlign: TextAlign.start,
                                  textSizeValue: true,
                                  hintText: 'Forgot Password?',
                                  fontfamily: 'regular',
                                  textSize:
                                      MediaQuery.of(Get.context!).size.height *
                                          0.018,
                                  hintColor: blackColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(Get.context!).size.height *
                                    0.04,
                                right: MediaQuery.of(Get.context!).size.height *
                                    0.04,
                              ),
                              child: CustomButton(
                                  miniButton: true,
                                  sufficIconValue: true,
                                  color: appMainColor,
                                  text: 'Sign In',
                                  onPressed: () {
                                    controller.validateSet();
                                  }),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(Get.context!).size.height *
                                  0.07),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSimpleTextField(
                                hintText: txtAccount,
                                hintColor: blackColor,
                                fontfamily: 'regular',
                                textSize:
                                    MediaQuery.of(Get.context!).size.height *
                                        0.019,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.offNamed(AppRoutes.signUpScreen);
                                  },
                                  child: CustomSimpleTextField(
                                    fontfamily: 'regular',
                                    hintText: txSignup,
                                    hintColor: appMainColor,
                                    textSize: MediaQuery.of(Get.context!)
                                            .size
                                            .height *
                                        0.019,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      ),
    ],
  );
}
