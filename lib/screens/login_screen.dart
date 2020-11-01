import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/models/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthack_frontend/services/services.dart';
import '../components/components.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService get authService => GetIt.I.get<AuthService>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                    controller: emailController,
                    label: 'email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  SmartTextField(
                    controller: passwordController,
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
                    onPressed: () => _auth(context),
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

  Future<void> _auth(context) async {
    var _apiResponse =
        await authService.auth(emailController.text, passwordController.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!_apiResponse.error) {
      prefs.setString('authToken', _apiResponse.data.token);
      Navigator.pushNamed(context, '/');
    }
  }
}
