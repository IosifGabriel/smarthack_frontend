import 'package:flutter/material.dart';
import '../components/components.dart';
import '../components/infotile.dart';
import '../models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class User {
  String name = 'Popescu Ion';
  String telefon = '0766445566';
  String email = "popescuion@yahoo.com";

  Point(String name, String telefon, String email) {
    this.name = name;
    this.telefon = telefon;
    this.email = email;
  }
}

class _HomeTabState extends State<HomeTab> {
  User user = new User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          Text(
            "Detaliile mele",
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Column(children: [
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              infoTile(FontAwesomeIcons.idCard, 'Name', user.name),
              Divider(
                height: 0.0,
                indent: 72.0,
              ),
              infoTile(FontAwesomeIcons.houseUser, 'Address',
                  '10 Downing Street, London, United Kingdom'),
              Divider(height: 0.0, indent: 72.0),
              infoTile(FontAwesomeIcons.phone, 'Telefon', user.telefon),
              Divider(height: 0.0, indent: 72.0),
              infoTile(FontAwesomeIcons.mailBulk, "Email", user.email),
            ]),
          ),
        ],
      ),
    );
  }
}
