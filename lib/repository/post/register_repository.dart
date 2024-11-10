import 'package:get_storage/get_storage.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/network_api_service.dart';
import 'package:product_app/models/post/register/register_res.dart';
import 'package:product_app/models/post/register/register_req.dart';

class RegisterRepository {
  final _api = NetworkApiService();

  Future<RegisterRes> register({
    String? phoneNumber,
    String? password,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? confirmPassword,
  }) async {
    var registerResponse = new RegisterRes();
    var requestBody = RegisterRequest(
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );

    var response = await _api.registerApi(ApiUrl.postAppLoginRegisterPath, requestBody.toJson());
    return RegisterRes.fromJson(response);
  }

  Future<void> saveUserLocal(RegisterRes data) async {
    var storage = GetStorage();
    storage.write("USER_KEY", data.toJson());
  }
}
