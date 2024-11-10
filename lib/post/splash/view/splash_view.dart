import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/post/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  var splashController = Get.put(SplashController());
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF26247B),  // Set background color to #26247b
      body: GestureDetector(
        onTap: () {
          // You can perform some action here, like navigating to the next screen
          // Example: Get.to(NextScreen()); // Replace with your desired navigation
          print('Splash screen tapped!');
        },
        child: Center(  // Center everything inside the Scaffold
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Center the content vertically
            children: [
              // Column for logo
              Column(
                children: [
                  Image.asset(
                    'assets/logo_white.png', // Replace with your asset image path
                    width: 300,  // Adjust size of the image
                    height: 300, // Adjust size of the image
                  ),
                ],
              ),

              // Column for title text
              Column(
                children: [
                  Text(
                    'Build Bright University NEWS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,  // Text color for contrast
                    ),
                  ),
                  Text(
                    'Mobile APP By Phearun Sorl',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,  // Light gray text color
                    ),
                  ),
                ],
              ),

              // Column for loading indicator
              Column(
                children: [
                  SizedBox(height: 20), // Add a small gap before the loading indicator
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // White color for the spinner
                    strokeWidth: 4, // Thickness of the spinner line
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
