import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import './services/services.dart';
import './screens/screens.dart';

void setupLocator() {
  GetIt.I.registerSingleton<TodoService>(TodoService());
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
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/': (context) => HomeScreen(),
      },
      initialRoute: '/login',
    );
  }
}
