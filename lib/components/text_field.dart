import 'dart:async';

import 'package:flutter/material.dart';

class SmartTextField extends StatefulWidget {
  SmartTextField({
    this.label,
    this.initialValue,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    Key key,
  }) : super(key: key);

  final String label;
  final String initialValue;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  _SmartTextFieldState createState() => _SmartTextFieldState();
}

class _SmartTextFieldState extends State<SmartTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
        hintStyle: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
        alignLabelWithHint: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
