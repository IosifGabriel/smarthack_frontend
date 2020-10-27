import 'package:flutter/material.dart';
import '../components/components.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SmartHeadline('Log in'),
              SmartButton(
                icon: Icons.login,
                text: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              SmartTextButton(
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
