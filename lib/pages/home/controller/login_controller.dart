import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/color.dart';
import '../../../custom/simpleText.dart';

class LoginController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pasController = TextEditingController();
  final TextEditingController conPasController = TextEditingController();
  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  bool isLoading = false;
  var isRememberMe = false.obs;
  var isLoggedIn = false.obs;
  Color suffixIconColor = Colors.grey;
  Color suffixIconPswrdColor = Colors.grey;
  var userName;
  var userPassword;
  String? errorMessage;
  String? errorMessagePassword;

  void validateSet() {
    if (emailController.text.isEmpty) {
      errorMessage = 'Please enter email';
    } else if (!emailController.text.contains('@')) {
      errorMessage = 'Please enter a valid email';
    } else {
      errorMessage = null;
    }

    if (pasController.text.isEmpty) {
      errorMessagePassword = 'Please enter password';
    } else if (pasController.text.length < 8) {
      errorMessagePassword = 'Password must be at least 8 characters long';
    } else {
      errorMessagePassword = null;
    }
    if (errorMessage == null && errorMessagePassword == null) {
      if (userName == emailController.text &&
          userPassword == pasController.text) {
        if (isRememberMe.value) {
          userData.write('remember_me', true);
          userData.write('email', emailController.text);
          userData.write('password', pasController.text);
        }
        userData.write('userLogin', true);
      } else {
        Get.snackbar(
          colorText: Colors.white,
          backgroundColor: appMainColor,
          'Hi user!',
          '',
          messageText: CustomSimpleTextField(
            textSizeValue: true,
            hintText: "Invalid credentials",
            textSize: 16,
            hintColor: Colors.white,
            fontfamily: 'Monstreat',
          ),
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    emailController.addListener(_validateEmail);
    pasController.addListener(_validatePassword);
    userName = userData.read('email');
    userPassword = userData.read('password');
    update();
  } // Toggle password visibility

  void _validateEmail() {
    final email = emailController.text;

    if (email.isEmpty || !email.contains('@')) {
      suffixIconColor = Colors.grey; // Invalid email
    } else {
      suffixIconColor = appMainColor; // Valid email
    }
    update();
  }

  void _validatePassword() {
    final password = pasController.text;

    if (password.isEmpty || password.length < 8) {
      suffixIconPswrdColor = Colors.grey; // Invalid password
    } else {
      suffixIconPswrdColor = appMainColor; // Valid password
    }
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    pasController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
    update();
    print(isPasswordHidden.value);
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
    update();
    print(isConfirmPasswordHidden.value);
  }

  void toggleRememberMe(bool? value) {
    if (value != null) {
      isRememberMe.value = value;
    }
  }

  void loadUserData() {
    isRememberMe.value = userData.read('remember_me') ?? false;
    if (isRememberMe.value) {
      emailController.text = userData.read('email') ?? '';
      pasController.text = userData.read('password') ?? '';
    }
  }

  void loginWithFacebook() {
    Get.snackbar('Login', 'Logging in with Facebook');
    // Implement Facebook login logic here
  }

  void loginWithTwitter() {
    Get.snackbar('Login', 'Logging in with Twitter');
    // Implement Twitter login logic here
  }

  void loginWithGoogle() {
    Get.snackbar('Login', 'Logging in with Google');
    // Implement Google login logic here
  }
}
