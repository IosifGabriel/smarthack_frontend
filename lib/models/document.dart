class Document {
  int id;
  String name;
  String releaseDate;
  String expirationDate;
  String documentBlob;

  Document({
    this.id,
    this.name,
    this.releaseDate,
    this.expirationDate,
    this.documentBlob,
  });

  factory Document.fromJson(Map<String, dynamic> item) {
    return Document(
      id: item['id'],
      name: item['name'],
      releaseDate: item['releaseDate'],
      expirationDate: item['expirationDate'],
      documentBlob: item['documentBlob'],
    );
  }
}
