import 'package:flutter/material.dart';
import 'documents.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class DocumentDelete extends StatefulWidget {
  DocumentDelete(
    this.document, {
    Key key,
  }) : super(key: key);

  final Document document;

  @override
  _DocumentDeleteState createState() => _DocumentDeleteState();
}

class _DocumentDeleteState extends State<DocumentDelete> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Doriti sa stergeti documentul "${widget.document.name}"?',
              ),
              SmartButton(
                icon: Icons.delete,
                text: 'Sterge',
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
