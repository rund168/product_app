import 'package:get/get.dart';
import 'package:product_app/post/auth/login/view/login_view.dart'; // Import LoginView

class HomeController extends GetxController {
  var selectedIndex = 0;

  void onBottomNavigationTapped(int index) {
    selectedIndex = index;
    update(); // Notify listeners to update the UI
  }

  // Optional: Define a list of titles to use in the app bar
  final titles = ["Home", "My Posts", "Account"];

  String get appBarTitle => titles[selectedIndex];

  // Add logout method to clear session and navigate to login screen
  void logout() {
    // Perform any necessary cleanup (e.g., clearing session or local storage)
    // Example: GetStorage().erase() or similar, depending on how you're managing the session

    // Navigate to the LoginView
    Get.offAll(() => LoginView()); // Navigate to login screen and clear the navigation stack
  }
}
