import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/color.dart';
import '../../../custom/simpleText.dart';
import '../view/login_screen.dart';

class SignUpController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController pasController = TextEditingController();
  final TextEditingController conPasController = TextEditingController();
  final userData = GetStorage();
  final formkey = new GlobalKey<FormState>();
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  bool isLoading = false;
  Color suffixIconNameColor = Colors.grey;
  Color suffixIconEmailColor = Colors.grey;
  Color suffixIconPhoneColor = Colors.grey;
  Color suffixIconPswrdColor = Colors.grey;
  Color suffixIconConfPswrdColor = Colors.grey;
  String? errorMessageFullName;
  String? errorMessagePassword;
  String? errorMessageConfirmPassword;
  String? errorMessageEmail;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(_validateEmail);
    pasController.addListener(_validatePassword);
    fullNameController.addListener(_validateName);

    conPasController.addListener(_validateConfirmPassword);
  }

  void _validateName() {
    final name = fullNameController.text;

    if (name.isEmpty || name.length < 3) {
      suffixIconNameColor = Colors.grey; // Invalid name
    } else {
      suffixIconNameColor = appMainColor; // Valid name
    }
    update();
  }

  void _validateEmail() {
    final email = emailController.text;

    if (email.isEmpty || !email.contains('@')) {
      suffixIconEmailColor = Colors.grey; // Invalid email
    } else {
      suffixIconEmailColor = appMainColor; // Valid email
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

  void _validateConfirmPassword() {
    final password = conPasController.text;

    if (password.isEmpty || password.length < 8) {
      suffixIconConfPswrdColor = Colors.grey; // Invalid password
    } else {
      suffixIconConfPswrdColor = appMainColor; // Valid password
    }
    update();
  }

  void validateSet() {
    if (emailController.text.isEmpty) {
      errorMessageEmail = 'Please enter email';
    } else if (!emailController.text.contains('@')) {
      errorMessageEmail = 'Please enter a valid email';
    } else {
      errorMessageEmail = null;
    }

    if (pasController.text.isEmpty) {
      errorMessagePassword = 'Please enter password';
    } else if (pasController.text.length < 8) {
      errorMessagePassword = 'Password must be at least 8 characters long';
    } else {
      errorMessagePassword = null;
    }

    if (conPasController.text.isEmpty) {
      errorMessageConfirmPassword = 'Please enter confirm password';
    }else  if (conPasController.text != pasController.text) {
      errorMessageConfirmPassword ='Passwords do not match';
    }
    else if (conPasController.text.length < 8) {
      errorMessageConfirmPassword =
          'Password must be at least 8 characters long';
    } else {
      errorMessageConfirmPassword = null;
    }

    if (fullNameController.text.isEmpty) {
      errorMessageFullName = 'Please enter name';
    } else if (fullNameController.text.length < 3) {
      errorMessageFullName = 'Name must be at least 3 characters long';
    } else {
      errorMessageFullName = null;
    }
    if (errorMessageEmail == null &&
        errorMessagePassword == null &&
        errorMessageConfirmPassword == null &&
        errorMessageFullName == null) {
      logInApi();
    }
    update();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    conPasController.dispose();
    pasController.dispose();
    super.dispose();
  }

  // Toggle password visibility
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

  void logInApi() {
    userData.write('email', emailController.text);
    userData.write('password', pasController.text);
    userData.write('name', fullNameController.text);
    Get.snackbar(
      colorText: Colors.white,
      backgroundColor: appMainColor,
      'Hi user!',
      '',
      messageText: CustomSimpleTextField(
        textSizeValue: true,
        hintText: "You have registered successfully",
        textSize: 16,
        hintColor: Colors.white,
        fontfamily: 'Monstreat',
      ),
    );

    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(LoginScreen());
    });
  }
}
