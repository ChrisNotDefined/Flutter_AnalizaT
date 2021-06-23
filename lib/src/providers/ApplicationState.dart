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

  // ==========================================

  Future<void> init() async {
    navigationKey = new GlobalKey<NavigatorState>();
    print('Initializing provider');
    FirebaseAuth.instance.userChanges().listen((User user) async {
      print('User changed');
      isLoadingUser = true;
      notifyListeners();
      if (user == null) {
        print('No user');
        navigationKey.currentState
            ?.pushNamedAndRemoveUntil('login', (route) => false);
        _loggedUser = null;
        isLoadingUser = false;
        notifyListeners();
      } else {
        print('Has User');
        await _fetchUser(user.uid);
        navigationKey.currentState
            ?.pushNamedAndRemoveUntil('home', (route) => false);
      }
    });
  }

  // USER ===============================

  Future<void> _fetchUser(String uid) async {
    print('Updating user info');
    isLoadingUser = true;
    notifyListeners();
    _loggedUser = await UserProvider().getUserById(uid);
    isLoadingUser = false;
    notifyListeners();
  }

  Future<void> login({String email, String password}) async {
    isLoadingUser = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('logged in');
    } on FirebaseAuthException catch (authEx) {
      print('FIREBASE ERROR: ${authEx.code}');
      throw authEx;
    } catch (e) {
      print('[ERROR] ${e.message}');
      throw e;
    } finally {
      isLoadingUser = false;
      notifyListeners();
    }
  }

  Future<void> registerUser(UserModel user, String pass) async {
    isLoadingUser = true;
    notifyListeners();
    try {
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user.correo, password: pass);

      user.id = cred.user.uid;

      bool success = await UserProvider().postUser(user);

      if (success) {
        _fetchUser(cred.user.uid);
      }

      print('Something went wrong');
      isLoadingUser = false;
      notifyListeners();
    } on FirebaseAuthException catch (authEx) {
      print('Firebase error: ${authEx.code}');
      isLoadingUser = false;
      notifyListeners();
      throw authEx;
    } catch (e) {
      print(e);
      isLoadingUser = false;
      notifyListeners();
      throw e;
    }
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
    // isLoadingRegister = true;
    // notifyListeners();
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
    super.dispose();
  }
}
