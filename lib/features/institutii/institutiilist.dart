import 'package:flutter/material.dart';
import 'institutii.dart';
import '../../models/models.dart';

class InstitutiisList extends StatefulWidget {
  InstitutiisList(
    this.documents, {
    Key key,
  }) : super(key: key);

  final List<Institutii> documents;

  @override
  _InstitutiisListState createState() => _InstitutiisListState();
}

class _InstitutiisListState extends State<InstitutiisList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.documents.length,
      itemBuilder: (context, index) {
        return InstitutiiListItem(
          widget.documents[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InstitutiiDetails(widget.documents[index])),
            );
          },
        );
      },
    );
  }
}
