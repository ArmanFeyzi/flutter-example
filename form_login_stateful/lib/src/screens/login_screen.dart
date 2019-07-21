import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 20.0)),
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
        return !value.contains('@') ? 'Not correct Email address' : null;
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
        return value.length < 6 ? 'Password must be at letest 6 character' : null;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        formKey.currentState.validate();
      },
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(7.0),
        child: const Text('Login', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
