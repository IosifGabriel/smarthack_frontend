class User {
  String name;
  String adresa;
  String telefon;
  String email;
  String cnp;

  User({this.name, this.adresa, this.telefon, this.email, this.cnp});

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      name: item['name'],
      adresa: item['adresa'],
      telefon: item['telefon'],
      email: item['email'],
      cnp: item['cnp'],
    );
  }
}
