import 'package:get_storage/get_storage.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/network_api_service.dart';
import 'package:product_app/models/post/login/login_res.dart';
import 'package:product_app/models/post/login/login_req.dart';



class LoginRepository {
  final _api = NetworkApiService();

  Future<LoginRes> login({String? username, String? password}) async {
    var requestBody = LoginReq(phoneNumber: username, password: password);
    var response = await _api.LoginApi(ApiUrl.postAppLoginPath, requestBody.toJson());
    return LoginRes.fromJson(response);
  }

  Future<void> saveUserLocal(LoginRes data) async {
    var storage = GetStorage();
    storage.write("USER_KEY", data.toJson());
  }

  Future<LoginRes> getUserLocal() async {
    LoginRes response = LoginRes();
    var storage = GetStorage();
    var user = storage.read("USER_KEY");
    if (user != null) {
      response = LoginRes.fromJson(user);
    }
    return response;
  }
}
