import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/post/home/controller/home_controller.dart';
import 'package:product_app/post/post/views/post_view.dart';
import 'package:product_app/post/account/view/account_view.dart';
import 'package:product_app/post/my_posts/view/my_posts_view.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 20.0,
            title: Text(
              controller.appBarTitle,
              style: TextStyle(
                color: Color(0xFF26247B),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Color(0xFF26247B)),
                onPressed: () {
                  // Add notification functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.exit_to_app, color: Color(0xFF26247B)), // Logout icon
                onPressed: () {
                  controller.logout(); // Call the logout method
                },
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF26247B), Color(0xFF26247B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: IndexedStack(
              index: controller.selectedIndex,
              children: [
                PostView(),
                MyPostsView(),
                AccountView(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Color(0xFF26247B),
                unselectedItemColor: Colors.grey,
                currentIndex: controller.selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.post_add_outlined),
                    activeIcon: Icon(Icons.post_add),
                    label: "My Posts",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    activeIcon: Icon(Icons.account_circle),
                    label: "Account",
                  ),
                ],
                onTap: (index) {
                  controller.onBottomNavigationTapped(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
