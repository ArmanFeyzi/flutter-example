import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18.0),
      child: Form(
        child: Column(
          children: [
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'yourmail@gmail.com',
        labelText: 'Username / Email',
      ),
      validator: (String value) {
        return value.contains('@') ? 'Do not use the @ char.' : null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'your secret password',
        labelText: 'Password',
      ),
      validator: (String value) {
        return value.contains('1') ? 'Do not use the 1 char.' : null;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {},
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(7.0),
        child: const Text('ورود به برنامه', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
