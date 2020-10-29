import 'package:flutter/material.dart';
import 'todos.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class TodoCreate extends StatefulWidget {
  TodoCreate({
    Key key,
  }) : super(key: key);

  @override
  _TodoCreateState createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
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
                  SmartHeadline('Add Todo'),
                  SizedBox(height: 20),
                  SmartTextField(
                    label: 'text',
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SmartButton(
                icon: Icons.add,
                text: 'Create Todo',
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
