class Document {
  String id;
  String name;

  Document({this.id, this.name});

  factory Document.fromJson(Map<String, dynamic> item) {
    return Document(
      id: item['id'],
      name: item['name'],
    );
  }
}
