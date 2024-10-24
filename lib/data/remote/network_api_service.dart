import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:product_app/data/app_exceptions.dart';
import 'package:product_app/data/remote/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiServer {
  @override
  Future getApi(String url) async {
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
  Future postApi(String url, requestBody) async {
    if (kDebugMode) {
      print("GET REQUEST URL $url BODY: $requestBody\n");
    }
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url),
              headers: {
                "Context-Type": "application/json",
              },
              body: requestBody)
          .timeout(const Duration(seconds: 120));
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 400:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
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
  Future LoginApi(String url, requestBody) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 120));
      switch (response.statusCode) {
        case 200:
          responseJson = jsonDecode(response.body);
          break;
        case 401:
          throw UnAuthorization();
        case 500:
          throw InternalServerException();
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }

    return responseJson;
  }
}
