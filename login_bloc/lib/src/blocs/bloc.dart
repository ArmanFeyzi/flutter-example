import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validate{
  final _emailStream = StreamController<String>.broadcast();
  final _passwordStream = StreamController<String>.broadcast();

  Function(String) get changeEmail => _emailStream.sink.add;
  Function(String) get changePassword => _passwordStream.sink.add;

  Stream<String> get email => _emailStream.stream.transform(validateEmail);
  Stream<String> get password => _passwordStream.stream.transform(validatePassword);
  Stream<bool> get submitVlid => Observable.combineLatest2(email, password, (e, p) => true);
  // Stream<bool> get submitValid => Observable.

  dispose(){
    _emailStream.close();
    _passwordStream.close();
  }
}