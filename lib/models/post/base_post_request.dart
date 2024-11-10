class BasePostRequest {
  BasePostRequest({
      this.limit=10,
      this.page=0,
      this.userId=0,
      this.status="ACT",
      this.id=0,});

  BasePostRequest.fromJson(dynamic json) {
    limit = json['limit'];
    page = json['page'];
    userId = json['userId'];
    status = json['status'];
    id = json['id'];
  }
  int? limit;
  int? page;
  int? userId;
  String? status;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = limit;
    map['page'] = page;
    map['userId'] = userId;
    map['status'] = status;
    map['id'] = id;
    return map;
  }

}