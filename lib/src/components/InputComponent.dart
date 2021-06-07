import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String label;
  final bool isPassword;
  final String Function(String) validator;
  final TextInputType keyBoardType;
  final void Function(String) onChange;

  const InputComponent(
      {Key key, this.label, this.isPassword = false, this.validator, this.keyBoardType, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        labelText: this.label,
      ),
      onChanged: onChange,
      keyboardType: keyBoardType,
      style: TextStyle(fontSize: 20.0),
      obscureText: this.isPassword,
    );
  }
}
