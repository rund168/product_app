import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/repository/post/modules/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  var splashController = Get.put(SplashController());
  SplashView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("Post Free Mobile App"),
      ),
    );
  }
}
