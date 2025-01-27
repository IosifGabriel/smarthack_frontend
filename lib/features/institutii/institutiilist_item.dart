import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthack_frontend/models/institutii.dart';
import './institutii.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class InstitutiiListItem extends StatelessWidget {
  const InstitutiiListItem(
    this.institutie, {
    this.onTap,
    Key key,
  }) : super(key: key);

  final Institutii institutie;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                institutie.abreviation,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.building,
                      color: Colors.deepOrangeAccent),
                  Flexible(
                      child: Text(
                    institutie.name,
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
