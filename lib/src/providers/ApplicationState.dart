import 'dart:async';

import 'package:exFinal_analiza_T/src/models/register_model.dart';
import 'package:exFinal_analiza_T/src/models/result_model.dart';
import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/API_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  BuildContext appContext;

  ApplicationState() {
    init();
  }
  GlobalKey<NavigatorState> navigationKey;

  
  
  ResultModel currentAnalysis;
  
  List<RegisterModel> registers;

  
  
  
  UserModel _loggedUser;
  
  bool isLoadingUser = false;

  UserModel get user => _loggedUser;

  StreamController<bool> _loggedInController =
      StreamController<bool>.broadcast();

  Stream<bool> get loginChanges => _loggedInController.stream;



  Future<void> init() async {
    navigationKey = new GlobalKey<NavigatorState>();
    print('Initializing provider');
    FirebaseAuth.instance.userChanges().listen((User user) async {
      print('Verifying');
      isLoadingUser = true;
      notifyListeners();
      if (user == null) {
        _loggedInController.sink.add(false);
        _loggedUser = null;
        isLoadingUser = false;
        notifyListeners();
      } else {
        await _fetchUser(user);
        _loggedInController.sink.add(true);
      }
    });
  }




  Future<void> _fetchUser(User user) async {
    print('Updating user info');
    User firebaseUser = user;
    isLoadingUser = true;
    notifyListeners();
    _loggedUser = await UserProvider().getUserById(firebaseUser.uid);
    isLoadingUser = false;
    notifyListeners();
  }




  void uploadRegister(RegisterModel register) async {
    print('Prov reg:  $register');

    final success =
        await RegisterProvider().postRegister(register, _loggedUser.id);
    if (success) {
      fetchRegisters();
    }
  }

  void fetchRegisters() async {
    registers = await RegisterProvider().getRegistersByUserId(_loggedUser.id);
    notifyListeners();
  }





  Future<void> fetchAnalysis() async {
    currentAnalysis = await ResultProvider().getResultByUserId(_loggedUser.id);
    notifyListeners();
  }





  @override
  void dispose() {
    _loggedInController.close();
    super.dispose();
  }
}
