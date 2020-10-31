import 'package:flutter/material.dart';
import 'documents.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class DocumentEdit extends StatefulWidget {
  DocumentEdit(
    this.document, {
    Key key,
  }) : super(key: key);

  final Document document;

  @override
  _DocumentEditState createState() => _DocumentEditState();
}

class _DocumentEditState extends State<DocumentEdit> {
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
                  SmartHeadline('Edit Document'),
                  SizedBox(height: 20),
                  SmartTextField(
                    label: 'text',
                    initialValue: widget.document.name,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SmartButton(
                icon: Icons.save_outlined,
                text: 'Save Document',
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
