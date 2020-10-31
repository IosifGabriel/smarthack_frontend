import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class DocumentService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  static const headers = {
    'Authorization':
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmciLCJleHAiOjE2MDQyMDQ1NTUsImlhdCI6MTYwNDE2ODU1NX0.UXUjHrxjKgZnB0w5YiDE8f19LvuyeuEyX2mgMENduAQ',
  };

  Future<ApiResponse<List<Document>>> getDocuments() async {
    return http.get('$api/documents').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
        final documents = <Document>[];
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
    return http.get('$api/getB64String', headers: headers).then((data) {
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