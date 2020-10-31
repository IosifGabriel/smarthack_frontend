class Institutii {
  String id;
  String name;
  String description;

  Institutii({this.id, this.name, this.description});

  factory Institutii.fromJson(Map<String, dynamic> item) {
    return Institutii(
      id: item['id'],
      name: item['name'],
      description: item['description'],
    );
  }
}
