import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    print('init');
    init();
  }

  User _loggedUser;

  bool get isLoggedIn => _loggedUser != null;

  User get user => _loggedUser;

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      _loggedUser = user;
      notifyListeners();
    });
  }
}
