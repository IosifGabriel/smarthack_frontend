import 'package:flutter/material.dart';
import 'todos.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class TodoEdit extends StatefulWidget {
  TodoEdit(
    this.todo, {
    Key key,
  }) : super(key: key);

  final Todo todo;

  @override
  _TodoEditState createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SmartHeadline('Edit Todo'),
                  SizedBox(height: 20),
                  SmartTextField(
                    label: 'text',
                    initialValue: widget.todo.text,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SmartButton(
                icon: Icons.save_outlined,
                text: 'Save Todo',
                onPressed: () {
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
