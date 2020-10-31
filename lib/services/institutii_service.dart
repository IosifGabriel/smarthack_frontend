import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class InstitutiiService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  static const headers = {
    'Authorization':
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmciLCJleHAiOjE2MDQyMTk0ODksImlhdCI6MTYwNDE4MzQ4OX0.HU-33F6tO9VhLrt8F6nJWk91ZO_WGpOuTUZ6GipTIKk',
  };

  Future<ApiResponse<List<Institutii>>> getInstitutii() async {
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
