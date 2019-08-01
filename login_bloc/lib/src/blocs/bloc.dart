import 'dart:async';

class Bloc{
  final _emailStream = StreamController<String>();
  final _passwordStream = StreamController<String>();

  Function(String) get changeEmail => _emailStream.sink.add;
  Function(String) get changePassword => _passwordStream.sink.add;

  Stream<String> get email => _emailStream.stream;
  Stream<String> get password => _passwordStream.stream;
}