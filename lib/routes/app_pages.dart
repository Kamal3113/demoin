import 'package:demoapp/pages/home/binding/add_food_binding.dart';
import 'package:demoapp/pages/home/view/add_food.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../pages/home/binding/food_list_binding.dart';
import '../pages/home/binding/signup_binding.dart';
import '../pages/home/view/food_list.dart';
import '../pages/home/view/signUp_screen.dart';
import '../pages/initial/binding/splash_binding.dart';
import '../pages/initial/view/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.splashScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      name: AppRoutes.foodListScreen,
      page: () => FoodListScreen(),
      bindings: [FoodListBinding()],
    ),
    GetPage(
      name: AppRoutes.addFood,
      page: () => AddFood(),
      bindings: [AddFoodBinding()],
    ),
  ];
}
