import 'dart:async';
import 'validators.dart';

class Bloc extends validate{
  final _emailStream = StreamController<String>();
  final _passwordStream = StreamController<String>();

  Function(String) get changeEmail => _emailStream.sink.add;
  Function(String) get changePassword => _passwordStream.sink.add;

  Stream<String> get email => _emailStream.stream.transform(validateEmail);
  Stream<String> get password => _passwordStream.stream.transform(validatePassword);
}