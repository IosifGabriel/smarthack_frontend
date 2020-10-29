import 'package:flutter/material.dart';
import './todos.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
    this.todo, {
    this.onTap,
    Key key,
  }) : super(key: key);

  final Todo todo;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SmartText(todo.id),
              SizedBox(width: 20),
              SmartText(todo.text),
            ],
          ),
        ),
      ),
    );
  }
}
