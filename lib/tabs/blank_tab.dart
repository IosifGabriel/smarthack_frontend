import 'package:flutter/material.dart';
import '../components/components.dart';

class BlankTab extends StatefulWidget {
  BlankTab({Key key}) : super(key: key);

  @override
  _BlankTabState createState() => _BlankTabState();
}

class _BlankTabState extends State<BlankTab> {
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? SmartLoader()
        : Padding(
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
