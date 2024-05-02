class QuizzCategory {
  late String name;
  late String id;
  String? image;

  QuizzCategory({required this.name, required this.id, this.image});

  QuizzCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
    QuizzCategory(id: id, image: image, name: name);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
