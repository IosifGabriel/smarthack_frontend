import 'package:flutter/material.dart';

Widget infoTile(IconData icon, String property, String value) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    leading: Icon(icon),
    title: Text(
      property,
      style: TextStyle(color: Colors.white60, fontSize: 15.0),
    ),
    subtitle: Text(
      value,
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
  );
}
