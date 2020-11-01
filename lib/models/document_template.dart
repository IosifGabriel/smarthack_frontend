class DocumentTemplate {
  int id;
  String name;

  DocumentTemplate({this.id, this.name});

  factory DocumentTemplate.fromJson(Map<String, dynamic> item) {
    return DocumentTemplate(
      id: item['id'],
      name: item['name'],
    );
  }
}
