import 'package:flutter/material.dart';
import '../components/components.dart';

class AccountTab extends StatefulWidget {
  AccountTab({Key key}) : super(key: key);

  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SmartHeadline('Account'),
          SmartButton(
            icon: Icons.logout,
            text: 'Log out',
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
