import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(context),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              InputComponent(text: 'Username'),
              SizedBox(height: 20),
              InputComponent(text: 'Password', isPassword: true),
              SizedBox(height: 20),
              InputComponent(
                text: 'Confirm Password',
                isPassword: true,
              ),
              SizedBox(height: 20),
              ButtonComponent(
                child: Text('Registrarse'),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
