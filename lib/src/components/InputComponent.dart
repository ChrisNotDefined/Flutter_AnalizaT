import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String text;
  final bool isPassword;

  const InputComponent({Key key, @required this.text, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(MyColors.accentColor),
            ),
          ),
          labelText: this.text),
      obscureText: this.isPassword,
    );
  }
}
