import 'dart:io';

import 'package:demoapp/pages/home/view/add_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../custom/appBar.dart';
import '../../../custom/dimensions.dart';
import '../../../custom/material_button.dart';
import '../../../custom/productCard.dart';
import '../../../custom/simpleText.dart';
import '../../../sqlite_data/sqlite_data_store.dart';
import '../controller/food_list_controller.dart';

class FoodListScreen extends GetView<FoodListController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodListController>(
      init: FoodListController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              color: appMainColor,
              onPressed: () {
                Get.to(AddFood());
              },
              text: 'Add More Food',
            ),
          ),
          body: _bodyWidget(controller),
        );
      },
    );
  }

  Widget _bodyWidget(FoodListController controller) {
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

                  title: 'Food List',
                ),
                _foodSection(controller),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _foodSection(FoodListController controller) {
    controller.width = MediaQuery.of(Get.context!).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: FutureBuilder(
        future: controller.dbFoodData.getFoodList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.foodDataList = snapshot.data;
            return snapshot.data!.isEmpty
                ? Center(
                    child: CustomSimpleTextField(
                      textSizeValue: true,
                      hintText: 'No data found',
                      textSize: 25,
                      hintColor: greyColor,
                      fontfamily: 'summary',
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.foodDataList == null
                        ? 0
                        : controller.foodDataList!.length,
                    itemBuilder: (context, index) {
                      Food showData = controller.foodDataList![index];
                      String filePath = showData.image!
                          .replaceAll("File: ", "")
                          .replaceAll("'", "");

                      File imageFile = File(filePath);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedContainer(
                          width: AppDimension.screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          duration: Duration(milliseconds: 100 + (index * 250)),
                          curve: Curves.bounceIn,
                          transform: Matrix4.translationValues(
                            0,
                            controller.myAnimation ? 0 : 100.0,
                            0,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ProductCardImage(
                                name: showData.name.toString(),
                                imageUrl: imageFile,
                                price: showData.price.toString(),
                                onDelete: () {
                                  controller.dbFoodData
                                      .deleteFood(showData.id!.toInt());

                                  controller.foodDataList!.removeAt(index);
                                  controller.update();
                                },
                              )),
                        ),
                      );
                    },
                  );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
