bool isValidEmail(String email) {
  final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return regExp.hasMatch(email);
}

String emailValidator(String email) {
  if (email == null || email.isEmpty) return 'The field is empty';
  if (!isValidEmail(email)) return 'Not a valid email';
  return null;
}

bool minLengthPass(String password ){
  return password.length > 6;
}

String passValidator(String password) {
  if (password.length < 6) return 'The password is too short';
  return null;
}
