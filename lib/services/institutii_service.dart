import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class InstitutiiService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  Map<String, String> headers;

  Future<Map<String, String>> _getheader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return headers = {
      'Authorization': prefs.getString('authToken'),
    };
  }

  Future<ApiResponse<List<Institutii>>> getInstitutii() async {
    headers = await _getheader();
    return http.get('$api/institutions', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
        final listainstitutii = <Institutii>[];
        for (var item in jsonData) {
          listainstitutii.add(Institutii.fromJson(item));
        }
        return ApiResponse<List<Institutii>>(
          data: listainstitutii,
        );
      }
      return ApiResponse<List<Institutii>>(
        error: true,
        errorCode: data.statusCode,
        errorMessage: 'An error occured',
      );
    }).catchError((error) {
      return ApiResponse<List<Document>>(
        error: true,
        errorMessage: 'An error occured',
      );
    });
  }
}
