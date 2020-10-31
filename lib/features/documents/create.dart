import 'package:flutter/material.dart';
import 'documents.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class DocumentCreate extends StatefulWidget {
  DocumentCreate({
    Key key,
  }) : super(key: key);

  @override
  _DocumentCreateState createState() => _DocumentCreateState();
}

class _DocumentCreateState extends State<DocumentCreate> {
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
                  SmartHeadline('Add Document'),
                  SizedBox(height: 20),
                  SmartTextField(
                    label: 'text',
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SmartButton(
                icon: Icons.add,
                text: 'Create Document',
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
