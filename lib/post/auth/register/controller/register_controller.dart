import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_app/repository/post/register_repository.dart';

class RegisterController extends GetxController {
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var profileImagePath = ''.obs;
  var loadingRegister = false.obs;
  var _registerRepository = RegisterRepository();

  Future<void> register() async {
    // Check if all fields are filled
    if (firstNameController.value.text.isEmpty) {
      Get.snackbar("Error", "Please Enter Your First Name");
      return;
    }

    if (lastNameController.value.text.isEmpty) {
      Get.snackbar("Error", "Please Enter Your Last Name");
      return;
    }

    if (usernameController.value.text.isEmpty) {
      Get.snackbar("Error", "Please Enter Your Username");
      return;
    }

    if (emailController.value.text.isEmpty) {
      Get.snackbar("Error", "Please Enter Your Email");
      return;
    }

    if (phoneNumberController.value.text.isEmpty) {
      Get.snackbar("Error", "Please Enter Your Phone Number");
      return;
    }

    if (passwordController.value.text != confirmPasswordController.value.text) {
      Get.snackbar("Error", "Password does not match");
      return;
    }

    // Start loading state
    loadingRegister(true);

    try {
      // Register user
      await _registerRepository.register(
        username: usernameController.value.text,
        email: emailController.value.text,
        phoneNumber: phoneNumberController.value.text,
        password: passwordController.value.text,
        confirmPassword: confirmPasswordController.value.text, // Added confirmPassword
        firstName: firstNameController.value.text,
        lastName: lastNameController.value.text,
      );

      // Go back to login after successful registration
      Get.back();
    } catch (e) {
      // Show error message if registration fails
      Get.snackbar("Error", e.toString());
    } finally {
      // Stop loading state
      loadingRegister(false);
    }
  }

}
