const Map<String, String> _errorCodes = {
  "invalid-email": "El correo ingresado no es válido",
  "user-disabled": "El usuario no está disponible",
  "user-not-found": "El usuario no fué encontrado",
  "wrong-password": "Las credenciales no son correctas",
  "email-already-in-use": "Este correo ya está en uso",
  "operation-not-allowed": "Accíon negada por el servidor",
  "weak-password": "La contraseña es muy débil, escriba una com más carateres",
};

String getErrorInfoFromCode(String code) {
  return _errorCodes[code] ?? 'Error desconocido: $code';
}
