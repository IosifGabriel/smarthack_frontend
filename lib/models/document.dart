import 'dart:convert';

class Document {
  String id;
  String name;
  String description;
  Base64Codec data;

  Document({this.id, this.name, this.description, this.data});

  factory Document.fromJson(Map<String, dynamic> item) {
    return Document(
      id: item['id'],
      name: item['name'],
      description: item['description'],
      data: item['data'],
    );
  }
}
