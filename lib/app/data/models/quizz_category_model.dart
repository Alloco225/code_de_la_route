class QuizzCategory {
  String? name;
  String? id;
  String? image;

  QuizzCategory({this.name, this.id, this.image});

  QuizzCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
