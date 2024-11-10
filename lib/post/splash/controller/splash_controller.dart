import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';  // Import GetStorage
import 'package:product_app/repository/post/login_repository.dart';
import 'package:product_app/routes/app_routes.dart';

class SplashController extends GetxController {
  var _loginRepository = LoginRepository();
  final _box = GetStorage(); // GetStorage instance

  @override
  void onInit() {
    super.onInit();
    checkFirstLaunch();
  }

  // Check if the app is being launched for the first time
  Future<void> checkFirstLaunch() async {
    // Check if it's the first time the app is being launched
    bool isFirstLaunch = _box.read('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      // Set the flag to false after the first launch
      _box.write('isFirstLaunch', false);

      // Show splash screen for a while before navigating
      Future.delayed(const Duration(seconds: 3), () {
        // Navigate to the home or login screen
        checkUserLogin();
      });
    } else {
      // If it's not the first launch, just check the login status
      checkUserLogin();
    }
  }

  Future<void> checkUserLogin() async {
    var user = await _loginRepository.getUserLocal();

    if (user.accessToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(RouteName.home);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(RouteName.postLogin);
      });
    }
  }
}
