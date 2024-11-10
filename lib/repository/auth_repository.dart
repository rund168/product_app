import 'package:get_storage/get_storage.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/network_api_service.dart';
import 'package:product_app/models/auth/Login_request.dart';
import 'package:product_app/models/auth/Login_response.dart';

class AuthRepository {
  final _networkApiService = NetworkApiService();

  Future<LoginResponse> login(LoginRequest req) async {
    var response = await _networkApiService.postApi(ApiUrl.loginPath, req.toJson());
    LoginResponse loginResponse = LoginResponse.fromJson(response);
    saveUserLocal(loginResponse);
    return loginResponse;
  }

  Future<void> saveUserLocal(LoginResponse data) async{
    var storage = GetStorage();
    storage.write("USER_KEY", data.toJson());
  }

  Future<LoginResponse> getUserLocal() async{
    var storage = GetStorage();
    return LoginResponse.fromJson(storage.read("USER_KEY"));
  }
}
