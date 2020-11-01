class DocumentTemplate {
  int id;
  String name;
  List<String> fields = [];

  DocumentTemplate({this.id, this.name, this.fields});

  factory DocumentTemplate.fromJson(Map<String, dynamic> item) {
    return DocumentTemplate(
      id: item['id'],
      name: item['name'],
      fields: item['fields'],
    );
  }
}
