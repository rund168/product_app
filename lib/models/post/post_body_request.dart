class PostBodyRequest {
  PostBodyRequest({
      this.limit=15,
      this.page=0,
      this.userId=0,
      this.status='ACT',
      this.id=0,
      this.categoryId=0,});

  PostBodyRequest.fromJson(dynamic json) {
    limit = json['limit'];
    page = json['page'];
    userId = json['userId'];
    status = json['status'];
    id = json['id'];
    categoryId = json['categoryId'];
  }
  int? limit;
  int? page;
  int? userId;
  String? status;
  int? id;
  int? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = limit;
    map['page'] = page;
    map['userId'] = userId;
    map['status'] = status;
    map['id'] = id;
    map['categoryId'] = categoryId;
    return map;
  }

}