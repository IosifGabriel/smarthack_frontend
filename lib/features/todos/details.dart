import 'package:flutter/material.dart';
import './todos.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class TodoDetails extends StatefulWidget {
  TodoDetails(
    this.todo, {
    Key key,
  }) : super(key: key);

  final Todo todo;

  @override
  _TodoDetailsState createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoEdit(widget.todo)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TodoDelete(widget.todo);
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SmartHeadline(widget.todo.text),
            ],
          ),
        ),
      ),
    );
  }
}
