import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../common/color.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
              // backgroundColor: Colors.lightBlueAccent,
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hero(
                //   tag: 'heroTag',
                //   child: Lottie.asset(
                //     'assets/yogaLoty1.json',
                //     // height: 120,
                //   ),
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Food App',
                      textStyle: const TextStyle(
                          fontFamily: 'black',
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: appMainColor),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
                // CustomSimpleTextField(
                //   fontfamily: 'black',
                //   textSizeValue: true,
                //   hintText: 'Yoga',
                //   hintColor: greyColor,
                //   textSize: AppTextStyles.textHeader,
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ));
        });
  }
}
