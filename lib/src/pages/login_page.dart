import 'package:exFinal_analiza_T/src/utils/Validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
          child: _LoginForm(),
        ),
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
    if (widget._formKey.currentState.validate()) {
      try {
        final creadentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        if (creadentials != null) {
          Navigator.of(context).pushReplacementNamed('test');
        }
        print('logged in');
      } catch (e) {
        print('[ERROR] ${e.message}');
      }
      // Navigator.pushNamed(context, 'test');
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
