import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../common/string.dart';
import '../../../custom/appBar.dart';
import '../../../custom/dimensions.dart';
import '../../../custom/simpleText.dart';
import '../controller/diet_controller.dart';
import '../model/diet_data.dart';
import 'food_list.dart';

class DietScreen extends GetView<DietController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DietController>(
      init: DietController(),
      builder: (controller) {
        return Scaffold(
          body: _bodyWidget(controller),
        );
      },
    );
  }

  Widget _bodyWidget(DietController controller) {
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
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  title: txtMeals,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.menu),
                    )
                  ],
                ),
                _favoriteSection(controller),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _favoriteSection(DietController controller) {
    controller.width = MediaQuery.of(Get.context!).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: dietData.length,
        itemBuilder: (context, index) {
          final myDiet = dietData[index];
          if (index % 2 == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.off(FoodListScreen(), arguments: {
                    'diet_data': myDiet.mealType,
                    'diet_type': myDiet.foodType
                  });
                },
                child: AnimatedContainer(
                  width: AppDimension.screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  duration: Duration(milliseconds: 400 + (index * 250)),
                  curve: Curves.decelerate,
                  transform: Matrix4.translationValues(
                    0,
                    controller.myAnimation ? 0 : 100.0,
                    0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Hero(
                          tag: 'one',
                          child: CircleAvatar(
                            radius: AppDimension.screenWidth * 0.1,
                            // 10% of screen width
                            backgroundImage: AssetImage(myDiet.image),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimension.screenWidth * 0.4,
                              child: CustomSimpleTextField(
                                textSizeValue: true,
                                hintText: myDiet.foodType,
                                hintColor: blackColor,
                                fontfamily: 'PoppinsRegular',
                                textSize:
                                    MediaQuery.of(Get.context!).size.height *
                                        0.022,
                              ),
                            ),
                            Text(
                              myDiet.description,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.off(FoodListScreen(), arguments: {
                  'diet_data': myDiet.mealType,
                  'diet_type': myDiet.foodType
                });
              },
              child: AnimatedContainer(
                width: AppDimension.screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                duration: Duration(milliseconds: 400 + (index * 250)),
                curve: Curves.decelerate,
                transform: Matrix4.translationValues(
                  0,
                  controller.myAnimation ? 0 : 100.0,
                  0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimension.screenWidth * 0.4,
                            child: CustomSimpleTextField(
                              textSizeValue: true,
                              hintText: myDiet.foodType,
                              hintColor: blackColor,
                              fontfamily: 'PoppinsRegular',
                              textSize:
                                  MediaQuery.of(Get.context!).size.height *
                                      0.022,
                            ),
                          ),
                          Text(
                            myDiet.description,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Hero(
                        tag: 'one',
                        child: CircleAvatar(
                          radius: AppDimension.screenWidth * 0.1,
                          // 10% of screen width
                          backgroundImage: AssetImage(myDiet.image),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
