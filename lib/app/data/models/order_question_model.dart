class OrderQuestion {
  String? categoryId;
  String? question;
  String? type;
  String? image;
  String? correctOrder;

  OrderQuestion(
      {this.categoryId,
      this.question,
      this.type,
      this.image,
      this.correctOrder});

  OrderQuestion.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    question = json['question'];
    type = json['type'];
    image = json['image'];
    correctOrder = json['correctOrder'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['question'] = question;
    data['type'] = type;
    data['image'] = image;
    data['correctOrder'] = correctOrder;
    return data;
  }
}
