class LoginResponse {
  LoginResponse({
      this.accessToken, 
      this.refreshToken, 
      this.id, 
      this.username, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.gender, 
      this.image,});

  LoginResponse.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
  }
  String? accessToken;
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['image'] = image;
    return map;
  }

}