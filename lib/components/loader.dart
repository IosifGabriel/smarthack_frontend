import 'package:flutter/material.dart';
import 'package:smarthack_frontend/components/components.dart';

class SmartLoader extends StatelessWidget {
  const SmartLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          SmartText('Loading..'),
        ],
      ),
    );
  }
}
