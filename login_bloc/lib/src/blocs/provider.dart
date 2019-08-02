import 'package:flutter/material.dart';
import 'bloc.dart';


class Provider extends InheritedWidget {
  final bloc = new Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  static Bloc of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

  bool updateShouldNotify(_) => true;
}