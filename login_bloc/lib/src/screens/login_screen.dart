import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';


class LoginScreen extends StatelessWidget{
  Widget build(BuildContext context){
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          userField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 10.0),),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget userField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'User ID, Email',
            labelText: 'Username',
            errorText: snapshot.error,
          ),
        );
      }
    );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'Your Secret Password',
            labelText: 'Username',
          ),
        );
      }
    );
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitVlid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: const Text('Submit'),
          onPressed: snapshot.hasData ? bloc.submit : null
        );
      },
    );
  }

}