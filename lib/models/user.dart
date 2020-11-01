class User {
  int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String cnp;
  String role;
  String institution;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.cnp,
      this.role,
      this.institution});

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      id: item['id'],
      username: item['username'],
      firstName: item['firstName'],
      lastName: item['lastName'],
      email: item['email'],
      cnp: item['cnp'],
      role: item['role'],
      institution: item['cninstitutionp'],
    );
  }
}
