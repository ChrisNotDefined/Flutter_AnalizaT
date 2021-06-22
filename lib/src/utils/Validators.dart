bool isValidEmail(String email) {
  final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return regExp.hasMatch(email);
}

String emailValidator(String email) {
  String emptyMessage = isFieldEmpty(email);
  if (emptyMessage != null) return emptyMessage;
  if (!isValidEmail(email)) return 'Not a valid email';
  return null;
}

// bool minLengthPass(String password) {
//   return password.length > 6;
// }

String passValidator(String password) {
  String emptyMessage = isFieldEmpty(password);
  if (emptyMessage != null) return emptyMessage;
  if (password.length < 6) return 'The password is too short';
  return null;
}

String isFieldEmpty(String field) {
  if (field.isEmpty) return 'Favor de llenar el campo';
  return null;
}

String isValidDouble(String text) {
  if (text.isEmpty) return 'Favor de llenar el campo';
  if (double.tryParse(text) == null) return 'Inserta un níumero válido';

  return null;
}
