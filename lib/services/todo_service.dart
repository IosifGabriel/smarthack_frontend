import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class TodoService {
  static const api = 'https://smarthack-backend.herokuapp.com';
  static const headers = {
    'Api-Key': 'DEV_KEY',
  };

  Future<ApiResponse<List<Todo>>> getTodos() async {
    return http.get('$api/todos').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final todos = <Todo>[];
        for (var item in jsonData) {
          todos.add(Todo.fromJson(item));
        }
        return ApiResponse<List<Todo>>(
          data: todos,
        );
      }
      return ApiResponse<List<Todo>>(
        error: true,
        errorCode: data.statusCode,
        errorMessage: 'An error occured',
      );
    }).catchError((error) {
      return ApiResponse<List<Todo>>(
        error: true,
        errorMessage: 'An error occured',
      );
    });
  }
}
