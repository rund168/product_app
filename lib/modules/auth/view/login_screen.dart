import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:product_app/modules/auth/controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5000),
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                controller: authController.usernameController.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  hintText: "Username",
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextFormField(
                controller: authController.passwordController.value,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  labelText: "Password",
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                authController.login();
              },
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                width: double.infinity,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF5000),
                  borderRadius: BorderRadius.all(Radius.circular(10),)
                ),
                child: 
                    Obx((){
                      if(authController.loadingLogin.value){
                        return Center(
                          child: CircularProgressIndicator(color: Colors.white,),
                        );
                      }
                      return Text(
                        "login".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      );
                    })
              ),
            ),
          ],
        ),
      ),
    );
  }
}
