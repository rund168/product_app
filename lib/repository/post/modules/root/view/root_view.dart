import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3B5998), // Distinct color for RootView
        centerTitle: true,
        title: Text(
          "Root View",
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
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              // App Logo (Placeholder)
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/41/Logo_of_the_Metropolitan_Museum_of_Art.svg',
                height: 50, // Adjust logo size
              ),
              SizedBox(height: 24),
              // Welcome text
              Text(
                "Welcome to Root View!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "This is the main screen of the app.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              // Placeholder button
              GestureDetector(
                onTap: () {
                  // Handle root view action or navigation
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.infinity, // Take full width
                  decoration: BoxDecoration(
                    color: Color(0xFF3B5998),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
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
