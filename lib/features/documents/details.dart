import 'package:flutter/material.dart';
import 'package:smarthack_frontend/features/documents/pdfBase64Viewer.dart';
import 'documents.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class DocumentDetails extends StatefulWidget {
  DocumentDetails(
    this.document, {
    Key key,
  }) : super(key: key);

  final Document document;

  @override
  _DocumentDetailsState createState() => _DocumentDetailsState();
}

class _DocumentDetailsState extends State<DocumentDetails> {
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
                MaterialPageRoute(
                    builder: (context) => DocumentEdit(widget.document)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DocumentDelete(widget.document);
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: PdfBase64Viewer("zcz"),
        ),
      ),
    );
  }
}
