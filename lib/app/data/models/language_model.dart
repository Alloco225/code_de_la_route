class Language {
  String? name;
  String? id;
  String? locale;
  String? emoji;

  Language({this.name, this.id, this.locale, this.emoji});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    locale = json['locale'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['locale'] = locale;
    data['emoji'] = emoji;
    return data;
  }
}
