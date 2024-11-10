import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/routes/app_routes.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4A90E2), // Updated to match your theme
          ),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Post Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.postManagePost);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 16, right: 8),
                        padding: EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4A90E2), // Updated primary color
                              Color(0xFF64B5F6), // Light blue accent
                              Color(0xFF303F9F), // Darker navy accent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.post_add, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Post",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Categories Button with routing
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.postManageCategory);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16),
                        padding: EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4A90E2), // Updated primary color
                              Color(0xFF64B5F6), // Light blue accent
                              Color(0xFF303F9F), // Darker navy accent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.category, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
