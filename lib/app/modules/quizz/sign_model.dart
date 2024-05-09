class Sign {
  String? id;
  String? image;
  String? name;
  String? description;

  Sign({this.id, this.image, this.name, this.description});

  Sign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
