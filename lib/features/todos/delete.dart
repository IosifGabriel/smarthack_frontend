import 'package:flutter/material.dart';
import 'todos.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class TodoDelete extends StatefulWidget {
  TodoDelete(
    this.todo, {
    Key key,
  }) : super(key: key);

  final Todo todo;

  @override
  _TodoDeleteState createState() => _TodoDeleteState();
}

class _TodoDeleteState extends State<TodoDelete> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmartText(
                'Are you sure you want to delete "${widget.todo.text}"?',
              ),
              SmartButton(
                icon: Icons.delete,
                text: 'Delete',
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
