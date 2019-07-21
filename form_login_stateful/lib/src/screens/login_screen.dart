import 'package:flutter/material.dart';
import '../mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidatorMixins{
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved:(String value){
        email = value;
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
      validator: validatePassword,
      onSaved:(String value){
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('user: $email and pass: $password');
        }
      },
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(7.0),
        child: const Text('Login', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
