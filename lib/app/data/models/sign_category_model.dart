class SignCategory {
  String? image;
  String? name;
  String? id;
  String? description;

  SignCategory({this.image, this.name, this.id, this.description});

  SignCategory.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['id'] = id;
    data['description'] = description;
    return data;
  }
}
