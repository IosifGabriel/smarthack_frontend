import 'package:flutter/material.dart';
import '../components/components.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SmartAvatar('PI'),
                  SizedBox(height: 20),
                  SmartHeadline('Popescu Ion'),
                ],
              ),
              SizedBox(height: 20),
              SmartText('email'),
              SmartText('CNP'),
            ],
          ),
        ),
      ),
    );
  }
}
