import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/modules/auth/controller/auth_controller.dart';
import 'package:product_app/post/auth/register/view/register_view.dart';


class LoginView extends StatelessWidget {
  LoginView({super.key});
  AuthController authController = Get.put(AuthController());

  // Create an observable variable to manage the password visibility state
  final RxBool obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26247B), // Updated color scheme
        centerTitle: true,
        title: Text(
          "BBU NEWS", // Updated app name
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add logo image
              Center(
                child: Image.asset(
                  'assets/logo_color.png',
                  height: 80,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Please log in to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: authController.usernameController.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  hintText: "Username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => TextFormField(
                controller: authController.passwordController.value,
                obscureText: obscureText.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(obscureText.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      obscureText.value = !obscureText.value;
                    },
                  ),
                ),
              )),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add forgot password functionality
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFF26247B)), // Updated color
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  authController.login();
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF26247B), // Updated color
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Obx(() {
                    if (authController.loadingLogin.value) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    return Text(
                      "Log In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(() => RegisterView()); // Navigate to RegisterView
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF26247B)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Create new account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF26247B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}