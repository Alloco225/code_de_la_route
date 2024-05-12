class Sign {
  String? id;
  String? image;
  String? name;
  String? categoryId;
  String? categoryName;
  String? level;
  String? description;

  Sign(
      {this.image,
      this.id,
      this.name,
      this.categoryId,
      this.categoryName,
      this.level,
      this.description});

  String get imageUrl {
    if (image == null || image == "" || image == ".jpg") {
      return 'assets/images/favicon.png';
      return "assets/images/categories/$categoryId.png";
    }
    return "assets/images/signalisation/$categoryId/$image";
  }

  Sign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    level = json['level'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['level'] = level;
    data['description'] = description;
    return data;
  }
}
