import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String text;
  final bool isPassword;

  const InputComponent({Key key, this.text, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: this.text,
        contentPadding: EdgeInsets.all(10.0)
      ),
      style: TextStyle(fontSize: 20.0),
      obscureText: this.isPassword,
    );
  }
}
