import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_app/models/post/login/login_res.dart';

class AccountController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var user = Rx<LoginRes?>(null);  // Set it to Rx<LoginRes?> to handle nullable LoginRes
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadUserData();  // Load stored data on init
  }

  void loadUserData() {
    final storedUser = storage.read('userData');  // Get user data from storage
    if (storedUser != null) {
      user.value = LoginRes.fromJson(storedUser);
      isLoading(false);
    } else {
      errorMessage.value = 'No user data available.';
    }
  }
}
