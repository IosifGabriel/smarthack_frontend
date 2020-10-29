import 'package:flutter/material.dart';
import './todos.dart';
import '../../models/models.dart';

class TodosList extends StatefulWidget {
  TodosList(
    this.todos, {
    Key key,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  _TodosListState createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      itemBuilder: (context, index) {
        return TodoListItem(
          widget.todos[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TodoDetails(widget.todos[index])),
            );
          },
        );
      },
    );
  }
}
