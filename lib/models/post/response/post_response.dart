import 'package:product_app/models/post/post_category.dart';

import 'user.dart';

class PostResponse {
  PostResponse({
      this.createAt, 
      this.createBy, 
      this.updateAt, 
      this.updateBy, 
      this.id, 
      this.title, 
      this.description, 
      this.totalView, 
      this.status, 
      this.image, 
      this.category, 
      this.user,});

  PostResponse.fromJson(dynamic json) {
    createAt = json['createAt'];
    createBy = json['createBy'];
    updateAt = json['updateAt'];
    updateBy = json['updateBy'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    totalView = json['totalView'];
    status = json['status'];
    image = json['image'];
    category = json['category'] != null ? PostCategory.fromJson(json['category']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? createAt;
  String? createBy;
  dynamic updateAt;
  dynamic updateBy;
  int? id;
  String? title;
  String? description;
  int? totalView;
  String? status;
  String? image;
  PostCategory? category;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createAt'] = createAt;
    map['createBy'] = createBy;
    map['updateAt'] = updateAt;
    map['updateBy'] = updateBy;
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['totalView'] = totalView;
    map['status'] = status;
    map['image'] = image;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}