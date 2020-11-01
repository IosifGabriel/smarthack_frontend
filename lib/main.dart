import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/services/documentTemplate_service.dart';
import './services/services.dart';
import './screens/screens.dart';

void setupLocator() {
  GetIt.I.registerSingleton<DocumentService>(DocumentService());
  GetIt.I.registerSingleton<InstitutiiService>(InstitutiiService());
  GetIt.I.registerSingleton<AuthService>(AuthService());
  GetIt.I.registerSingleton<DocumentTemplateService>(DocumentTemplateService());
  GetIt.I.registerSingleton<AccountService>(AccountService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smarthack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/': (context) => HomeScreen(),
        '/account': (context) => AccountScreen(),
      },
      initialRoute: '/login',
    );
  }
}
