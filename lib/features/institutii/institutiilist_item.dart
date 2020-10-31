import 'package:flutter/material.dart';
import 'package:smarthack_frontend/models/institutii.dart';
import './institutii.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class InstitutiiListItem extends StatelessWidget {
  const InstitutiiListItem(
    this.document, {
    this.onTap,
    Key key,
  }) : super(key: key);

  final Institutii document;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white24))),
                child: Icon(Icons.autorenew, color: Colors.white),
              ),
              title: Text(
                document.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                  Flexible(
                      child: Text(
                    document.description,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      ),
    );
  }
}
