import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smarthack_frontend/models/auth.dart';
import '../models/models.dart';

class AuthService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  static const headers = {"Content-Type": "application/json"};

  Future<ApiResponse<Auth>> auth(username, password) async {
    var body = jsonEncode(
        <String, String>{'username': username, 'password': password});
    return http
        .post('$api/users/authenticate', headers: headers, body: body)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final authdata = Auth.fromJson(jsonData);

        return ApiResponse<Auth>(
          data: authdata,
        );
      }
      return ApiResponse<Auth>(
        error: true,
        errorCode: data.statusCode,
        errorMessage: 'An error occured',
      );
    }).catchError((error) {
      return ApiResponse<Auth>(
        error: true,
        errorMessage: 'An error occured',
      );
    });
  }
}
