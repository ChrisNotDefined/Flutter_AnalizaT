import 'package:exFinal_analiza_T/src/components/AlertComponent.dart';
import 'package:exFinal_analiza_T/src/components/LoadingIndicatorComponent.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:exFinal_analiza_T/src/utils/Validators.dart';
import 'package:exFinal_analiza_T/src/utils/authErrorMessages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<ApplicationState>(context).isLoadingUser;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: _LoginForm(),
            ),
          ),
          isLoading ? LoadingIndicator() : Container(),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  _LoginForm({
    Key key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  String _email;
  String _password;

  Future<void> handleLogin(BuildContext context) async {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    if (widget._formKey.currentState.validate()) {
      try {
        await Provider.of<ApplicationState>(context, listen: false)
            .login(email: _email, password: _password);
        print('logged in');
      } on FirebaseAuthException catch (authEx) {
        AlertComponent(
          title: 'Error',
          message: getErrorInfoFromCode(authEx.code),
          actions: {'OK': () => Navigator.of(context).pop()},
        ).show(context);
      } catch (e) {
        print('[ERROR] ${e.message}');
      }
    }
  }

  void handleRegister(BuildContext context) =>
      Navigator.of(context).pushNamed('register');

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 50.0,
      width: 160.0,
      child: ButtonComponent(
        child: Text('Login', style: TextStyle(fontSize: 25.0)),
        onPressed: () => handleLogin(context),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      height: 50.0,
      width: 160.0,
      child: ButtonComponent(
        child: Text('Register', style: TextStyle(fontSize: 25.0)),
        onPressed: () => handleRegister(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Inicia Sesión',
            style: TextStyle(
              fontSize: 30.0,
              color: MyColors.accentColor,
            ),
          ),
          SizedBox(height: 30),
          InputComponent(
            label: 'E-mail',
            validator: emailValidator,
            keyBoardType: TextInputType.emailAddress,
            onChange: (value) => setState(() {
              this._email = value;
            }),
          ),
          SizedBox(height: 20),
          InputComponent(
            label: 'Password',
            isPassword: true,
            validator: passValidator,
            onChange: (value) => setState(() {
              this._password = value;
            }),
          ),
          SizedBox(height: 20),
          _loginButton(),
          _registerButton()
        ],
      ),
    );
  }
}
