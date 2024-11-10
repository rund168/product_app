import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_app/data/app_exceptions.dart';
import 'package:product_app/models/auth/Login_request.dart';
import 'package:product_app/repository/post/login_repository.dart';
import 'package:product_app/routes/app_routes.dart';

class AuthController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loadingLogin = false.obs;
  var _loginRepository = LoginRepository();

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
      var response =await _loginRepository.login(
        username: usernameController.value.text,
        password: passwordController.value.text,
      );
      Get.offAllNamed(RouteName.postSplash);
      _loginRepository.saveUserLocal(response);
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
  // 0962505045
  // 123456

}
