import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget{
  final bloc = new Bloc();
  

  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          userField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 10.0),),
          submitButton()
        ],
      ),
    );
  }

  Widget userField(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'User ID, Email',
        labelText: 'Username',
        errorText: 'invalid username'
      ),
    );
  }

  Widget passwordField(){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Your Secret Password',
        labelText: 'Username',
        errorText: 'wrong password'
      ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      onPressed: () {},
      child: const Text('Enabled Button'),
    );
  }
}