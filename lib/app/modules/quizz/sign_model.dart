class Sign {
  String? id;
  String? image;
  String? name;
  String? categoryId;
  String? categoryName;
  String? description;

  Sign(
      {this.id,
      this.image,
      this.name,
      this.description,
      this.categoryId,
      this.categoryName});

  Sign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['description'] = description;
    return data;
  }
}
