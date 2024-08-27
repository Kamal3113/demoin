import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../custom/simpleText.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return Scaffold(
          body: _bodyWidget(controller),
        );
      },
    );
  }

  Widget _bodyWidget(HomeScreenController controller) {
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
                _headerSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: ListTile(
        title: CustomSimpleTextField(
          textSizeValue: true,
          hintText: 'Hi,',
          hintColor: blackColor,
          fontfamily: 'PoppinsRegular',
          textSize: MediaQuery.of(Get.context!).size.height * 0.027,
        ),
        subtitle: CustomSimpleTextField(
          textSizeValue: true,
          hintText: 'Yoga is a strange gift.',
          hintColor: blackColor,
          fontfamily: 'InterHeader',
          textSize: MediaQuery.of(Get.context!).size.height * 0.019,
        ),
      ),
    );
  }
}
