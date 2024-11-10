

class PostBaseResponse {
  PostBaseResponse({
      this.code, 
      this.message, 
      this.messageKh, 
      this.data,});

  PostBaseResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    messageKh = json['messageKh'];
    data = json["data"];
  }
  String? code;
  String? message;
  String? messageKh;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['messageKh'] = messageKh;
    map['data'] = data;
    return map;
  }

}