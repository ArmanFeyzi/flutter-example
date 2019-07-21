import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

@override
class App extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Form - Login - Stateful',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}