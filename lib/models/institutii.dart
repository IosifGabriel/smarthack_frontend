class Institutii {
  String abreviation;
  String address;
  String name;

  Institutii({this.abreviation, this.address, this.name});

  factory Institutii.fromJson(Map<String, dynamic> item) {
    return Institutii(
      abreviation: item['abreviation'],
      address: item['address'],
      name: item['name'],
    );
  }
}
