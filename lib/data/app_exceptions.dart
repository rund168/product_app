class AppException implements Exception {
  final _message;
  final _prifex;

  AppException([this._prifex, this._message]);

  @override
  String toString() {
    return "$_prifex$_message";
  }
}

class NoInternetConnectionException extends AppException {
  NoInternetConnectionException([String? message])
      : super(message, "No internet connection");
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
      : super(message, "Request time out");
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, "Internal server error");
}

class UnAuthorization extends AppException {
  UnAuthorization([String? message])
      : super(message, "Your username and password incorrect!");
}
