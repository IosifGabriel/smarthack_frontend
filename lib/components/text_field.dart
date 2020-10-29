import 'package:flutter/material.dart';

class SmartTextField extends StatefulWidget {
  SmartTextField({
    this.label,
    this.initialValue,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    Key key,
  }) : super(key: key);

  final String label;
  final String initialValue;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  _SmartTextFieldState createState() => _SmartTextFieldState();
}

class _SmartTextFieldState extends State<SmartTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
