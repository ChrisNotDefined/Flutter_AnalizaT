import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/AdviceComponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputComponent(text: 'Username'),
              SizedBox(
                height: 20,
              ),
              InputComponent(
                text: 'Password',
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonComponent(
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, 'test');
                },
              ),
              ButtonComponent(
                child: Text('Register'),
                onPressed: () {
                  Navigator.pushNamed(context, 'register');
                },
              ),
            ],
          ),
        ));
  }
}
