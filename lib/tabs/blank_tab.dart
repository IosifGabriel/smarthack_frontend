import 'package:flutter/material.dart';
import '../components/components.dart';

class BlankTab extends StatefulWidget {
  BlankTab({Key key}) : super(key: key);

  @override
  _BlankTabState createState() => _BlankTabState();
}

class _BlankTabState extends State<BlankTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SmartHeadline('Blank'),
        ],
      ),
    );
  }
}
