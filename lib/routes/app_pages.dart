import 'package:get/get_navigation/get_navigation.dart';

import '../pages/home/binding/diet_binding.dart';
import '../pages/home/binding/favorite_list_binding.dart';
import '../pages/home/binding/food_list_binding.dart';
import '../pages/home/binding/home_screen_binding.dart';
import '../pages/home/binding/login_binding.dart';
import '../pages/home/binding/profile_binding.dart';
import '../pages/home/binding/signup_binding.dart';
import '../pages/home/view/diet_screen.dart';
import '../pages/home/view/favorite_list_screen.dart';
import '../pages/home/view/food_list.dart';
import '../pages/home/view/login_screen.dart';
import '../pages/home/view/new_home_screen.dart';
import '../pages/home/view/profile_screen.dart';
import '../pages/home/view/signUp_screen.dart';
import '../pages/initial/binding/splash_binding.dart';
import '../pages/initial/view/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.splashScreen;

  // static const INITIAL = AppRoutes.storyOptionGridScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeScreenBinding()],
    ),
    GetPage(
      name: AppRoutes.favoriteListScreen,
      page: () => FavoriteListScreen(),
      bindings: [FavoriteListBinding()],
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
      bindings: [ProfileBinding()],
    ),
    GetPage(
      name: AppRoutes.dietScreen,
      page: () => DietScreen(),
      bindings: [DietBinding()],
    ),
    GetPage(
      name: AppRoutes.foodListScreen,
      page: () => FoodListScreen(),
      bindings: [FoodListBinding()],
    ),
  ];
}
