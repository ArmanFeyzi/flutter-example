class ValidatorMixins {

  String validateEmail(String value) {
    return !value.contains('@') ? 'Not correct Email address' : null;
  }

  String validatePassword(String value) {
    return value.length < 6 ? 'Password must be at letest 6 character' : null;
  }

}
