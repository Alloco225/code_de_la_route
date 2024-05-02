class Sign {
  String? image;
  String? name;
  String? description;

  Sign({this.image, this.name, this.description});

  Sign.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
