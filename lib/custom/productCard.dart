import 'dart:io';

import 'package:demoapp/custom/simpleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color.dart';

class ProductCardImage extends StatelessWidget {
  final String name;
  final File imageUrl;
  final String price;
  final VoidCallback onDelete;

  const ProductCardImage({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.file(
        imageUrl,

        height: MediaQuery.of(Get.context!).size.height*0.2,
        fit: BoxFit.cover,
      ),
      title: CustomSimpleTextField(
        textSizeValue: true,
        hintText:name,
        textSize: MediaQuery.of(Get.context!).size.height*0.03,
        hintColor: appTextAllColor,
        fontfamily: 'summary',
      ),
      subtitle:CustomSimpleTextField(
        textSizeValue: true,
        hintText:'\$${price}',
        textSize: MediaQuery.of(Get.context!).size.height*0.02,
        hintColor: greyColor,
        fontfamily: 'summary',
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete,color: appColor,),
        onPressed: onDelete,
      ),
    );
  }
}
