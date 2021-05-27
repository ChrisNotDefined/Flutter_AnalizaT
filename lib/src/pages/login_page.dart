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
          height: 600,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputComponent(text: 'Username'),
              SizedBox(height: 20),
              InputComponent(
                text: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                height: 50.0,
                width: 160.0,
                child: ButtonComponent(
                  child: Text('Login', style: TextStyle(fontSize: 25.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'test');
                  },
                ),
              ),
              Container(
                height: 50.0,
                width: 160.0,
                child: ButtonComponent(
                  child: Text('Register', style: TextStyle(fontSize: 25.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
