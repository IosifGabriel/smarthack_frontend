import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class AccountService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  Map<String, String> headers;

  Future<Map<String, String>> _getheader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return headers = {
      'Authorization': prefs.getString('authToken'),
    };
  }

  Future<ApiResponse<User>> getUser() async {
    headers = await _getheader();
    return http.get('$api/users/account', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final userdata = User.fromJson(jsonData);

        return ApiResponse<User>(
          data: userdata,
        );
      }
      return ApiResponse<User>(
        error: true,
        errorCode: data.statusCode,
        errorMessage: 'An error occured',
      );
    }).catchError((error) {
      return ApiResponse<User>(
        error: true,
        errorMessage: 'An error occured',
      );
    });
  }
}
