import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_app/data/app_exceptions.dart';
import 'package:product_app/data/remote/api_url.dart';
import 'package:product_app/data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:product_app/models/auth/Login_response.dart';
import 'package:product_app/models/post/login/Refresh_token_request.dart';
import 'package:product_app/models/post/login/login_res.dart';
import 'package:product_app/routes/app_routes.dart';

class NetworkApiService implements BaseApiServer {
  @override
  Future getApi(String url) async {
    if (kDebugMode) print("GET REQUEST URL: $url\n");
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 120));
      if (kDebugMode) print("RESPONSE STATUS: ${response.statusCode}");

      switch (response.statusCode) {
        case 200:
          try {
            responseJson = jsonDecode(response.body);
            if (responseJson == null || responseJson is! Map<String, dynamic>) {
              throw Exception("Unexpected response format for GET request.");
            }
          } catch (e) {
            throw FormatException("Error parsing response body: $e");
          }
          break;
        case 400:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
        default:
          throw Exception('Unexpected error occurred: ${response.statusCode}');
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

    if (kDebugMode) print("GET RESPONSE BODY: $responseJson\n");
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic requestBody) async {
    print("POST REQUEST URL: $url\nBODY: $requestBody\n");
    dynamic responseJson;

    try {
      var storage = GetStorage();
      var user = LoginRes.fromJson(storage.read("USER_KEY"));
      var token = user.accessToken ?? "";

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 120));

      switch (response.statusCode) {
        case 200:
          try {
            responseJson = jsonDecode(response.body);
          } catch (e) {
            throw FormatException("Error parsing response body: $e");
          }
          break;
        case 401:
          if (await refreshTokenApi()) {
            print("Token refreshed - retrying request.");
            return _retry(url, requestBody);
          } else {
            print("Token refresh failed. Logging out.");
            throw UnAuthorization();
          }
        case 500:
          throw InternalServerException();
        default:
          throw Exception(
              'Error with status code: ${response.statusCode} - ${response.body}');
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

    return responseJson;
  }

  Future<dynamic> registerApi(String url, dynamic requestBody) async {
    if (kDebugMode) print("REGISTER REQUEST URL: $url\nBODY: $requestBody\n");
    dynamic responseJson;

    try {
      final headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 120));

      if (kDebugMode) print("REGISTER RESPONSE STATUS: ${response.statusCode}");

      switch (response.statusCode) {
        case 200:
          try {
            responseJson = jsonDecode(response.body);
            if (responseJson == null || responseJson is! Map<String, dynamic>) {
              throw Exception("Unexpected response format in registration.");
            }
          } catch (e) {
            throw FormatException("Error parsing response body: $e");
          }
          break;
        case 400:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
        default:
          throw Exception("Unexpected error occurred: ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

    if (kDebugMode) print("REGISTER RESPONSE BODY: $responseJson\n");
    return responseJson;
  }




  Future<dynamic> _retry(String url, dynamic requestBody) async {
    dynamic responseJson;
    final storage = GetStorage();
    final user = LoginResponse.fromJson(storage.read("USER_KEY"));
    final token = user.accessToken ?? "";

    if (kDebugMode) print("RETRYING WITH TOKEN: $token");

    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 120));

      if (kDebugMode) print("RETRY RESPONSE STATUS: ${response.statusCode}");

      switch (response.statusCode) {
        case 200:
          try {
            responseJson = jsonDecode(response.body);
          } catch (e) {
            throw FormatException("Error parsing response body: $e");
          }
          break;
        case 403:
        // Log the response body to better understand the cause
          if (kDebugMode) {
            print("403 Forbidden - Response Body: ${response.body}");
          }
          throw ForbiddenAccessException("Access is forbidden: ${response.body}");
        case 500:
          throw InternalServerException();
        default:
          throw Exception("Unexpected error occurred: ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

    return responseJson;
  }









  @override
  Future LoginApi(String url, dynamic requestBody) async {
    if (kDebugMode) print("LOGIN REQUEST URL: $url\nBODY: $requestBody\n");
    dynamic responseJson;

    try {
      final headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(requestBody))
          .timeout(const Duration(seconds: 120));

      if (kDebugMode) print("LOGIN RESPONSE STATUS: ${response.statusCode}");

      switch (response.statusCode) {
        case 200:
          try {
            responseJson = jsonDecode(response.body);
          } catch (e) {
            throw FormatException("Error parsing response body: $e");
          }
          break;
        case 401:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
        default:
          throw Exception("Unexpected error occurred: ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

    if (kDebugMode) print("LOGIN RESPONSE BODY: $responseJson\n");
    return responseJson;
  }

  Future<bool> refreshTokenApi() async {
    final storage = GetStorage();

    try {
      final headers = {'Content-Type': 'application/json'};
      final user = LoginRes.fromJson(storage.read("USER_KEY"));
      final refreshTokenRequest = RefreshTokenRequest(refreshToken: user.refreshToken);

      final response = await http
          .post(Uri.parse(ApiUrl.postAppRefreshTokenPath), headers: headers, body: jsonEncode(refreshTokenRequest))
          .timeout(const Duration(seconds: 120));

      if (kDebugMode) print("REFRESH TOKEN RESPONSE STATUS: ${response.statusCode}");

      switch (response.statusCode) {
        case 200:
          final responseJson = LoginRes.fromJson(jsonDecode(response.body));
          await storage.write("USER_KEY", responseJson.toJson());
          return true;
        case 401:
          await storage.remove("USER_KEY");
          Get.offAllNamed(RouteName.postSplash);
          return false;
        case 500:
          throw InternalServerException();
        default:
          throw Exception("Unexpected error occurred: ${response.statusCode}");
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }

  }

}
class ForbiddenAccessException implements Exception {
  final String message;
  ForbiddenAccessException(this.message);

  @override
  String toString() => "ForbiddenAccessException: $message";
}