import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_app/data/app_exceptions.dart';
import 'package:product_app/main.dart';
import 'package:product_app/models/auth/Login_request.dart';
import 'package:product_app/repository/auth_repository.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loadingLogin = false.obs;
  var authRepository = AuthRepository();

  Future<void> login() async {
    if (usernameController.value.text.isEmpty) {
      Get.snackbar("Error", "Please enter your username!");
      return;
    }
    if (passwordController.value.text.isEmpty){
      Get.snackbar("Error", "Please enter your password!");
      return;
    }
    loadingLogin(true);
    try {
      var req = LoginRequest(
        username: usernameController.value.text,
        password: passwordController.value.text,
      );
      await authRepository.login(req);
      Get.back(result: true);
    } on UnAuthorization {
      Get.snackbar("Error", "Your Username and Password incorrect!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingLogin(false);
    }
  }

  // emilys
  // emilyspass

}
