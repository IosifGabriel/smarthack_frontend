class User {
  int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String cnp;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.cnp,
  });

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      id: item['id'],
      username: item['username'],
      firstName: item['firstName'],
      lastName: item['lastName'],
      email: item['email'],
      cnp: item['cnp'],
    );
  }
}
