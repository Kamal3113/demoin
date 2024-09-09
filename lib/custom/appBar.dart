import 'package:demoapp/custom/simpleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? trailing;

  CustomAppBar({
    required this.title,
    this.leading,
    this.actions,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,

      title:  CustomSimpleTextField(
        textSizeValue: true,
        hintText: title,
        hintColor: blackColor,
        fontfamily: 'PoppinsRegular',
        textSize: MediaQuery.of(Get.context!).size.height * 0.024,
      ),
      leading: leading,
      actions: [

        ...?actions,
        if (trailing != null) trailing!,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
