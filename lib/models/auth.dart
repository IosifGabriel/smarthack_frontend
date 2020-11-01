import 'package:smarthack_frontend/models/user.dart';

class Auth {
  String token;
  User user;

  Auth({this.token, this.user});

  factory Auth.fromJson(Map<String, dynamic> item) {
    return Auth(
      token: item['jwt'],
      // user: User.fromJson(item['user']),
    );
  }
}
