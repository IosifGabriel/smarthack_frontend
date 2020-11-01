import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class DocumentTemplateService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  Map<String, String> headers;

  Future<Map<String, String>> _getheader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return headers = {
      'Authorization': prefs.getString('authToken'),
    };
  }

  Future<ApiResponse<List<DocumentTemplate>>> getDocumentTemplates() async {
    headers = await _getheader();
    return http.get('$api/documentTemplates', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
        final documents = <DocumentTemplate>[];
        for (var item in jsonData) {
          documents.add(DocumentTemplate.fromJson(item));
        }
        return ApiResponse<List<DocumentTemplate>>(
          data: documents,
        );
      }
      return ApiResponse<List<DocumentTemplate>>(
        error: true,
        errorCode: data.statusCode,
        errorMessage: 'An error occured',
      );
    }).catchError((error) {
      return ApiResponse<List<DocumentTemplate>>(
        error: true,
        errorMessage: 'An error occured',
      );
    });
  }
}
