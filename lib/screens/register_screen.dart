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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SmartHeadline('Register'),
              Column(
                children: [
                  SmartTextField(
                    label: 'name',
                  ),
                  SizedBox(height: 20),
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
