import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          "Taobao Khmer",
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
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align logo and text to the left
            children: [
              // App Logo
              Image.network(
                'https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Taobao_logo_%282021%29.svg/1200px-Taobao_logo_%282021%29.svg.png',
                height: 50, // Adjust logo size
              ),
              SizedBox(height: 24),
              // Welcome text
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
              // Username field
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
              // Password field
              TextFormField(
                controller: authController.passwordController.value,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add forgot password functionality
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFFFF5000)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Old Login button (Restored)
              GestureDetector(
                onTap: () {
                  authController.login();
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.infinity, // Take full width
                  decoration: BoxDecoration(
                    color: Color(0xFFFF5000),
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
            ],
          ),
        ),
      ),
    );
  }
}
