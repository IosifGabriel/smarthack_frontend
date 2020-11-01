import 'package:flutter/material.dart';

class SmartHeadline extends StatelessWidget {
  const SmartHeadline(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class SmartText extends StatelessWidget {
  const SmartText(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
