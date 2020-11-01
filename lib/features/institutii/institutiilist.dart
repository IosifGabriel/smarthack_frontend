import 'package:flutter/material.dart';
import 'institutii.dart';
import '../../models/models.dart';

class InstitutiisList extends StatefulWidget {
  InstitutiisList(
    this.institutii, {
    Key key,
  }) : super(key: key);

  final List<Institutii> institutii;

  @override
  _InstitutiisListState createState() => _InstitutiisListState();
}

class _InstitutiisListState extends State<InstitutiisList> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children: [
      ListView.builder(
        itemCount: widget.institutii.length,
        itemBuilder: (context, index) {
          return InstitutiiListItem(
            widget.institutii[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        InstitutiiDetails(widget.institutii[index])),
              );
            },
          );
        },
      )
    ]);
  }
}
