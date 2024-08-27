import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/color.dart';
import '../../../custom/dimensions.dart';
import '../../../custom/simpleText.dart';
import '../model/favorite_data.dart';

class FavoriteListController extends GetxController
    with SingleGetTickerProviderMixin {
  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();
  bool isLoading = false;
  double width = 0;
  bool myAnimation = false;
  List<User> favoriteUsersList = [];

  // final BottomBarController bottomBarController1 = Get.find();
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      width = Get.width;
      myAnimation = true;
      update();
    });
    print(myAnimation);
    super.onInit();

    print(favoriteUsersList);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void showBottomSheet(BuildContext context, User? users, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          widthFactor: 1.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSimpleTextField(
                    textSizeValue: true,
                    hintText: 'Are you sure want to remove?',
                    hintColor: appMainColor,
                    fontfamily: 'InterHeader',
                    textSize: MediaQuery.of(Get.context!).size.height * 0.022,
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    users!.image,
                    height: AppDimension.screenWidth * 0.18,
                  ),
                  title: CustomSimpleTextField(
                    textSizeValue: true,
                    hintText: '${users!.name}',
                    hintColor: blackColor,
                    fontfamily: 'InterHeader',
                    textSize: MediaQuery.of(Get.context!).size.height * 0.022,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back(); // Return false to indicate cancellation
                      },
                      child: CustomSimpleTextField(
                        textSizeValue: true,
                        hintText: 'Cancel',
                        fontfamily: 'welcomeWMD',
                        textSize:
                            MediaQuery.of(Get.context!).size.height * 0.021,
                        hintColor: appMainColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {

                        update();
                        Get.back();
                      },
                      child: CustomSimpleTextField(
                        textSizeValue: true,
                        hintText: 'Remove',
                        fontfamily: 'welcomeWMD',
                        textSize:
                            MediaQuery.of(Get.context!).size.height * 0.021,
                        hintColor: appMainColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
