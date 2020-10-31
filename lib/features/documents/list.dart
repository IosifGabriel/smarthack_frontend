import 'package:flutter/material.dart';
import 'documents.dart';
import '../../models/models.dart';

class DocumentsList extends StatefulWidget {
  DocumentsList(
    this.documents, {
    Key key,
  }) : super(key: key);

  final List<Document> documents;

  @override
  _DocumentsListState createState() => _DocumentsListState();
}

class _DocumentsListState extends State<DocumentsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.documents.length,
      itemBuilder: (context, index) {
        return DocumentListItem(
          widget.documents[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DocumentDetails(widget.documents[index])),
            );
          },
        );
      },
    );
  }
}
