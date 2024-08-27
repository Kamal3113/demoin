import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color.dart';
import '../../../common/string.dart';
import '../../../custom/appBar.dart';
import '../../../custom/dimensions.dart';
import '../../../custom/simpleText.dart';
import '../controller/favorite_list_controller.dart';
import '../model/favorite_data.dart';

class FavoriteListScreen extends GetView<FavoriteListController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteListController>(
      init: FavoriteListController(),
      builder: (controller) {
        return Scaffold(
          body: _bodyWidget(controller),
        );
      },
    );
  }

  Widget _bodyWidget(FavoriteListController controller) {
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
                  title: txtFavoriteList,
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

  Widget _favoriteSection(FavoriteListController controller) {
    controller.width = MediaQuery.of(Get.context!).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: controller.favoriteUsersList == null ||
              controller.favoriteUsersList.length == 0
          ? Center(
              child: CustomSimpleTextField(
                textSizeValue: true,
                hintText: 'No data found',
                textSize: MediaQuery.of(Get.context!).size.height * 0.025,
                hintColor: greyColor,
                fontfamily: 'summary',
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.favoriteUsersList.length,
              itemBuilder: (context, index) {
                final myUser = controller.favoriteUsersList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Get.off(YogaScreen(), arguments: {'yoga_data': users});
                    },
                    child: AnimatedContainer(
                      width: AppDimension.screenWidth * 0.9,
                      // 90% of screen width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      duration: Duration(milliseconds: 400 + (index * 250)),
                      curve: Curves.decelerate,
                      transform: Matrix4.translationValues(
                          controller.myAnimation ? 0 : controller.width, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: AppDimension.screenWidth * 0.1,
                              // 10% of screen width
                              backgroundImage: AssetImage(myUser.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimension.screenWidth * 0.4,
                                  child: CustomSimpleTextField(
                                    textSizeValue: true,
                                    hintText: myUser.name,
                                    hintColor: blackColor,
                                    fontfamily: 'PoppinsRegular',
                                    textSize: MediaQuery.of(Get.context!)
                                            .size
                                            .height *
                                        0.022,
                                  ),
                                ),
                                Text(
                                  myUser.username,
                                ),
                              ],
                            ),
                            Spacer(),
                            // Add Spacer to push the heart icon to the right
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.showBottomSheet(Get.context!,myUser, index);
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )
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
