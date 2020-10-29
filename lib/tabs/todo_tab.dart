import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../services/services.dart';

class TodoTab extends StatefulWidget {
  TodoTab({Key key}) : super(key: key);

  @override
  _TodoTabState createState() => _TodoTabState();
}

class _TodoTabState extends State<TodoTab> {
  TodoService get todoService => GetIt.I.get<TodoService>();

  bool _isLoading = true;
  ApiResponse<List<Todo>> _apiResponse;

  @override
  void initState() {
    _fetchTodos();
    super.initState();
  }

  void _fetchTodos() async {
    setState(() => _isLoading = true);

    _apiResponse = await todoService.getTodos();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SmartHeadline('Todos'),
          Expanded(
            child: Builder(builder: (_) {
              if (_isLoading) return SmartLoader();
              if (_apiResponse.error)
                return SmartError(
                  message: _apiResponse.errorMessage,
                  errorCode: _apiResponse.errorCode,
                );

              return Text('working');
            }),
          ),
        ],
      ),
    );
  }
}
