import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../common/string.dart';
import '../../../custom/appBar.dart';
import '../../../custom/dimensions.dart';
import '../../../custom/simpleText.dart';
import '../controller/profile_controller.dart';
import '../model/profile_data.dart';
import 'login_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: _bodyWidget(controller),
        );
      },
    );
  }

  Widget _bodyWidget(ProfileController controller) {
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
                  leading: Icon(Icons.arrow_back_ios),
                  title: txtProfile,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.menu),
                    )
                  ],
                ),
                _profileSettingSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileSettingSection() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: CustomSimpleTextField(
                  textSizeValue: true,
                  hintText: txtAccount1,
                  hintColor: blackColor,
                  fontfamily: 'PoppinsRegular',
                  textSize: MediaQuery.of(Get.context!).size.height * 0.024,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: AppDimension.containerSizeProfileAccountHeight,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: profileData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180,
                                child: Row(
                                  children: [
                                    profileData[index].icon,
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: CustomSimpleTextField(
                                        textSizeValue: true,
                                        hintText: profileData[index].title,
                                        hintColor: greyColor,
                                        fontfamily: 'PoppinsRegular',
                                        textSize: MediaQuery.of(Get.context!)
                                                .size
                                                .height *
                                            0.022,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: Get.context!,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: CustomSimpleTextField(
                                          textSizeValue: true,
                                          hintText: 'Logout Confirmation',
                                          fontfamily: 'welcomeWMD',
                                          textSize: MediaQuery.of(Get.context!)
                                                  .size
                                                  .height *
                                              0.021,
                                          hintColor: blackColor,
                                        ),
                                        content: CustomSimpleTextField(
                                          textSizeValue: true,
                                          hintText:
                                              'Are you sure you want to logout?',
                                          fontfamily: 'welcomeWMD',
                                          textSize: MediaQuery.of(Get.context!)
                                                  .size
                                                  .height *
                                              0.021,
                                          hintColor: greyColor,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Get.back(); // Return false to indicate cancellation
                                            },
                                            child: CustomSimpleTextField(
                                              textSizeValue: true,
                                              hintText: 'Cancel',
                                              fontfamily: 'welcomeWMD',
                                              textSize:
                                                  MediaQuery.of(Get.context!)
                                                          .size
                                                          .height *
                                                      0.021,
                                              hintColor: appMainColor,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.userData
                                                  .remove('userLogin');

                                              Get.offAll(() => LoginScreen());
                                            },
                                            child: CustomSimpleTextField(
                                              textSizeValue: true,
                                              hintText: 'Logout',
                                              fontfamily: 'welcomeWMD',
                                              textSize:
                                                  MediaQuery.of(Get.context!)
                                                          .size
                                                          .height *
                                                      0.021,
                                              hintColor: appMainColor,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(Icons.arrow_forward_ios_rounded,
                                    color: appMainColor, size: 22),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
