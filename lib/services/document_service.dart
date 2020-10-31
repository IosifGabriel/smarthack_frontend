import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class DocumentService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  static const headers = {
    'Api-Key': 'DEV_KEY',
  };

  Future<ApiResponse<List<Document>>> getDocuments() async {
    return http.get('$api/documents').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
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
}
