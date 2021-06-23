import 'dart:async';

import 'package:exFinal_analiza_T/src/models/register_model.dart';
import 'package:exFinal_analiza_T/src/models/result_model.dart';
import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/API_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  GlobalKey<NavigatorState> navigationKey;

  ApplicationState() {
    init();
  }

  // Analysis ==========================

  bool isLoadingAnalysis = false;

  ResultModel currentAnalysis;

  // Registers ==============================

  bool isLoadingRegister = false;

  List<RegisterModel> registers;

  // User ===============================

  UserModel _loggedUser;

  bool isLoadingUser = false;

  UserModel get user => _loggedUser;

  StreamController<bool> _loggedInController =
      StreamController<bool>.broadcast();

  Stream<bool> get loginChanges => _loggedInController.stream;

  // ==========================================

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

  // USER ===============================

  Future<void> _fetchUser(User user) async {
    print('Updating user info');
    User firebaseUser = user;
    isLoadingUser = true;
    notifyListeners();
    _loggedUser = await UserProvider().getUserById(firebaseUser.uid);
    isLoadingUser = false;
    notifyListeners();
  }

  // REGISTERS =============================

  void uploadRegister(RegisterModel register) async {
    isLoadingRegister = true;
    notifyListeners();
    final success =
        await RegisterProvider().postRegister(register, _loggedUser.id);
    if (success) {
      fetchRegisters();
    }
    isLoadingRegister = false;
    notifyListeners();
  }

  void fetchRegisters() async {
    isLoadingRegister = true;
    notifyListeners();
    registers = await RegisterProvider().getRegistersByUserId(_loggedUser.id);
    isLoadingRegister = false;
    notifyListeners();
  }

  void cleanRegisters() async {
    isLoadingRegister = true;
    notifyListeners();
    final success = await RegisterProvider().deleteRegisters(_loggedUser.id);
    if (success) {
      fetchRegisters();
    }
  }

  // ANALYSIS ==================================

  Future<void> fetchAnalysis() async {
    isLoadingAnalysis = true;
    notifyListeners();
    currentAnalysis = await ResultProvider().getResultByUserId(_loggedUser.id);
    isLoadingAnalysis = false;
    notifyListeners();
  }

  // ===================================

  @override
  void dispose() {
    _loggedInController.close();
    super.dispose();
  }
}
