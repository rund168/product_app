import 'package:get/get.dart';
import 'package:product_app/repository/post/login_repository.dart';
import 'package:product_app/routes/app_routes.dart';

class SplashController extends GetxController{
  var _loginRepository = LoginRepository();

  @override
  void onInit() {
    checkUserLogin();
    super.onInit();


  }
  Future<void> checkUserLogin() async{
    var user = await _loginRepository.getUserLocal();

    if(user.accessToken!= null){
      Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(RouteName.postRoot);
    }else{
      Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(RouteName.postLogin);
    }
  }
}