class Category {
  Category({
      this.slug, 
      this.name, 
      this.url,});

  Category.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }
  String? slug;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = slug;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}