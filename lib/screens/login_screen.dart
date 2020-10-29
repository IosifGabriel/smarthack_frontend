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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SmartHeadline('Log in'),
              Column(
                children: [
                  SmartTextField(
                    label: 'email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  SmartTextField(
                    label: 'password',
                    isPassword: true,
                  ),
                ],
              ),
              Column(
                children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
