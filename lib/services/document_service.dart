import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthack_frontend/services/services.dart';
import '../models/models.dart';

class DocumentService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  Map<String, String> headers;

  Future<Map<String, String>> _getheader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return headers = {
      "Content-Type": "application/json",
      'Authorization': prefs.getString('authToken'),
    };
  }

  Future<ApiResponse<List<Document>>> getDocuments() async {
    headers = await _getheader();
    return http.get('$api/document', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
        final documents = <Document>[initialDocument];
        for (var item in jsonData) {
          documents.add(Document.fromJson(item));
        }
        return ApiResponse<List<Document>>(
          data: documents,
        );
      }
      return ApiResponse<List<Document>>(
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

  Future<ApiResponse<String>> getPDF() async {
    return http.get('$api/users/getB64String', headers: headers).then((data) {
      if (data.statusCode == 200) {
        return ApiResponse<String>(
          data: data.body,
        );
      }
      return ApiResponse<String>(
        error: true,
        errorCode: data.statusCode,
        errorMessage: 'An error occured',
      );
    }).catchError((error) {
      return ApiResponse<String>(
        error: true,
        errorMessage: 'An error occured',
      );
    });
  }
}
