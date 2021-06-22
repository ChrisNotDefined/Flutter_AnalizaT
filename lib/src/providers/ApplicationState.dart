import 'dart:async';

import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/API_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationState extends ChangeNotifier {
  BuildContext appContext;

  ApplicationState() {
    init();
  }

  GlobalKey<NavigatorState> navigationKey;

  UserModel _loggedUser;

  bool isLoadingUser = false;

  UserModel get user => _loggedUser;

  StreamController<bool> _loggedInController = StreamController<bool>.broadcast();

  Stream<bool> get loginChanges => _loggedInController.stream;

  Future<void> init() async {
    // _loggedInController.sink.add(FirebaseAuth.instance.currentUser != null);
    navigationKey = new GlobalKey<NavigatorState>();
    print('Initializing provider');
    FirebaseAuth.instance.userChanges().listen((user) async {
      print('Verifying');
      isLoadingUser = true;
      notifyListeners();
      if (user == null) {
        _loggedInController.sink.add(false);
        _loggedUser = null;
        notifyListeners();
      } else {
        await _fetchUser(user);
        _loggedInController.sink.add(true);
      }
    });
  }

  Future<void> _fetchUser(User user) async {
    print('Updating user info');
    User firebaseUser = user ?? FirebaseAuth.instance.currentUser;
    isLoadingUser = true;
    notifyListeners();
    _loggedUser = await UserProvider().getUserById(firebaseUser.uid);
    isLoadingUser = false;
    notifyListeners();
  }

  @override
  void dispose() { 
    _loggedInController.close();
    super.dispose();
  }
}
