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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SizedBox(height: 150),
                  SmartHeadline('Log in'),
                  SizedBox(height: 80),
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
              SizedBox(
                width: 360,
                child: RaisedButton(
                  color: Color.fromRGBO(255, 109, 64, 0.5),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                  padding: EdgeInsets.all(20),
                  child: Text("Conecteaza-te la portofelul tau electornic"),
                  onPressed: () => _auth(context),
                ),
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
