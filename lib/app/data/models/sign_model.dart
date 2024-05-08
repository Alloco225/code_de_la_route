class Sign {
  String? image;
  String? name;
  String? categoryId;
  String? categoryName;
  String? level;
  String? description;

  Sign(
      {this.image,
      this.name,
      this.categoryId,
      this.categoryName,
      this.level,
      this.description});

  Sign.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    level = json['level'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['level'] = level;
    data['description'] = description;
    return data;
  }
}
