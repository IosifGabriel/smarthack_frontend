import 'package:flutter/material.dart';

class SmartTextField extends StatefulWidget {
  SmartTextField({
    this.label,
    this.initialValue,
    this.keyboardType,
    Key key,
  }) : super(key: key);

  final String label;
  final String initialValue;
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
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
