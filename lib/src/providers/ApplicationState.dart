import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  BuildContext appContext;

  ApplicationState(BuildContext context) {
    print('init');
    init(context);
  }

  User _loggedUser;

  bool get isLoggedIn => _loggedUser != null;

  User get user => _loggedUser;

  Future<void> init(BuildContext context) async {
    FirebaseAuth.instance.userChanges().listen((user) {
      _loggedUser = user;
      if (user == null)
        Navigator.of(context)
            .pushNamedAndRemoveUntil("login", (route) => false);
      else
        Navigator.of(context)
            .pushNamedAndRemoveUntil("test", (route) => false);
      notifyListeners();
    });
  }
}
