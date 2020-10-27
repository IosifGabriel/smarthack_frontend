import 'package:flutter/material.dart';
import '../components/components.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              SmartHeadline('Register'),
              SmartButton(
                icon: Icons.login,
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              SmartTextButton(
                text: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
