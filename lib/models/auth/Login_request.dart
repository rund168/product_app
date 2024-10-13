class LoginRequest {
  LoginRequest({
      this.username, 
      this.password});

  LoginRequest.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
  }
  String? username;
  String? password;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;

    return map;
  }

}