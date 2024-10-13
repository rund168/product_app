class Dimensions {
  Dimensions({
      this.width, 
      this.height, 
      this.depth,});

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  dynamic width;
  dynamic height;
  dynamic depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

}