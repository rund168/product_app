import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:product_app/data/app_exceptions.dart';
import 'package:product_app/data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiServer {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print("GET REQUEST URL $url\n");
    }
    dynamic responseJson;
    try {
      var response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 120));
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 400:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
        default:
          throw Exception('Error occurred with status code: ${response.statusCode}');
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }
    if (kDebugMode) {
      print("GET RESPONSE BODY $responseJson\n");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic requestBody) async {
    if (kDebugMode) {
      print("POST REQUEST URL $url BODY: $requestBody\n");
    }
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(requestBody)) // Encode the request body
          .timeout(const Duration(seconds: 120));
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 400:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
        default:
          throw Exception('Error occurred with status code: ${response.statusCode}');
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }
    if (kDebugMode) {
      print("POST RESPONSE BODY $responseJson\n");
    }
    return responseJson;
  }

  @override
  Future<dynamic> LoginApi(String url, dynamic requestBody) async {
    if (kDebugMode) {
      print("POST LOGIN REQUEST URL: $url\nBODY: $requestBody\n");
    }
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(requestBody)) // Encode the request body
          .timeout(const Duration(seconds: 120));
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 400:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
        default:
          throw Exception('Error occurred with status code: ${response.statusCode}');
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }
    if (kDebugMode) {
      print("POST LOGIN RESPONSE BODY $responseJson\n");
    }
    return responseJson;
  }
}
